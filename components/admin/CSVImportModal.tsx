'use client';

import { useState } from 'react';
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';
import { Upload, FileText, CheckCircle2, XCircle, AlertCircle } from 'lucide-react';
import { toast } from '@/hooks/use-toast';
import { cn } from '@/lib/utils';

interface CSVImportModalProps {
    open: boolean;
    onClose: () => void;
    onSuccess: () => void;
}

interface ImportResults {
    total: number;
    imported: number;
    skipped: number;
    failed: number;
    errors: string[];
}

export function CSVImportModal({ open, onClose, onSuccess }: CSVImportModalProps) {
    const [file, setFile] = useState<File | null>(null);
    const [importing, setImporting] = useState(false);
    const [results, setResults] = useState<ImportResults | null>(null);
    const [dragging, setDragging] = useState(false);

    const handleDrop = (e: React.DragEvent) => {
        e.preventDefault();
        setDragging(false);

        const droppedFile = e.dataTransfer.files[0];
        if (droppedFile && droppedFile.name.endsWith('.csv')) {
            setFile(droppedFile);
            setResults(null);
        } else {
            toast({ variant: 'destructive', description: 'Please upload a CSV file' });
        }
    };

    const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
        const selectedFile = e.target.files?.[0];
        if (selectedFile) {
            setFile(selectedFile);
            setResults(null);
        }
    };

    const handleImport = async () => {
        if (!file) return;

        setImporting(true);
        setResults(null);

        const formData = new FormData();
        formData.append('file', file);

        try {
            const res = await fetch('/api/admin/leads/import', {
                method: 'POST',
                body: formData,
            });

            const data = await res.json();

            if (data.success) {
                setResults(data.results);
                toast({
                    description: data.message,
                    className: 'bg-green-500 text-white'
                });
                onSuccess();
            } else {
                toast({
                    variant: 'destructive',
                    description: data.message || 'Import failed'
                });
            }
        } catch (error) {
            console.error(error);
            toast({ variant: 'destructive', description: 'Failed to import CSV' });
        } finally {
            setImporting(false);
        }
    };

    const handleClose = () => {
        setFile(null);
        setResults(null);
        onClose();
    };

    return (
        <Dialog open={open} onOpenChange={handleClose}>
            <DialogContent className="sm:max-w-[600px]">
                <DialogHeader>
                    <DialogTitle>Import Leads from CSV</DialogTitle>
                    <DialogDescription>
                        Upload a CSV file with customer data. We'll automatically detect name, phone, and email columns.
                    </DialogDescription>
                </DialogHeader>

                <div className="space-y-4">
                    {/* File Upload Area */}
                    {!results && (
                        <div
                            className={cn(
                                "border-2 border-dashed rounded-lg p-8 text-center transition-colors",
                                dragging ? "border-primary bg-primary/5" : "border-border",
                                file && "border-green-500 bg-green-50 dark:bg-green-900/10"
                            )}
                            onDragOver={(e) => { e.preventDefault(); setDragging(true); }}
                            onDragLeave={() => setDragging(false)}
                            onDrop={handleDrop}
                        >
                            {file ? (
                                <div className="space-y-2">
                                    <FileText className="w-12 h-12 mx-auto text-green-500" />
                                    <p className="font-medium">{file.name}</p>
                                    <p className="text-sm text-muted-foreground">
                                        {(file.size / 1024).toFixed(2)} KB
                                    </p>
                                    <Button
                                        variant="outline"
                                        size="sm"
                                        onClick={() => setFile(null)}
                                    >
                                        Remove
                                    </Button>
                                </div>
                            ) : (
                                <div className="space-y-2">
                                    <Upload className="w-12 h-12 mx-auto text-muted-foreground" />
                                    <p className="text-sm text-muted-foreground">
                                        Drag and drop your CSV file here, or click to browse
                                    </p>
                                    <input
                                        type="file"
                                        accept=".csv"
                                        className="hidden"
                                        id="csv-upload"
                                        onChange={handleFileSelect}
                                    />
                                    <Button
                                        variant="outline"
                                        size="sm"
                                        onClick={() => document.getElementById('csv-upload')?.click()}
                                    >
                                        Choose File
                                    </Button>
                                </div>
                            )}
                        </div>
                    )}

                    {/* Import Results */}
                    {results && (
                        <div className="space-y-4">
                            <div className="grid grid-cols-2 gap-4">
                                <div className="flex items-center gap-2 p-3 bg-green-50 dark:bg-green-900/20 rounded-lg">
                                    <CheckCircle2 className="w-5 h-5 text-green-500" />
                                    <div>
                                        <p className="text-sm text-muted-foreground">Imported</p>
                                        <p className="text-2xl font-bold text-green-600">{results.imported}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-2 p-3 bg-yellow-50 dark:bg-yellow-900/20 rounded-lg">
                                    <AlertCircle className="w-5 h-5 text-yellow-500" />
                                    <div>
                                        <p className="text-sm text-muted-foreground">Skipped</p>
                                        <p className="text-2xl font-bold text-yellow-600">{results.skipped}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-2 p-3 bg-red-50 dark:bg-red-900/20 rounded-lg">
                                    <XCircle className="w-5 h-5 text-red-500" />
                                    <div>
                                        <p className="text-sm text-muted-foreground">Failed</p>
                                        <p className="text-2xl font-bold text-red-600">{results.failed}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-2 p-3 bg-blue-50 dark:bg-blue-900/20 rounded-lg">
                                    <FileText className="w-5 h-5 text-blue-500" />
                                    <div>
                                        <p className="text-sm text-muted-foreground">Total Rows</p>
                                        <p className="text-2xl font-bold text-blue-600">{results.total}</p>
                                    </div>
                                </div>
                            </div>

                            {results.errors.length > 0 && (
                                <div className="max-h-32 overflow-y-auto border rounded-lg p-3 bg-red-50 dark:bg-red-900/10">
                                    <p className="text-sm font-medium text-red-600 mb-2">Errors:</p>
                                    {results.errors.map((error, i) => (
                                        <p key={i} className="text-xs text-red-600">{error}</p>
                                    ))}
                                </div>
                            )}

                            <Button onClick={handleClose} className="w-full">
                                Done
                            </Button>
                        </div>
                    )}

                    {/* Import Button */}
                    {file && !results && (
                        <Button
                            onClick={handleImport}
                            disabled={importing}
                            className="w-full"
                        >
                            {importing ? 'Importing...' : 'Import Leads'}
                        </Button>
                    )}
                </div>
            </DialogContent>
        </Dialog>
    );
}
