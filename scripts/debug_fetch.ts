
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

async function debug() {
    console.log("Fetching all faculty...");
    const { data, error } = await supabase.from('faculty_profiles').select('*');
    if (error) {
        console.error("Error:", error);
    } else {
        console.log(`Success: ${data.length} records.`);
    }
}

debug();
