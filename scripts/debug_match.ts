
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

async function checkFail() {
    console.log("Debugging 'BHUMANA SUJATHA'...");
    const { data: all_cse } = await supabase.from('faculty_profiles').select('*').eq('dept_code', 'CSE');
    console.log(`Initial CSE Count: ${all_cse?.length}`);

    // Search manual
    const match = all_cse?.find(f =>
        (f.first_name + ' ' + f.last_name).toUpperCase().includes('SUJATA') ||
        (f.first_name + ' ' + f.last_name).toUpperCase().includes('BHUMANA')
    );

    if (match) {
        console.log("Found Manual Match:", match);
    } else {
        console.log("No match found manually in fetched data.");
    }
}

checkFail();
