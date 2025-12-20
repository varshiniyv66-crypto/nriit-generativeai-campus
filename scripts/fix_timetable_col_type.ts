
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const seedFile = path.resolve(__dirname, '../seed_full_timetables.sql');

if (fs.existsSync(seedFile)) {
    let content = fs.readFileSync(seedFile, 'utf8');

    // The error "invalid input syntax for type integer: 'Monday'" implies
    // that the insert is trying to put 'Monday' into an Integer column.

    // Previous error: column "start_time" does not exist.
    // So the previous repair added columns.

    // Check column order in INSERT statement:
    // INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    // VALUES (..., 'Monday', 1, ...)

    // If the table was defined differently before, maybe 'day_of_week' is INTEGER (1-6)?
    // Or maybe the columns in the DB are in a different order and the implicit logic is failing?
    // No, we are using named columns.

    // Let's check if 'day_of_week' is actually an INTEGER in the DB?
    // "invalid input syntax for type integer: 'Monday'"

    // If 'day_of_week' is defined as INTEGER, then 'Monday' fails.
    // The original schema might have had it as integer (1=Mon, 2=Tue).

    // SOLUTION:
    // We will alter the table to ensuring 'day_of_week' is TEXT.
    // If it is INTEGER, we change it to TEXT.

    // But I can't run ALTER blindly here.
    // I will generate a fix script to Alter the column type.

    const fixSql = `
    -- FORCE day_of_week to be TEXT
    ALTER TABLE timetable ALTER COLUMN day_of_week TYPE TEXT USING day_of_week::text;
    `;

    const fixFile = path.resolve(__dirname, '../fix_timetable_type.sql');
    fs.writeFileSync(fixFile, fixSql);
    console.log("Created 'fix_timetable_type.sql' to fix column type.");

    // Also, check if the Seed File is actually correct.
    // INSERT INTO timetable (..., day_of_week, ...)
    // v/s
    // SELECT ..., 'Monday', ...

    // If the DB column is indeed Integer, we should probably respect that?
    // But standard practice and my generated code expect Text.
    // So fixing the DB schema to Text is the right move.

} else {
    console.error("Seed file not found.");
}
