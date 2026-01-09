import { NextResponse } from 'next/server';
import pool from '@/lib/db';
import { getSession } from '@/lib/auth';
import bcrypt from 'bcryptjs';

// POST - Change password
export async function POST(request: Request) {
    try {
        const session = await getSession();

        if (!session) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const body = await request.json();
        const { currentPassword, newPassword } = body;

        if (!currentPassword || !newPassword) {
            return NextResponse.json({ success: false, message: 'Missing required fields' }, { status: 400 });
        }

        if (newPassword.length < 8) {
            return NextResponse.json({ success: false, message: 'Password must be at least 8 characters' }, { status: 400 });
        }

        const connection = await pool.getConnection();

        try {
            // Get current password hash
            const [admins]: any = await connection.execute(
                'SELECT password_hash FROM admins WHERE id = ?',
                [session.id]
            );

            if (admins.length === 0) {
                return NextResponse.json({ success: false, message: 'Admin not found' }, { status: 404 });
            }

            // Verify current password
            const isValidPassword = await bcrypt.compare(currentPassword, admins[0].password_hash);

            if (!isValidPassword) {
                return NextResponse.json({ success: false, message: 'Current password is incorrect' }, { status: 401 });
            }

            // Hash new password
            const newPasswordHash = await bcrypt.hash(newPassword, 10);

            // Update password
            await connection.execute(
                'UPDATE admins SET password_hash = ? WHERE id = ?',
                [newPasswordHash, session.id]
            );

            // Log Admin Activity
            // Revoke all sessions (Optional but safer)
            await connection.execute(
                'DELETE FROM admin_sessions WHERE admin_id = ?',
                [session.id]
            );

            // Log Admin Activity
            await connection.execute(
                `INSERT INTO admin_activity_log (admin_id, action_type, action_description, ip_address) 
                 VALUES (?, 'change_password', 'Changed password and revoked sessions', ?)`,
                [session.id, request.headers.get('x-forwarded-for') || 'unknown']
            );

            return NextResponse.json({
                success: true,
                message: 'Password changed successfully'
            });

        } finally {
            connection.release();
        }

    } catch (error) {
        console.error("Change Password Error:", error);
        return NextResponse.json({ success: false, message: 'Failed to change password' }, { status: 500 });
    }
}
