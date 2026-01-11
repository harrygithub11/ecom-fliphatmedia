
const mysql = require('mysql2/promise');
require('dotenv').config();

async function updateStages() {
    console.log("Starting Lead Stages Update...");

    // Config from DATABASE_URL or individual Env Vars
    const dbConfig = process.env.DATABASE_URL || {
        host: process.env.DB_HOST || 'localhost',
        user: process.env.DB_USER || 'usernewyear',
        password: process.env.DB_PASSWORD || 'NEWyear11@@',
        database: process.env.DB_NAME || 'newyear',
        port: parseInt(process.env.DB_PORT || '3306')
    };

    console.log("Connecting using:", typeof dbConfig === 'string' ? "DATABASE_URL" : "Individual Certs");

    try {
        const connection = await mysql.createConnection(dbConfig);
        console.log("Connected to Database.");

        const stages = [
            { value: "new", label: "New Lead", color: "#E5E7EB", order: 1 },
            { value: "contacted", label: "Contacted", color: "#E0ECFF", order: 2 },
            { value: "qualified", label: "Qualified", color: "#E6F7F0", order: 3 },
            { value: "follow_up_required", label: "Follow Up Required", color: "#FFF3D6", order: 4 },
            { value: "proposal_sent", label: "Proposal Sent", color: "#F1E8FF", order: 5 },
            { value: "negotiation", label: "Negotiating", color: "#FFE5E5", order: 6 },
            { value: "won", label: "Won", color: "#DFF5EA", order: 7 },
            { value: "lost", label: "Lost", color: "#F2F2F2", order: 8 }
        ];

        try {
            // Check if table exists
            await connection.execute('SELECT 1 FROM lead_stages LIMIT 1');
            console.log('Clearing old stages...');
            await connection.execute('TRUNCATE TABLE lead_stages');
        } catch (e) {
            console.log('Table lead_stages might not exist or empty, attempting insert directly or CREATE TABLE not handled here.');
            // If table doesn't exist, this script assumes it does. schema.prisma defines it?
            // If the user hasn't run migrations, maybe it's missing.
            // But `lib/db.ts` and `api/admin/stages` exist, implying it exists.
        }

        console.log('Inserting new stages...');
        for (const stage of stages) {
            await connection.execute(
                'INSERT INTO lead_stages (value, label, color, display_order, is_active) VALUES (?, ?, ?, ?, ?)',
                [stage.value, stage.label, stage.color, stage.order, true]
            );
        }
        console.log('Successfully updated lead stages! 🎨');

        await connection.end();
        process.exit(0);

    } catch (error) {
        console.error('Error updating stages:', error);
        process.exit(1);
    }
}

updateStages();
