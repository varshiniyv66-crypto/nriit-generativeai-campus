
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function checkProgramDetails() {
    console.log('Checking nba_program_details...');

    // Get all departments first to Map ID -> Code
    const { data: depts } = await supabase.from('departments').select('id, code');
    const deptMap = {};
    if (depts) depts.forEach(d => deptMap[d.id] = d.code);

    const { data: details, error } = await supabase.from('nba_program_details').select('*');

    if (error) {
        console.error('Error:', error.message);
        return;
    }

    console.log('--- FOUND DETAILS ---');
    if (details) {
        details.forEach(d => {
            console.log(`Dept: ${deptMap[d.department_id] || d.department_id}, Avg Package: ${d.avg_package_latest}, Fill Rate: ${d.fill_rate_latest}`);
        });
    } else {
        console.log('No details found.');
    }

    console.log('\n--- MISSING DEPARTMENTS ---');
    // Logic to print missing ones could be added here
}

checkProgramDetails();
