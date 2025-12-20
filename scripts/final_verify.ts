
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

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

async function finalVerify() {
    console.log("Starting Final Verification...");

    // 1. Check IT Faculty Sowjanya
    const { data: sowjanya, error } = await supabase
        .from('faculty_profiles')
        .select('*')
        .eq('dept_code', 'IT')
        .or('first_name.ilike.%Sowjanya%,last_name.ilike.%Sowjanya%');

    if (sowjanya && sowjanya.length > 0) {
        console.log("\n✅ IT Faculty 'Sowjanya' found:");
        sowjanya.forEach(f => {
            console.log(`   - Name: ${f.first_name} ${f.last_name}, PAN: ${f.pan_number || 'MISSING'}`);
            if (f.pan_number === 'AMGPB4443C') {
                console.log("   -> PAN MATCHES Expected 'AMGPB4443C' ✅");
            } else {
                console.log("   -> PAN MISMATCH ❌ (Expected 'AMGPB4443C')");
            }
        });
    } else {
        console.log("\n❌ IT Faculty 'Sowjanya' NOT FOUND in DB.");
    }

    // 2. Check Missing Joining Dates count
    const depts = ['CSE', 'ECE', 'IT'];
    console.log("\nChecking Missing Joining Dates:");
    for (const dept of depts) {
        const { count } = await supabase
            .from('faculty_profiles')
            .select('*', { count: 'exact', head: true })
            .eq('dept_code', dept)
            .is('date_of_joining', null);

        const { count: total } = await supabase
            .from('faculty_profiles')
            .select('*', { count: 'exact', head: true })
            .eq('dept_code', dept);

        console.log(`   ${dept}: ${count} / ${total} faculty missing joining date.`);
    }

    process.exit(0);
}

finalVerify();
