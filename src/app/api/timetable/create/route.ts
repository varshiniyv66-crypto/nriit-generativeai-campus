import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

// Period timings mapping
const PERIOD_TIMINGS: Record<number, { start: string; end: string }> = {
    1: { start: '09:00:00', end: '09:50:00' },
    2: { start: '09:50:00', end: '10:40:00' },
    3: { start: '10:50:00', end: '11:40:00' },
    4: { start: '11:40:00', end: '12:30:00' },
    5: { start: '13:10:00', end: '14:00:00' },
    6: { start: '14:00:00', end: '14:50:00' },
    7: { start: '15:00:00', end: '15:40:00' },
    8: { start: '15:40:00', end: '16:20:00' },
};

// Day mapping - using TEXT names as the schema expects
const DAY_NAMES: Record<string, string> = {
    'Monday': 'Monday',
    'Tuesday': 'Tuesday',
    'Wednesday': 'Wednesday',
    'Thursday': 'Thursday',
    'Friday': 'Friday',
    'Saturday': 'Saturday',
};

export async function POST(request: NextRequest) {
    try {
        const supabase = createClient(supabaseUrl, supabaseKey);
        const body = await request.json();

        const { department, section, semester, roomNo, classIncharge, grid } = body;

        // Validate required fields
        if (!department || !section || !semester || !roomNo) {
            return NextResponse.json(
                { error: 'Missing required fields: department, section, semester, roomNo' },
                { status: 400 }
            );
        }

        // 1. Create or get class section
        const sectionName = `${department}-${section}`;
        const academicYear = '2025-2026';

        let classSectionId: string;

        // Check if class section exists
        const { data: existingSection } = await supabase
            .from('class_sections')
            .select('id')
            .eq('name', sectionName)
            .eq('semester', semester)
            .maybeSingle();

        if (existingSection) {
            classSectionId = existingSection.id;

            // Delete existing timetable entries for this section
            await supabase
                .from('timetable')
                .delete()
                .eq('class_section_id', classSectionId);
        } else {
            // Create new class section
            const { data: newSection, error: sectionError } = await supabase
                .from('class_sections')
                .insert({
                    name: sectionName,
                    dept_code: department,
                    semester: semester,
                    section: section,
                    academic_year: academicYear,
                    room_no: roomNo,
                    class_incharge: classIncharge || null,
                })
                .select('id')
                .single();

            if (sectionError) {
                // Fallback: find any section for this department
                const { data: anySection } = await supabase
                    .from('class_sections')
                    .select('id')
                    .eq('dept_code', department)
                    .limit(1)
                    .single();

                if (anySection) {
                    classSectionId = anySection.id;
                } else {
                    return NextResponse.json(
                        { error: 'Failed to create class section', details: sectionError.message },
                        { status: 500 }
                    );
                }
            } else {
                classSectionId = newSection.id;
            }
        }

        // 2. Process grid and create timetable entries
        const timetableEntries: any[] = [];
        const errors: string[] = [];

        for (const [day, periods] of Object.entries(grid)) {
            const dayName = DAY_NAMES[day];
            if (!dayName) continue;

            for (const [periodStr, cellData] of Object.entries(periods as Record<string, any>)) {
                const periodNumber = parseInt(periodStr);
                const { subjectCode, facultyId } = cellData;

                if (!subjectCode || subjectCode === 'FREE') continue;

                const timing = PERIOD_TIMINGS[periodNumber];
                if (!timing) continue;

                // Get or create course
                let courseId: string | null = null;

                const { data: existingCourse } = await supabase
                    .from('courses')
                    .select('id')
                    .eq('course_code', subjectCode)
                    .maybeSingle();

                if (existingCourse) {
                    courseId = existingCourse.id;
                } else {
                    // Create course
                    const { data: newCourse, error: courseError } = await supabase
                        .from('courses')
                        .insert({
                            course_code: subjectCode,
                            course_name: subjectCode,
                            dept_code: department,
                            semester: semester,
                            credits: subjectCode.includes('LAB') ? 2 : 3,
                            course_type: subjectCode.includes('LAB') ? 'lab' : 'theory',
                        })
                        .select('id')
                        .single();

                    if (!courseError && newCourse) {
                        courseId = newCourse.id;
                    }
                }

                // Create timetable entry - match actual schema
                timetableEntries.push({
                    class_section_id: classSectionId,
                    course_id: courseId,
                    faculty_id: facultyId || null,
                    day_of_week: dayName,  // TEXT not INTEGER
                    period_number: periodNumber,
                    start_time: timing.start,
                    end_time: timing.end,
                });
            }
        }

        // 3. Bulk insert timetable entries
        let entriesCreated = 0;
        if (timetableEntries.length > 0) {
            const { data: insertedData, error: insertError } = await supabase
                .from('timetable')
                .insert(timetableEntries)
                .select('id');

            if (insertError) {
                console.error('Error inserting timetable:', insertError);
                return NextResponse.json(
                    {
                        error: 'Failed to save timetable entries',
                        details: insertError.message
                    },
                    { status: 500 }
                );
            }
            entriesCreated = insertedData?.length || timetableEntries.length;
        }

        return NextResponse.json({
            success: true,
            message: `Timetable created successfully for ${sectionName}`,
            results: {
                classSectionId,
                entriesCreated,
                errors: errors.length > 0 ? errors : null,
            },
        });
    } catch (error: any) {
        console.error('Timetable create error:', error);
        return NextResponse.json(
            { error: 'Failed to create timetable', details: error.message },
            { status: 500 }
        );
    }
}
