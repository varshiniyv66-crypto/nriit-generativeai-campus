
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

async function showSchedule() {
    console.log("📅 Fetching Schedule for CSE-2-A...");

    // 1. Get Section ID
    const { data: sec } = await supabase.from('class_sections').select('id').eq('name', 'CSE-2-A').single();
    if (!sec) { console.error("❌ Section CSE-2-A not found!"); return; }

    // 2. Get Timetable (No faculty join)
    const { data: schedule, error } = await supabase
        .from('timetable')
        .select(`
            day_of_week, 
            period_number,
            start_time,
            course:courses (name),
            faculty_id
        `)
        .eq('class_section_id', sec.id);

    if (error) { console.error("❌ Error fetching schedule:", error); return; }

    // 3. Manual Faculty Join
    const facultyIds = Array.from(new Set(schedule.map((s: any) => s.faculty_id).filter(Boolean)));
    const { data: faculty } = await supabase.from('faculty_profiles').select('id, first_name, last_name').in('id', facultyIds);

    const facultyMap: Record<string, string> = {};
    faculty?.forEach((f: any) => facultyMap[f.id] = `${f.first_name} ${f.last_name || ''}`);

    // Sort
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    schedule.sort((a, b) => {
        const dA = days.indexOf(a.day_of_week);
        const dB = days.indexOf(b.day_of_week);
        if (dA !== dB) return dA - dB;
        return a.period_number - b.period_number;
    });

    console.table(schedule.map((s: any) => ({
        Day: s.day_of_week,
        Period: s.period_number,
        Time: s.start_time,
        Course: s.course?.name || '???',
        Faculty: facultyMap[s.faculty_id] || 'Unassigned'
    })));
}

showSchedule();
