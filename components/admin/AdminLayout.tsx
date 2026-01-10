'use client'

import React from 'react'

export default function AdminLayout({ children }: { children: React.ReactNode }) {
    // Since we are already inside app/admin/layout.tsx, we don't need to re-wrap.
    // We just provide this component to avoid import errors.
    return <>{children}</>
}
