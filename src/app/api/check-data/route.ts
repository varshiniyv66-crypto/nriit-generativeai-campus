import { supabase } from '@/lib/supabase';
import { NextResponse } from 'next/server';

export async function GET() {
    try {
        // Use client-side supabase (anon key) for checking data

        // Check data counts in key tables
        const [
            { count: departmentCount },
            { count: studentCount },
            { count: facultyCount },
            { count: userCount },
            { count: batchCount }
        ] = await Promise.all([
            supabase.from('departments').select('*', { count: 'exact', head: true }),
            supabase.from('student_profiles').select('*', { count: 'exact', head: true }),
            supabase.from('faculty_profiles').select('*', { count: 'exact', head: true }),
            supabase.from('users').select('*', { count: 'exact', head: true }),
            supabase.from('academic_batches').select('*', { count: 'exact', head: true })
        ]);

        // Get sample student data
        const { data: sampleStudents, error: studentError } = await supabase
            .from('student_profiles')
            .select('id, first_name, last_name, roll_number, email, dept_code')
            .limit(10);

        // Get 2023 batch students for testing
        const { data: students2023 } = await supabase
            .from('student_profiles')
            .select('roll_number, first_name, last_name, dept_code')
            .ilike('roll_number', '23%')
            .limit(10);

        // Get sample faculty data
        const { data: sampleFaculty, error: facultyError } = await supabase
            .from('faculty_profiles')
            .select('id, first_name, last_name, employee_id, email, dept_code')
            .limit(5);

        // Get departments
        const { data: departments, error: deptError } = await supabase
            .from('departments')
            .select('code, name')
            .limit(10);

        return NextResponse.json({
            status: 'success',
            timestamp: new Date().toISOString(),
            counts: {
                departments: departmentCount ?? 0,
                students: studentCount ?? 0,
                faculty: facultyCount ?? 0,
                users: userCount ?? 0,
                batches: batchCount ?? 0
            },
            sampleData: {
                students: sampleStudents ?? [],
                students2023: students2023 ?? [],
                faculty: sampleFaculty ?? [],
                departments: departments ?? []
            },
            errors: {
                studentError: studentError?.message ?? null,
                facultyError: facultyError?.message ?? null,
                deptError: deptError?.message ?? null
            }
        });

    } catch (error: unknown) {
        const errorMessage = error instanceof Error ? error.message : 'Unknown error';
        return NextResponse.json({
            status: 'error',
            message: errorMessage
        }, { status: 500 });
    }
}
