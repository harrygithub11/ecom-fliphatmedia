import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { markTaskRead } from '@/lib/read-state';

export async function POST(
    request: Request,
    { params }: { params: { id: string } }
) {
    const session = await getSession();
    if (!session) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    try {
        const taskId = parseInt(params.id);
        await markTaskRead(session.id, taskId);

        return NextResponse.json({ success: true });
    } catch (error) {
        console.error('Error marking task as read:', error);
        return NextResponse.json({ error: 'Failed to mark task as read' }, { status: 500 });
    }
}
