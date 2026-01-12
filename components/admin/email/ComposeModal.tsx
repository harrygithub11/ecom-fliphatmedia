'use client';

import { useState, useEffect, useRef } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/dialog';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Textarea } from '@/components/ui/textarea';
import { useToast } from '@/components/ui/use-toast';
import { Loader2, Paperclip, Send, Search, X, Plus } from 'lucide-react';
import { useComposeEmail } from '@/context/ComposeEmailContext';

export function ComposeModal() {
    const { isOpen, closeCompose, data } = useComposeEmail();
    const { toast } = useToast();

    const [sending, setSending] = useState(false);
    const [accounts, setAccounts] = useState<any[]>([]);
    const [templates, setTemplates] = useState<any[]>([]);
    const [draftId, setDraftId] = useState<number | null>(null);
    const [attachments, setAttachments] = useState<any[]>([]);

    // Form State
    const [formData, setFormData] = useState({
        to: '',
        subject: '',
        body: '',
        smtp_account_id: ''
    });

    // Lead Search State
    const [leads, setLeads] = useState<{ id: number, name: string, email: string }[]>([]);
    const [searchQuery, setSearchQuery] = useState('');
    const [showSuggestions, setShowSuggestions] = useState(false);
    const wrapperRef = useRef<HTMLDivElement>(null);

    // Sync context data to form when opened
    useEffect(() => {
        if (isOpen) {
            setFormData(prev => ({
                ...prev,
                to: data.to || '',
                subject: data.subject || '',
                body: data.body || '',
                smtp_account_id: prev.smtp_account_id // Keep last selected or default
            }));
            if (data.to) setSearchQuery(data.to); // Pre-fill search if 'to' is provided
            setAttachments([]); // Clear attachments when opening new compose
        }
    }, [isOpen, data]);

    // Fetch Accounts on Open
    useEffect(() => {
        if (isOpen) {
            fetch('/api/email-system/accounts', {
                headers: { 'Authorization': 'Bearer YWRtaW4=' }
            })
                .then(res => res.json())
                .then(data => {
                    if (data.accounts && data.accounts.length > 0) {
                        setAccounts(data.accounts);
                        if (!formData.smtp_account_id) {
                            setFormData(prev => ({ ...prev, smtp_account_id: data.accounts[0].id }));
                        }
                    }
                });

            // Load Leads
            fetch('/api/admin/leads')
                .then(res => res.json())
                .then(data => {
                    const list = Array.isArray(data) ? data : (data.leads || []);
                    setLeads(list);
                });
        }
    }, [isOpen]);

    // Fetch Templates when Account changes
    useEffect(() => {
        if (isOpen && formData.smtp_account_id) {
            fetch(`/api/email-system/templates?accountId=${formData.smtp_account_id}`, {
                headers: { 'Authorization': 'Bearer YWRtaW4=' }
            })
                .then(res => res.json())
                .then(data => {
                    if (data.success) setTemplates(data.templates);
                });
        }
    }, [isOpen, formData.smtp_account_id]);

    // Attachment Handler
    const handleFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const files = e.target.files;
        if (!files) return;

        const newAttachments = [...attachments];
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const reader = new FileReader();
            reader.onload = (event) => {
                const base64 = (event.target?.result as string).split(',')[1];
                newAttachments.push({
                    filename: file.name,
                    data: base64,
                    contentType: file.type,
                    size: file.size
                });
                setAttachments([...newAttachments]);
            };
            reader.readAsDataURL(file);
        }
    };

    const removeAttachment = (index: number) => {
        setAttachments(attachments.filter((_, i) => i !== index));
    };

    // Handle Click Outside for Suggestions
    useEffect(() => {
        function handleClickOutside(event: MouseEvent) {
            if (wrapperRef.current && !wrapperRef.current.contains(event.target as Node)) {
                setShowSuggestions(false);
            }
        }
        document.addEventListener("mousedown", handleClickOutside);
        return () => document.removeEventListener("mousedown", handleClickOutside);
    }, [wrapperRef]);

    const handleApplyTemplate = (template: any) => {
        if (!template) return;
        setFormData(prev => ({
            ...prev,
            subject: template.subject || prev.subject,
            body: template.body || template.htmlBody?.replace(/<[^>]*>/g, '') || prev.body
        }));

        // Record Template Usage
        fetch('/api/email-system/templates', {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json', 'Authorization': 'Bearer YWRtaW4=' },
            body: JSON.stringify({ templateId: template.id })
        });

        toast({ title: "Template Applied", description: `Applied "${template.name}"` });
    };

    const handleSend = async () => {
        if (!formData.to || !formData.subject || !formData.body) {
            toast({ title: "Validation Error", description: "Please fill required fields", variant: "destructive" });
            return;
        }

        setSending(true);
        try {
            const res = await fetch('/api/email-system/send', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer YWRtaW4='
                },
                body: JSON.stringify({
                    accountId: formData.smtp_account_id,
                    to: formData.to,
                    subject: formData.subject,
                    text: formData.body,
                    html: `<p>${formData.body.replace(/\n/g, '<br>')}</p>`,
                    attachments: attachments.map(a => ({
                        filename: a.filename,
                        data: a.data,
                        contentType: a.contentType
                    }))
                })
            });
            const resData = await res.json();
            if (resData.success) {
                toast({ title: "Sent", description: "Email sent successfully." });
                closeCompose();
                setFormData({ ...formData, subject: '', body: '', to: '' });
                setSearchQuery('');
                setAttachments([]);
            } else {
                toast({ title: "Error", description: resData.error || resData.message || "Failed to send", variant: "destructive" });
            }
        } catch (e) {
            toast({ title: "Error", description: "Network error", variant: "destructive" });
        } finally {
            setSending(false);
        }
    };

    const filteredLeads = leads.filter(l =>
        l.email.toLowerCase().includes(searchQuery.toLowerCase()) ||
        l.name.toLowerCase().includes(searchQuery.toLowerCase())
    ).slice(0, 5);

    const selectLead = (email: string) => {
        const currentTo = formData.to.trim();
        let newTo = '';

        if (currentTo === '' || !currentTo.includes(',')) {
            // Check if what we have is just a partial search or actual text
            // For simplicity, if there's no comma, we replace. 
            // Better: if there are multiple, append.
            newTo = email;
        } else {
            const parts = currentTo.split(',').map(p => p.trim());
            parts[parts.length - 1] = email;
            newTo = parts.join(', ');
        }

        setFormData(prev => ({ ...prev, to: newTo }));
        setSearchQuery(newTo);
        setShowSuggestions(false);
    };

    return (
        <Dialog open={isOpen} onOpenChange={(open) => !open && closeCompose()}>
            <DialogContent className="sm:max-w-[800px] p-0 gap-0 overflow-hidden bg-white">
                <DialogHeader className="p-4 pr-10 border-b bg-zinc-50 flex flex-row items-center justify-between">
                    <DialogTitle className="text-lg font-black uppercase tracking-tight">New Message</DialogTitle>
                    <div className="flex gap-2">
                        <Select onValueChange={(val) => handleApplyTemplate(templates.find(t => t.id === val))}>
                            <SelectTrigger className="w-[160px] h-9 bg-white border-zinc-200">
                                <SelectValue placeholder="Use Template" />
                            </SelectTrigger>
                            <SelectContent>
                                {templates.length === 0 ? (
                                    <div className="p-2 text-xs text-center text-zinc-400">No templates found</div>
                                ) : (
                                    templates.map(t => <SelectItem key={t.id} value={t.id}>{t.name}</SelectItem>)
                                )}
                            </SelectContent>
                        </Select>
                    </div>
                </DialogHeader>

                <div className="p-6 space-y-4">
                    <div className="grid gap-3">
                        {/* FROM */}
                        <div className="grid grid-cols-[80px_1fr] items-center gap-4">
                            <Label className="text-right text-xs font-black uppercase tracking-widest text-zinc-400">From</Label>
                            <Select
                                value={formData.smtp_account_id}
                                onValueChange={val => setFormData({ ...formData, smtp_account_id: val })}
                            >
                                <SelectTrigger className="h-11 border-zinc-200 shadow-sm focus:ring-black">
                                    <SelectValue placeholder="Select Account" />
                                </SelectTrigger>
                                <SelectContent>
                                    {accounts.map(acc => (
                                        <SelectItem key={acc.id} value={acc.id}>
                                            <div className="flex items-center gap-2">
                                                <span className="font-bold">{acc.name}</span>
                                                <span className="text-zinc-400">&lt;{acc.email}&gt;</span>
                                            </div>
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        {/* TO */}
                        <div className="grid grid-cols-[80px_1fr] items-center gap-4 relative z-20" ref={wrapperRef}>
                            <Label className="text-right text-xs font-black uppercase tracking-widest text-zinc-400">To</Label>
                            <div className="relative">
                                <Input
                                    value={searchQuery}
                                    onChange={e => {
                                        setSearchQuery(e.target.value);
                                        setFormData(prev => ({ ...prev, to: e.target.value }));
                                        setShowSuggestions(true);
                                    }}
                                    onFocus={() => setShowSuggestions(true)}
                                    placeholder="Add recipients (comma separated for multiple)"
                                    className="h-11 border-zinc-200 shadow-sm focus:ring-black"
                                />
                                {showSuggestions && searchQuery && filteredLeads.length > 0 && (
                                    <div className="absolute top-full left-0 w-full mt-1 bg-white border border-zinc-200 rounded-xl shadow-2xl z-50 overflow-hidden animate-in fade-in slide-in-from-top-2">
                                        {filteredLeads.map(lead => (
                                            <div
                                                key={lead.id}
                                                className="px-4 py-3 hover:bg-zinc-50 cursor-pointer flex justify-between items-center transition-colors"
                                                onClick={() => selectLead(lead.email)}
                                            >
                                                <div className="flex flex-col">
                                                    <span className="font-bold text-sm text-black">{lead.name}</span>
                                                    <span className="text-xs text-zinc-400">{lead.email}</span>
                                                </div>
                                                <Plus className="w-4 h-4 text-zinc-300" />
                                            </div>
                                        ))}
                                    </div>
                                )}
                            </div>
                        </div>

                        {/* SUBJECT */}
                        <div className="grid grid-cols-[80px_1fr] items-center gap-4">
                            <Label className="text-right text-xs font-black uppercase tracking-widest text-zinc-400">Subject</Label>
                            <Input
                                value={formData.subject}
                                onChange={e => setFormData({ ...formData, subject: e.target.value })}
                                placeholder="Email subject..."
                                className="h-11 border-zinc-200 shadow-sm focus:ring-black font-bold"
                            />
                        </div>
                    </div>

                    {/* BODY */}
                    <div className="relative border border-zinc-200 rounded-2xl overflow-hidden shadow-sm">
                        <Textarea
                            className="min-h-[300px] border-none focus-visible:ring-0 p-6 text-base leading-relaxed resize-none"
                            placeholder="Type your message here..."
                            value={formData.body}
                            onChange={e => setFormData({ ...formData, body: e.target.value })}
                        />

                        {/* Attachments List */}
                        {attachments.length > 0 && (
                            <div className="px-6 py-4 bg-zinc-50 border-t border-zinc-100 flex flex-wrap gap-2">
                                {attachments.map((file, idx) => (
                                    <div key={idx} className="flex items-center gap-2 bg-white border border-zinc-200 px-3 py-1.5 rounded-full text-xs font-bold shadow-sm group">
                                        <Paperclip className="w-3 h-3 text-zinc-400" />
                                        <span className="max-w-[150px] truncate">{file.filename}</span>
                                        <button onClick={() => removeAttachment(idx)} className="hover:text-red-500 transition-colors">
                                            <X className="w-3 h-3" />
                                        </button>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>
                </div>

                <DialogFooter className="p-4 border-t bg-zinc-50 flex items-center justify-between sm:justify-between">
                    <div className="flex items-center gap-2">
                        <label className="cursor-pointer p-2 hover:bg-zinc-200 rounded-full transition-colors flex items-center gap-2 group">
                            <input type="file" multiple className="hidden" onChange={handleFileChange} />
                            <Paperclip className="w-5 h-5 text-zinc-500 group-hover:text-black" />
                            <span className="text-xs font-bold hidden sm:inline">Attach Files</span>
                        </label>
                    </div>

                    <div className="flex gap-3">
                        <Button variant="ghost" onClick={closeCompose} className="font-bold text-zinc-500 hover:text-black">
                            Discard
                        </Button>
                        <Button
                            onClick={handleSend}
                            disabled={sending}
                            className="bg-black text-white hover:bg-zinc-800 px-8 font-black uppercase tracking-widest text-xs h-11 shadow-lg active:scale-95 transition-all"
                        >
                            {sending ? <Loader2 className="w-4 h-4 mr-2 animate-spin" /> : <Send className="w-4 h-4 mr-2" />}
                            Send Email
                        </Button>
                    </div>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    );
}
