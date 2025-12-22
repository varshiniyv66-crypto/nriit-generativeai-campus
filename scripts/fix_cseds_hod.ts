
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

async function fixCSEDS_HOD() {
    console.log('Fixing CSE-DS HOD...');

    const cseDsHodaName = 'Dr. B. Bhavani';
    // Search for her
    const { data: matches, error: searchErr } = await supabase
        .from('faculty')
        .select('*')
        .ilike('name', '%Bhavani%');

    console.log('Matches found:', matches?.length);

    if (matches && matches.length > 0) {
        const faculty = matches[0];
        console.log(`Found ${faculty.name} (ID: ${faculty.id}). Updating to HOD of CSE-DS...`);

        const { error: updateErr } = await supabase
            .from('faculty')
            .update({
                name: cseDsHodaName,
                designation: 'Associate Professor & HOD',
                department: 'CSE-DS', // Ensure she is in the right department to appear in that list
                qualification: 'Ph.D' // Assumption, usually required for HOD
            })
            .eq('id', faculty.id);

        if (updateErr) console.error('Error updating:', updateErr);
        else console.log('Successfully updated Dr. B. Bhavani.');

    } else {
        console.log('Dr. B. Bhavani not found. Creating new record...');
        const { error: insertErr } = await supabase
            .from('faculty')
            .insert({
                name: cseDsHodaName,
                designation: 'Associate Professor & HOD',
                department: 'CSE-DS',
                qualification: 'Ph.D', // Assumption
                date_of_joining: '2015-06-01', // Dummy
                status: 'Regular',
                aicte_id: '1-BHAVANI',
                jntu_id: 'BHAVANI-123'
            });

        if (insertErr) console.error('Error inserting:', insertErr);
        else console.log('Successfully inserted Dr. B. Bhavani.');
    }
}

fixCSEDS_HOD();
