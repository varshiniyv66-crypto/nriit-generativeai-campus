import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

// Use anon key for read operations (RLS should allow reading faculty_profiles)
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export async function GET(request: NextRequest) {
    try {
        const supabase = createClient(supabaseUrl, supabaseKey);
        const { searchParams } = new URL(request.url);
        const dept = searchParams.get('dept');

        let query = supabase
            .from('faculty_profiles')
            .select('id, first_name, last_name, dept_code, designation, pan_number')
            .order('first_name');

        // Filter by department if specified
        if (dept) {
            query = query.eq('dept_code', dept);
        }

        const { data: facultyData, error } = await query;

        if (error) {
            console.error('Error fetching faculty:', error);
            return NextResponse.json(
                { error: 'Failed to fetch faculty', details: error.message },
                { status: 500 }
            );
        }

        // Format faculty data
        const faculty = (facultyData || []).map((f) => ({
            id: f.id,
            name: `${f.first_name} ${f.last_name}`.trim(),
            department: f.dept_code,
            designation: f.designation,
            hasPan: !!f.pan_number,
        }));

        return NextResponse.json({
            success: true,
            faculty,
            count: faculty.length,
        });
    } catch (error: any) {
        console.error('Faculty API error:', error);
        return NextResponse.json(
            { error: 'Failed to fetch faculty', details: error.message },
            { status: 500 }
        );
    }
}
