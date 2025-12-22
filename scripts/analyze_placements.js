const path = require('path');
const data = require(path.join(__dirname, '../src/data/placements_yearwise.json'));

console.log("=== PLACEMENT DATA SUMMARY ===\n");

const summary = [];

Object.keys(data).forEach(dept => {
    Object.keys(data[dept]).forEach(year => {
        const records = data[dept][year];
        const packages = records.map(r => {
            const pkg = parseFloat((r.package || '0').toString().replace(/[^0-9.]/g, ''));
            return isNaN(pkg) ? 0 : pkg;
        }).filter(p => p > 0);

        const maxPkg = packages.length > 0 ? Math.max(...packages) : 0;
        const avgPkg = packages.length > 0 ? (packages.reduce((a, b) => a + b, 0) / packages.length).toFixed(2) : 0;

        summary.push({
            dept,
            year,
            placed: records.length,
            maxPkg,
            avgPkg: parseFloat(avgPkg)
        });

        console.log(`${dept} | ${year} | Placed: ${records.length} | Max: ${maxPkg} LPA | Avg: ${avgPkg} LPA`);
    });
});

console.log("\n=== SQL UPDATE SCRIPT ===\n");
console.log("-- Run this in Supabase SQL Editor to sync nba_placements with Excel data\n");

summary.forEach(s => {
    console.log(`
-- ${s.dept} ${s.year}
INSERT INTO nba_placements (department_id, academic_year, students_placed, max_package, avg_package)
SELECT d.id, '${s.year}', ${s.placed}, ${s.maxPkg}, ${s.avgPkg}
FROM departments d WHERE d.code = '${s.dept}'
ON CONFLICT (department_id, academic_year) 
DO UPDATE SET students_placed = ${s.placed}, max_package = ${s.maxPkg}, avg_package = ${s.avgPkg};
`);
});
