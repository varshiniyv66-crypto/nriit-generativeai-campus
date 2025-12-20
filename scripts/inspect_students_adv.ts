
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

async function inspectStudents() {
    console.log("🔍 Checking Students Table Status...");

    // 1. Check Count
    const { count, error } = await supabase.from('students').select('*', { count: 'exact', head: true });

    if (error) {
        console.error("❌ Error accessing 'students' table:");
        console.error(JSON.stringify(error, null, 2));

        // Check if table exists via RPC or implication?
        // Usually error code 'PGRST205' means relation does not exist.
        if (error.code === 'PGRST205' || error.message?.includes('does not exist')) {
            console.log("⚠️  Table 'students' appears to be MISSING.");
        }
    } else {
        console.log(`✅ Table 'students' is accessible.`);
        console.log(`📊 Total Student Records: ${count}`);
    }
}

inspectStudents();
