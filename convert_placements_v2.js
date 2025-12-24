const XLSX = require('xlsx');
const fs = require('fs');

// Files with their academic years based on file names
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

const allPlacements = {};

files.forEach(({ path: filePath, year }) => {
    console.log(`\n📄 Processing: ${filePath}`);
    console.log(`   Academic Year: ${year}`);

    try {
        const workbook = XLSX.readFile(filePath);

        workbook.SheetNames.forEach(sheetName => {
            if (sheetName === 'ALL_BRANCHES' || sheetName === 'ALL' || sheetName === 'Sheet1') {
                console.log(`  ⏭️  Skipping sheet: ${sheetName} (combined sheet)`);
                return;
            }

            console.log(`  📊 Reading sheet: ${sheetName}`);
            const worksheet = workbook.Sheets[sheetName];
            const data = XLSX.utils.sheet_to_json(worksheet, { defval: '' });

            let count = 0;
            data.forEach(row => {
                const rollNo = (row['ROLL NUMBER'] || row['Roll Number'] || row['REG NO'] || row['regNo'] || '').toString().trim().toUpperCase();
                const name = (row['NAME'] || row['Name'] || row['STUDENT NAME'] || '').toString().trim().toUpperCase();
                const company = (row['COMPANY  NAME'] || row['COMPANY NAME'] || row['Company'] || '').toString().trim();
                const packageVal = cleanPackage(row['PACKAGE'] || row['Package'] || row['CTC']);

                if (!rollNo || !name || rollNo === 'ROLL NUMBER') return; // Skip invalid/header rows

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

console.log(`\n✅ SUCCESS! Generated: ${outputPath}`);
console.log('\n📊 FINAL SUMMARY:');
Object.keys(allPlacements).sort().forEach(dept => {
    console.log(`\n  ${dept}:`);
    Object.keys(allPlacements[dept]).sort().forEach(year => {
        console.log(`    ${year}: ${allPlacements[dept][year].length} students`);
    });
});

// Calculate totals
let total = 0;
Object.values(allPlacements).forEach(years => {
    Object.values(years).forEach(students => {
        total += students.length;
    });
});
console.log(`\n📈 TOTAL PLACEMENT RECORDS: ${total}`);
