
const mysql = require('mysql2/promise');
require('dotenv').config({ path: '.env' });

async function debugQuery() {
    console.log('Connecting to DB...');
    let connection;
    try {
        connection = await mysql.createConnection(process.env.DATABASE_URL);
        console.log('Connected.');

        const currentUserId = 0; // Simulate unauthenticated or system user if needed, or put a valid ID

        // The exact query from route.ts
        let query = `
            SELECT t.*, 
                   tr.last_seen_at,
                   c.name AS customer_name, c.email AS customer_email, 
                   a.name AS created_by_name,
                   asg.name AS assigned_name,
                   sc.name AS status_changed_by_name,
                   (
                       CASE 
                           WHEN tr.last_seen_at IS NULL THEN 1
                           WHEN t.updated_at > tr.last_seen_at THEN 1
                           WHEN (SELECT MAX(created_at) FROM task_comments WHERE task_id = t.id) > tr.last_seen_at THEN 1
                           ELSE 0
                       END
                   ) as is_unread,
                   (SELECT COUNT(*) FROM task_comments WHERE task_id = t.id) as comments_count,
                   (SELECT COUNT(*) FROM task_comments WHERE task_id = t.id AND created_at > IFNULL(tr.last_seen_at, '1970-01-01')) as unread_comments_count
            FROM tasks t
            LEFT JOIN customers c ON t.customer_id = c.id
            LEFT JOIN admins a ON t.created_by = a.id
            LEFT JOIN admins asg ON t.assigned_to = asg.id
            LEFT JOIN admins sc ON t.status_changed_by = sc.id
            LEFT JOIN task_reads tr ON t.id = tr.task_id AND tr.user_id = ?
            WHERE t.deleted_at IS NULL
        `;
        const params = [currentUserId];

        // Add LIMIT/OFFSET as in the route
        query += ` LIMIT 50 OFFSET 0`;

        console.log('Running query...');
        const [rows] = await connection.execute(query, params);
        console.log(`Success! Retrieved ${rows.length} rows.`);
        if (rows.length > 0) {
            console.log('First row sample:', rows[0]);
        }

    } catch (error) {
        console.error('QUERY FAILED:');
        console.error(error);
        if (error.sqlMessage) console.error('SQL Message:', error.sqlMessage);
    } finally {
        if (connection) await connection.end();
    }
}

debugQuery();
