
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

async function listTables() {
    // We can't list tables via client easily without admin, but we can try to select from likely candidates.
    const candidates = ['academic_years', 'academic_batches', 'class_sections', 'classes', 'timetable', 'timetables'];

    for (const t of candidates) {
        const { error } = await supabase.from(t).select('count', { count: 'exact', head: true });
        if (!error) console.log(`✅ Table exists: ${t}`);
        else console.log(`❌ ${t}: ${error.code} - ${error.message}`);
    }
}

listTables();
