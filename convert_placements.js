const XLSX = require('xlsx');
const fs = require('fs');

// Map registration numbers to academic years
function getAcademicYear(rollNumber) {
    if (!rollNumber) return 'Unknown';
    const yearPrefix = rollNumber.substring(0, 2);
    const yearMap = {
        '19': '2022-23',  // 2019 batch graduated in 2023
        '20': '2023-24',  // 2020 batch graduated in 2024
        '21': '2024-25',  // 2021 batch graduated in 2025
        '22': '2025-26'   // 2022 batch will graduate in 2026
    };
    return yearMap[yearPrefix] || 'Unknown';
}

// Map department codes from roll numbers
function getDepartmentFromRoll(rollNumber) {
    if (!rollNumber) return 'UNKNOWN';
    const deptCode = rollNumber.substring(6, 8);
    const deptMap = {
        '01': 'CIVIL',
        '02': 'MECH',
        '03': 'EEE',
        '04': 'ECE',
        '05': 'CSE',
        '12': 'IT',
        '54': 'CSE-DS',
        '55': 'CSE-AI'
    };
    return deptMap[deptCode] || 'UNKNOWN';
}

// Clean package string
function cleanPackage(pkg) {
    if (!pkg) return '';
    return pkg.toString().toUpperCase().replace(/\s+/g, ' ').trim();
}

// Process all Excel files
const files = [
    './public/LATEST  PLACAMNETS YEAR WISE/ALL_BRANCHES_PLACED_DATA BY dr yvrr (1).xlsx',
    './public/LATEST  PLACAMNETS YEAR WISE/ALL_BRANCHES_PLACED_DATA BY dr yvrr (2).xlsx',
    './public/LATEST  PLACAMNETS YEAR WISE/ALL_BRANCHES_PLACED_DATA BY dr yvrr (3).xlsx'
];

const allPlacements = {};

files.forEach((filePath, fileIndex) => {
    console.log(`\n📄 Processing file ${fileIndex + 1}: ${filePath}`);

    try {
        const workbook = XLSX.readFile(filePath);

        workbook.SheetNames.forEach(sheetName => {
            console.log(`  📊 Reading sheet: ${sheetName}`);
            const worksheet = workbook.Sheets[sheetName];
            const data = XLSX.utils.sheet_to_json(worksheet, { defval: '' });

            data.forEach(row => {
                const rollNo = row['ROLL NUMBER']?.toString().trim();
                const name = row['NAME']?.toString().trim().toUpperCase();
                const company = row['COMPANY  NAME']?.toString().trim();
                const packageVal = cleanPackage(row['PACKAGE']);

                if (!rollNo || !name) return; // Skip invalid rows

                const year = getAcademicYear(rollNo);
                const dept = getDepartmentFromRoll(rollNo);

                // Initialize structure
                if (!allPlacements[dept]) allPlacements[dept] = {};
                if (!allPlacements[dept][year]) allPlacements[dept][year] = [];

                // Add placement record
                allPlacements[dept][year].push({
                    regNo: rollNo,
                    name: name,
                    company: company,
                    package: packageVal
                });
            });
        });

        console.log(`  ✅ Completed file ${fileIndex + 1}`);
    } catch (error) {
        console.error(`  ❌ Error processing file ${fileIndex + 1}:`, error.message);
    }
});

// Write output
const outputPath = './src/data/placements_yearwise.json';
fs.writeFileSync(outputPath, JSON.stringify(allPlacements, null, 2));

console.log(`\n✅ SUCCESS! Generated: ${outputPath}`);
console.log('\n📊 Summary:');
Object.keys(allPlacements).forEach(dept => {
    console.log(`\n  ${dept}:`);
    Object.keys(allPlacements[dept]).forEach(year => {
        console.log(`    ${year}: ${allPlacements[dept][year].length} students`);
    });
});
