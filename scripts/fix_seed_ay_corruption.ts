
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const seedFile = path.resolve(__dirname, '../seed_full_timetables.sql');

if (fs.existsSync(seedFile)) {
    let content = fs.readFileSync(seedFile, 'utf8');

    // The previous regex replacement for VALUES was too broad.
    // It matched the Academic Year insert which looks like:
    // VALUES ('UUID', '2025-2026', '2025-06-01', '2026-05-30', true)

    // My previous script for legacy courses blindly replaced:
    // VALUES ('A', 'B', with VALUES ('A', 'B', 'A', 'B',

    // This accidentally corrupted the Academic Year insert.
    // Failing line: VALUES ('UUID', '2025-2026', 'UUID', '2025-2026', '2025-06-01', ...)
    // It duplicated the first two strings.

    // We must revert/fix the Academic Year Insert specifically.
    // The Academic Year Insert is:
    // INSERT INTO academic_years (id, name, start_date, end_date, is_active)
    // VALUES ('...', '...', '...', '...', true)

    // We can find the corrupted academic year values block.
    // It likely looks like: VALUES ('UUID', '2025-2026', 'UUID', '2025-2026', '2025-06-01', '2026-05-30', true)
    // We want: VALUES ('UUID', '2025-2026', '2025-06-01', '2026-05-30', true)

    const badAyValuesRegex = /VALUES \('([a-f0-9\-]+)', '2025-2026', '[^']+', '2025-2026',/g;
    content = content.replace(badAyValuesRegex, "VALUES ('$1', '2025-2026',");

    fs.writeFileSync(seedFile, content);
    console.log("Fixed corrupted Academic Year INSERT statement.");
} else {
    console.error("Seed file not found.");
}
