'use client';

import { useState, useEffect } from 'react';
import { Button } from '@/components/ui/button';
import { ChevronLeft, MoreHorizontal, User, Layout, ArrowLeft } from 'lucide-react';
import Link from 'next/link';
import MeetingRoom from '@/components/admin/meetings/MeetingRoom';
import MeetingNotes from '@/components/admin/meetings/MeetingNotes';
import { useRouter } from 'next/navigation';

export default function MeetingRoomPage({ params }: { params: { id: string } }) {
    const [meeting, setMeeting] = useState<any>(null);
    const [loading, setLoading] = useState(true);
    const [user, setUser] = useState<any>(null);
    const router = useRouter();

    useEffect(() => {
        const fetchData = async () => {
            try {
                // Fetch User
                const userRes = await fetch('/api/admin/me');
                const userData = await userRes.json();
                if (userData.success) setUser(userData.admin);

                // Fetch Meeting
                const res = await fetch(`/api/admin/meetings/${params.id}`);
                const data = await res.json();
                if (data.success) {
                    setMeeting(data.meeting);
                } else {
                    router.push('/admin/meetings');
                }
            } catch (error) {
                console.error('Error loading meeting:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [params.id, router]);

    const handleEndMeeting = async () => {
        try {
            await fetch(`/api/admin/meetings/${params.id}`, {
                method: 'PATCH',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    status: 'completed',
                    endTime: new Date().toISOString()
                })
            });
            router.push('/admin/meetings');
        } catch (error) {
            console.error('Failed to end meeting:', error);
            router.push('/admin/meetings');
        }
    };

    if (loading) return (
        <div className="h-screen bg-black flex items-center justify-center">
            <div className="text-center">
                <div className="w-12 h-12 border-4 border-primary border-t-transparent rounded-full animate-spin mx-auto mb-4" />
                <p className="text-zinc-500 uppercase tracking-widest text-[10px] font-black">Initializing Room...</p>
            </div>
        </div>
    );

    if (!meeting || !user) return null;

    return (
        <div className="fixed inset-0 bg-[#0A0A0A] flex flex-col z-[100] animate-in fade-in duration-500">
            {/* Header */}
            <div className="h-20 border-b border-white/5 px-8 flex items-center justify-between shrink-0 bg-[#0F0F0F]">
                <div className="flex items-center gap-6">
                    <Link href="/admin/meetings">
                        <Button variant="ghost" size="icon" className="text-white hover:bg-white/10 rounded-full h-12 w-12">
                            <ArrowLeft className="w-6 h-6" />
                        </Button>
                    </Link>
                    <div className="h-10 w-px bg-white/10" />
                    <div>
                        <h1 className="text-white font-black text-xl uppercase tracking-tighter leading-none">{meeting.title}</h1>
                        <p className="text-primary text-[10px] font-black uppercase tracking-widest mt-1 flex items-center gap-2">
                            <span className="w-1.5 h-1.5 rounded-full bg-primary animate-pulse" /> Live Session #{(meeting.id || '').slice(-6)}
                        </p>
                    </div>
                </div>

                <div className="flex items-center gap-4">
                    <div className="hidden md:flex flex-col items-end mr-4">
                        <span className="text-white/40 text-[10px] uppercase font-black tracking-widest">Moderator</span>
                        <span className="text-white text-xs font-bold">{user.name}</span>
                    </div>
                    <Button
                        onClick={handleEndMeeting}
                        className="bg-red-600 hover:bg-red-700 text-white font-black uppercase tracking-widest text-[10px] h-12 px-8 rounded-full shadow-lg shadow-red-900/20"
                    >
                        End Session
                    </Button>
                </div>
            </div>

            {/* Main Area */}
            <div className="flex-1 flex overflow-hidden p-6 gap-6">
                {/* Video Area */}
                <div className="flex-[3] h-full">
                    <MeetingRoom
                        roomName={meeting.roomName}
                        userName={user.name}
                        onReady={() => console.log('Meeting ready')}
                        onEnd={() => router.push('/admin/meetings')}
                    />
                </div>

                {/* Notes Sidebar Area */}
                <div className="flex-1 h-full bg-[#141414] rounded-3xl p-6 border border-white/5 flex flex-col shadow-2xl relative overflow-hidden group">
                    {/* Background Detail */}
                    <div className="absolute top-0 right-0 w-32 h-32 bg-primary/5 rounded-bl-[100%] opacity-50" />
                    <MeetingNotes meetingId={meeting.id} initialNotes={meeting.notes} />
                </div>
            </div>
        </div>
    );
}
