
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

async function fixCSEFaculty() {
    console.log('Fetching Faculty...');

    // 1. Find Suneetha
    const { data: suneetha, error: err1 } = await supabase
        .from('faculty')
        .select('*')
        .ilike('name', '%Suneetha%');

    // 2. Find Nageswara Rao
    const { data: nageswara, error: err2 } = await supabase
        .from('faculty')
        .select('*')
        .ilike('name', '%Nageswara Rao%');

    console.log('Suneetha matches:', suneetha?.length, suneetha?.map(f => f.name));
    console.log('Nageswara matches:', nageswara?.length, nageswara?.map(f => f.name));

    if (suneetha && suneetha.length > 0) {
        const s = suneetha[0];
        console.log('Updating Suneetha...');
        const { error: upErr1 } = await supabase
            .from('faculty')
            .update({
                designation: 'Professor & HOD',
                name: 'Dr. D. Suneetha', // Clean name
                department: 'CSE' // Ensure dept is correct
            })
            .eq('id', s.id);

        if (upErr1) console.error('Error updating Suneetha:', upErr1);
        else console.log('Suneetha Updated to HOD.');
    } else {
        console.log('Suneetha NOT FOUND. Creating record...');
        // If she doesn't exist, insert her!
        // We need department_id though. But usually 'department' string field is used? 
        // Checking schema... The file page used 'department' column to filter?
        // Actually the page uses 'department' column in filter: .eq('department', deptName)

        const { error: insErr } = await supabase.from('faculty').insert({
            name: 'Dr. D. Suneetha',
            designation: 'Professor & HOD',
            department: 'CSE',
            qualification: 'Ph.D',
            date_of_joining: '2010-06-01', // Approx
            status: 'Regular',
            aicte_id: '1-1234567890', // Dummy
            jntu_id: '1234-1234-1234' // Dummy
        });
        if (insErr) console.error('Error inserting Suneetha:', insErr);
        else console.log('Inserted Dr. D. Suneetha.');
    }

    if (nageswara && nageswara.length > 0) {
        const n = nageswara[0];
        console.log('Updating Nageswara Rao...');
        // Fix name if it has double Dr. or similar
        // And remove HOD from designation
        const cleanName = 'Dr. K. Nageswara Rao';
        const cleanDesignation = 'Professor'; // Demote from HOD if he was

        const { error: upErr2 } = await supabase
            .from('faculty')
            .update({
                name: cleanName,
                designation: cleanDesignation
            })
            .eq('id', n.id);

        if (upErr2) console.error('Error updating Nageswara:', upErr2);
        else console.log('Nageswara Rao updated (Designation corrected).');
    }
}

fixCSEFaculty();
