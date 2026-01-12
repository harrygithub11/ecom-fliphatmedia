import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getSession } from '@/lib/auth'

export const dynamic = 'force-dynamic'

export async function GET(request: NextRequest, { params }: { params: { id: string } }) {
    try {
        const session = await getSession();
        if (!session) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const p = prisma as any;
        const meeting = await p.meeting.findUnique({
            where: { id: params.id },
            include: {
                host: {
                    select: {
                        name: true,
                        email: true,
                        avatar_url: true
                    }
                }
            }
        });

        if (!meeting) {
            return NextResponse.json({ error: 'Meeting not found' }, { status: 404 });
        }

        return NextResponse.json({ success: true, meeting });
    } catch (error: any) {
        console.error('[MEETING_GET_ERROR]', error);
        return NextResponse.json({ error: 'Failed to fetch meeting' }, { status: 500 });
    }
}

export async function PATCH(request: NextRequest, { params }: { params: { id: string } }) {
    try {
        const session = await getSession();
        if (!session) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const body = await request.json();
        const { notes, status, endTime } = body;

        const p = prisma as any;
        const meeting = await p.meeting.update({
            where: { id: params.id },
            data: {
                notes: notes !== undefined ? notes : undefined,
                status: status !== undefined ? status : undefined,
                endTime: endTime !== undefined ? new Date(endTime) : undefined,
            }
        });

        return NextResponse.json({ success: true, meeting });
    } catch (error: any) {
        console.error('[MEETING_UPDATE_ERROR]', error);
        return NextResponse.json({ error: 'Failed to update meeting' }, { status: 500 });
    }
}

export async function DELETE(request: NextRequest, { params }: { params: { id: string } }) {
    try {
        const session = await getSession();
        if (!session) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const p = prisma as any;
        await p.meeting.delete({
            where: { id: params.id }
        });

        return NextResponse.json({ success: true, message: 'Meeting deleted' });
    } catch (error: any) {
        console.error('[MEETING_DELETE_ERROR]', error);
        return NextResponse.json({ error: 'Failed to delete meeting' }, { status: 500 });
    }
}
