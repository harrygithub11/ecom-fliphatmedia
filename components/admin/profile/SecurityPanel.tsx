'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { toast } from '@/hooks/use-toast';
import { ShieldAlert, ShieldCheck, LogOut } from 'lucide-react';

export function SecurityPanel() {
    const [currentPassword, setCurrentPassword] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [loading, setLoading] = useState(false);

    const handlePasswordChange = async () => {
        if (!currentPassword || !newPassword || !confirmPassword) {
            toast({ variant: 'destructive', description: 'Please fill in all password fields' });
            return;
        }

        if (newPassword !== confirmPassword) {
            toast({ variant: 'destructive', description: 'New passwords do not match' });
            return;
        }

        if (newPassword.length < 8) {
            toast({ variant: 'destructive', description: 'New password must be at least 8 characters' });
            return;
        }

        setLoading(true);

        try {
            const res = await fetch('/api/admin/profile/change-password', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ currentPassword, newPassword })
            });

            const data = await res.json();

            if (data.success) {
                toast({ description: "Password changed successfully. All other sessions have been revoked.", className: "bg-green-500 text-white" });
                setCurrentPassword('');
                setNewPassword('');
                setConfirmPassword('');
            } else {
                toast({ variant: 'destructive', description: data.message || 'Failed to change password' });
            }
        } catch (error) {
            console.error('Error changing password:', error);
            toast({ variant: 'destructive', description: 'Failed to change password' });
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="space-y-6">
            <Card className="border-l-4 border-l-orange-500">
                <CardHeader>
                    <div className="flex items-center gap-2 text-orange-600 mb-2">
                        <ShieldAlert className="h-5 w-5" />
                        <span className="font-bold text-sm uppercase tracking-wider">Security Zone</span>
                    </div>
                    <CardTitle>Change Password</CardTitle>
                    <CardDescription>
                        Update your password to keep your account secure. Changing your password will log out all other active sessions.
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4 max-w-lg">
                    <div className="space-y-2">
                        <Label htmlFor="current-password">Current Password</Label>
                        <Input
                            id="current-password"
                            type="password"
                            value={currentPassword}
                            onChange={(e) => setCurrentPassword(e.target.value)}
                            placeholder="Enter current password"
                        />
                    </div>
                    <div className="space-y-2">
                        <Label htmlFor="new-password">New Password</Label>
                        <Input
                            id="new-password"
                            type="password"
                            value={newPassword}
                            onChange={(e) => setNewPassword(e.target.value)}
                            placeholder="Enter new password (min 8 characters)"
                        />
                        {/* Password strength indicator could go here */}
                    </div>
                    <div className="space-y-2">
                        <Label htmlFor="confirm-password">Confirm New Password</Label>
                        <Input
                            id="confirm-password"
                            type="password"
                            value={confirmPassword}
                            onChange={(e) => setConfirmPassword(e.target.value)}
                            placeholder="Confirm new password"
                        />
                    </div>
                    <Button onClick={handlePasswordChange} disabled={loading} className="w-full sm:w-auto">
                        {loading ? 'Updating Security...' : 'Update Password'}
                    </Button>
                </CardContent>
            </Card>

            <Card>
                <CardHeader>
                    <CardTitle>Active Sessions</CardTitle>
                    <CardDescription>Manage devices currently logged into your account.</CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="flex items-center justify-between p-4 border rounded-lg bg-zinc-50 dark:bg-zinc-900">
                        <div className="flex items-center gap-3">
                            <ShieldCheck className="h-8 w-8 text-green-500" />
                            <div>
                                <p className="font-medium text-sm">Current Session</p>
                                <p className="text-xs text-muted-foreground">Active now • This Device</p>
                            </div>
                        </div>
                        <Button variant="outline" size="sm" disabled>
                            Active
                        </Button>
                    </div>

                    <div className="mt-4">
                        <Button variant="outline" className="w-full sm:w-auto text-red-600 border-red-200 hover:bg-red-50">
                            <LogOut className="h-4 w-4 mr-2" /> Log Out All Other Devices
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
