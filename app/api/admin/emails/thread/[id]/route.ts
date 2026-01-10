
import { NextRequest, NextResponse } from 'next/server';
import pool from '@/lib/db';

export const dynamic = 'force-dynamic';

export async function GET(req: NextRequest, { params }: { params: { id: string } }) {
    try {
        const threadId = params.id;

        // Fetch all emails in this thread
        const [rows]: any = await pool.execute(`
            SELECT 
                e.*,
                c.name as customer_name,
                c.avatar_url
            FROM emails e
            LEFT JOIN customers c ON e.customer_id = c.id
            WHERE e.thread_id = ?
            ORDER BY e.created_at ASC
        `, [threadId]);

        return NextResponse.json({ success: true, emails: rows });

    } catch (error: any) {
        console.error('Fetch Thread Error:', error);
        return NextResponse.json({ success: false, message: error.message }, { status: 500 });
    }
}
