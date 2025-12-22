
import { createClient } from '@supabase/supabase-js';
import * as fs from 'fs';
import * as path from 'path';
import pg from 'pg';
const { Client } = pg;

const client = new Client({
    connectionString: "postgresql://postgres:postgres@127.0.0.1:54322/postgres",
});

async function run() {
    await client.connect();

    try {
        const sqlPath = path.join(process.cwd(), 'scripts', 'seed_program_details.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');

        console.log('Running Program Details Seed SQL...');
        await client.query(sql);
        console.log('Seed Executed Successfully.');
    } catch (err) {
        console.error('Error executing SQL:', err);
    } finally {
        await client.end();
    }
}

run();
