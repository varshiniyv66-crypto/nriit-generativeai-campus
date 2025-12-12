
import dotenv from 'dotenv';
import path from 'path';
import { createClient } from '@supabase/supabase-js';

dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const url = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

const supabase = createClient(url, key);

async function inspect() {
    console.log("Inspecting DB...");
    const { count: deptCount } = await supabase.from('departments').select('*', { count: 'exact', head: true });
    console.log(`Departments: ${deptCount}`);

    const { count: facultyCount } = await supabase.from('faculty_profiles').select('*', { count: 'exact', head: true });
    console.log(`Faculty Profiles: ${facultyCount}`);

    const { count: studentCount } = await supabase.from('student_profiles').select('*', { count: 'exact', head: true });
    console.log(`Student Profiles: ${studentCount}`);
}

inspect();
