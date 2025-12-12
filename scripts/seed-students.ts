import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';

// Load environment variables
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

// Use Service Role Key to bypass RLS, falling back to Anon Key
let supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
if (!supabaseKey || supabaseKey.length < 30 || supabaseKey === 'your-service-role-key') {
    console.log("Service Key is placeholder or missing, checking Anon Key...");
    supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
} else {
    console.log("Using Service Role Key.");
}

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase credentials");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

const DEPARTMENTS = ['CSE', 'CSE-DS', 'CSE-AI', 'IT', 'ECE', 'CIVIL', 'MBA', 'MCA', 'BSH'];

async function seedStudents() {
    console.log("Seeding Students...");
    let createdCount = 0;

    for (const deptCode of DEPARTMENTS) {
        // Create 2 students for each department
        for (let i = 1; i <= 2; i++) {
            const rollNumber = `24${deptCode.replace('-', '')}00${i}`; // e.g., 24CSE001
            const email = `${rollNumber.toLowerCase()}@nriit.edu.in`;
            const firstName = `Student${i}`;
            const lastName = `${deptCode}`;

            // Check if user exists
            const { data: existingUser } = await supabase
                .from('users')
                .select('id')
                .eq('email', email)
                .single();

            let userId = existingUser?.id;

            if (!userId) {
                // Create User
                const { data: newUser, error: userError } = await supabase
                    .from('users')
                    .insert({
                        email: email,
                        role: 'student',
                        is_active: true,
                        email_verified: true
                    })
                    .select()
                    .single();

                if (userError) {
                    console.error(`Error creating user ${email}:`, userError.message);
                    // If invalid key, we can't create auth users proper but we can try inserting to PUBLIC users table if RLS allows?
                    // Actually, the error `Invalid API key` suggests the SERVICE ROLE KEY is bad.
                    // We can manually generate a UUID for the user just for valid FK reference if the foreign key constraint exists.
                    // Let's create a fake UUID and insert into profiles? No, FK user_id references users(id).
                    // So we MUST insert into users table.
                    // If the Key is invalid, we can't insert into ANY table if RLS is on and we are anon?
                    // But anon key should allow reading.
                    // Let's assume we can fix the key or fallback.
                    console.log("Skipping this student.");
                    continue;
                }
                userId = newUser.id;
            }

            // Check if profile exists
            const { data: existingProfile } = await supabase
                .from('student_profiles')
                .select('id')
                .eq('roll_number', rollNumber)
                .single();

            if (!existingProfile) {
                // Create Profile
                const { error: profileError } = await supabase
                    .from('student_profiles')
                    .insert({
                        user_id: userId,
                        roll_number: rollNumber,
                        registration_number: rollNumber,
                        first_name: firstName,
                        last_name: lastName,
                        dept_code: deptCode,
                        current_semester: 1,
                        section: 'A',
                        email: email,
                        phone: `9900${deptCode.length}${i}00`, // Mock phone
                        admission_date: new Date().toISOString(),
                        admission_type: 'EAMCET',
                        is_active: true
                    });

                if (profileError) {
                    console.error(`Error creating profile for ${rollNumber}:`, profileError.message);
                } else {
                    console.log(`Created Student: ${firstName} ${lastName} (${rollNumber})`);
                    createdCount++;
                }
            } else {
                console.log(`Student ${rollNumber} already exists`);
            }
        }
    }
    console.log(`Successfully seeded ${createdCount} students.`);
}

seedStudents().catch(console.error);
