// generate-sample-template.js
// Run with: node generate-sample-template.js
// This script creates a ready‑to‑use Excel file that already contains
// a filled‑in example for the CSE 4‑A class. You can open the file,
// change the values (branch, section, faculty names, subject codes)
// and then upload it.

const XLSX = require('xlsx');
const fs = require('fs');

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

function generateSampleTemplate() {
    const wb = XLSX.utils.book_new();

    // ---------- Sheet 1: Timetable (official format) ----------
    const gridData = [
        // Row 1: Title
        ['III B.Tech II-Sem Time Table (2023-2027 Batch)'],
        // Row 2: Academic Year
        ['Academic Year: 2025-2026'],
        // Row 3: Empty
        [''],
        // Row 4: Metadata (you can edit these cells)
        ['Branch:', 'CSE', 'Section:', 'A', 'Class Incharge:', 'Dr. A. Kumar', 'Room No:', '301'],
        // Row 5: Empty
        [''],
        // Row 6: Column headers with breaks
        ['Day/Timings', 'P1 (9:00-9:50)', 'P2 (9:50-10:40)', 'BREAK', 'P3 (10:50-11:40)', 'P4 (11:40-12:30)',
            'LUNCH BREAK', 'P5 (1:10-2:00)', 'P6 (2:00-2:50)', 'BREAK', 'P7 (3:00-3:40)', 'P8 (3:40-4:20)'],
        // Rows 7‑12: Days – filled with example subject codes
        ['Monday', 'OS', 'DL', '', 'CC', 'SPM', '', 'COUN', 'LIB', '', 'TS', 'M/C'],
        ['Tuesday', 'DL', 'OS', '', 'SPM', 'CC', '', 'LIB', 'COUN', '', 'M/C', 'TS'],
        ['Wednesday', 'CC', 'SPM', '', 'OS', 'DL', '', 'TS', 'M/C', '', 'COUN', 'LIB'],
        ['Thursday', 'SPM', 'CC', '', 'DL', 'OS', '', 'M/C', 'TS', '', 'LIB', 'COUN'],
        ['Friday', 'OS', 'DL', '', 'CC', 'SPM', '', 'COUN', 'LIB', '', 'TS', 'M/C'],
        ['Saturday', 'DL', 'OS', '', 'SPM', 'CC', '', 'LIB', 'COUN', '', 'M/C', 'TS'],
        // Row 13: Empty
        [''],
        // Row 14‑20: Legend (optional – you can fill faculty names here for quick reference)
        ['Lab Name', 'Faculty Name'],
        ['Deep Learning Lab', 'Dr. B. Sharma'],
        ['Data Visualization Lab', 'Dr. C. Patel'],
        ['COUN', ''],
        ['LIB', ''],
        ['TS', ''],
        ['M/C', ''],
    ];

    const ws1 = XLSX.utils.aoa_to_sheet(gridData);

    // Column widths to make the sheet readable
    ws1['!cols'] = [
        { wch: 15 }, // Day column
        { wch: 14 }, { wch: 14 }, { wch: 10 }, // P1, P2, BREAK
        { wch: 14 }, { wch: 14 }, { wch: 14 }, // P3, P4, LUNCH
        { wch: 14 }, { wch: 14 }, { wch: 10 }, // P5, P6, BREAK
        { wch: 14 }, { wch: 14 }                // P7, P8
    ];

    XLSX.utils.book_append_sheet(wb, ws1, 'Timetable');

    // ---------- Sheet 2: Subject Mapping ----------
    const mappingData = [
        ['Subject Code', 'Subject Name', 'Faculty Name', 'Type'],
        ['OS', 'Operating Systems', 'Dr. A. Kumar', 'theory'],
        ['DL', 'Deep Learning', 'Dr. B. Sharma', 'theory'],
        ['CC', 'C Programming', 'Dr. C. Patel', 'theory'],
        ['SPM', 'Software Project Management', 'Dr. D. Singh', 'theory'],
        ['DLLAB', 'Deep Learning Lab', 'Dr. B. Sharma', 'lab'],
        ['DVLAB', 'Data Visualization Lab', 'Dr. C. Patel', 'lab'],
        ['COUN', 'Counseling', '-', 'special'],
        ['LIB', 'Library', '-', 'special'],
        ['TS', 'Telangana Studies', '-', 'special'],
        ['M/C', 'Moral & Cultural', '-', 'special'],
    ];

    const ws2 = XLSX.utils.aoa_to_sheet(mappingData);
    ws2['!cols'] = [{ wch: 15 }, { wch: 35 }, { wch: 25 }, { wch: 12 }];
    XLSX.utils.book_append_sheet(wb, ws2, 'Subject Mapping');

    // ---------- Sheet 3: Instructions (read‑only) ----------
    const instructions = [
        ['NRIIT Timetable Upload – Instructions'],
        [''],
        ['1. Edit the metadata row (Row 4) if you need a different branch/section/room.’],
        ['2. Change any subject codes in the grid (Rows 7‑12) to match your real subjects.’],
            ['3. In the "Subject Mapping" sheet, make sure every code you used appears with the correct faculty name and type.’],
            ['4. Save the file and upload it via the Dean → Timetable → Upload page.’],
            [''],
            ['You can keep this file as a template for future semesters – just change the metadata and subject codes.’],
            ];
    const ws3 = XLSX.utils.aoa_to_sheet(instructions);
    ws3['!cols'] = [{ wch: 80 }];
    XLSX.utils.book_append_sheet(wb, ws3, 'Instructions');

    // Write the file
    const filename = `NRIIT_Timetable_Sample_${new Date().toISOString().split('T')[0]}.xlsx`;
    XLSX.writeFile(wb, filename);
    console.log(`✅ Sample template created: ${filename}`);
}

generateSampleTemplate();
