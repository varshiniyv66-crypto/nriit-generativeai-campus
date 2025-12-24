const XLSX = require('xlsx');

// Read the Excel file
const filePath = './public/2025-26 Faculty Directory/B S & H25-26 FACULTY LIST  DINAL FROM dr yvrr.xlsx';
const workbook = XLSX.readFile(filePath);

console.log('Available sheets:', workbook.SheetNames);

// Find the correct sheet
const sheetName = workbook.SheetNames.find(s => s.includes('S&H 25-26 DR YVRR'));
console.log('\nUsing sheet:', sheetName);

const worksheet = workbook.Sheets[sheetName];
const jsonData = XLSX.utils.sheet_to_json(worksheet);

// Filter out header rows and empty rows
const facultyData = jsonData.filter((row, index) => {
    // Skip first row (header)
    if (index === 0) return false;

    // Check if row has actual faculty data (has a serial number)
    const sno = row['S&H FACULTY LIST'];
    return typeof sno === 'number' && sno > 0;
});

console.log('\nTotal faculty members (excluding headers):', facultyData.length);
console.log('\nFirst faculty:', facultyData[0]['__EMPTY']);
console.log('Last faculty:', facultyData[facultyData.length - 1]['__EMPTY']);
console.log('Last S.NO:', facultyData[facultyData.length - 1]['S&H FACULTY LIST']);
