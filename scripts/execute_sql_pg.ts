
import { createClient } from '@supabase/supabase-js';
import * as fs from 'fs';
import * as path from 'path';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

// Since we need to delete and insert efficiently, and RLS might be an issue with anon key if not careful,
// but for now we assume anon key has access or we use service role key if available.
// However, the user environment usually provides anon key.
// A better approach for raw SQL execution without a service key is difficult via supabase-js if RPC isn't set up.
// BUT, the 'postgres' connection string from previous output suggests we have direct DB access locally!
// "postgresql://postgres:postgres@127.0.0.1:54322/postgres"

// Let's use 'pg' library to run the SQL directly against the local docker database.
import pg from 'pg';
const { Client } = pg;

const client = new Client({
    connectionString: "postgresql://postgres:postgres@127.0.0.1:54322/postgres",
});

async function run() {
    await client.connect();

    try {
        const sqlPath = path.join(process.cwd(), 'scripts', 'update_premium_data.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');

        console.log('Running SQL...');
        await client.query(sql);
        console.log('SQL Executed Successfully.');
    } catch (err) {
        console.error('Error executing SQL:', err);
    } finally {
        await client.end();
    }
}

run();
