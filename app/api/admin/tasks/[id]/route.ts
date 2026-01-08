import { NextResponse } from 'next/server';
import pool from '@/lib/db';

// GET: Full task detail with comments, assignees, history
export async function GET(
    request: Request,
    { params }: { params: { id: string } }
) {
    try {
        const taskId = params.id;
        const connection = await pool.getConnection();

        try {
            // Main task
            const [taskRows]: any = await connection.execute(`
                SELECT t.*, 
                       c.name AS customer_name, c.email AS customer_email,
                       a.name AS created_by_name,
                       asg.name AS assigned_name,
                       sc.name AS status_changed_by_name
                FROM tasks t
                LEFT JOIN customers c ON t.customer_id = c.id
                LEFT JOIN admins a ON t.created_by = a.id
                LEFT JOIN admins asg ON t.assigned_to = asg.id
                LEFT JOIN admins sc ON t.status_changed_by = sc.id
                WHERE t.id = ? AND t.deleted_at IS NULL
            `, [taskId]);

            if (taskRows.length === 0) {
                return NextResponse.json({ success: false, message: 'Task not found' }, { status: 404 });
            }

            const task = taskRows[0];

            // Comments
            const [comments]: any = await connection.execute(`
                SELECT tc.*, a.name AS author_name
                FROM task_comments tc
                LEFT JOIN admins a ON tc.author_id = a.id
                WHERE tc.task_id = ?
                ORDER BY tc.created_at ASC
            `, [taskId]);

            // Attachments
            const [attachments]: any = await connection.execute(`
                SELECT ta.*, a.name AS uploaded_by_name
                FROM task_attachments ta
                LEFT JOIN admins a ON ta.uploaded_by = a.id
                WHERE ta.task_id = ?
                ORDER BY ta.uploaded_at DESC
            `, [taskId]);

            // History
            const [history]: any = await connection.execute(`
                SELECT th.*, a.name AS changed_by_name
                FROM task_history th
                LEFT JOIN admins a ON th.changed_by = a.id
                WHERE th.task_id = ?
                ORDER BY th.created_at DESC
                LIMIT 50
            `, [taskId]);

            return NextResponse.json({
                success: true,
                task: {
                    ...task,
                    comments,
                    attachments,
                    history
                }
            });
        } finally {
            connection.release();
        }
    } catch (error) {
        console.error("Get Task Detail Error:", error);
        return NextResponse.json({ success: false, message: 'Failed to fetch task' }, { status: 500 });
    }
}

// DELETE: Soft delete task
export async function DELETE(
    request: Request,
    { params }: { params: { id: string } }
) {
    try {
        const taskId = params.id;
        const { getSession } = await import('@/lib/auth');
        const session = await getSession();

        const connection = await pool.getConnection();
        try {
            // Soft delete
            await connection.execute(
                'UPDATE tasks SET deleted_at = NOW() WHERE id = ?',
                [taskId]
            );

            // Log activity
            if (session) {
                const { logAdminActivity } = await import('@/lib/activity-logger');
                await logAdminActivity(
                    session.id,
                    'task_delete',
                    `Soft-deleted task #${taskId}`,
                    'task',
                    parseInt(taskId)
                );
            }

            return NextResponse.json({ success: true });
        } finally {
            connection.release();
        }
    } catch (error) {
        console.error("Delete Task Error:", error);
        return NextResponse.json({ success: false, message: 'Failed to delete task' }, { status: 500 });
    }
}
