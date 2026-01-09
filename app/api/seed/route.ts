import { NextResponse } from 'next/server';
import pool from '@/lib/db';

export async function GET() {
    try {
        const connection = await pool.getConnection();
        try {
            await connection.beginTransaction();

            // 1. Check if data already exists to prevent duplicates
            const [existing]: any = await connection.execute("SELECT id FROM customers WHERE email = 'alice@fashion.com'");
            if (existing.length > 0) {
                return NextResponse.json({ success: true, message: 'Database already seeded' });
            }

            /* 
            // 2. Insert Customers
            const customers = [
                // ... (dummies removed) ...
            ];
            
            // ... (rest commented out)
            */
            return NextResponse.json({ success: true, message: 'Seeding disabled' });

            await connection.commit();
            return NextResponse.json({ success: true, message: 'Seeded successfully' });

        } catch (dbError) {
            await connection.rollback();
            throw dbError;
        } finally {
            connection.release();
        }
    } catch (error) {
        console.error("Seed Error:", error);
        return NextResponse.json({ error: 'Failed to seed' }, { status: 500 });
    }
}
