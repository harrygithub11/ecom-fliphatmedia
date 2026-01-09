const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config({ path: '.env.local' });

async function migrate() {
    const config = {
        host: process.env.DB_HOST || 'localhost',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || '',
        database: process.env.DB_NAME || 'newyear',
        port: process.env.DB_PORT || 3306,
    };

    console.log('Connecting to database...', { ...config, password: '***' });

    try {
        const connection = await mysql.createConnection(config);
        console.log('Connected!');

        const sql = fs.readFileSync(path.join(__dirname, '../migrations/create_stage_config.sql'), 'utf8');
        console.log('Executing migration: create_stage_config.sql');

        // Split by semicolon to execute multiple statements
        const statements = sql.split(';').filter(s => s.trim());
        for (const statement of statements) {
            if (statement.trim()) {
                await connection.query(statement);
            }
        }

        console.log('Migration successful: Created lead_stages table and inserted default values.');
        await connection.end();
    } catch (error) {
        console.error('Migration failed:', error);
        process.exit(1);
    }
}

migrate();
