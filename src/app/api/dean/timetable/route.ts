import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

// Initialize Supabase client with service role for admin operations
const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

interface TimetableEntry {
    employee_id: string;
    course_code: string;
    dept_code: string;
    semester: number;
    section: string;
    day: string;
    period: number;
    room?: string;
}

interface UploadRequest {
    dept_code: string;
    academic_year: string;
    entries: TimetableEntry[];
}

// Period timings mapping
const PERIOD_TIMINGS: Record<number, { start: string; end: string }> = {
    1: { start: '09:00', end: '09:50' },
    2: { start: '09:50', end: '10:40' },
    3: { start: '10:50', end: '11:40' },
    4: { start: '11:40', end: '12:30' },
    5: { start: '13:30', end: '14:20' },
    6: { start: '14:20', end: '15:10' },
    7: { start: '15:20', end: '16:10' },
    8: { start: '16:10', end: '17:00' },
};

export async function POST(request: NextRequest) {
    try {
        const body: UploadRequest = await request.json();
        const { dept_code, academic_year, entries } = body;

        if (!dept_code || !academic_year || !entries || entries.length === 0) {
            return NextResponse.json(
                { success: false, message: 'Missing required fields' },
                { status: 400 }
            );
        }

        const results = {
            success: 0,
            failed: 0,
            errors: [] as string[],
            created_sections: 0,
        };

        // Step 1: Get all faculty IDs for validation
        const { data: facultyData } = await supabase
            .from('faculty_profiles')
            .select('id, employee_id')
            .eq('is_active', true);

        const facultyMap = new Map(
            facultyData?.map(f => [f.employee_id, f.id]) || []
        );

        // Step 2: Get all course IDs for validation
        const { data: courseData } = await supabase
            .from('courses')
            .select('id, course_code')
            .eq('is_active', true);

        const courseMap = new Map(
            courseData?.map(c => [c.course_code, c.id]) || []
        );

        // Step 3: Get existing class sections
        const { data: sectionData } = await supabase
            .from('class_sections')
            .select('id, dept_code, semester, section');

        const sectionMap = new Map(
            sectionData?.map(s => [`${s.dept_code}-${s.semester}-${s.section}`, s.id]) || []
        );

        // Step 4: Delete existing timetable entries for this dept/academic_year
        // (Optional - uncomment if you want to replace instead of append)
        /*
        await supabase
            .from('timetable')
            .delete()
            .eq('academic_year', academic_year)
            .in('class_section_id', 
                sectionData?.filter(s => s.dept_code === dept_code).map(s => s.id) || []
            );
        */

        // Step 5: Process each entry
        for (const entry of entries) {
            try {
                // Validate faculty exists
                const facultyId = facultyMap.get(entry.employee_id);
                if (!facultyId) {
                    // Try to find by partial match
                    const matchedFacultyId = [...facultyMap.entries()]
                        .find(([eid]) => eid.includes(entry.employee_id) || entry.employee_id.includes(eid))?.[1];

                    if (!matchedFacultyId) {
                        results.failed++;
                        results.errors.push(`Faculty ${entry.employee_id} not found`);
                        continue;
                    }
                }

                // Validate or create course
                let courseId = courseMap.get(entry.course_code);
                if (!courseId) {
                    // Create course if it doesn't exist
                    const { data: newCourse, error: courseError } = await supabase
                        .from('courses')
                        .insert({
                            course_code: entry.course_code,
                            course_name: entry.course_code, // Will need to be updated later
                            dept_code: entry.dept_code,
                            semester: entry.semester,
                            credits: 3,
                            course_type: 'theory',
                            is_active: true,
                        })
                        .select('id')
                        .single();

                    if (courseError || !newCourse) {
                        results.failed++;
                        results.errors.push(`Could not create course ${entry.course_code}`);
                        continue;
                    }
                    courseId = newCourse.id;
                    courseMap.set(entry.course_code, courseId);
                }

                // Validate or create class section
                const sectionKey = `${entry.dept_code}-${entry.semester}-${entry.section}`;
                let sectionId = sectionMap.get(sectionKey);

                if (!sectionId) {
                    // Create class section
                    const { data: newSection, error: sectionError } = await supabase
                        .from('class_sections')
                        .insert({
                            dept_code: entry.dept_code,
                            semester: entry.semester,
                            section: entry.section,
                            name: `${entry.dept_code} - Sem ${entry.semester} - ${entry.section}`,
                            academic_year: academic_year,
                            max_strength: 120,
                            is_active: true,
                        })
                        .select('id')
                        .single();

                    if (sectionError || !newSection) {
                        results.failed++;
                        results.errors.push(`Could not create section ${sectionKey}`);
                        continue;
                    }
                    sectionId = newSection.id;
                    sectionMap.set(sectionKey, sectionId);
                    results.created_sections++;
                }

                // Get period timings
                const timing = PERIOD_TIMINGS[entry.period] || { start: '09:00', end: '10:00' };

                // Insert timetable entry
                const { error: timetableError } = await supabase
                    .from('timetable')
                    .upsert({
                        faculty_id: facultyMap.get(entry.employee_id),
                        course_id: courseId,
                        class_section_id: sectionId,
                        day_of_week: entry.day,
                        period_number: entry.period,
                        start_time: timing.start,
                        end_time: timing.end,
                        room_number: entry.room || null,
                        academic_year: academic_year,
                        is_active: true,
                    }, {
                        onConflict: 'faculty_id,class_section_id,day_of_week,period_number',
                        ignoreDuplicates: false,
                    });

                if (timetableError) {
                    // Try insert without upsert
                    const { error: insertError } = await supabase
                        .from('timetable')
                        .insert({
                            faculty_id: facultyMap.get(entry.employee_id),
                            course_id: courseId,
                            class_section_id: sectionId,
                            day_of_week: entry.day,
                            period_number: entry.period,
                            start_time: timing.start,
                            end_time: timing.end,
                            room_number: entry.room || null,
                            academic_year: academic_year,
                            is_active: true,
                        });

                    if (insertError) {
                        results.failed++;
                        results.errors.push(`Timetable entry failed: ${entry.employee_id} ${entry.day} P${entry.period}`);
                        continue;
                    }
                }

                results.success++;
            } catch (entryError) {
                console.error('Entry processing error:', entryError);
                results.failed++;
            }
        }

        return NextResponse.json({
            success: true,
            message: `Uploaded ${results.success} entries successfully`,
            results: {
                total: entries.length,
                success: results.success,
                failed: results.failed,
                created_sections: results.created_sections,
                errors: results.errors.slice(0, 10), // Limit error messages
            }
        });

    } catch (error) {
        console.error('Timetable upload error:', error);
        return NextResponse.json(
            { success: false, message: 'Internal server error' },
            { status: 500 }
        );
    }
}

