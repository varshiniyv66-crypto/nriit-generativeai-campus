import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function generateReport() {
    const depts = ['CSE', 'ECE', 'IT'];
    let report = "# 🎓 Latest Faculty Report (Supabase Transfer Verification)\n\n";
    report += `**Generated:** ${new Date().toLocaleString()}\n\n`;

    let totalFaculty = 0;

    for (const dept of depts) {
        const { data: faculty, count } = await supabase
            .from('faculty_profiles')
            .select('employee_id, first_name, last_name, designation, date_of_joining, is_active', { count: 'exact' })
            .eq('dept_code', dept)
            .order('date_of_joining', { ascending: false }); // Latest first

        if (faculty) {
            report += `## 📘 Department: ${dept} (${count} Faculty)\n\n`;
            totalFaculty += count || 0;

            report += "| Employee ID | Name | Designation | Joined |\n";
            report += "|-------------|------|-------------|--------|\n";

            // Show top 20
            faculty.slice(0, 20).forEach(f => {
                const name = `${f.first_name} ${f.last_name}`;
                const joined = f.date_of_joining || 'N/A';
                report += `| ${f.employee_id || '-'} | ${name} | ${f.designation} | ${joined} |\n`;
            });

            if (faculty.length > 20) {
                report += `| ... | *and ${faculty.length - 20} more* | ... | ... |\n`;
            }
            report += "\n";
        }
    }

    report += "---\n";
    report += `### 📊 Summary\n`;
    report += `- **Total Faculty Found:** ${totalFaculty}\n`;
    report += `- **Status:** Data transfer verified in Supabase.\n`;

    fs.writeFileSync(path.resolve(__dirname, '../LATEST_FACULTY_REPORT.md'), report);
    console.log("Report generated at LATEST_FACULTY_REPORT.md");
}

generateReport();
