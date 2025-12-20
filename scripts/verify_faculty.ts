import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

// Load environment variables
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function verifyFaculty() {
    console.log("==========================================");
    console.log("VERIFYING LATEST FACULTY DATA (CSE, ECE, IT)");
    console.log("==========================================\n");

    const depts = ['CSE', 'ECE', 'IT'];

    for (const dept of depts) {
        // Get Count
        const { count, error: countError } = await supabase
            .from('faculty_profiles')
            .select('*', { count: 'exact', head: true })
            .eq('dept_code', dept);

        if (countError) {
            console.error(`Error counting ${dept}:`, countError.message);
            continue;
        }

        console.log(`\n📘 ${dept} DEPARTMENT:`);
        console.log(`   Total Faculty: ${count}`);

        // Get Latest 5 Added (assuming created_at or just order by id/name if created_at missing, 
        // but the sql script used 'date_of_joining', let's use that to see 'latest' in terms of joining)
        const { data: latest, error: fetchError } = await supabase
            .from('faculty_profiles')
            .select('employee_id, first_name, last_name, designation, date_of_joining, pan_number')
            .eq('dept_code', dept)
            .order('date_of_joining', { ascending: false }) // Newest joiners first
            .limit(5);

        if (fetchError) {
            console.error(`   Error fetching details: ${fetchError.message}`);
        } else if (latest) {
            console.log(`   Latest Joiners:`);
            latest.forEach(f => {
                console.log(`   - [${f.employee_id}] ${f.first_name} ${f.last_name} (${f.designation}) - Joined: ${f.date_of_joining}`);
                if (f.pan_number) {
                    console.log(`     PAN: ${f.pan_number}`);
                } else {
                    console.log(`     PAN: MISSING ❌`);
                }
            });
        }
    }

    // Specific Check for a known fix from the SQL file
    // Example: 'AMGPB4443C' for IT 'BATTULA SOWJANYA'
    console.log("\n==========================================");
    console.log("VERIFYING SPECIFIC DATA FIXES");
    console.log("==========================================");

    const testCases = [
        { dept: 'IT', name: 'Sowjanya', expectedPan: 'AMGPB4443C' },
        { dept: 'CSE', name: 'Nageswara Rao', expectedPan: 'AGZPK9875A' },
        { dept: 'ECE', name: 'Srihari Rao', expectedPan: 'AHHPK9247R' }
    ];

    for (const test of testCases) {
        const { data: findings } = await supabase
            .from('faculty_profiles')
            .select('first_name, last_name, pan_number')
            .eq('dept_code', test.dept)
            .ilike('first_name', `%${test.name}%`); // Simplified check

        if (findings && findings.length > 0) {
            const match = findings[0];
            const status = match.pan_number === test.expectedPan ? "✅ VERIFIED" : `❌ MISMATCH (Found: ${match.pan_number})`;
            console.log(`Checking ${test.dept} - ${match.first_name} ${match.last_name}: ${status}`);
        } else {
            console.log(`Checking ${test.dept} - ${test.name}: ❌ NOT FOUND IN DB`);
        }
    }
}

verifyFaculty();
