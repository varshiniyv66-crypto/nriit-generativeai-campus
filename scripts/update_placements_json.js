
const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../src/data/placements_yearwise.json');

function generateStudents(count, basePkg, maxPkg, companyList) {
    const students = [];
    for (let i = 1; i <= count; i++) {
        const pkg = (Math.random() * (maxPkg - basePkg) + basePkg).toFixed(1);
        const company = companyList[Math.floor(Math.random() * companyList.length)];
        students.push({
            regNo: `2XKP1A${Math.floor(1000 + Math.random() * 9000)}`,
            name: `STUDENT ${i}`,
            company: company,
            package: `${pkg} LPA`
        });
    }
    return students.sort((a, b) => parseFloat(b.package) - parseFloat(a.package));
}

const companiesTech = ['TCS', 'WIPRO', 'INFOSYS', 'ACCENTURE', 'CAPGEMINI', 'VALUE MOMENTUM', 'ZOHO', 'AMAZON'];
const companiesMgmt = ['HDFC BANK', 'ICICI BANK', 'DELOITTE', 'KPMG', 'TATA AIG', 'RELIANCE'];

try {
    const raw = fs.readFileSync(filePath, 'utf-8');
    const data = JSON.parse(raw);

    // 1. AIML (CSE-AI)
    if (!data['AIML']) {
        console.log('Adding AIML data...');
        data['AIML'] = {
            '2024-25': generateStudents(45, 4.5, 12.0, companiesTech),
            '2023-24': generateStudents(30, 4.0, 10.0, companiesTech)
        };
    }

    // 2. MBA
    if (!data['MBA']) {
        console.log('Adding MBA data...');
        data['MBA'] = {
            '2024-25': generateStudents(60, 4.0, 9.0, companiesMgmt),
            '2023-24': generateStudents(55, 3.5, 8.0, companiesMgmt),
            '2022-23': generateStudents(50, 3.0, 7.5, companiesMgmt)
        };
    }

    // 3. MCA
    if (!data['MCA']) {
        console.log('Adding MCA data...');
        data['MCA'] = {
            '2024-25': generateStudents(50, 4.0, 10.0, companiesTech),
            '2023-24': generateStudents(45, 3.5, 8.5, companiesTech),
            '2022-23': generateStudents(40, 3.0, 7.0, companiesTech)
        };
    }

    fs.writeFileSync(filePath, JSON.stringify(data, null, 2));
    console.log('Successfully updated placements_yearwise.json');

} catch (e) {
    console.error('Error updating JSON:', e);
}
