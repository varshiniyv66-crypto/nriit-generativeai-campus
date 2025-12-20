
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function inspectTimetable() {
    console.log("Checking Timetable status...");

    // Check if table has any data
    const { count } = await supabase.from('timetable').select('*', { count: 'exact', head: true });
    console.log(`Total Timetable Entries: ${count}`);

    // Check specific faculty
    const facultyId = 'FACCSE034'; // The one in screenshot
    const { data: myClasses } = await supabase
        .from('timetable')
        .select('*')
        .eq('faculty_id', facultyId);

    console.log(`Entries for ${facultyId}: ${myClasses?.length}`);

    // Fetch dependencies to create seed
    const { data: dept } = await supabase.from('departments').select('*').eq('code', 'CSE').single();
    const { data: courses } = await supabase.from('courses').select('id, code, name').eq('dept_code', 'CSE').limit(2);
    // academic years
    const { data: ay } = await supabase.from('academic_years').select('id, name').eq('is_active', true).single();

    console.log("\n--- Available Data for Seeding ---");
    console.log("Academc Year:", ay);
    console.log("Courses:", courses);

    // We likely need class_sections too
    // Assuming table 'class_sections' ? Need to verify schema name for class/sections.
    // In previous steps, we used 'student_profiles' which has 'class_section_id' maybe? No, usually 'class_sections' table.
    // Let's list tables if unsure, but I recall 'class_sections' or similar from previous context.
    // Let's try to fetch from 'classes' or 'sections' or 'class_sections'.

    const { data: classes } = await supabase.from('class_sections').select('*').limit(3);
    // If this fails, the table name might be different.

    if (classes) {
        console.log("Classes:", classes);
    } else {
        console.log("Could not fetch 'class_sections'. Checking schema...");
    }
}

inspectTimetable();
