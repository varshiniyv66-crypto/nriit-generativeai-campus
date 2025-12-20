
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function fixSowjanya() {
    console.log("Fixing Sowjanya PAN (Attempt 2)...");

    // Find ID first
    const { data: found, error } = await supabase
        .from('faculty_profiles')
        .select('id, first_name, last_name')
        .eq('dept_code', 'IT')
        .or('first_name.ilike.%Sowjanya%,last_name.ilike.%Sowjanya%');

    if (found && found.length > 0) {
        console.log(`Found ${found.length} matches.`);
        for (const f of found) {
            console.log(`Updating ${f.first_name} ${f.last_name}...`);
            const { error: updateError } = await supabase
                .from('faculty_profiles')
                .update({ pan_number: 'AMGPB4443C' })
                .eq('id', f.id);

            if (updateError) console.error("Update failed:", updateError.message);
            else console.log("Update SUCCESS.");
        }
    } else {
        console.log("No matching faculty found in IT.");
    }
}

fixSowjanya();
