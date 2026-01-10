
import { NextRequest, NextResponse } from 'next/server';
import pool from '@/lib/db';
import { Queue } from 'bullmq';
import Redis from 'ioredis';

// Reuse Redis connection for queue using config object to avoid type mismatch
const emailQueue = new Queue('email-queue', {
    connection: {
        host: process.env.REDIS_HOST || '127.0.0.1',
        port: parseInt(process.env.REDIS_PORT || '6379'),
        password: process.env.REDIS_PASSWORD
    }
});

export async function POST(req: NextRequest) {
    try {
        const body = await req.json();
        const {
            recipients, // Expected: { to: [{email: '...'}, ...], cc: [], bcc: [] }
            subject,
            body_html,
            body_text,
            smtp_account_id,
            related_customer_id,
            in_reply_to
        } = body;

        if (!recipients || !recipients.to || !subject || !smtp_account_id) {
            return NextResponse.json({ success: false, message: 'Missing required fields' }, { status: 400 });
        }

        // 1. Get Sender Info (for from_name/address)
        const [accounts]: any = await pool.execute(
            'SELECT from_name, from_email FROM smtp_accounts WHERE id = ?',
            [smtp_account_id]
        );

        if (accounts.length === 0) {
            return NextResponse.json({ success: false, message: 'Invalid SMTP Account' }, { status: 400 });
        }
        const sender = accounts[0];

        // 2. Format Recipients for JSON storage
        const recipientJson = JSON.stringify(recipients.to.map((r: any) => ({
            name: r.name || '',
            email: r.email
        })));

        // 3. Insert into DB (Status = queued)
        // Note: 'folder' is 'SENT' for outbound emails
        // 'direction' is 'outbound'
        // 3. Threading Logic
        let threadId = `thread_out_${Date.now()}`;
        if (in_reply_to) {
            const [parent]: any = await pool.execute('SELECT thread_id FROM emails WHERE message_id = ? OR id = ?', [in_reply_to, in_reply_to]);
            if (parent.length > 0) threadId = parent[0].thread_id;
        }

        const [result]: any = await pool.execute(`
            INSERT INTO emails (
                smtp_account_id, customer_id, direction, folder, status, 
                from_address, from_name, subject, body_html, body_text, 
                recipient_to, in_reply_to, thread_id
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `, [
            smtp_account_id,
            related_customer_id || null,
            'outbound',
            'SENT',
            'queued',
            sender.from_email,
            sender.from_name || '',
            subject,
            body_html || '',
            body_text || '',
            recipientJson,
            in_reply_to || null,
            threadId
        ]);

        const emailId = result.insertId;

        // 3. Log as Interaction (for Global Activity/Timeline)
        if (related_customer_id) {
            // Assuming `session` is available in the scope, if not, it needs to be passed or retrieved.
            // For now, using a placeholder for created_by.
            const createdBy = null; // Replace with actual session?.id if available
            await pool.execute(`
                INSERT INTO interactions (customer_id, type, content, created_at, created_by)
                VALUES (?, 'email_outbound', ?, NOW(), ?)
            `, [
                related_customer_id,
                `Email Queued: ${subject.substring(0, 100)}`,
                createdBy
            ]);
        }

        // 4. Add to BullMQ Queue
        await emailQueue.add('send-email', { emailId });

        return NextResponse.json({ success: true, message: 'Email queued for sending', emailId });

    } catch (error: any) {
        console.error('Send Email Error:', error);
        return NextResponse.json({ success: false, message: error.message }, { status: 500 });
    }
}
