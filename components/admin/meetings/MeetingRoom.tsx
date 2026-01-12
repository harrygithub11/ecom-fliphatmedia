'use client';

import { useEffect, useRef, useState } from 'react';
import { Button } from '@/components/ui/button';
import { VideoOff, RefreshCw } from 'lucide-react';

interface MeetingRoomProps {
    roomName: string;
    userName: string;
    onReady?: () => void;
    onEnd?: () => void;
}

export default function MeetingRoom({ roomName, userName }: MeetingRoomProps) {
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    // Simple iframe-based approach (more reliable than External API)
    const jitsiUrl = `https://meet.jit.si/${roomName}#config.prejoinPageEnabled=false&userInfo.displayName="${encodeURIComponent(userName)}"`;

    useEffect(() => {
        // Hide loading after a short delay
        const timer = setTimeout(() => {
            setLoading(false);
        }, 2000);

        return () => clearTimeout(timer);
    }, []);

    return (
        <div className="relative w-full h-full bg-zinc-950 rounded-xl overflow-hidden shadow-2xl border border-zinc-800">
            {loading && (
                <div className="absolute inset-0 flex flex-col items-center justify-center bg-zinc-900 z-50">
                    <div className="w-12 h-12 border-4 border-primary border-t-transparent rounded-full animate-spin mb-4" />
                    <p className="text-zinc-400 font-medium animate-pulse">Loading video room...</p>
                </div>
            )}
            {error && (
                <div className="absolute inset-0 flex flex-col items-center justify-center bg-zinc-900 z-50 p-8">
                    <div className="w-16 h-16 rounded-full bg-red-500/10 flex items-center justify-center mb-4">
                        <VideoOff className="w-8 h-8 text-red-500" />
                    </div>
                    <h3 className="text-xl font-bold text-white mb-2">Connection Failed</h3>
                    <p className="text-zinc-400 text-center mb-6 max-w-md">{error}</p>
                    <Button onClick={() => window.location.reload()} className="bg-primary hover:bg-primary/90">
                        <RefreshCw className="w-4 h-4 mr-2" /> Retry Connection
                    </Button>
                </div>
            )}
            <iframe
                src={jitsiUrl}
                allow="camera; microphone; fullscreen; display-capture; autoplay"
                className="w-full h-full border-0"
                title="Jitsi Meeting"
            />
        </div>
    );
}
