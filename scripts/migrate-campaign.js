
const mysql = require('mysql2/promise');
require('dotenv').config({ path: require('fs').existsSync('.env') ? '.env' : '.env.local' });
const fs = require('fs');
const path = require('path');

async function migrate() {
    console.log('Connecting to DB...');
    let connection;
    try {
        connection = await mysql.createConnection(process.env.DATABASE_URL);
        console.log('Connected.');

        console.log('Adding campaign_name column...');
        const sqlPath = path.join(__dirname, '../migrations/add_campaign_to_customers.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');

        await connection.query(sql);
        console.log('Migration successful!');

    } catch (error) {
        if (error.code === 'ER_DUP_FIELDNAME') {
            console.log('Column campaign_name already exists. Skipping.');
        } else {
            console.error('Migration failed:', error);
        }
    } finally {
        if (connection) await connection.end();
    }
}

migrate();
