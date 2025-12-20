
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function fixTimetable() {
    console.log("Fixing Timetable for FACCSE034 (Dr. Y. V. Raghava Rao)...");

    // 1. Get Faculty UUID
    const { data: faculty } = await supabase.from('faculty_profiles').select('id, dept_code').eq('employee_id', 'FACCSE034').single();
    if (!faculty) { console.error("Faculty NOT FOUND"); return; }
    console.log(`Faculty ID: ${faculty.id}`);

    // 2. Get a Course (Subject)
    // If 'courses' table was empty in previous check (it returned null), we need to create one or find correct table.
    let { data: course } = await supabase.from('courses').select('id').eq('dept_code', 'CSE').limit(1).single();

    if (!course) {
        console.log("No courses found. Creating 'Data Warehousing' course...");
        const { data: newCourse, error } = await supabase.from('courses').insert({
            code: 'CS3101',
            name: 'Data Warehousing & Mining',
            dept_code: 'CSE',
            credits: 3,
            semester: 5, // Assuming
            type: 'Theory'
        }).select().single();
        if (error) { console.error("Failed to create course:", error); return; }
        course = newCourse;
    }
    console.log(`Course ID: ${course.id}`);

    // 3. Get a Class Section
    // If 'class_sections' was empty.
    let { data: section } = await supabase.from('class_sections').select('id').eq('dept_code', 'CSE').limit(1).single();

    if (!section) {
        // Need Academic Year first?
        let { data: ay } = await supabase.from('academic_years').select('id').eq('is_active', true).single();
        if (!ay) {
            console.log("Creating Academic Year...");
            const { data: newAy } = await supabase.from('academic_years').insert({
                name: '2025-2026',
                start_date: '2025-06-01',
                end_date: '2026-05-30',
                is_active: true
            }).select().single();
            ay = newAy;
        }

        console.log("Creating Class Section...");
        const { data: newSection, error: secError } = await supabase.from('class_sections').insert({
            name: 'CSE-A',
            dept_code: 'CSE',
            academic_year_id: ay.id,
            year: 3,
            semester: 1,
            section: 'A'
        }).select().single();

        if (secError) { console.error("Failed to create section:", secError); return; }
        section = newSection;
    }
    console.log(`Section ID: ${section.id}`);

    // 4. Assign Timetable
    // Assign Periods 1-4 on Monday
    const entries = [
        { day_of_week: 'Monday', period_number: 1, start_time: '09:00', end_time: '09:50' },
        { day_of_week: 'Monday', period_number: 2, start_time: '09:50', end_time: '10:40' },
        { day_of_week: 'Tuesday', period_number: 3, start_time: '10:50', end_time: '11:40' },
        { day_of_week: 'Wednesday', period_number: 4, start_time: '11:40', end_time: '12:30' },
    ];

    for (const e of entries) {
        const payload = {
            faculty_id: faculty.id,
            course_id: course.id,
            class_section_id: section.id,
            ...e
        };

        const { error } = await supabase.from('timetable').insert(payload);
        if (error) console.error(`Failed to assign ${e.day_of_week} Period ${e.period_number}:`, error.message);
        else console.log(`Assigned ${e.day_of_week} Period ${e.period_number} ✅`);
    }
}

fixTimetable();
