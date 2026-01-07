
const mysql = require('mysql2/promise');
require('dotenv').config();

async function testInteractions() {
    console.log('Testing interactions query...');

    // Create connection (using same env vars as app)
    const pool = mysql.createPool({
        uri: process.env.DATABASE_URL,
        waitForConnections: true,
        connectionLimit: 10,
        queueLimit: 0
    });

    try {
        const connection = await pool.getConnection();
        console.log('Database connected successfully');

        try {
            // 1. Check if table exists and count rows
            const [countRows] = await connection.execute('SELECT COUNT(*) as count FROM interactions');
            console.log(`Total rows in interactions table: ${countRows[0].count}`);

            // 2. Run the exact query from the API
            console.log('Running API query...');
            const [rows] = await connection.execute(
                `SELECT 
                    i.id,
                    'interaction' AS source,
                    i.type AS action_type,
                    i.content AS description,
                    i.customer_id,
                    c.name AS customer_name,
                    i.created_by AS admin_id,
                    a.name AS admin_name,
                    i.created_at
                 FROM interactions i
                 LEFT JOIN customers c ON i.customer_id = c.id
                 LEFT JOIN admins a ON i.created_by = a.id
                 ORDER BY i.created_at DESC
                 LIMIT 5`
            );

            console.log(`Query returned ${rows.length} rows`);
            if (rows.length > 0) {
                console.log('First row sample:', rows[0]);
            }

        } catch (queryError) {
            console.error('Query failed:', queryError.message);
        } finally {
            connection.release();
        }

    } catch (error) {
        console.error('Connection failed:', error.message);
    } finally {
        await pool.end();
    }
}

testInteractions();
