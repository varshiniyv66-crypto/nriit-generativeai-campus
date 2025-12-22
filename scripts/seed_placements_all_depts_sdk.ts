
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

// Years to seed
const YEARS_FULL = ['2021-22', '2022-23', '2023-24', '2024-25'];
const YEARS_NEW_A = ['2022-23', '2023-24', '2024-25']; // Started 2020, first batch 2024? Actually placement happens in 4th year usually. 
// If started 2020, first batch out in 2024. So 2023-24 placements.
// But we'll add 3 years for visual goodness as requested by "New Placements Data" which implies available data.

// Data Generators
const generateData = (baseAvg, baseMax, trendFactor, yearIdx) => {
    // Growth over years
    const growth = 1 + (trendFactor * yearIdx);
    return {
        avg: (baseAvg * growth).toFixed(2),
        max: (baseMax * (1 + (trendFactor * 1.5) * yearIdx)).toFixed(1),
        rate: Math.min(98, 70 + (5 * yearIdx))
    };
};

const DEPT_CONFIGS = {
    'CSE': { baseAvg: 5.0, baseMax: 18.0, years: YEARS_FULL, eligible: 180 },
    'CSE-DS': { baseAvg: 4.8, baseMax: 14.0, years: YEARS_NEW_A, eligible: 60 },
    'CSE-AI': { baseAvg: 4.9, baseMax: 15.0, years: YEARS_NEW_A, eligible: 60 },
    'IT': { baseAvg: 4.8, baseMax: 16.0, years: YEARS_FULL, eligible: 120 },
    'ECE': { baseAvg: 4.5, baseMax: 12.0, years: YEARS_FULL, eligible: 180 },
    'EEE': { baseAvg: 4.0, baseMax: 10.0, years: YEARS_FULL, eligible: 120 },
    'MECH': { baseAvg: 3.8, baseMax: 9.0, years: YEARS_FULL, eligible: 120 },
    'CIVIL': { baseAvg: 3.5, baseMax: 8.0, years: YEARS_FULL, eligible: 60 },
    'MBA': { baseAvg: 4.5, baseMax: 10.0, years: YEARS_FULL, eligible: 120 },
    'MCA': { baseAvg: 4.0, baseMax: 9.0, years: YEARS_FULL, eligible: 60 },
    'BSH': { baseAvg: 0, baseMax: 0, years: [], eligible: 0 },
    'EVT': { baseAvg: 0, baseMax: 0, years: [], eligible: 0 }
};

async function seedPlacements() {
    console.log('Fetching Department IDs...');
    const { data: depts, error } = await supabase.from('departments').select('id, code');
    if (error || !depts) {
        console.error('Error fetching depts:', error);
        return;
    }

    console.log(`Found ${depts.length} depts.`);

    for (const dept of depts) {
        const code = dept.code.toUpperCase();
        const config = DEPT_CONFIGS[code];

        if (config && config.years.length > 0) {
            console.log(`Seeding placements for ${code}...`);

            // Delete existing to clean slate
            await supabase.from('nba_placements').delete().eq('department_id', dept.id);

            for (let i = 0; i < config.years.length; i++) {
                const year = config.years[i];
                const stats = generateData(config.baseAvg, config.baseMax, 0.1, i);

                // Random variation
                const eligible = config.eligible + Math.floor(Math.random() * 10);
                const placed = Math.floor(eligible * (stats.rate / 100));

                const record = {
                    department_id: dept.id,
                    academic_year: year,
                    total_students_eligible: eligible,
                    students_placed: placed,
                    max_package: parseFloat(stats.max),
                    avg_package: parseFloat(stats.avg),
                    created_at: new Date()
                };

                const { error: insErr } = await supabase.from('nba_placements').insert(record);
                if (insErr) console.error(`Error inserting ${code} ${year}:`, insErr.message);
            }
        }
    }
    console.log('Placement Seeding Complete.');
}

seedPlacements();
