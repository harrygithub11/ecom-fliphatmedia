const mysql = require('mysql2/promise');
require('dotenv').config({ path: require('fs').existsSync('.env') ? '.env' : '.env.local' });
const fs = require('fs');
const path = require('path');

async function migrateReadState() {
    let connection;
    try {
        console.log('\n🚀 Starting Read-State Engine Migration...\n');

        connection = await mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || '',
            database: process.env.DB_NAME || 'newyear',
            port: process.env.DB_PORT || 3306,
            multipleStatements: true // Enable multiple statements
        });

        console.log('✅ Connected into database');

        const sqlPath = path.join(__dirname, '../migrations/read_state_engine.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');

        console.log('📦 Executing schema changes...');
        await connection.query(sql);

        console.log('✅ Read-State tables (task_reads, comment_reads, notifications) created successfully!');

    } catch (error) {
        console.error('❌ Migration Failed:', error);
        process.exit(1);
    } finally {
        if (connection) await connection.end();
    }
}

migrateReadState();
