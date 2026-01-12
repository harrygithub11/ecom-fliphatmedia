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

    useEffect(() => {
        const loadJitsiScript = () => {
            return new Promise<void>((resolve) => {
                if (window.JitsiMeetExternalAPI) {
                    resolve();
                    return;
                }
                const script = document.createElement('script');
                script.src = 'https://meet.jit.si/external_api.js';
                script.async = true;
                script.onload = () => resolve();
                document.body.appendChild(script);
            });
        };

        const initJitsi = async () => {
            await loadJitsiScript();

            if (!jitsiContainerRef.current) return;

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

            api.addEventListeners({
                videoConferenceJoined: () => {
                    setLoading(false);
                    if (onReady) onReady();
                },
                videoConferenceLeft: () => {
                    if (onEnd) onEnd();
                },
                readyToClose: () => {
                    if (onEnd) onEnd();
                }
            });
        };

        initJitsi();

        return () => {
            if (apiRef.current) {
                apiRef.current.dispose();
            }
        };
    }, [roomName, userName, onReady, onEnd]);

    return (
        <div className="relative w-full h-full bg-zinc-950 rounded-xl overflow-hidden shadow-2xl border border-zinc-800">
            {loading && (
                <div className="absolute inset-0 flex flex-col items-center justify-center bg-zinc-900 z-50">
                    <div className="w-12 h-12 border-4 border-primary border-t-transparent rounded-full animate-spin mb-4" />
                    <p className="text-zinc-400 font-medium animate-pulse">Establishing Secure Connection...</p>
                </div>
            )}
            <div ref={jitsiContainerRef} className="w-full h-full" />
        </div>
    );
}
