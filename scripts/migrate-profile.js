
const mysql = require('mysql2/promise');
const path = require('path');
require('dotenv').config({ path: path.resolve(__dirname, '../.env') });

const dbConfig = {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
};

async function migrate() {
    console.log('Starting migration...');
    let connection;
    try {
        connection = await mysql.createConnection(dbConfig);
        console.log('Connected to database.');

        await connection.beginTransaction();

        // 1. Alter admins table
        try {
            console.log('Altering admins table...');
            await connection.execute(`
                ALTER TABLE admins
                ADD COLUMN phone VARCHAR(20) NULL,
                ADD COLUMN avatar_url VARCHAR(500) NULL,
                ADD COLUMN timezone VARCHAR(50) DEFAULT 'UTC',
                ADD COLUMN language VARCHAR(10) DEFAULT 'en'
            `);
            console.log("Admins table altered.");
        } catch (e) {
            if (e.code === 'ER_DUP_FIELDNAME') {
                console.log("Admins table columns already exist, skipping.");
            } else {
                console.log("Admins table alter warning:", e.message);
            }
        }

        // 2. Create admin_sessions
        console.log('Creating admin_sessions...');
        await connection.execute(`
            CREATE TABLE IF NOT EXISTS admin_sessions (
                id INT AUTO_INCREMENT PRIMARY KEY,
                admin_id INT NOT NULL,
                token_hash VARCHAR(255) NOT NULL,
                ip_address VARCHAR(45),
                user_agent VARCHAR(255),
                expires_at TIMESTAMP NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (admin_id) REFERENCES admins(id) ON DELETE CASCADE
            )
        `);

        // 3. Create admin_login_history
        console.log('Creating admin_login_history...');
        await connection.execute(`
            CREATE TABLE IF NOT EXISTS admin_login_history (
                id INT AUTO_INCREMENT PRIMARY KEY,
                admin_id INT,
                email_attempted VARCHAR(255),
                ip_address VARCHAR(45),
                user_agent VARCHAR(255),
                location VARCHAR(100),
                success BOOLEAN DEFAULT FALSE,
                failure_reason VARCHAR(255),
                login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )
        `);

        // 4. Create admin_activity_log
        console.log('Creating admin_activity_log...');
        await connection.execute(`
            CREATE TABLE IF NOT EXISTS admin_activity_log (
                id INT AUTO_INCREMENT PRIMARY KEY,
                admin_id INT NOT NULL,
                action_type VARCHAR(50) NOT NULL,
                action_description TEXT,
                entity_type VARCHAR(50),
                entity_id INT,
                ip_address VARCHAR(45),
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (admin_id) REFERENCES admins(id) ON DELETE CASCADE
            )
        `);

        // 5. Create admin_preferences
        console.log('Creating admin_preferences...');
        await connection.execute(`
            CREATE TABLE IF NOT EXISTS admin_preferences (
                id INT AUTO_INCREMENT PRIMARY KEY,
                admin_id INT NOT NULL UNIQUE,
                theme ENUM('light', 'dark', 'system') DEFAULT 'system',
                notify_email BOOLEAN DEFAULT TRUE,
                notify_in_app BOOLEAN DEFAULT TRUE,
                default_view VARCHAR(50) DEFAULT 'dashboard',
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                FOREIGN KEY (admin_id) REFERENCES admins(id) ON DELETE CASCADE
            )
        `);

        await connection.commit();
        console.log('Migration completed successfully.');
        process.exit(0);

    } catch (error) {
        if (connection) await connection.rollback();
        console.error('Migration failed:', error);
        process.exit(1);
    } finally {
        if (connection) await connection.end();
    }
}

migrate();
