const XLSX = require('xlsx');
const fs = require('fs');

// Read the Excel file
const filePath = './public/2025-26 Faculty Directory/B S & H25-26 FACULTY LIST  DINAL FROM dr yvrr.xlsx';
const workbook = XLSX.readFile(filePath);

// Get the correct sheet
const sheetName = 'S&H 25-26 DR YVRR';
const worksheet = workbook.Sheets[sheetName];

// Convert to JSON
const rawData = XLSX.utils.sheet_to_json(worksheet);

// Process and clean the data
const facultyData = rawData.slice(1).filter((row, index) => {
    const sno = row['S&H FACULTY LIST'];
    return typeof sno === 'number' && sno >= 1 && sno <= 67;
}).map(row => {
    // Convert Excel date numbers to readable dates
    const convertExcelDate = (excelDate) => {
        if (!excelDate || typeof excelDate !== 'number') return '';
        const date = new Date((excelDate - 25569) * 86400 * 1000);
        const day = String(date.getUTCDate()).padStart(2, '0');
        const month = String(date.getUTCMonth() + 1).padStart(2, '0');
        const year = date.getUTCFullYear();
        return `${day}-${month}-${year}`;
    };

    return {
        sno: String(row['S&H FACULTY LIST']) + '.0',
        name: (row['__EMPTY'] || '').toUpperCase(),
        qualification: row['__EMPTY_1'] || '',
        designation: row['__EMPTY_2'] || '',
        doj: convertExcelDate(row['__EMPTY_3']),
        nature: row['__EMPTY_9'] || 'Regular'
    };
});

console.log(`Processed ${facultyData.length} faculty members`);
console.log('First:', facultyData[0]);
console.log('Last:', facultyData[facultyData.length - 1]);

// Save to file
fs.writeFileSync('./bsh_2025_26_processed.json', JSON.stringify(facultyData, null, 2));
console.log('\nData saved to bsh_2025_26_processed.json');
