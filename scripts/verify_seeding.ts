
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

async function verifyTimetableSeeding() {
    console.log("🚀 Verifying Timetable Seeding...");

    // 1. Check Total Entries
    const { count: totalEntries, error: countError } = await supabase
        .from('timetable')
        .select('*', { count: 'exact', head: true });

    if (countError) {
        console.error("❌ Error checking entries:", countError.message);
    } else {
        console.log(`✅ Total Timetable Entries: ${totalEntries}`);
    }

    // 2. Check Distribution by Department (via class_sections)
    const { data: deptCounts, error: groupError } = await supabase
        .from('timetable')
        .select(`
            class_section:class_sections (
                dept_code
            )
        `);

    if (groupError) {
        console.error("❌ Error grouping:", groupError.message);
    } else if (deptCounts) {
        const counts: Record<string, number> = {};
        deptCounts.forEach((row: any) => {
            const dept = row.class_section?.dept_code || 'Unknown';
            counts[dept] = (counts[dept] || 0) + 1;
        });

        console.log("\n📊 Entries by Department:");
        Object.keys(counts).forEach(d => console.log(`   - ${d}: ${counts[d]}`));
    }

    // 3. Check Specific Example (CSE-2-A)
    const { data: cseExample } = await supabase
        .from('timetable')
        .select(`
            day_of_week, 
            period_number,
            start_time,
            course:courses (name),
            faculty:faculty_profiles (first_name)
        `)
        .eq('class_section_id', (await supabase.from('class_sections').select('id').eq('name', 'CSE-2-A').single()).data?.id)
        .order('period_number', { ascending: true })
        .limit(5);

    if (cseExample && cseExample.length > 0) {
        console.log("\n🗓️  Sample Schedule (CSE-2-A):");
        cseExample.forEach((slot: any) => {
            console.log(`   - ${slot.day_of_week} P${slot.period_number} (${slot.start_time}): ${slot.course?.name} (${slot.faculty?.first_name || 'Unassigned'})`);
        });
    } else {
        console.log("\n❌ No schedule found for CSE-2-A. Seeding might have failed for CSE.");
    }
}

verifyTimetableSeeding();
