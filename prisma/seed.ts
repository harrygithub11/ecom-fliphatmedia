
import { PrismaClient } from '@prisma/client';
import mysql from 'mysql2/promise';
import fs from 'fs';
import path from 'path';

const prisma = new PrismaClient();

async function main() {
    const sqlFile = path.join(process.cwd(), 'newyear (3).sql');

    if (!fs.existsSync(sqlFile)) {
        console.error(`❌ SQL file not found: ${sqlFile}`);
        return;
    }

    console.log(`📄 Reading SQL file: ${sqlFile}`);
    const sql = fs.readFileSync(sqlFile, 'utf8');

    // get database details from environment variable
    const dbUrl = process.env.DATABASE_URL;
    if (!dbUrl) {
        console.error('❌ DATABASE_URL not found in environment');
        return;
    }

    try {
        const url = new URL(dbUrl);
        const config = {
            host: url.hostname,
            port: parseInt(url.port) || 3306,
            user: url.username,
            password: url.password,
            database: url.pathname.replace(/^\//, ''),
            multipleStatements: true
        };

        console.log(`🔌 Connecting to database: ${config.database} on ${config.host}:${config.port}`);
        const connection = await mysql.createConnection(config);

        console.log('🚀 Executing SQL dump...');
        // Remove USE statements to avoid switching databases if the dump was from a different DB name
        const safeSql = sql.replace(/USE `[^`]+`;/gi, '-- USE statement removed');

        await connection.query(safeSql);

        console.log('✅ Seeding completed successfully!');
        await connection.end();
    } catch (error: any) {
        console.error('❌ Seeding failed:', error.message);
    } finally {
        await prisma.$disconnect();
    }
}

main();
