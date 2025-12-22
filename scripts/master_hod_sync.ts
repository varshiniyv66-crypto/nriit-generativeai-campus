
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

// Define User Overrides
const OVERRIDES = {
    'CSE': 'Dr. K. Nageswara Rao',
    'CSE-DS': 'Dr. B. Bhavani'
};

const DEPARTMENTS = ['CSE', 'CSE-DS', 'CSE-AI', 'ECE', 'IT', 'EEE', 'MECH', 'CIVIL', 'MCA', 'MBA'];

async function masterHodSync() {
    console.log('Starting Master HOD Sync...');

    // 1. Fetch all faculty
    // Try lowercase 'faculty' first, fallback to 'Faculty' or 'FACULTY'
    let tableName = 'faculty';
    let { data: allFaculty, error } = await supabase.from(tableName).select('*');

    if (error) {
        console.warn(`Failed with '${tableName}': ${error.message}`);
        tableName = 'Faculty';
        console.log(`Trying '${tableName}'...`);
        const res2 = await supabase.from(tableName).select('*');

        if (res2.error) {
            console.warn(`Failed with '${tableName}': ${res2.error.message}`);
            tableName = 'FACULTY';
            console.log(`Trying '${tableName}'...`);
            const res3 = await supabase.from(tableName).select('*');
            if (res3.error) {
                console.error('CRITICAL: Could not access faculty table with any casing.');
                return;
            }
            allFaculty = res3.data;
        } else {
            allFaculty = res2.data;
        }
    }

    if (!allFaculty) {
        console.log('No faculty data found.');
        return;
    }

    console.log(`Successfully accessed '${tableName}'. Total Faculty Found: ${allFaculty.length}`);

    for (const dept of DEPARTMENTS) {
        console.log(`\n--- Processing ${dept} ---`);

        // Filter faculty for this dept
        // Handle variations in dept naming if necessary (e.g. 'CSE' vs 'Computer Science')
        // Assuming codes match for now based on previous work
        const deptFaculty = allFaculty.filter(f => f.department === dept || f.department === dept.replace('-', ' ')); // Simple fuzzy check

        if (deptFaculty.length === 0) {
            console.log(`No faculty found for ${dept}. Skipping.`);
            continue;
        }

        // Check for specific override
        if (OVERRIDES[dept]) {
            const desiredName = OVERRIDES[dept];
            console.log(`Applying Override for ${dept}: ${desiredName}`);

            // Find the person
            const target = deptFaculty.find(f => f.name.toLowerCase().includes(desiredName.toLowerCase()));

            if (target) {
                if (!target.designation.includes('HOD')) {
                    console.log(`Promoting ${target.name} to HOD...`);
                    const newDesig = target.designation.includes('Professor') ? target.designation + ' & HOD' : 'Professor & HOD';
                    await supabase.from(tableName).update({ designation: newDesig }).eq('id', target.id);
                } else {
                    console.log(`${target.name} is already HOD.`);
                }

                // Demote others in this dept who shouldn't be HOD
                const others = deptFaculty.filter(f => f.id !== target.id && f.designation.includes('HOD'));
                for (const other of others) {
                    console.log(`Demoting old HOD: ${other.name}`);
                    const fixedDesig = other.designation.replace('& HOD', '').replace('HOD', '').trim();
                    await supabase.from(tableName).update({ designation: fixedDesig }).eq('id', other.id);
                }
            } else {
                console.warn(`WARNING: Override candidate ${desiredName} not found in ${dept} faculty list!`);
                // Fallback to auto-assign? Maybe better to warn first.
            }
        } else {
            // Auto-Assign Logic: "First Top PhD"

            // 1. Check if ANY valid HOD exists
            const existingHod = deptFaculty.find(f => f.designation.includes('HOD'));

            if (existingHod) {
                console.log(`Existing HOD found: ${existingHod.name}. Keeping as is.`);
                // Could verify they are PhD here if we wanted to be strict
            } else {
                console.log(`No HOD found for ${dept}. Finding Top PhD...`);

                // Filter for PhDs
                const phds = deptFaculty.filter(f =>
                    (f.qualification && f.qualification.toLowerCase().includes('ph.d')) ||
                    (f.name.startsWith('Dr.'))
                );

                if (phds.length > 0) {
                    // Sort by Designation Rank then Date of Joining
                    // Rank: Professor > Associate > Assistant
                    phds.sort((a, b) => {
                        const rankA = getRank(a.designation);
                        const rankB = getRank(b.designation);
                        if (rankA !== rankB) return rankB - rankA; // Higher rank first

                        // If rank same, earliest join date first
                        const dateA = new Date(a.date_of_joining || '2100-01-01').getTime();
                        const dateB = new Date(b.date_of_joining || '2100-01-01').getTime();
                        return dateA - dateB;
                    });

                    const topCandidate = phds[0];
                    console.log(`Selected Top Candidate: ${topCandidate.name} (${topCandidate.designation}, ${topCandidate.qualification})`);

                    // Promote
                    const baseDesig = topCandidate.designation.replace('& HOD', '').trim(); // clean first
                    const newDesig = `${baseDesig} & HOD`;

                    await supabase.from(tableName).update({ designation: newDesig }).eq('id', topCandidate.id);
                    console.log(`Promoted to ${newDesig}`);

                } else {
                    console.log(`No PhDs found in ${dept}. Checking for senior-most Professor/Associate...`);
                    // Fallback to just rank if no PhDs info avail
                    // Sort by Designation Rank then Date of Joining
                    deptFaculty.sort((a, b) => {
                        const rankA = getRank(a.designation);
                        const rankB = getRank(b.designation);
                        if (rankA !== rankB) return rankB - rankA;
                        const dateA = new Date(a.date_of_joining || '2100-01-01').getTime();
                        const dateB = new Date(b.date_of_joining || '2100-01-01').getTime();
                        return dateA - dateB;
                    });

                    if (deptFaculty.length > 0) {
                        const backup = deptFaculty[0];
                        console.log(`Selected Backup Candidate: ${backup.name} (${backup.designation})`);
                        const newDesig = `${backup.designation.replace('& HOD', '').trim()} & HOD`;
                        await supabase.from(tableName).update({ designation: newDesig }).eq('id', backup.id);
                    }
                }
            }
        }
    }

    console.log('Master HOD Sync Complete.');
}

function getRank(designation) {
    const d = designation.toLowerCase();
    if (d.includes('professor') && !d.includes('associate') && !d.includes('assistant')) return 3; // Full Professor
    if (d.includes('associate professor')) return 2;
    if (d.includes('assistant professor')) return 1;
    return 0;
}

masterHodSync();
