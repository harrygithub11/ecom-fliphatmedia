'use client';

import { useEffect, useRef, useState } from 'react';
import { Button } from '@/components/ui/button';
import { Maximize2, Minimize2, Video, VideoOff, Mic, MicOff, MonitorUp, MonitorOff, PhoneOff } from 'lucide-react';

interface MeetingRoomProps {
    roomName: string;
    userName: string;
    onReady?: () => void;
    onEnd?: () => void;
}

declare global {
    interface Window {
        JitsiMeetExternalAPI: any;
    }
}

export default function MeetingRoom({ roomName, userName, onReady, onEnd }: MeetingRoomProps) {
    const jitsiContainerRef = useRef<HTMLDivElement>(null);
    const apiRef = useRef<any>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        let timeout: NodeJS.Timeout;

        const loadJitsiScript = () => {
            return new Promise<void>((resolve, reject) => {
                if (window.JitsiMeetExternalAPI) {
                    resolve();
                    return;
                }
                const script = document.createElement('script');
                script.src = 'https://meet.jit.si/external_api.js';
                script.async = true;
                script.onload = () => resolve();
                script.onerror = () => reject(new Error('Failed to load Jitsi Meet script'));
                document.body.appendChild(script);
            });
        };

        const initJitsi = async () => {
            try {
                await loadJitsiScript();

                if (!jitsiContainerRef.current) {
                    setError('Container not found');
                    return;
                }

                const domain = 'meet.jit.si';
                const options = {
                    roomName: roomName,
                    width: '100%',
                    height: '100%',
                    parentNode: jitsiContainerRef.current,
                    userInfo: {
                        displayName: userName
                    },
                    configOverwrite: {
                        startWithAudioMuted: false,
                        startWithVideoMuted: false,
                        prejoinPageEnabled: false,
                        disableDeepLinking: true,
                    },
                    interfaceConfigOverwrite: {
                        TILE_VIEW_MAX_COLUMNS: 8,
                    }
                };

                const api = new window.JitsiMeetExternalAPI(domain, options);
                apiRef.current = api;

                // Set a timeout to detect if connection is stuck
                timeout = setTimeout(() => {
                    if (loading) {
                        setError('Connection timeout - please check your internet connection');
                        setLoading(false);
                    }
                }, 30000); // 30 second timeout

                api.addEventListeners({
                    videoConferenceJoined: () => {
                        clearTimeout(timeout);
                        setLoading(false);
                        setError(null);
                        if (onReady) onReady();
                    },
                    videoConferenceLeft: () => {
                        if (onEnd) onEnd();
                    },
                    readyToClose: () => {
                        if (onEnd) onEnd();
                    }
                });
            } catch (err: any) {
                console.error('Jitsi initialization error:', err);
                setError(err.message || 'Failed to initialize video call');
                setLoading(false);
            }
        };

        initJitsi();

        return () => {
            if (timeout) clearTimeout(timeout);
            if (apiRef.current) {
                apiRef.current.dispose();
            }
        };
    }, [roomName, userName, onReady, onEnd]);

    return (
        <div className="relative w-full h-full bg-zinc-950 rounded-xl overflow-hidden shadow-2xl border border-zinc-800">
            {loading && !error && (
                <div className="absolute inset-0 flex flex-col items-center justify-center bg-zinc-900 z-50">
                    <div className="w-12 h-12 border-4 border-primary border-t-transparent rounded-full animate-spin mb-4" />
                    <p className="text-zinc-400 font-medium animate-pulse">Establishing Secure Connection...</p>
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
                        Retry Connection
                    </Button>
                </div>
            )}
            <div ref={jitsiContainerRef} className="w-full h-full" />
        </div>
    );
}