// GET - Fetch timetable for a department
export async function GET(request: NextRequest) {
    try {
        const { searchParams } = new URL(request.url);
        const dept_code = searchParams.get('dept_code');
        const academic_year = searchParams.get('academic_year') || '2024-25';

        if (!dept_code) {
            return NextResponse.json(
                { success: false, message: 'dept_code is required' },
                { status: 400 }
            );
        }

        // Fetch timetable with related data
        const { data, error } = await supabase
            .from('timetable')
            .select(`
                *,
                faculty:faculty_profiles (
                    id,
                    employee_id,
                    first_name,
                    last_name,
                    dept_code
                ),
                course:courses (
                    id,
                    course_code,
                    course_name
                ),
                class_section:class_sections (
                    id,
                    dept_code,
                    semester,
                    section,
                    name
                )
            `)
            .eq('academic_year', academic_year)
            .eq('is_active', true);

        if (error) {
            throw error;
        }

        // Filter by department (class_section's dept_code)
        const filteredData = data?.filter(
            entry => entry.class_section?.dept_code === dept_code
        );

        return NextResponse.json({
            success: true,
            data: filteredData,
            count: filteredData?.length || 0,
        });

    } catch (error) {
        console.error('Timetable fetch error:', error);
        return NextResponse.json(
            { success: false, message: 'Failed to fetch timetable' },
            { status: 500 }
        );
    }
}
