
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
    console.log('Checking faculty via Supabase SDK...');

    // 1. Try lowercase 'faculty'
    let { data: faculty, error } = await supabase.from('faculty').select('id, name, designation, department').limit(5);

    if (error) {
        console.error('Error with "faculty":', error.message);
        // Try Capitalized 'Faculty'?
        console.log('Trying "Faculty"...');
        const res2 = await supabase.from('Faculty').select('id, name, designation, department').limit(5);
        if (res2.error) {
            console.error('Error with "Faculty":', res2.error.message);
            return;
        }
        faculty = res2.data;
    }

    console.log('Successfully accessed table. Sample data:', faculty);

    // 2. Fix CSE HOD
    console.log('Searching for Nageswara Rao...');
    const { data: nageswara } = await supabase.from('faculty').select('*').ilike('name', '%Nageswara Rao%');
    if (nageswara && nageswara.length > 0) {
        console.log('Found Nageswara:', nageswara[0]);
        const update = await supabase.from('faculty').update({ designation: 'Professor & HOD' }).eq('id', nageswara[0].id);
        console.log('Update Nageswara result:', update);
    } else {
        console.log('Nageswara NOT FOUND');
    }

    // 3. Fix Suneetha
    console.log('Searching for Suneetha...');
    const { data: suneetha } = await supabase.from('faculty').select('*').ilike('name', '%Suneetha%');
    if (suneetha && suneetha.length > 0) {
        console.log('Found Suneetha:', suneetha[0]);
        // Only update if she is marked as HOD textually
        if (suneetha[0].designation.includes('HOD')) {
            const update = await supabase.from('faculty').update({ designation: 'Professor' }).eq('id', suneetha[0].id);
            console.log('Demoted Suneetha result:', update);
        }
    }

    // 4. Fix CSE-DS HOD (Bhavani)
    console.log('Searching for Bhavani...');
    const { data: bhavani } = await supabase.from('faculty').select('*').ilike('name', '%Bhavani%');

    if (bhavani && bhavani.length > 0) {
        console.log('Found Bhavani:', bhavani[0]);
        const update = await supabase.from('faculty').update({
            name: 'Dr. B. Bhavani',
            designation: 'Associate Professor & HOD',
            department: 'CSE-DS'
        }).eq('id', bhavani[0].id);
        console.log('Update Bhavani result:', update);
    } else {
        console.log('Bhavani NOT FOUND. Creating...');
        const insert = await supabase.from('faculty').insert({
            name: 'Dr. B. Bhavani',
            designation: 'Associate Professor & HOD',
            department: 'CSE-DS',
            qualification: 'Ph.D',
            status: 'Regular',
            date_of_joining: '2015-06-01', // Dummy
            aicte_id: 'TEMP-BHAVANI',
            jntu_id: 'TEMP-BHAVANI'
        });
        console.log('Insert Bhavani result:', insert);
    }
}

run();
