'use client';

import { useState, useEffect, useRef } from 'react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Textarea } from '@/components/ui/textarea';
import { ScrollArea } from '@/components/ui/scroll-area';
import { Badge } from '@/components/ui/badge';
import { Save, Cloud, Check } from 'lucide-react';

interface MeetingNotesProps {
    meetingId: string;
    initialNotes?: string;
}

export default function MeetingNotes({ meetingId, initialNotes = '' }: MeetingNotesProps) {
    const [notes, setNotes] = useState(initialNotes);
    const [saving, setSaving] = useState(false);
    const [lastSaved, setLastSaved] = useState<Date | null>(null);
    const timeoutRef = useRef<NodeJS.Timeout | null>(null);

    const saveNotes = async (content: string) => {
        setSaving(true);
        try {
            const res = await fetch(`/api/admin/meetings/${meetingId}`, {
                method: 'PATCH',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ notes: content })
            });
            if (res.ok) {
                setLastSaved(new Date());
            }
        } catch (error) {
            console.error('Failed to save notes:', error);
        } finally {
            setSaving(false);
        }
    };

    const handleNotesChange = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
        const newNotes = e.target.value;
        setNotes(newNotes);

        if (timeoutRef.current) clearTimeout(timeoutRef.current);
        timeoutRef.current = setTimeout(() => {
            saveNotes(newNotes);
        }, 2000);
    };

    useEffect(() => {
        return () => {
            if (timeoutRef.current) clearTimeout(timeoutRef.current);
        };
    }, []);

    return (
        <Card className="h-full flex flex-col border-none shadow-none bg-transparent">
            <CardHeader className="py-4 px-0 shrink-0 border-b flex flex-row items-center justify-between space-y-0 mb-4">
                <CardTitle className="text-sm font-bold uppercase tracking-widest text-zinc-500">Meeting Notes</CardTitle>
                <div className="flex items-center gap-2">
                    {saving ? (
                        <Badge variant="outline" className="text-[10px] h-5 bg-zinc-100 dark:bg-zinc-800 animate-pulse border-none">
                            <Cloud className="w-3 h-3 mr-1" /> Saving...
                        </Badge>
                    ) : lastSaved ? (
                        <Badge variant="outline" className="text-[10px] h-5 bg-green-50 dark:bg-green-900/20 text-green-600 border-none">
                            <Check className="w-3 h-3 mr-1" /> Saved {lastSaved.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}
                        </Badge>
                    ) : null}
                </div>
            </CardHeader>
            <CardContent className="p-0 flex-1 overflow-hidden">
                <ScrollArea className="h-full pr-4">
                    <Textarea
                        value={notes}
                        onChange={handleNotesChange}
                        placeholder="Start taking notes here... (Auto-saves every 2 seconds)"
                        className="min-h-[calc(100vh-250px)] w-full resize-none border-none focus-visible:ring-0 bg-transparent text-base leading-relaxed p-0 placeholder:text-zinc-300 dark:placeholder:text-zinc-700"
                    />
                </ScrollArea>
            </CardContent>
        </Card>
    );
}
