const XLSX = require('xlsx');

const files = [
    './public/LATEST  PLACAMNETS YEAR WISE/ALL_BRANCHES_PLACED_DATA_2023-2024(20KP) (2).xlsx',
    './public/LATEST  PLACAMNETS YEAR WISE/ALL_BRANCHES_PLACED_DATA_2024-2025(21KP) (1).xlsx'
];

files.forEach(filePath => {
    console.log(`\n📄 File: ${filePath}`);
    try {
        const workbook = XLSX.readFile(filePath);
        console.log('Sheet Names:', workbook.SheetNames);

        workbook.SheetNames.forEach(sheetName => {
            console.log(`\n  📊 Sheet: ${sheetName}`);
            const worksheet = workbook.Sheets[sheetName];
            const data = XLSX.utils.sheet_to_json(worksheet, { defval: '' });
            console.log('    Total Rows:', data.length);
            if (data.length > 0) {
                console.log('    Columns:', Object.keys(data[0]));
                console.log('    Sample Row 1:', JSON.stringify(data[0], null, 2));
                if (data.length > 1) {
                    console.log('    Sample Row 2:', JSON.stringify(data[1], null, 2));
                }
            }
        });
    } catch (error) {
        console.error('Error:', error.message);
    }
});
