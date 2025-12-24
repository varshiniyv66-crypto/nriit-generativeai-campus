const XLSX = require('xlsx');
const fs = require('fs');

// Read the Excel file
const filePath = './public/2025-26 Faculty Directory/B S & H25-26 FACULTY LIST  DINAL FROM dr yvrr.xlsx';
const workbook = XLSX.readFile(filePath);

console.log('Sheet names:', workbook.SheetNames);

// Get the first sheet
const sheetName = workbook.SheetNames[0];
const worksheet = workbook.Sheets[sheetName];

// Convert to JSON
const jsonData = XLSX.utils.sheet_to_json(worksheet);

console.log(`Total faculty count: ${jsonData.length}`);
console.log('\nFirst 3 entries:');
console.log(JSON.stringify(jsonData.slice(0, 3), null, 2));

// Save to file for inspection
fs.writeFileSync('./bsh_extracted.json', JSON.stringify(jsonData, null, 2));
console.log('\nFull data saved to bsh_extracted.json');
