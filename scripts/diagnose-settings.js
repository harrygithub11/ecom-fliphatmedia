const mysql = require('mysql2/promise');
require('dotenv').config();
const crypto = require('crypto');

async function diagnose() {
    console.log('--- DIAGNOSIS STARTED ---');
    console.log('Connecting to database...');
    const connection = await mysql.createConnection(process.env.DATABASE_URL);

    try {
        // 1. Check Table Structure
        console.log('\n1. Checking Table Schema (DESCRIBE system_settings):');
        try {
            const [columns] = await connection.execute('DESCRIBE system_settings');
            console.table(columns);
        } catch (e) {
            console.error('❌ Table error:', e.message);
            return;
        }

        // 2. Check Existing Data
        console.log('\n2. Checking Current Data:');
        const [rows] = await connection.execute('SELECT * FROM system_settings');
        if (rows.length === 0) {
            console.log('⚠️  Table is EMPTY.');
        } else {
            console.log('Found rows:', rows);
        }

        // 3. Attempt Test Insert
        console.log('\n3. Attempting Test Insert (test_key):');
        const testKey = 'test_key_' + Date.now();
        const testValue = 'test_value';
        const uuid = crypto.randomUUID();

        try {
            // Check if column names match standard expectations
            await connection.execute(
                'INSERT INTO system_settings (id, `key`, `value`, description) VALUES (?, ?, ?, ?)',
                [uuid, testKey, testValue, 'Test entry']
            );
            console.log('✅ INSERT success.');

            const [verify] = await connection.execute('SELECT * FROM system_settings WHERE `key` = ?', [testKey]);
            console.log('Updated Row:', verify);

            // Clean up
            await connection.execute('DELETE FROM system_settings WHERE `key` = ?', [testKey]);
            console.log('Cleaned up test entry.');

        } catch (insertError) {
            console.error('❌ INSERT Failed:', insertError.message);
        }

    } catch (error) {
        console.error('GLOBAL Error:', error);
    } finally {
        await connection.end();
        console.log('\n--- DIAGNOSIS COMPLETE ---');
    }
}

diagnose();
