const fs = require('fs');

// Read the BSH faculty data
const facultyData = JSON.parse(fs.readFileSync('./bsh_67_faculty.json', 'utf8'));

// Generate SQL INSERT statements
const sqlStatements = facultyData.map((faculty, index) => {
    // Split name into first and last name
    const nameParts = faculty.name.trim().split(/\s+/);
    const firstName = nameParts[0];
    const lastName = nameParts.slice(1).join(' ') || firstName;

    // Parse date (format: M/D/YYYY or MM/DD/YYYY)
    const parseDate = (dateStr) => {
        if (!dateStr) return null;
        const parts = dateStr.split('/');
        if (parts.length === 3) {
            const month = parts[0].padStart(2, '0');
            const day = parts[1].padStart(2, '0');
            const year = parts[2];
            return `${year}-${month}-${day}`;
        }
        return null;
    };

    const doj = parseDate(faculty.doj);
    const employeeId = `BSH${String(index + 1).padStart(3, '0')}`;

    return `INSERT INTO faculty_profiles (
    employee_id,
    first_name,
    last_name,
    dept_code,
    designation,
    qualification,
    date_of_joining,
    nature_of_association,
    is_active,
    created_at,
    updated_at
  ) VALUES (
    '${employeeId}',
    '${firstName.replace(/'/g, "''")}',
    '${lastName.replace(/'/g, "''")}',
    'BSH',
    '${faculty.designation.replace(/'/g, "''")}',
    '${faculty.qualification.replace(/'/g, "''")}',
    ${doj ? `'${doj}'` : 'NULL'},
    '${faculty.nature}',
    true,
    NOW(),
    NOW()
  );`;
}).join('\n\n');

// Create complete SQL script
const sqlScript = `-- Insert BSH Faculty into Supabase
-- Total: ${facultyData.length} faculty members
-- Source: Dr. YVRR's Excel file (B S & H25-26 FACULTY LIST)

${sqlStatements}

-- Verify insertion
SELECT COUNT(*) as total_bsh_faculty FROM faculty_profiles WHERE dept_code = 'BSH';
`;

fs.writeFileSync('./insert_bsh_faculty.sql', sqlScript);
console.log(`✅ Generated SQL script with ${facultyData.length} INSERT statements`);
console.log('📄 File: insert_bsh_faculty.sql');
console.log('\nNext steps:');
console.log('1. Open Supabase SQL Editor');
console.log('2. Copy and paste the SQL from insert_bsh_faculty.sql');
console.log('3. Run the script');
