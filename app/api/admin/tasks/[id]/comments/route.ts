import { NextResponse } from 'next/server';
import pool from '@/lib/db';

// GET: List comments for a task
export async function GET(
    request: Request,
    { params }: { params: { id: string } }
) {
    try {
        const taskId = params.id;
        const connection = await pool.getConnection();

        try {
            const [comments]: any = await connection.execute(`
                SELECT tc.*, a.name AS author_name
                FROM task_comments tc
                LEFT JOIN admins a ON tc.author_id = a.id
                WHERE tc.task_id = ?
                ORDER BY tc.created_at ASC
            `, [taskId]);

            return NextResponse.json({ success: true, comments });
        } finally {
            connection.release();
        }
    } catch (error) {
        console.error("Get Comments Error:", error);
        return NextResponse.json({ success: false, message: 'Failed to fetch comments' }, { status: 500 });
    }
}

// POST: Add a comment
export async function POST(
    request: Request,
    { params }: { params: { id: string } }
) {
    try {
        const taskId = params.id;
        const body = await request.json();
        const { body: commentBody } = body;

        if (!commentBody || !commentBody.trim()) {
            return NextResponse.json({ success: false, message: 'Comment body required' }, { status: 400 });
        }

        const { getSession } = await import('@/lib/auth');
        const session = await getSession();

        if (!session) {
            return NextResponse.json({ success: false, message: 'Unauthorized' }, { status: 401 });
        }

        const connection = await pool.getConnection();
        try {
            const [result]: any = await connection.execute(
                'INSERT INTO task_comments (task_id, author_id, body) VALUES (?, ?, ?)',
                [taskId, session.id, commentBody.trim()]
            );

            // Log to task history
            await connection.execute(
                `INSERT INTO task_history (task_id, changed_by, change_type, new_value) VALUES (?, ?, ?, ?)`,
                [taskId, session.id, 'comment_added', commentBody.substring(0, 100)]
            );

            // Log admin activity
            const { logAdminActivity } = await import('@/lib/activity-logger');
            await logAdminActivity(
                session.id,
                'task_comment',
                `Added comment on task #${taskId}`,
                'task',
                parseInt(taskId)
            );

            return NextResponse.json({ success: true, commentId: result.insertId });
        } finally {
            connection.release();
        }
    } catch (error) {
        console.error("Add Comment Error:", error);
        return NextResponse.json({ success: false, message: 'Failed to add comment' }, { status: 500 });
    }
}
