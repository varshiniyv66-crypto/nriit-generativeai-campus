// run-cleanup.js
const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

// Load env
const envPath = path.resolve(__dirname, '.env.local');
const envContent = fs.readFileSync(envPath, 'utf8');
const env = {};
envContent.split('\n').forEach(line => {
    const [key, value] = line.split('=');
    if (key && value) env[key.trim()] = value.trim();
});

const supabaseUrl = env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = env.SUPABASE_SERVICE_ROLE_KEY || env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
// Note: Deleting users might require SERVICE_ROLE_KEY due to RLS. 
// If we only have ANON_KEY, this might fail if RLS prevents deletion.
// But we will try.

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Missing credentials.');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function cleanup() {
    console.log('🧹 Starting cleanup of dummy faculty...');

    // 1. Delete where PAN is NULL
    const { error: err1, count: count1 } = await supabase
        .from('faculty_profiles')
        .delete({ count: 'exact' })
        .is('pan_number', null)
        .not('email', 'ilike', '%dean%')
        .not('email', 'ilike', '%admin%')
        .not('email', 'ilike', '%principal%');

    if (err1) console.error('Error deleting NULL PANs:', err1.message);
    else console.log(`Deleted ${count1} faculty with NULL PAN.`);

    // 2. Delete where PAN is empty string
    const { error: err2, count: count2 } = await supabase
        .from('faculty_profiles')
        .delete({ count: 'exact' })
        .eq('pan_number', '')
        .not('email', 'ilike', '%dean%')
        .not('email', 'ilike', '%admin%')
        .not('email', 'ilike', '%principal%');

    if (err2) console.error('Error deleting empty PANs:', err2.message);
    else console.log(`Deleted ${count2} faculty with empty PAN.`);

    console.log('✅ Cleanup complete.');
}

cleanup();
