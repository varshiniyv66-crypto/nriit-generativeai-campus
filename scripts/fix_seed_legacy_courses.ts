
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const seedFile = path.resolve(__dirname, '../seed_full_timetables.sql');

if (fs.existsSync(seedFile)) {
    let content = fs.readFileSync(seedFile, 'utf8');

    // Explicitly add 'course_code' and 'course_name' to inserts.
    // The table has legacy columns (course_code, course_name) enforcing NOT NULL.
    // Our insert uses (code, name).

    // Pattern: INSERT INTO courses (code, name, ...) VALUES ('CODE', 'NAME', ...)
    // Fix: INSERT INTO courses (code, name, course_code, course_name, ...) VALUES ('CODE', 'NAME', 'CODE', 'NAME', ...)

    const insertRegex = /INSERT INTO courses \(code, name, dept_code, credits, semester, type\)/g;
    // We need to capture the VALUES content safely.
    // Regex replace is tricky with multiple groups.

    // Let's replace the INSERT part
    content = content.replace(insertRegex, "INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)");

    // Now replace the VALUES part
    // VALUES ('CSE-2-CLO', 'Cloud Computing',
    // We want: VALUES ('CSE-2-CLO', 'Cloud Computing', 'CSE-2-CLO', 'Cloud Computing',

    // Regex for VALUES: VALUES \('([^']+)', '([^']+)',
    content = content.replace(/VALUES \('([^']+)', '([^']+)',/g, "VALUES ('$1', '$2', '$1', '$2',");

    fs.writeFileSync(seedFile, content);
    console.log("Updated Seeder to include legacy 'course_code' and 'course_name' columns.");
} else {
    console.error("Seed file not found.");
}
