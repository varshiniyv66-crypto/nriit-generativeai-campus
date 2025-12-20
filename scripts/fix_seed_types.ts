
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const seedFile = path.resolve(__dirname, '../seed_full_timetables.sql');

if (fs.existsSync(seedFile)) {
    let content = fs.readFileSync(seedFile, 'utf8');

    // Replace variable declarations to cast to department_code type
    // We look for patterns like: v_dept text := 'CSE';
    // And replace usages: v_dept
    // Actually, simply casting the usage is safer.
    // Error is in: INSERT INTO class_sections (... dept_code ...) VALUES (... v_dept ...)

    // Pattern to fix: v_dept,
    // Replace with: v_dept::department_code,

    // But we need to be careful not to break other things.
    // The error says: column "dept_code" is of type department_code but expression is of type text

    // We will globally replace `v_dept` with `v_dept::department_code` in the INSERT VALUES clauses.
    // The Generator script wrote: VALUES ('${sectionName}', v_dept, v_ay_id, ...)

    content = content.replace(/VALUES \(([^)]*?), v_dept, ([^)]*?)\)/g, "VALUES ($1, v_dept::department_code, $2)");

    // Also for courses table inserts?
    // INSERT INTO courses (..., dept_code, ...) VALUES (..., v_dept, ...)
    // Same fix applies.

    fs.writeFileSync(seedFile, content);
    console.log("Applied Type Casting Fix to seed_full_timetables.sql");
} else {
    console.error("Seed file not found.");
}
