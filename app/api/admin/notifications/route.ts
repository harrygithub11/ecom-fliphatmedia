import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import pool from '@/lib/db';

export const dynamic = 'force-dynamic';

export async function GET() {
    const session = await getSession();
    if (!session) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    try {
        const connection = await pool.getConnection();

        // Get unread notifications
        const [notifications]: any = await connection.execute(
            `SELECT n.*, a.name as actor_name, a.avatar_url as actor_avatar
             FROM notifications n
             LEFT JOIN admins a ON n.related_entity_id = a.id
             WHERE n.user_id = ? AND n.is_read = FALSE
             ORDER BY n.created_at DESC
             LIMIT 20`,
            [session.id]
        );

        // Get global unread counts
        const [taskCounts]: any = await connection.execute(
            `SELECT COUNT(DISTINCT t.id) as count
             FROM tasks t
             LEFT JOIN task_reads tr ON tr.task_id = t.id AND tr.user_id = ?
             WHERE (t.updated_at > IFNULL(tr.last_seen_at, '1970-01-01'))
             OR EXISTS (
                SELECT 1 FROM task_comments tc
                WHERE tc.task_id = t.id
                AND tc.created_at > IFNULL(tr.last_seen_at, '1970-01-01')
             )`,
            [session.id]
        );

        connection.release();

        return NextResponse.json({
            notifications,
            unreadTasks: taskCounts[0].count,
            unreadNotifications: notifications.length
        });

    } catch (error: any) {
        console.error('Error fetching notifications:', error);
        return NextResponse.json({ error: 'Internal Server Error', details: error.message }, { status: 500 });
    }
}

export async function POST(request: Request) {
    const session = await getSession();
    if (!session) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    try {
        const connection = await pool.getConnection();

        // Mark all as read
        await connection.execute(
            'UPDATE notifications SET is_read = TRUE WHERE user_id = ?',
            [session.id]
        );

        connection.release();
        return NextResponse.json({ success: true });

    } catch (error) {
        return NextResponse.json({ error: 'Failed to clear notifications' }, { status: 500 });
    }
}
