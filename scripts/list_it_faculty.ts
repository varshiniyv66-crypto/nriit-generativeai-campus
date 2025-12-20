
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

async function listIT() {
    console.log("Listing IT Faculty...");
    const { data, error } = await supabase
        .from('faculty_profiles')
        .select('*')
        .eq('dept_code', 'IT');

    if (error) {
        console.error("Error:", error);
        return;
    }

    console.log(`Found ${data?.length} faculty in IT.`);
    data?.forEach(f => {
        const fullName = `${f.first_name || ''} ${f.last_name || ''}`.trim();
        console.log(`ID: ${f.id} | Name: ${fullName} | PAN: ${f.pan_number}`);
    });
}

listIT();
