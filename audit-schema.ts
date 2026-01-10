
import mysql from 'mysql2/promise';
import * as dotenv from 'dotenv';
import path from 'path';

dotenv.config({ path: path.resolve(__dirname, '.env') });

async function audit() {
    console.log("Starting Phase 1: System Audit...");

    let connection;
    try {
        if (process.env.DATABASE_URL) {
            connection = await mysql.createConnection({ uri: process.env.DATABASE_URL });
        } else {
            connection = await mysql.createConnection({
                host: process.env.DB_HOST || '127.0.0.1',
                port: parseInt(process.env.DB_PORT || '3306'),
                user: process.env.DB_USER || 'root',
                password: process.env.DB_PASSWORD ?? 'admin',
                database: process.env.DB_NAME || 'newyear'
            });
        }

        try {
            console.log("🔍 Verifying Schema...");

            // Check emails table columns
            const [emailColumns]: any = await connection.execute(`
            SELECT COLUMN_NAME 
            FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'emails'
        `);

            const existingCols = emailColumns.map((c: any) => c.COLUMN_NAME);
            const requiredCols = ['message_id', 'direction', 'folder', 'is_read', 'received_at', 'recipient_to', 'headers_json'];

            const missingCols = requiredCols.filter(c => !existingCols.includes(c));

            if (missingCols.length > 0) {
                console.error(`❌ Missing columns in 'emails': ${missingCols.join(', ')}`);
            } else {
                console.log("✅ 'emails' table has all required columns.");
            }

            // Check smtp_accounts table columns
            const [smtpColumns]: any = await connection.execute(`
            SELECT COLUMN_NAME 
            FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'smtp_accounts'
        `);
            const smtpCols = smtpColumns.map((c: any) => c.COLUMN_NAME);
            const requiredSmtpCols = ['imap_host', 'imap_port', 'imap_user'];
            const missingSmtp = requiredSmtpCols.filter(c => !smtpCols.includes(c));

            if (missingSmtp.length > 0) {
                console.error(`❌ Missing columns in 'smtp_accounts': ${missingSmtp.join(', ')}`);
            } else {
                console.log("✅ 'smtp_accounts' table has all required columns.");
            }

        } catch (e: any) {
            console.error("Audit Failed:", e);
        } finally {
            if (connection) await connection.end();
        }
    } catch (e: any) {
        console.error("Connection Failed:", e);
    }
}

audit();
