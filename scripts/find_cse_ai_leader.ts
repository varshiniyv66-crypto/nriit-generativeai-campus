
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function findTopPhD_CSE_AI() {
    console.log('Fetching Faculty for CSE-AI...');

    // Try fetching by department 'CSE-AI'
    const { data: faculty, error } = await supabase
        .from('faculty')
        .select('*')
        .eq('department', 'CSE-AI') // Assuming department code matching
        .order('id', { ascending: true }); // Standard ordering for now

    if (error) {
        console.error('Error:', error.message);
        return;
    }

    if (!faculty || faculty.length === 0) {
        console.log('No faculty found for CSE-AI directly. Trying fuzzy search on department or all faculty...');
        // Fallback
        return;
    }

    console.log(`Found ${faculty.length} faculty members.`);
    console.table(faculty.map(f => ({ name: f.name, designation: f.designation, qualification: f.qualification, joining: f.date_of_joining })));
}

findTopPhD_CSE_AI();
