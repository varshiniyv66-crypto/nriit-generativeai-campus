
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

async function inspectSchema() {
    console.log("Testing Minimal Insert...");
    const payload = {
        name: 'TEST-MINIMAL',
        dept_code: 'CSE',
        year: 2,
        semester: 4,
        section: 'Z'
    };

    const { data, error } = await supabase.from('class_sections').insert(payload).select().single();

    if (error) {
        console.log("Minimal Insert Failed:", error);
    } else {
        console.log("Minimal Insert Success!", Object.keys(data));
        // Clean up
        if (data && data.id) await supabase.from('class_sections').delete().eq('id', data.id);
    }
}

inspectSchema();
