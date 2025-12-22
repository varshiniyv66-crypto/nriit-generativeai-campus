
const pg = require('pg');
const fs = require('fs');
const path = require('path');

const { Client } = pg;

const client = new Client({
    connectionString: "postgresql://postgres:postgres@127.0.0.1:54322/postgres",
});

async function run() {
    await client.connect();

    try {
        const sqlPath = path.join(process.cwd(), 'scripts', 'add_mba_faculty_rajesh.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');

        console.log('Syncing Dr. KPR Rajesh to faculty database...');
        await client.query(sql);
        console.log('✅ MBA Faculty synced successfully in Supabase.');
    } catch (err) {
        console.error('❌ Error syncing faculty:', err);
    } finally {
        await client.end();
    }
}

run();
