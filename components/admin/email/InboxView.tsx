'use client';

import { useState, useEffect } from 'react';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { ScrollArea } from '@/components/ui/scroll-area';
import { Badge } from '@/components/ui/badge';
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';
import { Separator } from '@/components/ui/separator';
import { Search, Mail, Reply, Trash2, RefreshCw, Inbox, Send, Archive, FileText, User, ChevronLeft, Loader2 } from 'lucide-react';
import { useToast } from '@/components/ui/use-toast';
import { formatDistanceToNow } from 'date-fns';
import { ComposeModal } from './ComposeModal';
import { cn } from '@/lib/utils';

interface Email {
    id: number;
    subject: string;
    from_name: string;
    from_address: string;
    account_email: string; // Recipient account
    customer_name: string;
    avatar_url: string;
    body_html: string;
    body_text: string;
    created_at: string;
    received_at: string;
    is_read: boolean | number;
    recipient_to?: string; // JSON string of recipients
    thread_id?: string;
    thread_count?: number;
}

interface Account {
    id: number;
    name: string;
    from_email: string;
    unread_count: number;
}

export function InboxView() {
    // Context State
    const [accounts, setAccounts] = useState<Account[]>([]);
    const [selectedAccountId, setSelectedAccountId] = useState<string>('all');
    const [selectedFolder, setSelectedFolder] = useState<string>('INBOX');

    // Data State
    const [emails, setEmails] = useState<Email[]>([]);
    const [selectedEmail, setSelectedEmail] = useState<Email | null>(null);
    const [currentThread, setCurrentThread] = useState<Email[]>([]);
    const [loading, setLoading] = useState(true);
    const [threadLoading, setThreadLoading] = useState(false);
    const [refreshing, setRefreshing] = useState(false);
    const [search, setSearch] = useState('');

    // UI State
    const [replyOpen, setReplyOpen] = useState(false);

    const { toast } = useToast();

    // 1. Fetch Accounts on Mount
    useEffect(() => {
        fetchAccounts();
    }, []);

    // 2. Fetch Emails on Filter Change
    useEffect(() => {
        fetchInbox();
    }, [selectedAccountId, selectedFolder]);

    const fetchAccounts = async () => {
        try {
            const res = await fetch('/api/admin/smtp-accounts');
            const data = await res.json();
            if (data.success) setAccounts(data.accounts);
        } catch (error) {
            console.error('Failed to fetch accounts', error);
        }
    };

    const fetchInbox = async () => {
        setLoading(true);
        try {
            const params = new URLSearchParams({
                folder: selectedFolder,
                accountId: selectedAccountId
            });
            const res = await fetch(`/api/admin/emails/inbox?${params}`);
            const data = await res.json();
            if (data.success) {
                setEmails(data.emails);
            }
        } catch (error) {
            console.error('Failed to fetch inbox', error);
        } finally {
            setLoading(false);
            setRefreshing(false);
        }
    };

    const handleRefresh = () => {
        setRefreshing(true);
        fetchInbox();
    };

    const filteredEmails = emails.filter(e =>
        (e.subject?.toLowerCase() || '').includes(search.toLowerCase()) ||
        (e.from_name?.toLowerCase() || '').includes(search.toLowerCase()) ||
        (e.from_address?.toLowerCase() || '').includes(search.toLowerCase())
    );

    // Helpers
    const getInitials = (name: string) => name ? name.substring(0, 2).toUpperCase() : '??';

    const fetchThread = async (threadId: string) => {
        setThreadLoading(true);
        try {
            const res = await fetch(`/api/admin/emails/thread/${threadId}`);
            const data = await res.json();
            if (data.success) {
                setCurrentThread(data.emails);
            }
        } catch (error) {
            console.error('Failed to fetch thread', error);
        } finally {
            setThreadLoading(false);
        }
    };

    const handleEmailClick = (email: Email) => {
        setSelectedEmail(email);
        if (email.thread_id) {
            fetchThread(email.thread_id);
        } else {
            setCurrentThread([email]);
        }

        if (!email.is_read) {
            // Mark as read in UI
            setEmails(prev => prev.map(e => e.id === email.id ? { ...e, is_read: true } : e));

            // API call to mark as read
            fetch(`/api/admin/emails/${email.id}`, {
                method: 'PATCH',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ is_read: true })
            });
        }
    };

    return (
        <div className="flex h-[calc(100vh-140px)] w-full rounded-lg border bg-background shadow-sm overflow-hidden">
            {/* 1. Sidebar (Accounts & Folders) */}
            <div className="w-[250px] bg-muted/20 border-r flex flex-col hidden md:flex">
                <div className="p-4">
                    <Button onClick={() => setReplyOpen(true)} className="w-full justify-start gap-2" size="lg">
                        <Send className="h-4 w-4" /> Compose
                    </Button>
                </div>

                <ScrollArea className="flex-1 px-3">
                    <div className="space-y-4">
                        <div className="py-2">
                            <h3 className="mb-2 px-2 text-xs font-semibold text-muted-foreground uppercase tracking-wider">Folders</h3>
                            <div className="space-y-1">
                                {[
                                    { id: 'INBOX', icon: Inbox, label: 'Inbox', color: 'text-blue-500' },
                                    { id: 'SENT', icon: Send, label: 'Sent', color: 'text-green-500' },
                                    { id: 'TRASH', icon: Trash2, label: 'Trash', color: 'text-red-500' },
                                ].map((folder) => (
                                    <Button
                                        key={folder.id}
                                        variant="ghost"
                                        size="sm"
                                        className={cn(
                                            "w-full justify-start font-normal",
                                            selectedFolder === folder.id ? "bg-accent text-accent-foreground font-medium" : ""
                                        )}
                                        onClick={() => setSelectedFolder(folder.id)}
                                    >
                                        <folder.icon className={cn("mr-2 h-4 w-4", folder.color)} />
                                        {folder.label}
                                    </Button>
                                ))}
                            </div>
                        </div>

                        <Separator />

                        <div className="py-2">
                            <h3 className="mb-2 px-2 text-xs font-semibold text-muted-foreground uppercase tracking-wider">Accounts</h3>
                            <div className="space-y-1">
                                <Button
                                    variant="ghost"
                                    size="sm"
                                    className={cn("w-full justify-start font-normal", selectedAccountId === 'all' ? "bg-accent text-accent-foreground font-medium" : "")}
                                    onClick={() => setSelectedAccountId('all')}
                                >
                                    <Inbox className="mr-2 h-4 w-4" />
                                    All Inboxes
                                </Button>
                                {accounts.map((acc) => (
                                    <Button
                                        key={acc.id}
                                        variant="ghost"
                                        size="sm"
                                        className={cn(
                                            "w-full justify-start font-normal truncate",
                                            selectedAccountId === String(acc.id) ? "bg-accent text-accent-foreground font-medium" : ""
                                        )}
                                        onClick={() => setSelectedAccountId(String(acc.id))}
                                    >
                                        <div className="h-2 w-2 rounded-full bg-slate-400 mr-2 shrink-0" />
                                        <span className="truncate">{acc.from_email}</span>
                                        {acc.unread_count > 0 && (
                                            <span className="ml-auto flex h-5 w-5 items-center justify-center rounded-full bg-primary text-[10px] font-medium text-primary-foreground">
                                                {acc.unread_count > 99 ? '99+' : acc.unread_count}
                                            </span>
                                        )}
                                    </Button>
                                ))}
                            </div>
                        </div>
                    </div>
                </ScrollArea>
            </div>

            {/* 2. Email List */}
            <div className="w-[350px] border-r flex flex-col bg-background">
                <div className="p-3 border-b flex items-center gap-2">
                    <div className="relative flex-1">
                        <Search className="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground" />
                        <Input
                            placeholder="Search..."
                            className="pl-8 h-9 border-none bg-muted/50 focus-visible:ring-0"
                            value={search}
                            onChange={e => setSearch(e.target.value)}
                        />
                    </div>
                    <Button variant="ghost" size="icon" className="h-9 w-9" onClick={handleRefresh}>
                        <RefreshCw className={cn("h-4 w-4", refreshing && "animate-spin")} />
                    </Button>
                </div>

                <ScrollArea className="flex-1">
                    <div className="divide-y divide-border/50">
                        {loading ? (
                            <div className="p-8 text-center text-sm text-muted-foreground">Loading emails...</div>
                        ) : filteredEmails.length === 0 ? (
                            <div className="p-8 text-center text-muted-foreground flex flex-col items-center">
                                <Inbox className="h-10 w-10 mb-3 opacity-20" />
                                <p className="text-sm font-medium">No emails found</p>
                            </div>
                        ) : (
                            filteredEmails.map(email => (
                                <div
                                    key={email.id}
                                    className={cn(
                                        "flex flex-col gap-1 p-4 cursor-pointer hover:bg-muted/50 transition-all border-l-4",
                                        selectedEmail?.id === email.id ? "bg-muted border-l-primary" : "border-l-transparent",
                                        !email.is_read ? "bg-blue-50/30 dark:bg-blue-900/10" : "opacity-90"
                                    )}
                                    onClick={() => handleEmailClick(email)}
                                >
                                    <div className="flex items-start justify-between gap-2">
                                        <div className="flex items-center gap-2 min-w-0">
                                            {!email.is_read && <div className="h-2 w-2 rounded-full bg-blue-500 shrink-0" />}
                                            <span className={cn("text-sm truncate", !email.is_read ? "font-bold text-foreground" : "font-medium text-foreground/80")}>
                                                {email.from_name || email.from_address}
                                            </span>
                                        </div>
                                        <span className="text-[10px] text-muted-foreground whitespace-nowrap">
                                            {formatDistanceToNow(new Date(email.received_at || email.created_at), { addSuffix: false })}
                                        </span>
                                    </div>
                                    <div className="flex items-center gap-2">
                                        <span className={cn("text-xs truncate flex-1", !email.is_read ? "font-semibold text-foreground" : "text-muted-foreground")}>
                                            {email.subject || '(No Subject)'}
                                        </span>
                                        {(email.thread_count || 0) > 1 && (
                                            <Badge variant="outline" className="text-[9px] h-4 px-1 rounded-full">{email.thread_count}</Badge>
                                        )}
                                    </div>
                                    <p className="text-[11px] text-muted-foreground line-clamp-2 leading-relaxed">
                                        {email.body_text?.substring(0, 120) || 'No preview available'}
                                    </p>
                                </div>
                            ))
                        )}
                    </div>
                </ScrollArea>
            </div>

            {/* 3. Reading Pane */}
            <div className="flex-1 flex flex-col bg-background min-w-0">
                {selectedEmail ? (
                    <>
                        <div className="p-6 border-b flex justify-between items-start gap-4">
                            <div className="flex gap-4 min-w-0">
                                <Avatar className="h-10 w-10 border">
                                    <AvatarImage src={selectedEmail.avatar_url} />
                                    <AvatarFallback className="bg-primary/10 text-primary font-bold">
                                        {getInitials(selectedEmail.from_name || selectedEmail.from_address)}
                                    </AvatarFallback>
                                </Avatar>
                                <div className="min-w-0">
                                    <h2 className="text-xl font-semibold text-foreground truncate leading-none mb-2">{selectedEmail.subject}</h2>
                                    <div className="flex flex-col gap-0.5 text-sm">
                                        <div className="flex items-center gap-2 text-muted-foreground">
                                            <span className="font-medium text-foreground">{selectedEmail.from_name}</span>
                                            <span>&lt;{selectedEmail.from_address}&gt;</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="flex items-center gap-2">
                                <Button variant="outline" size="sm" onClick={() => setReplyOpen(true)}>
                                    <Reply className="h-4 w-4 mr-2" /> Reply
                                </Button>
                            </div>
                        </div>

                        <ScrollArea className="flex-1">
                            {threadLoading ? (
                                <div className="p-10 text-center"><Loader2 className="animate-spin inline mr-2" /> Loading conversation...</div>
                            ) : (
                                <div className="p-8 max-w-4xl mx-auto space-y-8">
                                    {currentThread.map((e, idx) => (
                                        <div key={e.id} className={cn("rounded-lg border p-6 bg-card transition-all", idx === currentThread.length - 1 ? "ring-1 ring-primary/20 bg-primary/5" : "opacity-80 hover:opacity-100")}>
                                            <div className="flex justify-between items-start mb-4">
                                                <div className="flex items-center gap-3">
                                                    <Avatar className="h-8 w-8">
                                                        <AvatarFallback className="text-[10px]">{getInitials(e.from_name || e.from_address)}</AvatarFallback>
                                                    </Avatar>
                                                    <div>
                                                        <p className="text-sm font-semibold">{e.from_name}</p>
                                                        <p className="text-[11px] text-muted-foreground">{new Date(e.received_at || e.created_at).toLocaleString()}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div
                                                className="prose prose-sm dark:prose-invert max-w-none text-foreground/90 leading-relaxed font-sans"
                                                dangerouslySetInnerHTML={{ __html: e.body_html || e.body_text?.replace(/\n/g, '<br/>') }}
                                            />
                                        </div>
                                    ))}
                                </div>
                            )}
                        </ScrollArea>

                        <ComposeModal
                            open={replyOpen}
                            onOpenChange={setReplyOpen}
                            defaultTo={selectedEmail.from_address}
                            defaultSubject={selectedEmail.subject.startsWith('Re:') ? selectedEmail.subject : `Re: ${selectedEmail.subject}`}
                        />
                    </>
                ) : (
                    <div className="flex-1 flex flex-col items-center justify-center text-muted-foreground p-8 bg-muted/5">
                        <div className="h-24 w-24 rounded-full bg-muted flex items-center justify-center mb-6">
                            <Mail className="h-10 w-10 opacity-20" />
                        </div>
                        <h3 className="text-lg font-medium text-foreground mb-2">Select an email to read</h3>
                        <p className="max-w-xs text-center text-sm">Choose an email from the list to view its contents, or start a new conversation.</p>
                    </div>
                )}
            </div>
        </div>
    );
}
