
import pool from '@/lib/db';

export async function createNotification(
    userId: number,
    type: string,
    referenceId: number,
    actorId: number
) {
    const connection = await pool.getConnection();
    try {
        await connection.execute(
            `INSERT INTO notifications (user_id, type, reference_id, is_read, created_at, created_by)
             VALUES (?, ?, ?, FALSE, NOW(), ?)`,
            [userId, type, referenceId, actorId]
        );
    } catch (error) {
        console.error('Failed to create notification', error);
    } finally {
        connection.release();
    }
}

export async function createTeamNotification(
    type: string,
    referenceId: number,
    actorId: number,
    excludeUserId?: number
) {
    // Get all admins except actor and excluded user
    const connection = await pool.getConnection();
    try {
        const [admins]: any = await connection.execute(
            'SELECT id FROM admins WHERE id != ? AND id != ?',
            [actorId, excludeUserId || 0]
        );

        for (const admin of admins) {
            await createNotification(admin.id, type, referenceId, actorId);
        }
    } finally {
        connection.release();
    }
}
