
const fs = require('fs');

async function debugSheet() {
    const sheetId = "1YPXxPc3Wo2gTQFPwDupMykfW701Mm505iJDR87FZ7SM"; // 4-2 CSE A
    const url = `https://docs.google.com/spreadsheets/d/${sheetId}/export?format=csv`;

    console.log(`Fetching 4-2 CSE A: ${url}`);

    try {
        const response = await fetch(url);
        if (!response.ok) {
            console.error("Failed to fetch.");
            return;
        }

        const text = await response.text();
        const rows = text.split('\n').map(r => r.split(',')); // Simple split for debugging

        console.log("--- Row 2 (Dates) ---");
        // Print first 20 columns of row 2 (Index 1)
        const dateRow = rows[1];
        if (dateRow) {
            dateRow.slice(0, 20).forEach((cell, i) => console.log(`Col ${i}: ${cell}`));
        }

        console.log("\n--- Row 3 (Periods) ---");
        const periodRow = rows[2];
        if (periodRow) {
            periodRow.slice(0, 20).forEach((cell, i) => console.log(`Col ${i}: ${cell}`));
        }

        console.log("\n--- Row 6 (Student Data Sample) ---");
        // Check a student row
        const studentRow = rows[5];
        if (studentRow) {
            studentRow.slice(0, 20).forEach((cell, i) => console.log(`Col ${i}: ${cell}`));
        }

    } catch (e) {
        console.error(e);
    }
}

debugSheet();
