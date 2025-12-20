// generate-cse-real-data.js
// Run with: node generate-cse-real-data.js

const { createClient } = require('@supabase/supabase-js');
const XLSX = require('xlsx');
const fs = require('fs');
const path = require('path');

// Load environment variables from .env.local
const envPath = path.resolve(__dirname, '.env.local');
const envContent = fs.readFileSync(envPath, 'utf8');
const env = {};
envContent.split('\n').forEach(line => {
    const [key, value] = line.split('=');
    if (key && value) env[key.trim()] = value.trim();
});

const supabaseUrl = env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
// Note: Usually we need service role key for some admin tasks, but reading public profiles might work with anon if RLS allows.
// If RLS blocks it, we might need the SERVICE_ROLE_KEY if available in .env.local

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Error: Could not load Supabase credentials from .env.local');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function generateWithRealData() {
    console.log('🔄 Fetching real CSE faculty data...');

    // 1. Fetch CSE Faculty (REAL ONLY)
    const { data: faculty, error } = await supabase
        .from('faculty_profiles')
        .select('first_name, last_name, pan_number, designation')
        .eq('dept_code', 'CSE')
        .neq('pan_number', null)  // Filter out NULL
        .neq('pan_number', '')    // Filter out empty
        .order('first_name');

    if (error) {
        console.error('❌ Error fetching faculty:', error.message);
        return;
    }

    console.log(`✅ Found ${faculty.length} CSE faculty members.`);

    // 2. Create Excel Workbook
    const wb = XLSX.utils.book_new();

    // --- Sheet 1: Timetable ---
    const grid = [
        ['III B.Tech II-Sem Time Table (2023-2027 Batch)'],
        ['Academic Year: 2025-2026'],
        [''],
        ['Branch:', 'CSE', 'Section:', 'A', 'Class Incharge:', '<Select Faculty>', 'Room No:', '301'],
        [''],
        ['Day/Timings', 'P1 (9:00-9:50)', 'P2 (9:50-10:40)', 'BREAK', 'P3 (10:50-11:40)', 'P4 (11:40-12:30)', 'LUNCH BREAK', 'P5 (1:10-2:00)', 'P6 (2:00-2:50)', 'BREAK', 'P7 (3:00-3:40)', 'P8 (3:40-4:20)'],
    ];
    // Add 6 days
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'].forEach(d => grid.push([d, '', '', '', '', '', '', '', '', '', '', '']));

    const ws1 = XLSX.utils.aoa_to_sheet(grid);
    ws1['!cols'] = [{ wch: 15 }, { wch: 14 }, { wch: 14 }, { wch: 10 }, { wch: 14 }, { wch: 14 }, { wch: 14 }, { wch: 14 }, { wch: 14 }, { wch: 10 }, { wch: 14 }, { wch: 14 }];
    XLSX.utils.book_append_sheet(wb, ws1, 'Timetable');

    // --- Sheet 2: Subject Mapping ---
    // Prepare rows with real faculty examples
    const mappingRows = [['Subject Code', 'Subject Name', 'Faculty Name', 'PAN Number', 'Type']];

    // Default CSE subjects
    const subjects = [
        ['OS', 'Operating Systems'],
        ['DBMS', 'Database Management Systems'],
        ['CC', 'Cloud Computing'],
        ['SPM', 'Software Project Management'],
        ['AI', 'Artificial Intelligence'],
        ['ML', 'Machine Learning'],
        ['DL_LAB', 'Deep Learning Lab'],
        ['DV_LAB', 'Data Visualization Lab']
    ];

    // Assign first few faculty to subjects just as an example
    subjects.forEach((sub, index) => {
        const fac = faculty[index % faculty.length] || { first_name: 'Unknown', last_name: 'Faculty', pan_number: 'N/A' };
        const fullName = `${fac.first_name} ${fac.last_name}`;
        const type = sub[0].includes('LAB') ? 'lab' : 'theory';
        mappingRows.push([sub[0], sub[1], fullName, fac.pan_number, type]);
    });

    // Add Special subjects
    mappingRows.push(['COUN', 'Counseling', '-', '-', 'special']);
    mappingRows.push(['LIB', 'Library', '-', '-', 'special']);

    const ws2 = XLSX.utils.aoa_to_sheet(mappingRows);
    ws2['!cols'] = [{ wch: 15 }, { wch: 30 }, { wch: 25 }, { wch: 15 }, { wch: 10 }];
    XLSX.utils.book_append_sheet(wb, ws2, 'Subject Mapping');

    // --- Sheet 3: Faculty Reference (Helper Sheet) ---
    // List all available CSE faculty so user can copy-paste
    const facRows = [['Faculty Name', 'PAN Number', 'Designation']];
    faculty.forEach(f => {
        facRows.push([`${f.first_name} ${f.last_name}`, f.pan_number || '-', f.designation]);
    });
    const ws3 = XLSX.utils.aoa_to_sheet(facRows);
    ws3['!cols'] = [{ wch: 25 }, { wch: 15 }, { wch: 20 }];
    XLSX.utils.book_append_sheet(wb, ws3, 'CSE Faculty List');

    // Write File
    const filename = 'CSE_Timetable_REAL_DATA.xlsx';
    XLSX.writeFile(wb, filename);
    console.log(`✅ Created: ${filename}`);
}

generateWithRealData();
