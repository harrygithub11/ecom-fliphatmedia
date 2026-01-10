
import mysql from 'mysql2/promise';
import * as dotenv from 'dotenv';
import path from 'path';

dotenv.config({ path: path.resolve(__dirname, '.env') });

async function migrate() {
    let connection;
    try {
        console.log("Migrating existing emails to threads...");
        connection = await mysql.createConnection(process.env.DATABASE_URL!);

        // 1. Give every email a thread_id if it doesn't have one
        // Pattern: thread_[message_id] or thread_[id]
        const [rows]: any = await connection.execute('SELECT id, message_id FROM emails WHERE thread_id IS NULL');
        console.log(`Found ${rows.length} emails needing thread_id`);

        for (const row of rows) {
            const threadId = row.message_id ? `thread_${row.message_id}` : `thread_${row.id}`;
            await connection.execute('UPDATE emails SET thread_id = ? WHERE id = ?', [threadId, row.id]);
        }

        console.log("Migration complete!");

    } catch (e) {
        console.error("Migration failed:", e);
    } finally {
        if (connection) await connection.end();
        process.exit(0);
    }
}
migrate();
