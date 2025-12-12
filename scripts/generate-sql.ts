
import { v4 as uuidv4 } from 'uuid';
import fs from 'fs';
import path from 'path';

const DEPARTMENTS = ['CSE', 'CSE-DS', 'CSE-AI', 'IT', 'ECE', 'CIVIL', 'MBA', 'MCA', 'BSH'];

function generateSQL() {
    let sql = `-- Seed Data for Students (Robust Version)
-- Run this in your Supabase SQL Editor

DO $$
DECLARE
    new_user_id UUID;
BEGIN
    RAISE NOTICE 'Seeding Students...';

`;

    for (const deptCode of DEPARTMENTS) {
        for (let i = 1; i <= 2; i++) {
            const rollNumber = `24${deptCode.replace('-', '')}00${i}`;
            const email = `${rollNumber.toLowerCase()}@nriit.edu.in`;
            const firstName = `Student${i}`;
            const lastName = `${deptCode}`;
            const phone = `9900${deptCode.length}${i}00`;

            // Logic: Insert User if not exists, or get ID if exists.
            sql += `
    -- Student: ${rollNumber} (${deptCode})
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('${email}', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '${rollNumber}', '${rollNumber}', '${firstName}', '${lastName}', 
        '${deptCode}', 1, 'A', '${email}', '${phone}', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;
`;
        }
    }

    sql += `
    RAISE NOTICE 'Seeding Complete.';
END $$;
`;

    const outputPath = path.resolve(__dirname, '../seed_students.sql');
    fs.writeFileSync(outputPath, sql);
    console.log(`SQL file generated at: ${outputPath}`);
}

generateSQL();
