
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

const SEED_DATA = {
    'CSE': { avg: '6.5 LPA', fill: '98.6%', place: '94.2%' },
    'CSE-DS': { avg: '6.2 LPA', fill: '95.4%', place: '92.1%' },
    'CSE-AI': { avg: '6.3 LPA', fill: '96.1%', place: '93.5%' },
    'ECE': { avg: '5.8 LPA', fill: '92.3%', place: '88.7%' },
    'IT': { avg: '5.9 LPA', fill: '94.2%', place: '90.5%' },
    'CIVIL': { avg: '4.2 LPA', fill: '85.0%', place: '76.4%' },
    'MBA': { avg: '5.5 LPA', fill: '90.0%', place: '82.0%' },
    'MCA': { avg: '4.8 LPA', fill: '91.5%', place: '85.0%' },
    'EEE': { avg: '4.5 LPA', fill: '88.0%', place: '79.2%' },
    'MECH': { avg: '4.3 LPA', fill: '86.5%', place: '78.1%' },
    'BSH': { avg: 'N/A', fill: '98.0%', place: 'N/A' },
    'EVT': { avg: 'N/A', fill: 'N/A', place: 'N/A' }
};

async function seedProgramDetails() {
    console.log('Fetching Department IDs...');
    const { data: depts, error } = await supabase.from('departments').select('id, code');

    if (error) {
        console.error('Error fetching depts:', error.message);
        return;
    }

    if (!depts) {
        console.error('No departments found');
        return;
    }

    console.log(`Found ${depts.length} departments.`);

    for (const dept of depts) {
        const code = dept.code.toUpperCase();
        const data = SEED_DATA[code];

        if (data) {
            console.log(`Seeding for ${code} (ID: ${dept.id})...`);

            const payload = {
                department_id: dept.id,
                avg_package_latest: data.avg,
                fill_rate_latest: data.fill,
                placement_rate_latest: data.place
            };

            // Upsert based on department_id (assuming it's unique or we delete first)
            // Since we can't easily delete via SDK without an ID or allowing delete all, assume 1:1 relation
            // We will try to select first to see if exists, then update or insert.

            // Actually, let's just use upsert if there is a constraint, but table constraint might not be set.
            // Let's check if record exists
            const { data: existing } = await supabase.from('nba_program_details').select('id').eq('department_id', dept.id).single();

            if (existing) {
                await supabase.from('nba_program_details').update(payload).eq('id', existing.id);
            } else {
                await supabase.from('nba_program_details').insert(payload);
            }
        } else {
            console.warn(`No seed data for ${code}`);
        }
    }

    console.log('Seeding Complete.');
}

seedProgramDetails();
