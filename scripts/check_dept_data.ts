
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkData() {
    const deptCode = 'CSE';
    console.log(`Checking data for department: ${deptCode}`);

    const { data: dept, error: deptError } = await supabase
        .from('departments')
        .select('id, code')
        .eq('code', deptCode)
        .single();

    if (deptError || !dept) {
        console.error('Error fetching department:', deptError);
        return;
    }

    console.log(`Department ID: ${dept.id}`);

    const { data: admissions, error: admError } = await supabase
        .from('nba_admissions')
        .select('*')
        .eq('department_id', dept.id);

    console.log(`Admissions count: ${admissions?.length}`);
    if (admissions?.length === 0) console.log('Admissions data is EMPTY');

    const { data: placements, error: placeError } = await supabase
        .from('nba_placements')
        .select('*')
        .eq('department_id', dept.id);

    console.log(`Placements count: ${placements?.length}`);
    if (placements?.length === 0) console.log('Placements data is EMPTY');

    if (placements && placements.length > 0) {
        console.log('Sample Placement:', placements[0]);
    }
}

checkData();
