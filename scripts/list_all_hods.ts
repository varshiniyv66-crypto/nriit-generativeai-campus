
import pg from 'pg';
const { Client } = pg;

const client = new Client({
    connectionString: "postgresql://postgres:postgres@127.0.0.1:54322/postgres",
});

async function run() {
    await client.connect();

    try {
        const res = await client.query(`
        SELECT department, name, designation 
        FROM faculty 
        WHERE designation ILIKE '%HOD%' 
        ORDER BY department;
    `);

        console.log('--- CURRENT HOD LIST ---');
        console.table(res.rows);
    } catch (err) {
        console.error('Error:', err);
    } finally {
        await client.end();
    }
}

run();
