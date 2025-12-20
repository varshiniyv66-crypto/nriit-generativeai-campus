import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export async function POST(request: NextRequest) {
    try {
        const supabase = createClient(supabaseUrl, supabaseKey);

        // Get the uploaded data
        const body = await request.json();
        const { metadata, entries, subjects } = body;

        // Validate metadata
        if (!metadata.branch || !metadata.section || !metadata.semester) {
            return NextResponse.json(
                { error: 'Missing required metadata: branch, section, or semester' },
                { status: 400 }
            );
        }

        // Start transaction-like operations
        const results = {
            classSection: null as any,
            courses: [] as any[],
            timetableEntries: [] as any[],
            errors: [] as string[],
        };

        // Step 1: Create or get class section
        const { data: existingSection } = await supabase
            .from('class_sections')
            .select('id')
            .eq('dept_code', metadata.branch)
            .eq('semester', metadata.semester)
            .eq('section', metadata.section)
            .single();

        if (existingSection) {
            results.classSection = existingSection;
        } else {
            const { data: newSection, error: sectionError } = await supabase
                .from('class_sections')
                .insert({
                    dept_code: metadata.branch,
                    semester: metadata.semester,
                    section: metadata.section,
                    name: `${metadata.semester} ${metadata.branch}-${metadata.section}`,
                    academic_year: metadata.academicYear,
                    strength: 60, // Default, can be updated later
                })
                .select()
                .single();

            if (sectionError) {
                results.errors.push(`Failed to create class section: ${sectionError.message}`);
                return NextResponse.json({ error: 'Failed to create class section', details: sectionError }, { status: 500 });
            }

            results.classSection = newSection;
        }

        const classSectionId = results.classSection.id;

        // Step 2: Create courses from subject mapping
        for (const subject of subjects) {
            // Check if course exists
            const { data: existingCourse } = await supabase
                .from('courses')
                .select('id')
                .eq('dept_code', metadata.branch)
                .eq('semester', metadata.semester)
                .eq('course_code', subject.code)
                .single();

            if (existingCourse) {
                results.courses.push(existingCourse);
                continue;
            }

            // Create new course
            const { data: newCourse, error: courseError } = await supabase
                .from('courses')
                .insert({
                    dept_code: metadata.branch,
                    semester: metadata.semester,
                    course_code: subject.code,
                    course_name: subject.name,
                    course_type: subject.type === 'lab' ? 'lab' : 'theory',
                    credits: subject.type === 'lab' ? 2 : 3,
                    is_active: true,
                })
                .select()
                .single();

            if (courseError) {
                results.errors.push(`Failed to create course ${subject.code}: ${courseError.message}`);
            } else {
                results.courses.push(newCourse);
            }
        }

        // Step 3: Get or create faculty assignments
        const facultyMap = new Map<string, string>(); // faculty name -> faculty ID

        for (const subject of subjects) {
            if (!subject.faculty || subject.faculty === '-') continue;

            // Find faculty by name
            const { data: faculty } = await supabase
                .from('faculty_profiles')
                .select('id')
                .or(`first_name.ilike.%${subject.faculty}%,last_name.ilike.%${subject.faculty}%`)
                .limit(1)
                .single();

            if (faculty) {
                facultyMap.set(subject.code, faculty.id);
            } else {
                results.errors.push(`Faculty not found: ${subject.faculty} for ${subject.code}`);
            }
        }

        // Step 4: Create timetable entries
        const dayMapping: Record<string, string> = {
            'Monday': 'Monday',
            'Tuesday': 'Tuesday',
            'Wednesday': 'Wednesday',
            'Thursday': 'Thursday',
            'Friday': 'Friday',
            'Saturday': 'Saturday',
        };

        const timeSlots = [
            { period: 1, start: '09:00', end: '09:50' },
            { period: 2, start: '09:50', end: '10:40' },
            { period: 3, start: '10:50', end: '11:40' },
            { period: 4, start: '11:40', end: '12:30' },
            { period: 5, start: '13:10', end: '14:00' },
            { period: 6, start: '14:00', end: '14:50' },
            { period: 7, start: '15:00', end: '15:40' },
            { period: 8, start: '15:40', end: '16:20' },
        ];

        // Delete existing timetable for this class section
        await supabase
            .from('timetable')
            .delete()
            .eq('class_section_id', classSectionId);

        for (const entry of entries) {
            // Find course
            const course = results.courses.find(c => c.course_code === entry.subjectCode);
            if (!course) {
                results.errors.push(`Course not found for code: ${entry.subjectCode}`);
                continue;
            }

            // Find faculty
            const facultyId = facultyMap.get(entry.subjectCode);
            if (!facultyId) {
                results.errors.push(`Faculty not assigned for: ${entry.subjectCode}`);
                continue;
            }

            // Get time slot
            const timeSlot = timeSlots.find(t => t.period === entry.period);
            if (!timeSlot) {
                results.errors.push(`Invalid period: ${entry.period}`);
                continue;
            }

            // Insert timetable entry
            const { data: timetableEntry, error: timetableError } = await supabase
                .from('timetable')
                .insert({
                    faculty_id: facultyId,
                    course_id: course.id,
                    class_section_id: classSectionId,
                    day_of_week: dayMapping[entry.day],
                    period_number: entry.period,
                    start_time: timeSlot.start,
                    end_time: timeSlot.end,
                    room_number: metadata.roomNo,
                })
                .select()
                .single();

            if (timetableError) {
                results.errors.push(`Failed to create timetable entry: ${timetableError.message}`);
            } else {
                results.timetableEntries.push(timetableEntry);
            }
        }

        return NextResponse.json({
            success: true,
            message: `Timetable uploaded successfully for ${metadata.branch} ${metadata.section}`,
            results: {
                classSection: results.classSection,
                coursesCreated: results.courses.length,
                timetableEntriesCreated: results.timetableEntries.length,
                errors: results.errors,
            },
        });

    } catch (error: any) {
        console.error('Timetable upload error:', error);
        return NextResponse.json(
            { error: 'Failed to upload timetable', details: error.message },
            { status: 500 }
        );
    }
}
