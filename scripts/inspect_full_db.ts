
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

async function inspectFullDb() {
    console.log("🔍 Inspecting Full Database State...\n");

    // 1. Academic Years
    const { data: ays, error: ayError } = await supabase.from('academic_years').select('*');
    console.log(`📅 Academic Years (${ays?.length || 0}):`);
    if (ayError) console.error(ayError);
    else console.table(ays);

    // 2. Class Sections Count & Sample
    const { count: sectionCount } = await supabase.from('class_sections').select('*', { count: 'exact', head: true });
    console.log(`\n🏫 Class Sections (Total: ${sectionCount}):`);
    const { data: sections } = await supabase.from('class_sections').select('id, name, dept_code, year, section').limit(10);
    console.table(sections);

    // 3. Courses Count & Sample
    const { count: courseCount } = await supabase.from('courses').select('*', { count: 'exact', head: true });
    console.log(`\n📚 Courses (Total: ${courseCount}):`);
    const { data: courses } = await supabase.from('courses').select('id, code, name, dept_code').limit(10);
    console.table(courses);

    // 4. Timetable Count & Sample
    const { count: timetableCount } = await supabase.from('timetable').select('*', { count: 'exact', head: true });
    console.log(`\n🗓️  Timetable Entries (Total: ${timetableCount}):`);

    // Join to see if IDs match
    const { data: timetableSamples } = await supabase
        .from('timetable')
        .select(`
            day_of_week, 
            period_number,
            start_time,
            class_section:class_sections(name),
            course:courses(code),
            faculty:faculty_profiles(first_name)
        `)
        .limit(5);

    if (timetableSamples) {
        timetableSamples.forEach((t: any) => {
            console.log(`   - ${t.class_section?.name || 'Unknown Sec'}: ${t.day_of_week} P${t.period_number} -> ${t.course?.code || 'Unknown Course'} (${t.faculty?.first_name || 'Unknown Fac'})`);
        });
    }

    console.log("\n✅ Inspection Complete.");
}

inspectFullDb();
