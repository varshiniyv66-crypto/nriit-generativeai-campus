
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

async function getCredentials() {
    console.log("Fetching valid credentials...");

    // Get 1 CSE Faculty
    const { data: cse } = await supabase
        .from('faculty_profiles')
        .select('employee_id, email, first_name, last_name, dept_code, designation')
        .eq('dept_code', 'CSE')
        .limit(1)
        .single();

    // Get 1 ECE Faculty
    const { data: ece } = await supabase
        .from('faculty_profiles')
        .select('employee_id, email, first_name, last_name, dept_code, designation')
        .eq('dept_code', 'ECE')
        .limit(1)
        .single();

    // Get 1 IT Faculty (Sowjanya)
    const { data: it } = await supabase
        .from('faculty_profiles')
        .select('employee_id, email, first_name, last_name, dept_code, designation')
        .ilike('last_name', '%Sowjanya%')
        .limit(1)
        .single();

    console.log("\n=== REAL FACULTY CREDENTIALS ===");
    const faculties = [cse, ece, it].filter(Boolean);

    faculties.forEach(f => {
        console.log(`\nDept: ${f.dept_code}`);
        console.log(`Name: ${f.first_name} ${f.last_name}`);
        console.log(`Designation: ${f.designation}`);
        console.log(`Login ID: ${f.employee_id}`);
        console.log(`Email:    ${f.email || '(None)'}`);
        console.log(`Password: (Use Demo Password if set, or just ID/Magic Link)`);
    });
}

getCredentials();
