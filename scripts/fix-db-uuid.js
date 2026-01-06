const mysql = require('mysql2/promise');
require('dotenv').config();

async function fixTable() {
    const connection = await mysql.createConnection(process.env.DATABASE_URL);
    try {
        console.log('--- Fixing system_settings Table ---');

        // Option 1: Drop and Recreate (Simplest strictly for this table)
        // Since it's settings, we can probably safely recreate if it's crashing.
        // But let's try to just ALTER it first.

        // Actually, the error is "Field 'id' doesn't have a default value".
        // This means the column exists but has no default.
        // WE WILL UPDATE THE API CODE TO GENERATE UUIDs instead of relying on DB default.
        // But for now, let's also fix the DB.

        await connection.execute(`
            ALTER TABLE system_settings 
            MODIFY COLUMN id CHAR(36) NOT NULL;
        `);
        console.log('✅ Modified ID column.');

    } catch (e) {
        console.error(e);
    } finally {
        connection.end();
    }
}

fixTable();
