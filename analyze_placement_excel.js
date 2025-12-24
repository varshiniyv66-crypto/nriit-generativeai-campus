const XLSX = require('xlsx');
const fs = require('fs');

// Read the Excel file
const filePath = './public/LATEST  PLACAMNETS YEAR WISE/ALL_BRANCHES_PLACED_DATA BY dr yvrr (1).xlsx';
console.log('Reading file:', filePath);

try {
    const workbook = XLSX.readFile(filePath);

    console.log('\n=== SHEET NAMES ===');
    console.log(workbook.SheetNames);

    // Check first sheet
    const firstSheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[firstSheetName];
    const data = XLSX.utils.sheet_to_json(worksheet, { defval: '' });

    console.log('\n=== FIRST SHEET:', firstSheetName, '===');
    console.log('Total Rows:', data.length);

    if (data.length > 0) {
        console.log('\n=== COLUMN HEADERS ===');
        console.log(Object.keys(data[0]));

        console.log('\n=== SAMPLE ROW 1 ===');
        console.log(JSON.stringify(data[0], null, 2));

        if (data.length > 1) {
            console.log('\n=== SAMPLE ROW 2 ===');
            console.log(JSON.stringify(data[1], null, 2));
        }
    }
} catch (error) {
    console.error('Error:', error.message);
}
