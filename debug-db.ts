
import mysql from 'mysql2/promise';
import * as dotenv from 'dotenv';
import path from 'path';

dotenv.config({ path: path.resolve(__dirname, '.env') });

async function check() {
    let connection;
    try {
        connection = await mysql.createConnection(process.env.DATABASE_URL!);
        const [rows]: any = await connection.execute('SELECT folder, direction, COUNT(*) as count FROM emails GROUP BY folder, direction');
        console.log("Email Distribution:", rows);

        const [accounts]: any = await connection.execute('SELECT id, from_email FROM smtp_accounts');
        console.log("SMTP Accounts:", accounts);
    } catch (e) {
        console.error("DB Check Failed:", e);
    } finally {
        if (connection) await connection.end();
        process.exit(0);
    }
}
check();
