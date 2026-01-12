import { useState, useEffect } from 'react';
import { useFlashMessages, FlashMessage } from '@/hooks/useFlashMessages';
import { X, Send, AlertCircle, Clock, Check, Reply } from 'lucide-react';
import { cn } from '@/lib/utils';
import { Button } from '@/components/ui/button';

export function FlashMessageOverlay() {
    const { unreadMessages, markAsRead, sendMessage } = useFlashMessages();
    const [currentMessage, setCurrentMessage] = useState<FlashMessage | null>(null);
    const [replyText, setReplyText] = useState('');
    const [sending, setSending] = useState(false);

    // Show oldest unread message first
    useEffect(() => {
        if (unreadMessages.length > 0 && !currentMessage) {
            setCurrentMessage(unreadMessages[0]);
        }
    }, [unreadMessages, currentMessage]);

    const handleDismiss = async () => {
        if (!currentMessage) return;
        await markAsRead(currentMessage.id);
        setCurrentMessage(null); // Will trigger effect to show next if any
    };

    const handleReply = async () => {
        if (!currentMessage || !replyText.trim()) return;
        setSending(true);
        try {
            await sendMessage(currentMessage.senderId, replyText, currentMessage.id);
            await markAsRead(currentMessage.id);
            setReplyText('');
            setCurrentMessage(null);
        } catch (err) {
            console.error(err);
        } finally {
            setSending(false);
        }
    };

    if (!currentMessage) return null;

    return (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 animate-in fade-in duration-300">
            {/* Backdrop */}
            <div className="absolute inset-0 bg-black/60 backdrop-blur-md" />

            {/* Message Card */}
            <div className="relative w-full max-w-2xl bg-white/95 border border-white/20 shadow-2xl rounded-2xl flex flex-col overflow-hidden animate-in zoom-in-95 duration-300">

                {/* Header */}
                <div className="bg-gradient-to-r from-red-600 to-red-800 p-6 flex items-center justify-between text-white">
                    <div className="flex items-center gap-4">
                        <div className="p-3 bg-white/20 rounded-full backdrop-blur-sm animate-pulse">
                            <AlertCircle className="w-8 h-8 text-white" />
                        </div>
                        <div>
                            <h2 className="text-2xl font-black uppercase tracking-wider">Priority Message</h2>
                            <div className="flex items-center gap-2 text-red-100 text-sm font-medium">
                                <span>From: {currentMessage.sender?.name || 'Admin'}</span>
                                <span>•</span>
                                <Clock className="w-3 h-3" />
                                <span>{new Date(currentMessage.sentAt).toLocaleTimeString()}</span>
                            </div>
                        </div>
                    </div>
                </div>

                {/* Body */}
                <div className="p-8 bg-white/50 backdrop-blur-sm">
                    <div className="text-3xl font-bold text-gray-900 leading-tight mb-8 drop-shadow-sm min-h-[120px] flex items-center justify-center text-center">
                        "{currentMessage.message}"
                    </div>

                    {/* Reply Section */}
                    <div className="space-y-4">
                        <div className="relative">
                            <textarea
                                value={replyText}
                                onChange={(e) => setReplyText(e.target.value)}
                                placeholder="Type your reply here..."
                                className="w-full bg-white border-2 border-gray-200 rounded-xl p-4 text-lg focus:outline-none focus:border-red-500 focus:ring-4 focus:ring-red-500/10 transition-all resize-none shadow-inner"
                                rows={3}
                            />
                            <div className="absolute right-3 bottom-3 text-xs text-gray-400 font-bold">
                                ENTER to send (optional)
                            </div>
                        </div>

                        <div className="flex gap-4">
                            <Button
                                onClick={handleDismiss}
                                variant="outline"
                                className="flex-1 py-6 text-lg font-bold border-2 hover:bg-gray-100"
                            >
                                <Check className="w-5 h-5 mr-2" />
                                Acknowledge & Close
                            </Button>
                            <Button
                                onClick={handleReply}
                                disabled={!replyText.trim() || sending}
                                className="flex-[2] py-6 text-lg font-bold bg-red-600 hover:bg-red-700 text-white shadow-lg shadow-red-600/20"
                            >
                                {sending ? (
                                    <>Sending...</>
                                ) : (
                                    <>
                                        <Reply className="w-5 h-5 mr-2" />
                                        Reply Instantly
                                    </>
                                )}
                            </Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
