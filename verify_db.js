const { Client } = require('pg');

const connectionString = 'postgresql://postgres.bzjoestbxmitarmatbgr:Klu%40jntu123@aws-1-ap-northeast-2.pooler.supabase.com:5432/postgres';

async function verify() {
  const client = new Client({ connectionString, ssl: { rejectUnauthorized: false } });
  await client.connect();

  // 1. List all tables
  const tables = await client.query(
    "SELECT table_name FROM information_schema.tables WHERE table_schema='public' ORDER BY table_name"
  );
  console.log('=== ALL PUBLIC TABLES ===');
  tables.rows.forEach(r => console.log('  ', r.table_name));

  // 2. Count key tables
  const counts = [
    'departments', 'faculty_profiles', 'courses', 'timetable', 'class_sections',
    'profiles', 'student_profiles', 'fee_structure', 'attendance', 'mentor_assignments'
  ];
  console.log('\n=== ROW COUNTS ===');
  for (const t of counts) {
    try {
      const res = await client.query(`SELECT count(*) as cnt FROM "${t}"`);
      console.log(`  ${t}: ${res.rows[0].cnt}`);
    } catch (e) {
      console.log(`  ${t}: TABLE NOT FOUND`);
    }
  }

  // 3. Check faculty_profiles columns
  const facCols = await client.query(
    "SELECT column_name FROM information_schema.columns WHERE table_name='faculty_profiles' ORDER BY ordinal_position"
  );
  console.log('\n=== FACULTY_PROFILES COLUMNS ===');
  facCols.rows.forEach(r => console.log('  ', r.column_name));

  // 4. Check RLS policies
  const rls = await client.query(
    "SELECT tablename, policyname FROM pg_policies WHERE schemaname='public' ORDER BY tablename LIMIT 30"
  );
  console.log('\n=== RLS POLICIES (first 30) ===');
  rls.rows.forEach(r => console.log(`  ${r.tablename}: ${r.policyname}`));

  // 5. Check if RLS is enabled
  const rlsEnabled = await client.query(
    "SELECT relname, relrowsecurity FROM pg_class WHERE relnamespace=(SELECT oid FROM pg_namespace WHERE nspname='public') AND relkind='r' ORDER BY relname"
  );
  console.log('\n=== RLS ENABLED STATUS ===');
  rlsEnabled.rows.forEach(r => console.log(`  ${r.relname}: RLS=${r.relrowsecurity ? 'ON' : 'OFF'}`));

  // 6. Check department data
  const depts = await client.query("SELECT code, name FROM departments ORDER BY code");
  console.log('\n=== DEPARTMENTS ===');
  depts.rows.forEach(r => console.log(`  ${r.code}: ${r.name}`));

  await client.end();
  console.log('\nVerification complete.');
}

verify().catch(err => {
  console.error('Error:', err.message);
  process.exit(1);
});
