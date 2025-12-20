
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

async function seedRealTimetable() {
    console.log("Seeding Real 3rd Year Data Science Timetable...");

    // 1. Identify Target Keys
    // Faculty: Dr. Y. V. Raghava Rao (FACCSE034) or similar valid one. 
    // We'll search by name to be safe.
    const { data: facultyList } = await supabase
        .from('faculty_profiles')
        .select('id, employee_id, first_name, last_name, dept_code')
        .ilike('first_name', '%Raghava%')
        .limit(1);

    const faculty = facultyList?.[0];
    if (!faculty) {
        console.error("Target Faculty (Raghava Rao) not found. Using first available CSE faculty.");
    }
    const targetFacultyId = faculty?.id;
    const targetDeptCode = 'CSE'; // Map DataScience to CSE if no specific dept

    console.log(`Using Faculty: ${faculty?.first_name} ${faculty?.last_name} (${faculty?.employee_id})`);

    // 2. Ensure Courses Exist (Based on sample)
    const coursesToSeed = [
        { code: 'DS3201', name: 'Computer Machine Mining (CMM)' },
        { code: 'DS3202', name: 'Data Visualization (DV)' },
        { code: 'DS3203', name: 'Deep Learning (DL)' },
        { code: 'DS3204', name: 'Cloud Computing (CC)' },
        { code: 'DS3205', name: 'Operating Systems (OS)' },
        { code: 'DS3206', name: 'Software Project Management (SPM)' },
        { code: 'DS3207', name: 'IPR' },
        { code: 'DS3208', name: 'Soft Skills' },
        { code: 'DS3209', name: 'CRT' },
        { code: 'DS3210', name: 'Counseling (COUN)' },
        { code: 'DS3211', name: 'DV Lab' },
        { code: 'DS3212', name: 'DL Lab' },
        { code: 'DS3213', name: 'Library (LIB)' },
        { code: 'DS3214', name: 'Sports (SPORT)' },
        { code: 'DS3215', name: 'Tech Seminar (TS)' },
    ];

    const courseMap = new Map(); // Name -> ID

    for (const c of coursesToSeed) {
        // Upsert Course
        // We use code as unique key if possible, or insert if not found
        let { data: existing } = await supabase.from('courses').select('id').eq('code', c.code).single();
        if (!existing) {
            const { data: newC, error } = await supabase.from('courses').insert({
                dept_code: targetDeptCode,
                code: c.code,
                name: c.name,
                credits: 3, // Mock
                semester: 6, // 3rd Year 2nd Sem
                type: c.name.includes('Lab') ? 'Lab' : 'Theory'
            }).select().single();
            if (error) console.error(`Failed to create course ${c.name}:`, error.message);
            existing = newC;
        }
        if (existing) courseMap.set(c.name, existing.id);
    }

    // 3. Ensure Class Section Exists: "DataScience-A" (3rd Year, 2nd Sem, 2025-26)
    // We already have Academic Year?
    let { data: ay } = await supabase.from('academic_years').select('id').eq('is_active', true).single();
    if (!ay) {
        // Create if missing
        const { data: newAy } = await supabase.from('academic_years').insert({ name: '2025-2026', start_date: '2025-06-01', end_date: '2026-05-30', is_active: true }).select().single();
        ay = newAy;
    }

    if (!ay) { console.error("Could not find or create Academic Year"); return; }

    let { data: section } = await supabase.from('class_sections').select('id').eq('name', 'DataScience-A').single();
    if (!section) {
        const { data: newSec, error } = await supabase.from('class_sections').insert({
            name: 'DataScience-A',
            dept_code: targetDeptCode,
            academic_year_id: ay.id,
            year: 3,
            semester: 2,
            section: 'A'
        }).select().single();
        if (error) { console.error("Failed to create section:", error.message); return; }
        section = newSec;
    }

    if (!section) { console.error("Could not find or create Section"); return; }
    console.log(`Using Section: DataScience-A (${section.id})`);

    // 4. Create Timetable Entries
    // Define Slots
    const slots = [
        { p: 1, start: '09:00', end: '09:50' },
        { p: 2, start: '09:50', end: '10:40' },
        // Break 10:40-10:50
        { p: 3, start: '10:50', end: '11:40' },
        { p: 4, start: '11:40', end: '12:30' },
        // Lunch 12:30-1:10
        { p: 5, start: '13:10', end: '14:00' },
        { p: 6, start: '14:00', end: '14:50' },
        // Break 2:50-3:00
        { p: 7, start: '15:00', end: '15:40' },
        { p: 8, start: '15:40', end: '16:20' }
    ];

    // Helper
    const getC = (partialName) => {
        for (const [name, id] of courseMap.entries()) {
            if (name.includes(partialName)) return id;
        }
        return null;
    };

    // Schedule: [Day, P1, P2, P3, P4, P5, P6, P7, P8]
    // Abbrevs map to partialName for getC
    const schedule = [
        { day: 'Monday', periods: ['CMM', 'DV', 'DL', 'CC', 'OS', 'SPM', 'IPR', 'COUN'] },
        { day: 'Tuesday', periods: ['CC', 'CRT', 'Soft Skills', 'DV', 'SPM', 'DV Lab', 'DV Lab', 'DV Lab'] }, // Lab 6-8
        { day: 'Wednesday', periods: ['OS', 'CMM', 'DV', 'DL', 'CC', 'LIB', 'M/C', 'SPM'] }, // M/C? Mapping to CMM or similar? Let's use CMM
        { day: 'Thursday', periods: ['DL', 'CRT', 'CMM', 'OS', 'SPM', 'DV', 'CC', 'SPORT'] },
        { day: 'Friday', periods: ['OS', 'DL', 'Soft Skills', 'CMM', 'IPR', 'DL Lab', 'DL Lab', 'DL Lab'] },
        { day: 'Saturday', periods: ['SPM', 'CRT', 'CC', 'DV', 'CMM', 'OS', 'DL', 'Tech Seminar'] }
    ];

    // Clear existing for this section
    await supabase.from('timetable').delete().eq('class_section_id', section.id);

    let entryCount = 0;
    for (const row of schedule) {
        for (let i = 0; i < 8; i++) {
            const subjectName = row.periods[i];
            const courseId = getC(subjectName);
            const slot = slots[i];

            if (courseId && targetFacultyId) {
                const { error } = await supabase.from('timetable').insert({
                    class_section_id: section.id,
                    faculty_id: targetFacultyId, // Assign ALL to this faculty for visibility in demo
                    course_id: courseId,
                    day_of_week: row.day,
                    period_number: slot.p,
                    start_time: slot.start,
                    end_time: slot.end
                });
                if (error) console.error(`Error ${row.day} P${slot.p}:`, error.message);
                else entryCount++;
            }
        }
    }

    console.log(`Timetable Seeded Successfully! (${entryCount} entries)`);
    console.log("PLEASE LOGIN AS FACULTY TO SEE THE ACTIVE TIMETABLE.");
}

seedRealTimetable();
