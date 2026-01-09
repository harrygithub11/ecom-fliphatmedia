// Fix owner field for existing leads
// This script updates leads where owner is a number (admin ID) and replaces it with the admin's name

const mysql = require('mysql2/promise');
require('dotenv').config({ path: require('fs').existsSync('.env') ? '.env' : '.env.local' });

async function fixOwnerField() {
    let connection;

    try {
        // Connect to database
        console.log('\n🔧 FIXING OWNER FIELD IN CUSTOMERS TABLE\n');
        console.log('==================================================');

        connection = await mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || '',
            database: process.env.DB_NAME || 'newyear',
            port: process.env.DB_PORT || 3306,
        });

        console.log('✅ Database connected');

        // Get all admins
        const [admins] = await connection.execute('SELECT id, name FROM admins');
        const adminMap = {};
        admins.forEach(admin => {
            adminMap[admin.id] = admin.name;
        });

        console.log(`\n📋 Found ${admins.length} admin(s)`);

        // Get all customers with numeric owner or empty owner
        const [customers] = await connection.execute(
            `SELECT id, name, owner FROM customers 
             WHERE owner IS NULL OR owner = '' OR owner REGEXP '^[0-9]+$'`
        );

        console.log(`\n👥 Found ${customers.length} customer(s) with invalid owner field\n`);

        let updated = 0;

        for (const customer of customers) {
            const oldOwner = customer.owner;
            let newOwner = 'unassigned';

            // If owner is a number, try to map it to admin name
            if (oldOwner && !isNaN(oldOwner)) {
                const adminId = parseInt(oldOwner);
                if (adminMap[adminId]) {
                    newOwner = adminMap[adminId];
                }
            }

            // Update the customer
            await connection.execute(
                'UPDATE customers SET owner = ? WHERE id = ?',
                [newOwner, customer.id]
            );

            console.log(`  ✅ Updated "${customer.name}": "${oldOwner || '(empty)'}" → "${newOwner}"`);
            updated++;
        }

        console.log('\n==================================================');
        console.log(`\n📊 SUMMARY:`);
        console.log(`   Total processed: ${customers.length}`);
        console.log(`   Updated: ${updated}`);
        console.log('\n✅ Owner field fix completed!');

    } catch (error) {
        console.error('\n❌ ERROR:', error.message);
        process.exit(1);
    } finally {
        if (connection) {
            await connection.end();
        }
    }
}

fixOwnerField();
