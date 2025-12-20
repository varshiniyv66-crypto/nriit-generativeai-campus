
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

async function seedTestStudents() {
    console.log("🌱 Seeding Test Students...");

    // CSE Student
    const { data: cseSection } = await supabase.from('class_sections').select('id, academic_year_id').eq('name', 'CSE-2-A').single();
    if (cseSection) {
        const { error } = await supabase.from('students').upsert({
            roll_number: '23CSE201',
            first_name: 'Arjun',
            last_name: 'Reddy',
            email: 'arjun.cse@nriit.ac.in',
            dept_code: 'CSE',
            section_id: cseSection.id,
            academic_year_id: cseSection.academic_year_id
        }, { onConflict: 'roll_number' });

        if (error) console.error("❌ Failed to seed CSE student:", error.message);
        else console.log("✅ Seeded Arjun in CSE-2-A");
    }

    // ECE Student
    const { data: eceSection } = await supabase.from('class_sections').select('id, academic_year_id').eq('name', 'ECE-2-A').single();
    if (eceSection) {
        const { error } = await supabase.from('students').upsert({
            roll_number: '23ECE201',
            first_name: 'Priya',
            last_name: 'Sharma',
            email: 'priya.ece@nriit.ac.in',
            dept_code: 'ECE',
            section_id: eceSection.id,
            academic_year_id: eceSection.academic_year_id
        }, { onConflict: 'roll_number' });

        if (error) console.error("❌ Failed to seed ECE student:", error.message);
        else console.log("✅ Seeded Priya in ECE-2-A");
    }
}

seedTestStudents();
