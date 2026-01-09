import { NextResponse } from 'next/server';
import pool from '@/lib/db';

export async function GET() {
    try {
        const connection = await pool.getConnection();
        try {
            await connection.beginTransaction();

            // 1. Alter admins table
            // We use a try-catch for the ALTER because if it already exists it might throw duplicate column error
            // checks. simpler is to just run it and catch error if columns exist.
            try {
                await connection.execute(`
                    ALTER TABLE admins
                    ADD COLUMN phone VARCHAR(20) NULL,
                    ADD COLUMN avatar_url VARCHAR(500) NULL,
                    ADD COLUMN timezone VARCHAR(50) DEFAULT 'UTC',
                    ADD COLUMN language VARCHAR(10) DEFAULT 'en'
                `);
                console.log("Admins table altered");
            } catch (e: any) {
                console.log("Admins table alter skipped (probably exists):", e.message);
            }

            // 2. Create admin_sessions
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
            return NextResponse.json({ success: true, message: 'Migration applied successfully' });
        } catch (dbError: any) {
            await connection.rollback();
            console.error('Migration failed:', dbError);
            return NextResponse.json({ success: false, error: dbError.message }, { status: 500 });
        } finally {
            connection.release();
        }
    } catch (error: any) {
        return NextResponse.json({ success: false, error: error.message }, { status: 500 });
    }
}
