// Script to check duplicate PAN numbers and preview cleanup
// Uses the same approach as the app does

async function checkDuplicates() {
    // Read env file manually
    const fs = require('fs');
    const path = require('path');

    let envContent = '';
    try {
        envContent = fs.readFileSync(path.join(__dirname, '.env.local'), 'utf-8');
    } catch (e) {
        console.error('Could not read .env.local file');
        return;
    }

    // Parse env
    const envVars = {};
    envContent.split('\n').forEach(line => {
        const [key, ...valueParts] = line.split('=');
        if (key && valueParts.length > 0) {
            envVars[key.trim()] = valueParts.join('=').trim();
        }
    });

    const supabaseUrl = envVars.NEXT_PUBLIC_SUPABASE_URL;
    const supabaseKey = envVars.SUPABASE_SERVICE_ROLE_KEY || envVars.NEXT_PUBLIC_SUPABASE_ANON_KEY;

    if (!supabaseUrl || !supabaseKey) {
        console.error('Missing Supabase credentials in .env.local');
        return;
    }

    const { createClient } = require('@supabase/supabase-js');
    const supabase = createClient(supabaseUrl, supabaseKey);

    console.log('\n🔍 Checking for duplicate PAN numbers...\n');
    console.log('='.repeat(120));

    // Get all faculty with PAN numbers
    const { data: faculty, error } = await supabase
        .from('faculty_profiles')
        .select(`
            id,
            employee_id,
            first_name,
            last_name,
            designation,
            pan_number,
            date_of_joining,
            department_id,
            departments (dept_code, dept_name)
        `)
        .eq('is_active', true)
        .not('pan_number', 'is', null)
        .order('pan_number');

    if (error) {
        console.error('Error fetching faculty:', error);
        return;
    }

    console.log(`📊 Total active faculty with PAN: ${faculty.length}\n`);

    // Group by PAN number
    const panGroups = {};
    faculty.forEach(f => {
        if (!panGroups[f.pan_number]) {
            panGroups[f.pan_number] = [];
        }
        panGroups[f.pan_number].push(f);
    });

    // Find duplicates
    const duplicates = Object.entries(panGroups).filter(([pan, members]) => members.length > 1);

    if (duplicates.length === 0) {
        console.log('✅ No duplicate PAN numbers found! All records are unique.');
        return;
    }

    console.log(`🔴 Found ${duplicates.length} duplicate PAN numbers:\n`);

    // Designation priority
    const getDesignationPriority = (designation) => {
        if (!designation) return 5;
        const d = designation.toLowerCase();
        if (d.includes('dean')) return 1;
        if (d.includes('professor') && !d.includes('assistant') && !d.includes('associate')) return 2;
        if (d.includes('associate')) return 3;
        if (d.includes('assistant')) return 4;
        return 5;
    };

    let totalToDelete = 0;
    const recordsToDelete = [];

    duplicates.forEach(([pan, members], index) => {
        console.log(`\n${'─'.repeat(120)}`);
        console.log(`📋 PAN: ${pan} (${members.length} records)`);
        console.log(`${'─'.repeat(120)}`);
        console.log(`   ${'ACTION'.padEnd(12)} | ${'EMPLOYEE_ID'.padEnd(15)} | ${'NAME'.padEnd(28)} | ${'DESIGNATION'.padEnd(24)} | ${'JOIN DATE'.padEnd(12)} | DEPT`);
        console.log(`   ${'─'.repeat(110)}`);

        // Sort by priority and join date
        const sorted = members.sort((a, b) => {
            const priorityDiff = getDesignationPriority(a.designation) - getDesignationPriority(b.designation);
            if (priorityDiff !== 0) return priorityDiff;
            return new Date(b.date_of_joining || '1900-01-01') - new Date(a.date_of_joining || '1900-01-01');
        });

        sorted.forEach((f, i) => {
            const action = i === 0 ? '✅ KEEP' : '❌ DELETE';
            const dept = f.departments?.dept_code || 'N/A';
            const joinDate = f.date_of_joining ? new Date(f.date_of_joining).toLocaleDateString('en-IN') : 'N/A';
            const fullName = (f.first_name + ' ' + f.last_name).substring(0, 26);
            const desig = (f.designation || 'N/A').substring(0, 22);

            console.log(`   ${action.padEnd(12)} | ${(f.employee_id || 'N/A').padEnd(15)} | ${fullName.padEnd(28)} | ${desig.padEnd(24)} | ${joinDate.padEnd(12)} | ${dept}`);

            if (i > 0) {
                totalToDelete++;
                recordsToDelete.push({
                    id: f.id,
                    employee_id: f.employee_id,
                    name: f.first_name + ' ' + f.last_name,
                    pan: pan
                });
            }
        });
    });

    console.log(`\n${'='.repeat(120)}`);
    console.log(`\n📊 SUMMARY:`);
    console.log(`   ─────────────────────────────────────────`);
    console.log(`   Total duplicate PANs found:   ${duplicates.length}`);
    console.log(`   Records to KEEP:              ${duplicates.length}`);
    console.log(`   Records to DELETE:            ${totalToDelete}`);
    console.log(`   ─────────────────────────────────────────`);

    console.log(`\n📝 Records marked for deletion:\n`);
    recordsToDelete.forEach((r, i) => {
        console.log(`   ${i + 1}. ${r.employee_id} - ${r.name} (PAN: ${r.pan})`);
    });

    console.log(`\n💡 To delete these duplicates, run the cleanup SQL in Supabase dashboard.`);
    console.log(`   File: cleanup_pan_duplicates.sql (uncomment Step 3A or 3B)\n`);
}

checkDuplicates().catch(console.error);
