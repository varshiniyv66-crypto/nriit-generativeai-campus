
import pg from 'pg';
const { Client } = pg;

const client = new Client({
    connectionString: "postgresql://postgres:postgres@127.0.0.1:54322/postgres",
});

async function run() {
    await client.connect();

    try {
        console.log('--- Listing Tables in public schema ---');
        const res = await client.query(`
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = 'public';
    `);
        console.table(res.rows);

        console.log('\n--- Trying to Access public.faculty ---');
        const res2 = await client.query('SELECT id, name, department FROM public.faculty LIMIT 3');
        console.table(res2.rows);

    } catch (err) {
        console.error('Error:', err);
    } finally {
        await client.end();
    }
}

run();
