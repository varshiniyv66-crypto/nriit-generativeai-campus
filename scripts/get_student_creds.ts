
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

async function getStudent() {
    const { data: section } = await supabase.from('class_sections').select('id').eq('name', 'CSE-2-A').single();
    if (!section) { console.log('Section CSE-2-A not found'); return; }

    const { data: student } = await supabase
        .from('students')
        .select('roll_number, email, first_name')
        .eq('section_id', section.id)
        .limit(1)
        .single();

    if (student) {
        console.log('=== REAL STUDENT CREDENTIALS ===');
        console.log('Class: CSE-2-A');
        console.log(`Name: ${student.first_name}`);
        console.log(`Roll No: ${student.roll_number}`);
        console.log(`Email: ${student.email}`);
    } else {
        console.log('No student found in CSE-2-A');
    }
}

getStudent();
