const XLSX = require('xlsx');
const fs = require('fs');

// Files with their academic years
const files = [
    { path: './public/LATEST  PLACAMNETS YEAR WISE/ALL_BRANCHES_PLACED_DATA_2022-2023(19kp) (1).xlsx', year: '2022-23' },
    { path: './public/LATEST  PLACAMNETS YEAR WISE/ALL_BRANCHES_PLACED_DATA_2023-2024(20KP) (2).xlsx', year: '2023-24' },
    { path: './public/LATEST  PLACAMNETS YEAR WISE/ALL_BRANCHES_PLACED_DATA_2024-2025(21KP) (1).xlsx', year: '2024-25' }
];

// Map department codes from roll numbers
function getDepartmentFromRoll(rollNumber) {
    if (!rollNumber) return 'UNKNOWN';
    const roll = rollNumber.toString().toUpperCase();
    const deptCode = roll.substring(6, 8);
    const deptMap = {
        '01': 'CIVIL',
        '02': 'MECH',
        '03': 'EEE',
        '04': 'ECE',
        '05': 'CSE',
        '12': 'IT',
        '44': 'CSE-DS',  // Data Science
        '54': 'CSE-DS',
        '55': 'CSE-AI',
        '61': 'CSE-AI'   // AI & ML
    };
    return deptMap[deptCode] || 'UNKNOWN';
}

// Get value from row with multiple possible column names
function getValue(row, ...keys) {
    for (const key of keys) {
        if (row[key] && row[key].toString().trim()) {
            return row[key].toString().trim();
        }
    }
    return '';
}

// Clean package string
function cleanPackage(pkg) {
    if (!pkg) return '';
    return pkg.toString().toUpperCase().replace(/\s+/g, ' ').trim();
}

const allPlacements = {};

files.forEach(({ path: filePath, year }) => {
    console.log(`\n📄 Processing: ${filePath}`);
    console.log(`   Academic Year: ${year}`);

    try {
        const workbook = XLSX.readFile(filePath);

        workbook.SheetNames.forEach(sheetName => {
            console.log(`  📊 Reading sheet: ${sheetName}`);
            const worksheet = workbook.Sheets[sheetName];
            const data = XLSX.utils.sheet_to_json(worksheet, { defval: '' });

            let count = 0;
            data.forEach(row => {
                // Handle all possible column name variations
                const rollNo = getValue(row, 'ROLL NUMBER', 'HALL TICKET', 'Roll Number', 'REG NO', 'Reg No').toUpperCase();
                const name = getValue(row, 'NAME', 'FULL NAME', 'STUDENT NAME', 'Student Name', 'Name').toUpperCase();
                const company = getValue(row, 'COMPANY  NAME', 'COMPANY NAME', 'Company Name', 'Company');
                const packageVal = cleanPackage(getValue(row, 'PACKAGE', 'Package', 'CTC'));

                // Skip invalid/header rows
                if (!rollNo || !name) return;
                if (rollNo === 'ROLL NUMBER' || rollNo === 'HALL TICKET') return;
                if (!rollNo.match(/^\d{2}KP/i)) return;

                const dept = getDepartmentFromRoll(rollNo);
                if (dept === 'UNKNOWN') {
                    console.log(`    ⚠️  Unknown dept for: ${rollNo}`);
                    return;
                }

                // Initialize structure
                if (!allPlacements[dept]) allPlacements[dept] = {};
                if (!allPlacements[dept][year]) allPlacements[dept][year] = [];

                // Check for duplicates
                const exists = allPlacements[dept][year].some(p => p.regNo === rollNo);
                if (!exists) {
                    allPlacements[dept][year].push({
                        regNo: rollNo,
                        name: name,
                        company: company,
                        package: packageVal
                    });
                    count++;
                }
            });
            console.log(`    ✅ Added ${count} records`);
        });

    } catch (error) {
        console.error(`  ❌ Error:`, error.message);
    }
});

// Write output
const outputPath = './src/data/placements_yearwise.json';
fs.writeFileSync(outputPath, JSON.stringify(allPlacements, null, 2));

console.log(`\n${'='.repeat(50)}`);
console.log(`✅ SUCCESS! Generated: ${outputPath}`);
console.log(`${'='.repeat(50)}`);
console.log('\n📊 FINAL SUMMARY BY DEPARTMENT:');
Object.keys(allPlacements).sort().forEach(dept => {
    console.log(`\n  ${dept}:`);
    Object.keys(allPlacements[dept]).sort().forEach(year => {
        console.log(`    ${year}: ${allPlacements[dept][year].length} students`);
    });
});

// Calculate totals
let grandTotal = 0;
const yearTotals = {};
Object.values(allPlacements).forEach(years => {
    Object.entries(years).forEach(([year, students]) => {
        grandTotal += students.length;
        yearTotals[year] = (yearTotals[year] || 0) + students.length;
    });
});

console.log('\n📈 TOTALS BY YEAR:');
Object.keys(yearTotals).sort().forEach(year => {
    console.log(`   ${year}: ${yearTotals[year]} students`);
});
console.log(`\n🎯 GRAND TOTAL: ${grandTotal} placement records`);
