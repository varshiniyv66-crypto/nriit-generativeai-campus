const { Client } = require('pg');
const connectionString = 'postgresql://postgres.bzjoestbxmitarmatbgr:Klu%40jntu123@aws-1-ap-northeast-2.pooler.supabase.com:5432/postgres';

async function check() {
  const client = new Client({ connectionString, ssl: { rejectUnauthorized: false } });
  await client.connect();

  // Find dean by email pattern
  const dean = await client.query("SELECT id, email, role FROM users WHERE email LIKE '%dean%'");
  console.log('=== USERS WITH "dean" IN EMAIL ===');
  dean.rows.forEach(row => console.log(JSON.stringify(row)));

  // Count by role
  const roles = await client.query("SELECT role, count(*) as cnt FROM users GROUP BY role ORDER BY role");
  console.log('\n=== USER COUNTS BY ROLE ===');
  roles.rows.forEach(row => console.log('  ' + row.role + ': ' + row.cnt));

  // Check for dean role specifically
  const deanRole = await client.query("SELECT id, email, role FROM users WHERE role='dean'");
  console.log('\n=== USERS WITH role=dean ===');
  deanRole.rows.forEach(row => console.log(JSON.stringify(row)));

  // Sample faculty
  const fac = await client.query("SELECT email, role FROM users WHERE role='faculty' LIMIT 3");
  console.log('\n=== SAMPLE FACULTY ===');
  fac.rows.forEach(row => console.log('  ' + row.email));

  await client.end();
}
check().catch(e => console.error(e.message));
