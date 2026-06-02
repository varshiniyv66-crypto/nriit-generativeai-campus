const { Client } = require('pg');
const connectionString = 'postgresql://postgres.bzjoestbxmitarmatbgr:Klu%40jntu123@aws-1-ap-northeast-2.pooler.supabase.com:5432/postgres';

async function fixPermissions() {
  const client = new Client({ connectionString, ssl: { rejectUnauthorized: false } });
  await client.connect();
  console.log('Connected. Fixing permissions...');

  const grants = [
    // Grant usage on schema
    "GRANT USAGE ON SCHEMA public TO anon;",
    "GRANT USAGE ON SCHEMA public TO authenticated;",
    "GRANT USAGE ON SCHEMA public TO service_role;",

    // Grant SELECT on all existing tables to anon (read-only public access)
    "GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon;",
    
    // Grant full CRUD to authenticated users
    "GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO authenticated;",
    
    // Grant full access to service_role
    "GRANT ALL ON ALL TABLES IN SCHEMA public TO service_role;",
    
    // Grant sequence usage
    "GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO anon;",
    "GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO authenticated;",
    "GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO service_role;",

    // Set default privileges for future tables
    "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO anon;",
    "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO authenticated;",
    "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO service_role;",
    "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE ON SEQUENCES TO anon;",
    "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE ON SEQUENCES TO authenticated;",
    "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;",
  ];

  for (const sql of grants) {
    try {
      await client.query(sql);
      console.log('OK:', sql.substring(0, 60) + '...');
    } catch (e) {
      console.error('WARN:', sql.substring(0, 60), '-', e.message);
    }
  }

  // Verify by testing anon access
  console.log('\nVerifying anon can now read tables...');
  
  // Test with a direct query as postgres (we can't test as anon from here, 
  // but let's confirm the grants exist)
  const res = await client.query(`
    SELECT grantee, table_name, privilege_type 
    FROM information_schema.table_privileges 
    WHERE table_schema = 'public' AND grantee = 'anon' 
    ORDER BY table_name 
    LIMIT 15
  `);
  console.log('\n=== ANON GRANTS (sample) ===');
  res.rows.forEach(r => console.log('  ' + r.table_name + ': ' + r.privilege_type));

  await client.end();
  console.log('\nDone! Permissions fixed. Try logging in again.');
}

fixPermissions().catch(e => {
  console.error('Fatal:', e.message);
  process.exit(1);
});
