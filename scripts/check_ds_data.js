
const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../src/data/placements_yearwise.json');
try {
    const raw = fs.readFileSync(filePath, 'utf-8');
    const data = JSON.parse(raw);
    console.log('DS Data Sample:', JSON.stringify(data['DS']?.['2024-25']?.slice(0, 3), null, 2));
    console.log('DS Years:', Object.keys(data['DS'] || {}));
} catch (e) {
    console.error('Error:', e);
}
