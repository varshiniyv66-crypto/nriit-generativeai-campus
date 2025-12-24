const https = require('https');
const fs = require('fs');

function download(url, dest, cb) {
    const file = fs.createWriteStream(dest);

    const request = https.get(url, function (response) {
        // Handle redirect
        if (response.statusCode === 301 || response.statusCode === 302 || response.statusCode === 307) {
            console.log('Redirecting to:', response.headers.location);
            file.close();
            return download(response.headers.location, dest, cb);
        }

        response.pipe(file);
        file.on('finish', function () {
            file.close(cb);
        });
    }).on('error', function (err) {
        fs.unlink(dest);
        if (cb) cb(err.message);
    });
}

download('https://docs.google.com/spreadsheets/d/1oNalDameuL9dwLfdrUqNGc9gFjefQZgYWI912xic0yw/export?format=csv', 'debug_faculty_sheet.csv', () => {
    console.log('Download complete!');

    // Read and find Dean
    const content = fs.readFileSync('debug_faculty_sheet.csv', 'utf8');
    const lines = content.split('\n');
    console.log(`Total lines: ${lines.length}`);

    const deanRow = lines.find(line => line.includes('ACDPY4427C'));
    if (deanRow) {
        console.log('FOUND DEAN ROW:', deanRow);
    } else {
        console.log('Dean not found by PAN. searching by name...');
        const nameRow = lines.find(line => line.toLowerCase().includes('raghava'));
        if (nameRow) console.log('FOUND BY NAME:', nameRow);
    }
});
