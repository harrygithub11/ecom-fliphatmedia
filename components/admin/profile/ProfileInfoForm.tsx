'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { toast } from '@/hooks/use-toast';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { AvatarUpload } from './AvatarUpload';

interface ProfileInfoFormProps {
    user: any;
    onUpdate: (updates: any) => Promise<void>;
}

export function ProfileInfoForm({ user, onUpdate }: ProfileInfoFormProps) {
    const [formData, setFormData] = useState({
        name: user.name || '',
        phone: user.phone || '',
        timezone: user.timezone || 'UTC',
        language: user.language || 'en',
    });
    const [saving, setSaving] = useState(false);

    const handleSubmit = async () => {
        setSaving(true);
        try {
            await onUpdate(formData);
            toast({ description: "Profile updated successfully", className: "bg-green-500 text-white" });
        } catch (error) {
            toast({ variant: 'destructive', description: "Failed to update profile" });
        } finally {
            setSaving(false);
        }
    };

    return (
        <Card>
            <CardHeader>
                <CardTitle>Profile Information</CardTitle>
                <CardDescription>Update your personal details and public profile.</CardDescription>
            </CardHeader>
            <CardContent className="space-y-6">

                {/* Avatar Section */}
                <div className="flex justify-center pb-6 border-b border-zinc-100 dark:border-zinc-800">
                    <AvatarUpload
                        currentUrl={user.avatar_url}
                        onUploadConfigured={(url) => onUpdate({ avatar_url: url })}
                    />
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div className="space-y-2">
                        <Label htmlFor="name">Full Name</Label>
                        <Input
                            id="name"
                            value={formData.name}
                            onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                        />
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="email">Email Address</Label>
                        <Input id="email" value={user.email} disabled className="bg-zinc-100 dark:bg-zinc-900" />
                        <p className="text-xs text-muted-foreground">Contact support to change email.</p>
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="phone">Phone Number</Label>
                        <Input
                            id="phone"
                            value={formData.phone}
                            onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                            placeholder="+1 (555) 000-0000"
                        />
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="role">Role</Label>
                        <Input id="role" value={user.role} disabled className="capitalize bg-zinc-100 dark:bg-zinc-900" />
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="timezone">Timezone</Label>
                        <Select
                            value={formData.timezone}
                            onValueChange={(val) => setFormData({ ...formData, timezone: val })}
                        >
                            <SelectTrigger>
                                <SelectValue placeholder="Select timezone" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="UTC">UTC (Universal)</SelectItem>
                                <SelectItem value="IST">IST (India)</SelectItem>
                                <SelectItem value="EST">EST (Eastern)</SelectItem>
                                <SelectItem value="PST">PST (Pacific)</SelectItem>
                            </SelectContent>
                        </Select>
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="language">Language</Label>
                        <Select
                            value={formData.language}
                            onValueChange={(val) => setFormData({ ...formData, language: val })}
                        >
                            <SelectTrigger>
                                <SelectValue placeholder="Select language" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="en">English</SelectItem>
                                <SelectItem value="es">Spanish</SelectItem>
                                <SelectItem value="fr">French</SelectItem>
                            </SelectContent>
                        </Select>
                    </div>
                </div>

                <div className="flex justify-end pt-4">
                    <Button onClick={handleSubmit} disabled={saving}>
                        {saving ? 'Saving...' : 'Save Changes'}
                    </Button>
                </div>
            </CardContent>
        </Card>
    );
}
