'use client';

import React, { useState, useEffect } from 'react';
import { Bell, Check } from 'lucide-react';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';

interface Notification {
    id: number;
    type: string;
    reference_id: number;
    is_read: boolean;
    created_at: string;
    actor_name?: string;
    actor_avatar?: string;
}

export default function NotificationBell() {
    const [notifications, setNotifications] = useState<Notification[]>([]);
    const [unreadCount, setUnreadCount] = useState(0);

    const fetchNotifications = async () => {
        try {
            const res = await fetch('/api/admin/notifications');
            const data = await res.json();
            if (data.notifications) {
                setNotifications(data.notifications);
                setUnreadCount(data.unreadNotifications || 0);
            }
        } catch (e) { console.error(e); }
    };

    const markAllRead = async () => {
        try {
            await fetch('/api/admin/notifications', { method: 'POST' });
            setUnreadCount(0);
            setNotifications(prev => prev.map(n => ({ ...n, is_read: true })));
        } catch (e) { console.error(e); }
    };

    useEffect(() => {
        fetchNotifications();
        const interval = setInterval(fetchNotifications, 30000); // Poll every 30s
        return () => clearInterval(interval);
    }, []);

    const getNotificationText = (n: Notification) => {
        switch (n.type) {
            case 'task_assigned': return 'assigned you a task';
            case 'comment_added': return 'commented on a task';
            case 'mention': return 'mentioned you';
            default: return 'updated something';
        }
    };

    return (
        <DropdownMenu>
            <DropdownMenuTrigger asChild>
                <Button variant="ghost" size="icon" className="relative">
                    <Bell className="w-5 h-5 text-zinc-500" />
                    {unreadCount > 0 && (
                        <Badge className="absolute -top-1 -right-1 h-5 w-5 rounded-full p-0 flex items-center justify-center bg-red-500 text-white border-2 border-white dark:border-zinc-950">
                            {unreadCount > 9 ? '9+' : unreadCount}
                        </Badge>
                    )}
                </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end" className="w-80 p-0">
                <div className="flex items-center justify-between px-4 py-3 border-b border-zinc-100 dark:border-zinc-800">
                    <h4 className="font-semibold text-sm">Notifications</h4>
                    {unreadCount > 0 && (
                        <Button variant="ghost" size="sm" onClick={markAllRead} className="h-auto px-2 py-0.5 text-xs text-blue-600 hover:text-blue-700">
                            Mark all read
                        </Button>
                    )}
                </div>
                <div className="max-h-[300px] overflow-y-auto">
                    {notifications.length === 0 ? (
                        <div className="p-8 text-center text-zinc-500 text-sm">
                            No notifications
                        </div>
                    ) : (
                        notifications.map(n => (
                            <div key={n.id} className={`px-4 py-3 border-b border-zinc-50 dark:border-zinc-900 last:border-0 hover:bg-zinc-50 dark:hover:bg-zinc-900/50 transition-colors ${!n.is_read ? 'bg-blue-50/50 dark:bg-blue-900/10' : ''}`}>
                                <div className="flex gap-3">
                                    <Avatar className="w-8 h-8">
                                        <AvatarImage src={n.actor_avatar} />
                                        <AvatarFallback>{n.actor_name?.charAt(0) || '?'}</AvatarFallback>
                                    </Avatar>
                                    <div className="flex-1 space-y-1">
                                        <p className="text-sm">
                                            <span className="font-medium text-zinc-900 dark:text-zinc-100">{n.actor_name || 'System'}</span>
                                            {' '}
                                            <span className="text-zinc-500">{getNotificationText(n)}</span>
                                        </p>
                                        <p className="text-xs text-zinc-400">
                                            {new Date(n.created_at).toLocaleDateString()}
                                        </p>
                                    </div>
                                    {!n.is_read && (
                                        <div className="w-2 h-2 mt-1.5 rounded-full bg-blue-500 shrink-0" />
                                    )}
                                </div>
                            </div>
                        ))
                    )}
                </div>
            </DropdownMenuContent>
        </DropdownMenu>
    );
}
