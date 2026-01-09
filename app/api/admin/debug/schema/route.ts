import { NextResponse } from 'next/server';
import pool from '@/lib/db';

export const dynamic = 'force-dynamic';

export async function GET() {
    try {
        const connection = await pool.getConnection();
        try {
            const [columns]: any = await connection.execute('DESCRIBE tasks');
            return NextResponse.json({ success: true, columns });
        } finally {
            connection.release();
        }
    } catch (error: any) {
        return NextResponse.json({ success: false, error: error.message });
    }
}
