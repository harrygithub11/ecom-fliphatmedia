
const mysql = require('mysql2/promise');
require('dotenv').config();

async function checkSchema() {
    const pool = mysql.createPool({
        uri: process.env.DATABASE_URL,
        waitForConnections: true,
        connectionLimit: 1
    });

    try {
        const connection = await pool.getConnection();
        console.log('Connected.');
        const [rows] = await connection.execute('SHOW COLUMNS FROM tasks');
        console.log('Tasks Table Columns:');
        rows.forEach(row => console.log(row.Field));
        connection.release();
    } catch (error) {
        console.error('Error:', error.message);
    } finally {
        await pool.end();
    }
}

checkSchema();
