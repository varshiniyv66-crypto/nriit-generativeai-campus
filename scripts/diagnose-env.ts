
import dotenv from 'dotenv';
import path from 'path';
import { createClient } from '@supabase/supabase-js';

// Load environment variables
const envPath = path.resolve(__dirname, '../.env.local');
console.log(`Loading env from: ${envPath}`);
const result = dotenv.config({ path: envPath });

if (result.error) {
    console.error("Error loading .env.local:", result.error);
} else {
    console.log("Dotenv parsed successfully.");
}

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log("Checking Environment Variables:");
console.log(`NEXT_PUBLIC_SUPABASE_URL: ${url ? (url.startsWith('https://') ? 'Valid Protocol' : 'Invalid Protocol') : 'MISSING'}`);
console.log(`NEXT_PUBLIC_SUPABASE_ANON_KEY: ${key ? `Present (Length: ${key.length})` : 'MISSING'}`);
console.log(`SUPABASE_SERVICE_ROLE_KEY: ${serviceKey ? `Present (Length: ${serviceKey.length})` : 'MISSING'}`);

if (url && key) {
    if (url.includes('your-project')) {
        console.error("CRITICAL: URL is still the default placeholder!");
    }
    if (key.includes('your-anon-key')) {
        console.error("CRITICAL: Anon Key is still the default placeholder!");
    }

    try {
        console.log("Attempting connection...");
        const supabase = createClient(url, key);
        supabase.from('departments').select('count', { count: 'exact', head: true }).then(({ count, error }) => {
            if (error) {
                console.error("Connection Failed:", error.message);

                if (error.message.includes('Invalid API key')) {
                    console.error("Suggest: Double check the Anon Key format. It should start with 'ey...'");
                }
            } else {
                console.log("Connection Successful! Department Count:", count);
            }
        });
    } catch (e) {
        console.error("Client Init Error:", e);
    }
}
