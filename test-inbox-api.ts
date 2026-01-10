
import mysql from 'mysql2/promise';
import * as dotenv from 'dotenv';
import path from 'path';

dotenv.config({ path: path.resolve(__dirname, '.env') });

async function testApi() {
    let connection;
    try {
        console.log("Testing API Query for Folder: INBOX, Account: all");
        connection = await mysql.createConnection(process.env.DATABASE_URL!);

        let query = `
            SELECT 
                e.id, e.subject, e.folder, e.direction, e.smtp_account_id,
                sa.from_email as account_email
            FROM emails e
            LEFT JOIN smtp_accounts sa ON e.smtp_account_id = sa.id
            WHERE e.folder = 'INBOX'
        `;

        const [rows]: any = await connection.execute(query);
        console.log("Found Emails:", rows);

    } catch (e) {
        console.error("Test Failed:", e);
    } finally {
        if (connection) await connection.end();
        process.exit(0);
    }
}
testApi();
