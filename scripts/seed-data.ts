
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import { facultyData } from '../src/data/faculty';
import { departments } from '../src/data/departments';
import path from 'path';

// Load environment variables from .env.local
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
// Use Service Role Key for seeding to bypass RLS, falling back to Anon Key
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase credentials in .env.local");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function seedDepartments() {
    console.log("Seeding Departments...");
    for (const [key, dept] of Object.entries(departments)) {
        // Check if exists
        const { data: existing } = await supabase
            .from('departments')
            .select('id')
            .eq('code', dept.code.toUpperCase())
            .single();

        if (!existing) {
            const { error } = await supabase.from('departments').insert({
                code: dept.code.toUpperCase(),
                name: dept.name,
                short_name: dept.code.toUpperCase(), // Using code as short_name for now
                vision: dept.vision,
                mission: dept.mission.join('\n'), // Storing array as newline separated string or JSON if changed
                // mission is text in schema, let's join it.
                is_active: true
            });
            if (error) console.error(`Error inserting department ${dept.name}:`, error.message);
            else console.log(`Inserted department: ${dept.name}`);
        } else {
            console.log(`Department ${dept.name} already exists.`);
        }
    }
}

async function seedFaculty() {
    console.log("Seeding Faculty...");
    for (const [deptCode, facultyList] of Object.entries(facultyData)) {
        for (const faculty of facultyList) {
            // 1. Create User Entry (Mock email if needed or skip logic)
            // We need a unique email to create a user. The data has email sometimes.
            // If email is missing, we'll generate one: `faculty.id@nriit.edu.in`

            const email = faculty.email || `${faculty.id}@nriit.edu.in`;

            // Map data file codes to DB ENUM codes
            const deptMap: Record<string, string> = {
                'AIML': 'CSE-AI',
                'DS': 'CSE-DS',
                'VLSI': 'ECE', // Assuming VLSI falls under ECE if not distinct
                'CSD': 'CSE-DS', // Some entries use CSD
                'IOT': 'ECE' // Assuming IOT falls under ECE or create new ENUM if needed. For now mapping to ECE to fix error.
            };

            let deptCodeUpper = faculty.department.toUpperCase();
            if (deptMap[deptCodeUpper]) {
                deptCodeUpper = deptMap[deptCodeUpper];
            }


            // Check if faculty profile exists
            const { data: existingProfile } = await supabase
                .from('faculty_profiles')
                .select('id')
                .eq('employee_id', faculty.id)
                .single();

            if (!existingProfile) {
                // Create User first
                let userId = null;

                // Check if user exists
                const { data: existingUser } = await supabase
                    .from('users')
                    .select('id')
                    .eq('email', email)
                    .single();

                if (existingUser) {
                    userId = existingUser.id;
                } else {
                    const { data: newUser, error: userError } = await supabase
                        .from('users')
                        .insert({
                            email: email,
                            role: 'faculty',
                            is_active: true
                        })
                        .select()
                        .single();

                    if (userError) {
                        console.error(`Error creating user for ${faculty.name}:`, userError.message);
                        continue;
                    }
                    userId = newUser.id;
                }

                // Create Profile
                const { error: profileError } = await supabase
                    .from('faculty_profiles')
                    .insert({
                        user_id: userId,
                        employee_id: faculty.id,
                        first_name: faculty.name, // Assuming name is full name, putting in first_name for now or split
                        last_name: " ", // Placeholder
                        dept_code: deptCodeUpper,
                        designation: faculty.designation,
                        qualification: faculty.qualification,
                        date_of_joining: faculty.joiningDate ? parseDate(faculty.joiningDate) : null,
                        pan_number: faculty.panNumber,
                        is_active: true
                    });

                if (profileError) console.error(`Error creating profile for ${faculty.name}:`, profileError.message);
                else console.log(`Inserted faculty: ${faculty.name}`);
            }
        }
    }
}

function parseDate(dateStr: string) {
    // Format DD/MM/YYYY to YYYY-MM-DD
    if (!dateStr) return null;
    const parts = dateStr.split('/');
    if (parts.length === 3) {
        return `${parts[2]}-${parts[1]}-${parts[0]}`;
    }
    return null;
}

async function main() {
    await seedDepartments();
    await seedFaculty();
    console.log("Seeding completed.");
}

main().catch(console.error);
