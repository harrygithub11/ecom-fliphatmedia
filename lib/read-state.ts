import pool from '@/lib/db';

/**
 * Marks a task as read for a specific user.
 * This updates the last_seen_at timestamp for the user-task pair.
 */
export async function markTaskRead(userId: number, taskId: number) {
    const connection = await pool.getConnection();
    try {
        await connection.execute(
            `INSERT INTO task_reads (user_id, task_id, last_seen_at) 
             VALUES (?, ?, NOW()) 
             ON DUPLICATE KEY UPDATE last_seen_at = NOW()`,
            [userId, taskId]
        );

        // Also mark all current comments as read
        // This is a bulk operation for efficiency
        await connection.execute(
            `INSERT INTO comment_reads (user_id, comment_id, seen_at)
             SELECT ?, id, NOW()
             FROM task_comments
             WHERE task_id = ?
             ON DUPLICATE KEY UPDATE seen_at = NOW()`,
            [userId, taskId]
        );

    } finally {
        connection.release();
    }
}

/**
 * Helper to check if a task has unread activity for a user.
 * Returns true if the task has been updated since the user last saw it,
 * or if there are any comments created after the user last saw the task.
 */
export async function isTaskUnread(userId: number, taskId: number) {
    const [rows]: any = await pool.execute(
        `SELECT 
            t.updated_at as task_updated,
            tr.last_seen_at,
            (SELECT MAX(created_at) FROM task_comments WHERE task_id = ?) as last_comment
         FROM tasks t
         LEFT JOIN task_reads tr ON tr.task_id = t.id AND tr.user_id = ?
         WHERE t.id = ?`,
        [taskId, userId, taskId]
    );

    if (rows.length === 0) return false;

    const { task_updated, last_seen_at, last_comment } = rows[0];

    // If never seen, it's unread
    if (!last_seen_at) return true;

    // Check if task updated after last see
    if (new Date(task_updated) > new Date(last_seen_at)) return true;

    // Check if new comments exist
    if (last_comment && new Date(last_comment) > new Date(last_seen_at)) return true;

    return false;
}

/**
 * Get global unread notification count for a user
 */
export async function getUnreadNotificationCount(userId: number): Promise<number> {
    const [rows]: any = await pool.execute(
        'SELECT COUNT(*) as count FROM notifications WHERE user_id = ? AND is_read = FALSE',
        [userId]
    );
    return rows[0].count;
}
