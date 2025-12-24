const https = require('https');

const url = 'https://docs.google.com/spreadsheets/d/1oNalDameuL9dwLfdrUqNGc9gFjefQZgYWI912xic0yw/export?format=csv';

https.get(url, (res) => {
    let data = '';
    res.on('data', (chunk) => { data += chunk; });
    res.on('end', () => {
        const lines = data.split('\n');
        console.log(`Fetched ${lines.length} rows.`);

        // Find row with PAN ACDPY4427C or name "Raghava Rao"
        const deanRow = lines.find(line =>
            line.includes('ACDPY4427C') ||
            (line.toLowerCase().includes('raghava') && line.toLowerCase().includes('rao'))
        );

        if (deanRow) {
            console.log('✅ FOUND DEAN ROW:');
            console.log(deanRow);

            // Extract Google Drive links
            const matches = deanRow.match(/https:\/\/drive\.google\.com\/[^\s,"]+/g);
            if (matches) {
                console.log('\n📸 POTENTIAL PHOTO LINKS:');
                matches.forEach((link, i) => console.log(`${i + 1}: ${link}`));
            } else {
                console.log('❌ No Drive links found in row.');
            }
        } else {
            console.log('❌ Dean not found in CSV.');
        }
    });
}).on('error', (e) => {
    console.error(e);
});
