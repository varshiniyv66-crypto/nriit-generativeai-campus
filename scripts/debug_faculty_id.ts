
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

async function findFaculty() {
    console.log("Searching for faculty...");

    // Check specific name again
    const { data: faculty, error } = await supabase
        .from('faculty_profiles')
        .select('*')
        .eq('employee_id', 'FACCSE034'); // user tried FACCSE034 but verify script said NOT FOUND?
    // Wait, the USER's screenshot showed "Dr. Y. V. Raghava Rao" and "FACCSE034".
    // The previous verify script might have failed due to RLS or ID mismatch? No, I used service role in one, anon in other.
    // Let's use ILIKE on namme to find the ID.

    console.log("By ID Search:", faculty);

    const { data: byName } = await supabase
        .from('faculty_profiles')
        .select('*')
        .ilike('first_name', '%Raghava%')
        .limit(5);

    console.log("By Name Search:", byName);
}

findFaculty();
