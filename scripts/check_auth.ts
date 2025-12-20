import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkDeanAuth() {
    console.log("Checking Dean Authentication...");
    const email = 'dean@nriit.ac.in';
    const password = 'Dean@123';

    const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
    });

    if (error) {
        console.error(`❌ Login Failed: ${error.message}`);
        if (error.message.includes("Invalid login credentials")) {
            console.log("   Action Required: Use the 'Create User' tool or script to create this user in Supabase Auth.");
        }
    } else {
        console.log(`✅ Login Successful! User ID: ${data.user.id}`);

        // Also check if this user is in the public.users table
        const { data: dbUser, error: dbError } = await supabase
            .from('users')
            .select('*')
            .eq('email', email)
            .single();

        if (dbUser) {
            console.log(`✅ Database Entry Found: Role = ${dbUser.role}`);
        } else {
            console.log(`❌ Database Entry Missing for ${email} in 'users' table.`);
            console.log(`   Action Required: Insert into public.users table.`);
        }
    }
}

checkDeanAuth();
