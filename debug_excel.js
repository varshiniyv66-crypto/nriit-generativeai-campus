const fs = require('fs');
const path = require('path');
const XLSX = require('xlsx');

const filePath = path.join(process.cwd(), 'public', '2025-26 Faculty Directory', 'CSE-Faculty-PAN-website-final  BY dr yvrr.xlsx');

try {
    const workbook = XLSX.readFile(filePath);
    // List all sheet names
    console.log("Sheets found:", workbook.SheetNames);

    workbook.SheetNames.forEach(name => {
        const ws = workbook.Sheets[name];
        const d = XLSX.utils.sheet_to_json(ws, { header: 1 }); // Use array of arrays
        console.log(`\n--- Sheet: ${name} (First 3 rows) ---`);
        console.log(JSON.stringify(d.slice(0, 3), null, 2));
    });

} catch (error) {
    console.error("Error reading file:", error.message);
}
