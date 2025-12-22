const fs = require('fs');
const path = require('path');
const XLSX = require('xlsx');

const filePath = path.join(process.cwd(), 'public', '2025-26 Faculty Directory', 'faculty list DS  FINAL FROM DR YVRR.xlsx');
console.log("Reading:", filePath);

try {
    const workbook = XLSX.readFile(filePath);
    const sheetName = 'DS 25-26'; // Confirmed from debug
    const worksheet = workbook.Sheets[sheetName];

    // Headers are at Row 3 (index 2) in this file based on debug output
    const data = XLSX.utils.sheet_to_json(worksheet, { range: 2 });

    const facultyList = data.map((row, index) => {
        if (!row['NAME']) return null;

        let doj = row['DOJ'];

        // Excel date handling
        if (typeof doj === 'number') {
            const date = new Date(Math.round((doj - 25569) * 86400 * 1000));
            doj = `${date.getDate().toString().padStart(2, '0')}/${(date.getMonth() + 1).toString().padStart(2, '0')}/${date.getFullYear()}`;
        }

        const nameParts = (row['NAME'] || "Unknown").split('.');
        let title = "Mr.";
        let name = row['NAME'];

        if (nameParts.length > 1) {
            const potentialTitle = nameParts[0].trim();
            if (['Dr', 'Mr', 'Mrs', 'Ms', 'Miss'].includes(potentialTitle)) {
                title = potentialTitle + ".";
                name = nameParts.slice(1).join('.').trim();
            } else {
                title = "Mr.";
                if (row['NAME'].toLowerCase().includes('dr.')) title = "Dr.";
                else if (row['NAME'].toLowerCase().includes('mrs.')) title = "Mrs.";
                else if (row['NAME'].toLowerCase().includes('ms.')) title = "Ms.";
            }
        }

        return {
            id: `cse-${index + 1}`,
            title: title,
            name: name,
            designation: row['Designation'] || "Assistant Professor",
            department: "CSE",
            qualification: row['QUALAIFICATION '] || "M.Tech", // Note the space in key
            joiningDate: doj,
            panNumber: `CSE${(index + 1).toString().padStart(3, '0')}PAN`, // No PAN in this file
            nature: row['REGULAR/ADHOC']
        };
    }).filter(f => f !== null);

    console.log(JSON.stringify(facultyList, null, 2));

} catch (error) {
    console.error("Error reading file:", error.message);
}
