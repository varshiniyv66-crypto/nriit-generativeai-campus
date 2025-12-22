
const { createClient } = require('@supabase/supabase-js');
const dotenv = require('dotenv');
const path = require('path');
dotenv.config({ path: path.join(process.cwd(), '.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('Missing Supabase credentials in .env.local');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function syncMbaFaculty() {
    console.log('Syncing Dr. KPR Rajesh to MBA faculty list in Supabase...');

    const newFaculty = {
        name: 'Dr. KPR Rajesh',
        designation: 'Associate Professor',
        department: 'MBA',
        qualification: 'MBA, M.Phil, Ph.D',
        status: 'Regular',
        date_of_joining: '2025-07-07',
        pan_number: 'AYXPP2880J'
    };

    const tables = ['faculty', 'Faculty', 'FACULTY'];
    let success = false;

    for (const tableName of tables) {
        try {
            console.log(`Checking table: ${tableName}...`);
            const { data: existing, error: checkError } = await supabase
                .from(tableName)
                .select('id')
                .eq('pan_number', 'AYXPP2880J')
                .maybeSingle();

            if (checkError) {
                console.warn(`Could not check table ${tableName}: ${checkError.message}`);
                continue;
            }

            if (existing) {
                console.log(`Faculty member with this PAN already exists in ${tableName}. Updating details...`);
                const { error: updateError } = await supabase
                    .from(tableName)
                    .update(newFaculty)
                    .eq('id', existing.id);

                if (updateError) throw updateError;
                console.log('✅ Faculty updated successfully.');
            } else {
                console.log(`Inserting into ${tableName}...`);
                const { error: insertError } = await supabase
                    .from(tableName)
                    .insert([newFaculty]);

                if (insertError) throw insertError;
                console.log('✅ Faculty inserted successfully.');
            }
            success = true;
            break;
        } catch (e) {
            console.warn(`Failed on ${tableName}: ${e.message}`);
        }
    }

    if (!success) {
        console.error('❌ CRITICAL: Could not sync faculty to any table casing.');
    }
}

syncMbaFaculty();
