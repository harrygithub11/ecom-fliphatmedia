'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Label } from '@/components/ui/label';
import { Switch } from '@/components/ui/switch';
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { toast } from '@/hooks/use-toast';
import { Bell, Monitor, Palette } from 'lucide-react';

interface PreferencesFormProps {
    preferences: any;
    onUpdate: (updates: any) => Promise<void>;
}

export function PreferencesForm({ preferences, onUpdate }: PreferencesFormProps) {
    const [formData, setFormData] = useState({
        theme: preferences.theme || 'system',
        notify_email: preferences.notify_email ?? true,
        notify_in_app: preferences.notify_in_app ?? true,
        default_view: preferences.default_view || 'dashboard',
    });
    const [saving, setSaving] = useState(false);

    const handleSubmit = async () => {
        setSaving(true);
        try {
            await onUpdate({ preferences: formData });
            toast({ description: "Preferences updated", className: "bg-green-500 text-white" });
        } catch (error) {
            toast({ variant: 'destructive', description: "Failed to update preferences" });
        } finally {
            setSaving(false);
        }
    };

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader>
                    <div className="flex items-center gap-2 mb-1">
                        <Palette className="w-5 h-5 text-zinc-500" />
                        <CardTitle>Appearance</CardTitle>
                    </div>
                    <CardDescription>Customize how the dashboard looks and feels.</CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="space-y-4">
                        <Label className="text-base">Theme Preference</Label>
                        <RadioGroup
                            defaultValue={formData.theme}
                            onValueChange={(val: string) => setFormData({ ...formData, theme: val })}
                            className="grid grid-cols-3 gap-4"
                        >
                            <div>
                                <RadioGroupItem value="light" id="light" className="peer sr-only" />
                                <Label
                                    htmlFor="light"
                                    className="flex flex-col items-center justify-between rounded-md border-2 border-muted bg-popover p-4 hover:bg-accent peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary cursor-pointer"
                                >
                                    <div className="mb-2 h-10 w-full rounded bg-[#ecedef]" />
                                    Light
                                </Label>
                            </div>
                            <div>
                                <RadioGroupItem value="dark" id="dark" className="peer sr-only" />
                                <Label
                                    htmlFor="dark"
                                    className="flex flex-col items-center justify-between rounded-md border-2 border-muted bg-popover p-4 hover:bg-accent peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary cursor-pointer"
                                >
                                    <div className="mb-2 h-10 w-full rounded bg-[#1f2937]" />
                                    Dark
                                </Label>
                            </div>
                            <div>
                                <RadioGroupItem value="system" id="system" className="peer sr-only" />
                                <Label
                                    htmlFor="system"
                                    className="flex flex-col items-center justify-between rounded-md border-2 border-muted bg-popover p-4 hover:bg-accent peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary cursor-pointer"
                                >
                                    <div className="mb-2 h-10 w-full rounded bg-gradient-to-r from-[#ecedef] to-[#1f2937]" />
                                    System
                                </Label>
                            </div>
                        </RadioGroup>
                    </div>
                </CardContent>
            </Card>

            <Card>
                <CardHeader>
                    <div className="flex items-center gap-2 mb-1">
                        <Bell className="w-5 h-5 text-zinc-500" />
                        <CardTitle>Notifications</CardTitle>
                    </div>
                    <CardDescription>Control how you receive alerts and updates.</CardDescription>
                </CardHeader>
                <CardContent className="space-y-6">
                    <div className="flex items-center justify-between space-x-4">
                        <div className="flex-1 space-y-1">
                            <Label htmlFor="notify_email" className="font-medium">Email Notifications</Label>
                            <p className="text-sm text-muted-foreground">Receive daily summaries and critical alerts via email.</p>
                        </div>
                        <Switch
                            id="notify_email"
                            checked={formData.notify_email}
                            onCheckedChange={(val) => setFormData({ ...formData, notify_email: val })}
                        />
                    </div>
                    <div className="flex items-center justify-between space-x-4">
                        <div className="flex-1 space-y-1">
                            <Label htmlFor="notify_in_app" className="font-medium">In-App Notifications</Label>
                            <p className="text-sm text-muted-foreground">Show badges and toasts while using the dashboard.</p>
                        </div>
                        <Switch
                            id="notify_in_app"
                            checked={formData.notify_in_app}
                            onCheckedChange={(val) => setFormData({ ...formData, notify_in_app: val })}
                        />
                    </div>
                </CardContent>
            </Card>

            <div className="flex justify-end">
                <Button onClick={handleSubmit} disabled={saving}>
                    {saving ? 'Saving...' : 'Save Preferences'}
                </Button>
            </div>
        </div>
    );
}
