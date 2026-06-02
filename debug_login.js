const { Client } = require('pg');
const connectionString = 'postgresql://postgres.bzjoestbxmitarmatbgr:Klu%40jntu123@aws-1-ap-northeast-2.pooler.supabase.com:5432/postgres';

async function check() {
  const client = new Client({ connectionString, ssl: { rejectUnauthorized: false } });
  await client.connect();

  // Check student_profiles columns
  const spCols = await client.query("SELECT column_name FROM information_schema.columns WHERE table_name='student_profiles' ORDER BY ordinal_position");
  console.log('=== STUDENT_PROFILES COLUMNS ===');
  spCols.rows.forEach(r => console.log('  ', r.column_name));

  // Sample student data
  const sp = await client.query("SELECT * FROM student_profiles LIMIT 3");
  console.log('\n=== SAMPLE STUDENTS ===');
  sp.rows.forEach(r => console.log(JSON.stringify(r)));

  // Check faculty employee_id format
  const fp = await client.query("SELECT employee_id, first_name, last_name, email FROM faculty_profiles LIMIT 5");
  console.log('\n=== SAMPLE FACULTY ===');
  fp.rows.forEach(r => console.log(JSON.stringify(r)));

  // Check dean user
  const dean = await client.query("SELECT * FROM users WHERE role='dean' LIMIT 1");
  console.log('\n=== DEAN USER ===');
  dean.rows.forEach(r => console.log(JSON.stringify(r)));

  // Now test the exact queries the login page uses
  console.log('\n=== TESTING LOGIN QUERIES ===');
  
  // Test student query (same as login page)
  const s1 = await client.query("SELECT id, first_name, last_name, roll_number, email FROM student_profiles WHERE roll_number='25KP1A0101' OR email='25kp1a0101' LIMIT 1");
  console.log('Student 25KP1A0101:', s1.rows.length > 0 ? 'FOUND' : 'NOT FOUND');
  
  // Try case-insensitive
  const s2 = await client.query("SELECT id, roll_number FROM student_profiles WHERE UPPER(roll_number)='25KP1A0101' LIMIT 1");
  console.log('Student 25KP1A0101 (case-insensitive):', s2.rows.length > 0 ? 'FOUND - ' + s2.rows[0].roll_number : 'NOT FOUND');

  // Test faculty query
  const f1 = await client.query("SELECT id, employee_id, email FROM faculty_profiles WHERE employee_id='FACCSE001' OR email='faccse001' LIMIT 1");
  console.log('Faculty FACCSE001:', f1.rows.length > 0 ? 'FOUND' : 'NOT FOUND');

  // Try with @nriit.ac.in
  const f2 = await client.query("SELECT id, employee_id, email FROM faculty_profiles WHERE email='faccse001@nriit.ac.in' LIMIT 1");
  console.log('Faculty faccse001@nriit.ac.in:', f2.rows.length > 0 ? 'FOUND' : 'NOT FOUND');

  // Test dean query
  const d1 = await client.query("SELECT id, email, role FROM users WHERE email='dean@nriit.ac.in' AND role='dean'");
  console.log('Dean dean@nriit.ac.in:', d1.rows.length > 0 ? 'FOUND' : 'NOT FOUND');

  await client.end();
}
check().catch(e => console.error(e.message));
