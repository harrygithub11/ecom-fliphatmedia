import { NextResponse } from 'next/server';
import pool from '@/lib/db';

export async function GET() {
    try {
        const connection = await pool.getConnection();
        try {
            const [rows]: any = await connection.execute(`
                SELECT id, value, label, color, emoji, display_order, is_active
                FROM lead_scores
                WHERE is_active = TRUE
                ORDER BY display_order ASC
            `);
            return NextResponse.json({ success: true, scores: rows });
        } finally {
            connection.release();
        }
    } catch (error) {
        console.error('Failed to fetch scores:', error);
        return NextResponse.json({ success: false, error: 'Failed to fetch scores' }, { status: 500 });
    }
}

export async function POST(request: Request) {
    try {
        const body = await request.json();
        const { value, label, color, emoji, display_order } = body;

        if (!value || !label) {
            return NextResponse.json({ success: false, message: 'Value and label are required' }, { status: 400 });
        }

        const connection = await pool.getConnection();
        try {
            const [result]: any = await connection.execute(
                'INSERT INTO lead_scores (value, label, color, emoji, display_order) VALUES (?, ?, ?, ?, ?)',
                [value, label, color || 'gray', emoji || '', display_order || 0]
            );
            return NextResponse.json({ success: true, id: result.insertId });
        } finally {
            connection.release();
        }
    } catch (error) {
        console.error('Failed to create score:', error);
        return NextResponse.json({ success: false, message: 'Failed to create score' }, { status: 500 });
    }
}
