// generate-cse-timetable.js
// Run with: node generate-cse-timetable.js
// This script creates a ready‑to‑upload Excel file for the CSE department
// with realistic subject codes and faculty names that already exist in the DB.

const XLSX = require('xlsx');
const fs = require('fs');

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

function generateCSETimetable() {
    const wb = XLSX.utils.book_new();

    // ---------- Sheet 1: Timetable (official NRIIT format) ----------
    const gridData = [
        // Row 1: Title
        ['III B.Tech II-Sem Time Table (2023-2027 Batch)'],
        // Row 2: Academic Year
        ['Academic Year: 2025-2026'],
        // Row 3: Empty
        [''],
        // Row 4: Metadata (edit if you need a different section)
        ['Branch:', 'CSE', 'Section:', 'A', 'Class Incharge:', 'Dr. A. Kumar', 'Room No:', '301'],
        // Row 5: Empty
        [''],
        // Row 6: Column headers with breaks
        ['Day/Timings', 'P1 (9:00-9:50)', 'P2 (9:50-10:40)', 'BREAK', 'P3 (10:50-11:40)', 'P4 (11:40-12:30)', 'LUNCH BREAK', 'P5 (1:10-2:00)', 'P6 (2:00-2:50)', 'BREAK', 'P7 (3:00-3:40)', 'P8 (3:40-4:20)'],
        // Rows 7‑12: Days – filled with realistic CSE subject codes
        // Monday
        ['Monday', 'OS', 'DBMS', '', 'CC', 'SPM', '', 'AI', 'ML', '', 'COUN', 'LIB'],
        // Tuesday
        ['Tuesday', 'DBMS', 'OS', '', 'SPM', 'CC', '', 'ML', 'AI', '', 'LIB', 'COUN'],
        // Wednesday
        ['Wednesday', 'CC', 'SPM', '', 'OS', 'DBMS', '', 'COUN', 'LIB', '', 'AI', 'ML'],
        // Thursday
        ['Thursday', 'SPM', 'CC', '', 'DBMS', 'OS', '', 'LIB', 'COUN', '', 'ML', 'AI'],
        // Friday
        ['Friday', 'OS', 'DBMS', '', 'CC', 'SPM', '', 'AI', 'ML', '', 'COUN', 'LIB'],
        // Saturday
        ['Saturday', 'DBMS', 'OS', '', 'SPM', 'CC', '', 'ML', 'AI', '', 'LIB', 'COUN'],
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
        ['DBMS', 'Database Management Systems', 'Dr. D. Singh', 'theory'],
        ['CC', 'C Programming', 'Dr. E. Rao', 'theory'],
        ['SPM', 'Software Project Management', 'Dr. F. Nair', 'theory'],
        ['AI', 'Artificial Intelligence', 'Dr. G. Verma', 'theory'],
        ['ML', 'Machine Learning', 'Dr. H. Patel', 'theory'],
        ['DLLAB', 'Deep Learning Lab', 'Dr. B. Sharma', 'lab'],
        ['DVL', 'Data Visualization Lab', 'Dr. C. Patel', 'lab'],
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
        ['1. Edit the metadata row (Row 4) if you need a different section.’],
        ['2. Change any subject codes in the grid (Rows 7‑12) to match your real subjects.’],
            ['3. In the "Subject Mapping" sheet, make sure every code you used appears with the correct faculty name and type.’],
            ['4. Save the file and upload it via the Dean → Timetable → Upload page.’],
            [''],
            ['You can keep this file as a template for future semesters – just change the metadata and subject codes.’],
            ];
    const ws3 = XLSX.utils.aoa_to_sheet(instructions);
    ws3['!cols'] = [{ wch: 80 }];
    XLSX.utils.book_append_sheet(wb, ws3, 'Instructions');

    const filename = `NRIIT_CSE_Timetable_${new Date().toISOString().split('T')[0]}.xlsx`;
    XLSX.writeFile(wb, filename);
    console.log(`✅ CSE timetable template created: ${filename}`);
}

generateCSETimetable();
