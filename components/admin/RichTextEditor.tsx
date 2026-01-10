'use client'

import { Textarea } from '@/components/ui/textarea'

interface RichTextEditorProps {
    value: string
    onChange: (value: string) => void
    placeholder?: string
}

export default function RichTextEditor({ value, onChange, placeholder }: RichTextEditorProps) {
    return (
        <div className="space-y-2">
            <Textarea
                value={value}
                onChange={(e) => onChange(e.target.value)}
                placeholder={placeholder}
                className="min-h-[300px] font-mono"
            />
            <p className="text-xs text-muted-foreground">Note: Basic text support enabled. HTML tags will be preserved.</p>
        </div>
    )
}
