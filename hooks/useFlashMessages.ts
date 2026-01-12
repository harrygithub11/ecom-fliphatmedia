import { useState, useEffect, useCallback } from 'react';

export interface FlashMessage {
    id: string;
    senderId: number;
    receiverId: number;
    message: string;
    isRead: boolean;
    sentAt: string;
    sender: {
        id: number;
        name: string;
        avatar_url: string | null;
    };
    parentMessage?: FlashMessage;
}

export function useFlashMessages() {
    const [unreadMessages, setUnreadMessages] = useState<FlashMessage[]>([]);
    const [loading, setLoading] = useState(false);

    const fetchMessages = useCallback(async (type: 'flash' | 'chat' | 'history' = 'flash', withUserId?: number) => {
        try {
            let url = `/api/admin/flash-messages?type=${type}`;
            if (withUserId) url += `&withUserId=${withUserId}`;

            const res = await fetch(url);
            const data = await res.json();
            return data.success ? data.messages : [];
        } catch (error) {
            console.error('Failed to fetch messages', error);
            return [];
        }
    }, []);

    // Polling only for 'flash' messages (default behavior of the hook currently used by overlay)
    const fetchUnreadFlash = useCallback(async () => {
        const msgs = await fetchMessages('flash');
        setUnreadMessages(msgs);
    }, [fetchMessages]);

    const sendMessage = async (receiverId: number, message: string, parentMessageId?: string, type: 'flash' | 'chat' = 'flash') => {
        const res = await fetch('/api/admin/flash-messages', {
            method: 'POST',
            body: JSON.stringify({ receiverId, message, parentMessageId, type }),
            headers: { 'Content-Type': 'application/json' }
        });
        return await res.json();
    };

    const markAsRead = async (id: string) => {
        const res = await fetch('/api/admin/flash-messages', {
            method: 'PUT',
            body: JSON.stringify({ id }),
            headers: { 'Content-Type': 'application/json' }
        });
        const data = await res.json();
        if (data.success) {
            setUnreadMessages(prev => prev.filter(m => m.id !== id));
        }
        return data;
    };

    // Poll every 5 seconds for Flash Messages
    useEffect(() => {
        fetchUnreadFlash();
        const interval = setInterval(fetchUnreadFlash, 5000);
        return () => clearInterval(interval);
    }, [fetchUnreadFlash]);

    return {
        unreadMessages,
        sendMessage,
        markAsRead,
        refresh: fetchUnreadFlash,
        fetchMessages // Export for chat widget
    };
}
