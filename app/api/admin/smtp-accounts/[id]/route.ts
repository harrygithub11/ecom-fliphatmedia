import { NextResponse } from 'next/server';
import pool from '@/lib/db';
import { encrypt } from '@/lib/smtp-encrypt';
import nodemailer from 'nodemailer';

export const dynamic = 'force-dynamic';

export async function PUT(request: Request, { params }: { params: { id: string } }) {
    try {
        const id = params.id;
        const body = await request.json();
        const { name, provider, host, port, username, password, from_email, from_name, test_connection } = body;

        // Validation
        if (!name || !host || !port || !username || !from_email) {
            return NextResponse.json({ success: false, message: 'Missing required fields' }, { status: 400 });
        }

        // 1. Test Connection if password is being updated or verification requested
        if (test_connection && password) {
            try {
                const transporter = nodemailer.createTransport({
                    host,
                    port: Number(port),
                    secure: Number(port) === 465,
                    auth: { user: username, pass: password }
                });
                await transporter.verify();
            } catch (smtpError: any) {
                let msg = 'SMTP Connection Failed: ' + smtpError.message;
                if (host.includes('gmail') && smtpError.message.includes('Username and Password not accepted')) {
                    msg += ' (Hint: For Gmail, use an "App Password", not your main password)';
                }
                return NextResponse.json({ success: false, message: msg }, { status: 400 });
            }
        }

        // 2. Prepare Update Query
        let query = `UPDATE smtp_accounts SET 
            name = ?, provider = ?, host = ?, port = ?, username = ?, 
            from_email = ?, from_name = ?`;

        const queryParams = [name, provider, host, port, username, from_email, from_name];

        // 3. Encrypt & Update Password only if provided
        if (password && password.trim() !== '') {
            const encryptedPassword = encrypt(password);
            query += `, encrypted_password = ?`;
            queryParams.push(encryptedPassword);
        }

        query += ` WHERE id = ?`;
        queryParams.push(id);

        await pool.execute(query, queryParams);

        return NextResponse.json({ success: true, message: 'SMTP Account updated successfully' });

    } catch (error: any) {
        console.error('Update SMTP Error:', error);
        return NextResponse.json({ success: false, message: 'Failed to update account: ' + error.message }, { status: 500 });
    }
}

export async function DELETE(request: Request, { params }: { params: { id: string } }) {
    try {
        const id = params.id;
        // Check if used in any campaigns/emails logic could be added here

        await pool.execute('DELETE FROM smtp_accounts WHERE id = ?', [id]);
        return NextResponse.json({ success: true, message: 'Account deleted' });
    } catch (error: any) {
        return NextResponse.json({ success: false, message: 'Failed to delete: ' + error.message }, { status: 500 });
    }
}
