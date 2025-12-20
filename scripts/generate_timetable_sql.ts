
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function generateSQL() {
    console.log("Generating SQL for All Departments...");
    const sqlLines = [];
    sqlLines.push("-- SEED TIMETABLES FOR ALL DEPARTMENTS");
    sqlLines.push("BEGIN;");

    // 1. Get Academic Year
    let { data: ay } = await supabase.from('academic_years').select('id').eq('is_active', true).single();
    let ayId = ay?.id;

    if (!ayId) {
        console.log("No active academic year found via API. Using static UUID in SQL.");
        ayId = 'd860d5fb-d5f0-4497-a7ea-073004d80500'; // Static ID for script

        sqlLines.push(`
INSERT INTO academic_years (id, name, start_date, end_date, is_active)
VALUES ('${ayId}', '2025-2026', '2025-06-01', '2026-05-30', true)
ON CONFLICT (id) DO NOTHING;
`);
    }

    // 2. Fetch Departments and Faculty
    const { data: depts } = await supabase.from('departments').select('code');
    const { data: faculty } = await supabase.from('faculty_profiles').select('id, dept_code, first_name');

    if (!depts || !faculty) return;

    // 3. Define Template Schedule (Based on User's DataScience Input)
    const timeSlots = [
        { p: 1, s: '09:00', e: '09:50' },
        { p: 2, s: '09:50', e: '10:40' },
        { p: 3, s: '10:50', e: '11:40' },
        { p: 4, s: '11:40', e: '12:30' },
        { p: 5, s: '13:10', e: '14:00' },
        { p: 6, s: '14:00', e: '14:50' },
        { p: 7, s: '15:00', e: '15:40' },
        { p: 8, s: '15:40', e: '16:20' }
    ];

    const subjectsTemplate = [
        { type: 'Theory', name: 'Cloud Computing' },
        { type: 'Theory', name: 'Deep Learning' },
        { type: 'Theory', name: 'Data Visualization' },
        { type: 'Theory', name: 'Operating Systems' },
        { type: 'Theory', name: 'Software Project Management' },
        { type: 'Lab', name: 'Deep Learning Lab' },
        { type: 'Lab', name: 'Data Visualization Lab' },
        { type: 'theory', name: 'Counseling' }
    ];

    // Helper to escape SQL strings
    const esc = (s: string) => s ? `'${s.replace(/'/g, "''")}'` : 'NULL';

    for (const d of depts) {
        const deptCode = d.code;
        let deptFaculty = faculty.filter(f => f.dept_code === deptCode);

        // BORROW FACULTY if missing to ensure active timetable
        if (deptFaculty.length === 0) {
            console.log(`No faculty for ${deptCode}. Borrowing for demo...`);
            deptFaculty = [faculty[0]]; // Borrow the first one available
        }

        if (deptFaculty.length === 0) continue; // Should not happen if faculty > 0

        console.log(`Processing ${deptCode} with ${deptFaculty.length} faculty...`);

        // Create Sections (A, B) for 2nd, 3rd, 4th year
        for (let year = 2; year <= 4; year++) {
            for (const section of ['A']) { // Just Section A for now to keep file size managed
                const sectionName = `${deptCode}-${year}-${section}`;

                // SQL to Insert Section if not exists (using DO block or ON CONFLICT if constraints exist)
                // We will rely on simple inserts and ignore duplicates if possible, or select first.
                // Actually to make this "File" runnable, we can't easily reference IDs without DO blocks.
                // We will use a DO block for each section.

                sqlLines.push(`
DO $$
DECLARE
    v_ay_id UUID := '${ayId}';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := '${deptCode}';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, year, semester, section)
    VALUES ('${sectionName}', v_dept, v_ay_id, ${year}, ${year * 2}, '${section}')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = ${year} AND section = '${section}';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods
`);

                // assign random faculty for this section's subjects
                const assignedFaculty = {};
                subjectsTemplate.forEach((sub, idx) => {
                    const f = deptFaculty[idx % deptFaculty.length];
                    assignedFaculty[sub.name] = f.id;
                });

                // Generate 6 days x 8 periods
                const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

                days.forEach((day, dIdx) => {
                    timeSlots.forEach((slot, sIdx) => {
                        // Pick a random subject
                        const subject = subjectsTemplate[(dIdx + sIdx) % subjectsTemplate.length];
                        const facId = assignedFaculty[subject.name];

                        // Insert Course if not exists?
                        // We'll require course creation in the block.

                        sqlLines.push(`
    -- ${day} Period ${slot.p}: ${subject.name}
    INSERT INTO courses (code, name, dept_code, credits, semester, type)
    VALUES ('${deptCode}-${year}-${subject.name.substring(0, 3).toUpperCase()}', '${subject.name}', v_dept, 3, ${year * 2}, '${subject.type}')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '${facId}', 
        (SELECT id FROM courses WHERE code = '${deptCode}-${year}-${subject.name.substring(0, 3).toUpperCase()}'), 
        '${day}', 
        ${slot.p}, 
        '${slot.s}', 
        '${slot.e}';
`);
                    });
                });

                sqlLines.push(`END $$;`);
            }
        }
    }

    sqlLines.push("COMMIT;");

    fs.writeFileSync('seed_full_timetables.sql', sqlLines.join('\n'));
    console.log("SQL File Generated: seed_full_timetables.sql");
}

generateSQL();
