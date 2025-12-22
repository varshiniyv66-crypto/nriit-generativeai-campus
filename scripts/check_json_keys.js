
const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../src/data/placements_yearwise.json');
try {
    const raw = fs.readFileSync(filePath, 'utf-8');
    const data = JSON.parse(raw);
    console.log('Keys in placements_yearwise.json:', Object.keys(data));

    // Check coverage for newer depts
    console.log('Has AIML?', !!data['AIML']);
    console.log('Has DS?', !!data['DS']);
} catch (e) {
    console.error('Error reading JSON:', e);
}
