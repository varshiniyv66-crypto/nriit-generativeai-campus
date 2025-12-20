
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const seedFile = path.resolve(__dirname, '../seed_full_timetables.sql');

if (fs.existsSync(seedFile)) {
    let content = fs.readFileSync(seedFile, 'utf8');

    // Explicitly add 'academic_year' string value to inserts.
    // Replace: VALUES (..., v_ay_id, ...)
    // With: VALUES (..., v_ay_id, '2025-2026', ...)

    // The insert pattern looks like:
    // INSERT INTO class_sections (name, dept_code, academic_year_id, year, semester, section)
    // VALUES ('CSE-2-A', v_dept::department_code, v_ay_id, 2, 4, 'A')

    const insertRegex = /INSERT INTO class_sections \(name, dept_code, academic_year_id, year, semester, section\)/g;
    const valuesRegex = /VALUES \('([^']+)', v_dept::department_code, v_ay_id, (\d+), (\d+), '([^']+)'\)/g;

    // We change the INSERT columns list first
    content = content.replace(insertRegex, "INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)");

    // We change the VALUES list
    content = content.replace(valuesRegex, "VALUES ('$1', v_dept::department_code, v_ay_id, '2025-2026', $2, $3, '$4')");

    fs.writeFileSync(seedFile, content);
    console.log("Updated Seeder to include legacy 'academic_year' column.");
} else {
    console.error("Seed file not found.");
}
