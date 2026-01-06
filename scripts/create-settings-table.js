const mysql = require('mysql2/promise');
require('dotenv').config();

async function migrateSettings() {
    console.log('Connecting to database...');
    const connection = await mysql.createConnection(process.env.DATABASE_URL);

    try {
        console.log('Checking for system_settings table...');

        // Check if table exists
        const [tables] = await connection.execute(`
            SELECT TABLE_NAME 
            FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = DATABASE() 
            AND TABLE_NAME = 'system_settings'
        `);

        if (tables.length === 0) {
            console.log('Creating system_settings table...');
            await connection.execute(`
                CREATE TABLE system_settings (
                    id VARCHAR(191) NOT NULL PRIMARY KEY,
                    \`key\` VARCHAR(191) NOT NULL,
                    \`value\` TEXT NOT NULL,
                    description VARCHAR(191) NULL,
                    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
                    UNIQUE INDEX system_settings_key_key(\`key\`)
                ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
            `);
            console.log('✅ Created system_settings table successfully.');
        } else {
            console.log('ℹ️ system_settings table already exists.');
        }

    } catch (error) {
        console.error('Migration failed:', error);
    } finally {
        await connection.end();
    }
}

migrateSettings();
