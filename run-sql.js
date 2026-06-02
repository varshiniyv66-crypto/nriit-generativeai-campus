const fs = require('fs');
const path = require('path');
const { Client } = require('pg');

const connectionString = 'postgresql://postgres.bzjoestbxmitarmatbgr:Klu%40jntu123@aws-1-ap-northeast-2.pooler.supabase.com:5432/postgres';

async function run() {
  const client = new Client({
    connectionString,
    ssl: { rejectUnauthorized: false }
  });

  await client.connect();
  console.log('Connected to PostgreSQL database.');

  // Wipe the database public schema first to ensure a clean slate
  console.log('Wiping database schema for a clean install...');
  await client.query('DROP SCHEMA public CASCADE; CREATE SCHEMA public; GRANT ALL ON SCHEMA public TO postgres; GRANT ALL ON SCHEMA public TO public;');
  console.log('Database wiped clean.');

  // Drop old storage policies to avoid conflicts
  console.log('Dropping old storage policies if they exist...');
  const policiesToDrop = [
    'Admins can upload faculty photos',
    'Public can view faculty photos',
    'Admins can update faculty photos',
    'Admins can delete faculty photos',
    'Admins can upload faculty resumes',
    'Authorized users can view faculty resumes',
    'Admins can upload student photos',
    'Public can view student photos',
    'Admins can upload circulars',
    'Public can view circulars'
  ];
  for (const policy of policiesToDrop) {
    try {
      await client.query(`DROP POLICY IF EXISTS "${policy}" ON storage.objects;`);
    } catch (e) {
      console.warn(`Could not drop policy "${policy}":`, e.message);
    }
  }
  console.log('Storage policies cleared.');

  const sqlFiles = [
    path.join(__dirname, 'supabase_schema.sql'),
    path.join(__dirname, 'setup_supabase_complete.sql'),
    path.join(__dirname, 'IMPORT_ALL_NRIIT_DATA.sql'),
    path.join(__dirname, 'seed_complete_sample_data.sql')
  ];

  for (const file of sqlFiles) {
    console.log(`Running SQL script: ${path.basename(file)}...`);
    let sql = fs.readFileSync(file, 'utf8');
    if (sql.startsWith('\uFEFF')) {
      sql = sql.slice(1);
    }
    await client.query(sql);
    console.log(`Successfully completed: ${path.basename(file)}`);
  }

  // Disable FK temporarily to seed timetables with old UUIDs
  console.log('Temporarily dropping timetable faculty foreign key constraint...');
  await client.query('ALTER TABLE timetable DROP CONSTRAINT IF EXISTS timetable_faculty_id_fkey;');

  // Run seed_full_timetables.sql
  const timetablesFile = path.join(__dirname, 'seed_full_timetables.sql');
  console.log(`Running SQL script: ${path.basename(timetablesFile)}...`);
  let timetablesSql = fs.readFileSync(timetablesFile, 'utf8');
  if (timetablesSql.startsWith('\uFEFF')) {
    timetablesSql = timetablesSql.slice(1);
  }
  await client.query(timetablesSql);
  console.log(`Successfully completed: ${path.basename(timetablesFile)}`);

  // Map old UUIDs to new UUIDs of same department (or fallback department if no faculty seeded)
  console.log('Dynamically mapping old faculty UUIDs to new active faculty profiles...');
  const mappingQuery = `
    DO $$
    DECLARE
        v_rec RECORD;
        v_new_fac_id UUID;
        v_count integer;
        v_mapped_dept text;
    BEGIN
        FOR v_rec IN 
            SELECT DISTINCT t.faculty_id, cs.dept_code 
            FROM timetable t
            JOIN class_sections cs ON cs.id = t.class_section_id
            WHERE t.faculty_id IS NOT NULL
        LOOP
            SELECT count(*) INTO v_count FROM faculty_profiles WHERE dept_code::text = v_rec.dept_code::text;

            IF v_count = 0 THEN
                v_mapped_dept := CASE v_rec.dept_code::text
                    WHEN 'CSE-DS' THEN 'CSE'
                    WHEN 'CSE-AI' THEN 'CSE'
                    WHEN 'EVT' THEN 'ECE'
                    ELSE 'CSE'
                END;
                SELECT count(*) INTO v_count FROM faculty_profiles WHERE dept_code::text = v_mapped_dept;
            ELSE
                v_mapped_dept := v_rec.dept_code::text;
            END IF;

            IF v_count > 0 THEN
                SELECT id INTO v_new_fac_id
                FROM (
                    SELECT id, row_number() OVER (ORDER BY employee_id) as rn
                    FROM faculty_profiles
                    WHERE dept_code::text = v_mapped_dept
                ) sub
                WHERE rn = (abs(hashtext(v_rec.faculty_id::text)) % v_count) + 1;

                IF v_new_fac_id IS NOT NULL THEN
                    UPDATE timetable 
                    SET faculty_id = v_new_fac_id 
                    WHERE faculty_id = v_rec.faculty_id;
                END IF;
            END IF;
        END LOOP;
    END $$;
  `;
  await client.query(mappingQuery);
  console.log('Faculty mapping complete.');

  // Re-enable FK constraint
  console.log('Restoring timetable faculty foreign key constraint...');
  await client.query('ALTER TABLE timetable ADD CONSTRAINT timetable_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES faculty_profiles(id);');

  await client.end();
  console.log('All SQL scripts executed and mapped successfully. Connection closed.');
}

run().catch(err => {
  console.error('Error executing SQL scripts:', err);
  process.exit(1);
});
