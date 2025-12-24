const https = require('https');
const fs = require('fs');

const url = 'https://docs.google.com/spreadsheets/d/1oNalDameuL9dwLfdrUqNGc9gFjefQZgYWI912xic0yw/export?format=csv';

const file = fs.createWriteStream("debug_faculty_sheet.csv");
https.get(url, function (response) {
    response.pipe(file);
    file.on('finish', function () {
        file.close();  // close() is async, call cb after close completes.
        console.log("Download completed.");
    });
});
