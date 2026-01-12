import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getSession } from '@/lib/auth'
import { v4 as uuidv4 } from 'uuid'

export const dynamic = 'force-dynamic'

export async function GET(request: NextRequest) {
    try {
        const session = await getSession();
        if (!session) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const p = prisma as any;
        const meetings = await p.meeting.findMany({
            orderBy: { createdAt: 'desc' },
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

        return NextResponse.json({ success: true, meetings });
    } catch (error: any) {
        console.error('[MEETINGS_GET_ERROR]', error);
        return NextResponse.json({ error: 'Failed to fetch meetings' }, { status: 500 });
    }
}

export async function POST(request: NextRequest) {
    try {
        const session = await getSession();
        if (!session) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const { title, description } = await request.json();

        if (!title) {
            return NextResponse.json({ error: 'Title is required' }, { status: 400 });
        }

        // Generate a unique room name for Jitsi
        const roomName = `Fliphat-${uuidv4().slice(0, 8)}`;

        const p = prisma as any;
        const meeting = await p.meeting.create({
            data: {
                title,
                description,
                roomName,
                hostId: session.id,
                status: 'active'
            }
        });

        return NextResponse.json({ success: true, meeting });
    } catch (error: any) {
        console.error('[MEETING_CREATE_ERROR]', error);
        return NextResponse.json({ error: 'Failed to create meeting' }, { status: 500 });
    }
}
