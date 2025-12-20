// Standalone script to generate NRIIT timetable template
// Run with: node generate-template.js

const XLSX = require('xlsx');
const fs = require('fs');

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

function generateTemplate() {
    const wb = XLSX.utils.book_new();

    // Sheet 1: OFFICIAL NRIIT TIMETABLE FORMAT
    const gridData = [
        // Row 1: Title
        ['III B.Tech II-Sem Time Table (2023-2027 Batch)'],
        // Row 2: Academic Year
        ['Academic Year: 2025-2026'],
        // Row 3: Empty
        [''],
        // Row 4: Metadata fields
        ['Branch:', '', 'Section:', '', 'Class Incharge:', '', 'Room No:', ''],
        // Row 5: Empty
        [''],
        // Row 6: Column headers
        ['Day/Timings', 'P1 (9:00-9:50)', 'P2 (9:50-10:40)', 'BREAK', 'P3 (10:50-11:40)', 'P4 (11:40-12:30)',
            'LUNCH BREAK', 'P5 (1:10-2:00)', 'P6 (2:00-2:50)', 'BREAK', 'P7 (3:00-3:40)', 'P8 (3:40-4:20)'],
        // Rows 7-12: Days
        ...DAYS.map(day => [day, '', '', '', '', '', '', '', '', '', '', '']),
        // Row 13: Empty
        [''],
        // Row 14-20: Legend
        ['Lab Name', 'Faculty Name'],
        ['Deep Learning Lab', ''],
        ['Data Visualization Lab', ''],
        ['COUN', ''],
        ['LIB', ''],
        ['TS', ''],
        ['M/C', ''],
    ];

    const ws1 = XLSX.utils.aoa_to_sheet(gridData);

    // Set column widths
    ws1['!cols'] = [
        { wch: 15 }, // Day
        { wch: 14 }, { wch: 14 }, { wch: 10 }, // P1, P2, BREAK
        { wch: 14 }, { wch: 14 }, { wch: 14 }, // P3, P4, LUNCH
        { wch: 14 }, { wch: 14 }, { wch: 10 }, // P5, P6, BREAK
        { wch: 14 }, { wch: 14 }                // P7, P8
    ];

    XLSX.utils.book_append_sheet(wb, ws1, 'Timetable');

    // Sheet 2: Subject Mapping
    const mappingData = [
        ['Subject Code', 'Subject Name', 'Faculty Name', 'Type'],
        ['Instructions:', 'Fill this sheet with all subjects used in the timetable'],
        ['Example: OS', 'Operating Systems', 'Dr. A. Kumar', 'theory'],
        ['Example: DL', 'Deep Learning', 'Dr. B. Sharma', 'theory'],
        ['Example: DLLAB', 'Deep Learning Lab', 'Dr. C. Patel', 'lab'],
        ['COUN', 'Counseling', '-', 'special'],
        ['LIB', 'Library', '-', 'special'],
        ['TS', 'Telangana Studies', '-', 'special'],
        ['M/C', 'Moral & Cultural', '-', 'special'],
    ];

    const ws2 = XLSX.utils.aoa_to_sheet(mappingData);
    ws2['!cols'] = [{ wch: 15 }, { wch: 35 }, { wch: 25 }, { wch: 12 }];
    XLSX.utils.book_append_sheet(wb, ws2, 'Subject Mapping');

    // Sheet 3: Instructions
    const instructions = [
        ['NRIIT Timetable Upload - Instructions'],
        [''],
        ['1. Fill Branch, Section, Class Incharge, Room No in Sheet 1, Row 4'],
        ['2. Fill timetable grid with subject codes (Sheet 1, Rows 7-12)'],
        ['3. Define all subjects in Sheet 2 with faculty names'],
        ['4. Upload this file in Dean Dashboard'],
    ];

    const ws3 = XLSX.utils.aoa_to_sheet(instructions);
    ws3['!cols'] = [{ wch: 70 }];
    XLSX.utils.book_append_sheet(wb, ws3, 'Instructions');

    // Write file
    const filename = `NRIIT_Timetable_Template_${new Date().toISOString().split('T')[0]}.xlsx`;
    XLSX.writeFile(wb, filename);
    console.log(`✅ Template created: ${filename}`);
}

generateTemplate();
