import { NextResponse } from 'next/server';

export const dynamic = 'force-dynamic';
import pool from '@/lib/db';
import { getSession } from '@/lib/auth';

// GET: Fetch combined timeline (interactions + admin activity logs)
export async function GET(request: Request) {
    try {
        const { searchParams } = new URL(request.url);
        const limit = parseInt(searchParams.get('limit') || '100');

        const connection = await pool.getConnection();
        try {
            // Combine interactions and admin activity logs into one timeline
            const [rows]: any = await connection.execute(
                `(SELECT 
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
                 LEFT JOIN admins a ON i.created_by = a.id)
                UNION ALL
                (SELECT 
                    al.id,
                    'activity_log' AS source,
                    al.action_type,
                    al.action_description AS description,
                    al.entity_id AS customer_id,
                    CASE WHEN al.entity_type = 'customer' THEN (SELECT name FROM customers WHERE id = al.entity_id) ELSE NULL END AS customer_name,
                    al.admin_id,
                    a.name AS admin_name,
                    al.created_at
                 FROM admin_activity_logs al
                 LEFT JOIN admins a ON al.admin_id = a.id)
                ORDER BY created_at DESC
                LIMIT ?`,
                [limit]
            );
            return NextResponse.json({ success: true, interactions: rows });
        } finally {
            connection.release();
        }
    } catch (error) {
        console.error("Get Timeline Error:", error);
        return NextResponse.json({ success: false, message: 'Failed to fetch timeline' }, { status: 500 });
    }
}

export async function POST(request: Request) {
    try {
        const session = await getSession();

        // Require authentication
        if (!session) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const body = await request.json();
        const { customer_id, type, content } = body;

        if (!customer_id || !content) {
            return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
        }

        const connection = await pool.getConnection();
        try {
            const [result]: any = await connection.execute(
                `INSERT INTO interactions (customer_id, type, content, created_by, created_at) 
                 VALUES (?, ?, ?, ?, NOW())`,
                [customer_id, type || 'internal_note', content, session.id]
            );

            // Log activity
            const { logAdminActivity } = await import('@/lib/activity-logger');
            await logAdminActivity(
                session.id,
                'interaction_created',
                `Added ${type || 'note'}: ${content.substring(0, 50)}${content.length > 50 ? '...' : ''}`,
                'customer',
                customer_id
            );

            // Return the created interaction with admin info
            return NextResponse.json({
                success: true,
                interaction: {
                    id: result.insertId,
                    customer_id,
                    type: type || 'internal_note',
                    content,
                    created_by: session.id,
                    created_by_name: session.name,
                    created_at: new Date().toISOString()
                }
            });
        } finally {
            connection.release();
        }

    } catch (error) {
        console.error("Log Interaction Error", error);
        return NextResponse.json({ error: 'Failed to log interaction' }, { status: 500 });
    }
}
