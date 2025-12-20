
import pandas as pd
import warnings
import json

warnings.simplefilter(action='ignore', category=UserWarning)

file_path = r'c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit\all l fcaualty nriit  all deapartmets 2025.xlsx'

def clean_text(text):
    if pd.isna(text): return ""
    s = str(text).replace("_x0000_", "").replace('"', '').replace("'", "").strip()
    return s

def parse_date(date_str):
    if not date_str or date_str == "nan": return None
    try:
        parts = date_str.split('/')
        if len(parts) == 3:
            return f"{parts[2]}-{parts[1]}-{parts[0]}"
    except:
        pass
    return None

print("Reading Excel...")
df = pd.read_excel(file_path, header=None, engine='openpyxl')
df = df.astype(str).map(clean_text)

ts_lines = []
ts_lines.append("import { createClient } from '@supabase/supabase-js';")
ts_lines.append("import dotenv from 'dotenv';")
ts_lines.append("import path from 'path';")
ts_lines.append("import { fileURLToPath } from 'url';")
ts_lines.append("import fs from 'fs';") # Unused but fine
ts_lines.append("")
ts_lines.append("const __filename = fileURLToPath(import.meta.url);")
ts_lines.append("const __dirname = path.dirname(__filename);")
ts_lines.append("dotenv.config({ path: path.resolve(__dirname, '../.env.local') });")
ts_lines.append("")
ts_lines.append("const supabase = createClient(")
ts_lines.append("    process.env.NEXT_PUBLIC_SUPABASE_URL!,")
ts_lines.append("    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!")
ts_lines.append(");")
ts_lines.append("")
ts_lines.append("async function applyFixes() {")
ts_lines.append("    console.log('Starting Smart Batch Update...');")
ts_lines.append("    let successCount = 0;")
ts_lines.append("    let skippedCount = 0;")
ts_lines.append("    let failCount = 0;")
ts_lines.append("")
ts_lines.append("    // 1. Fetch all faculty first to minimize queries")
ts_lines.append("    const { data: allFaculty } = await supabase.from('faculty_profiles').select('*');")
ts_lines.append("    if (!allFaculty) { console.error('Failed to fetch faculty'); return; }")
ts_lines.append("    console.log(`Fetched ${allFaculty.length} faculty profiles.`);")
ts_lines.append("")
ts_lines.append("    const updates = [];")
ts_lines.append("")

dept_map = {
    "COMPUTER SCIENCE AND ENGINEERING": "CSE",
    "COMPUTER SCIENCE & ENGINEERING": "CSE",
    "INFORMATION TECHNOLOGY": "IT",
    "ELECTRONICS AND COMMUNICATIONS ENGINEERING": "ECE",
    "ELECTRONICS & COMMUNICATION ENGINEERING": "ECE",
}

ts_lines.append("    // 2. Iterate Excel Data")
for index, row in df.iterrows():
    dept_raw = row[21].upper() 
    dept_code = None
    for k, v in dept_map.items():
        if k in dept_raw:
            dept_code = v
            break
    if not dept_code: continue

    fname = row[7]
    lname = row[8]
    pan = row[9]
    doj_raw = row[22]
    doj = parse_date(doj_raw)
    
    if not fname or not lname: continue
    if len(fname) < 2 and len(lname) < 2: continue
    
    update_data = {}
    if pan and len(pan) >= 10: update_data["pan_number"] = pan
    if doj: update_data["date_of_joining"] = doj
    
    if not update_data: continue

    # JS Logic to find match
    ts_lines.append(f"    matchAndQueue('{dept_code}', '{fname}', '{lname}', {json.dumps(update_data)});")

# Helper function definition inside
ts_lines.append("")
ts_lines.append("    function matchAndQueue(dept, fname, lname, updateData) {")
ts_lines.append("         const fnameClean = fname.toLowerCase().replace(/\\s+/g, '');")
ts_lines.append("         const lnameClean = lname.toLowerCase().replace(/\\s+/g, '');")
ts_lines.append("         ")
ts_lines.append("         const match = allFaculty.find(f => {")
ts_lines.append("             if (f.dept_code !== dept) return false;")
ts_lines.append("             const fFirst = (f.first_name || '').toLowerCase().replace(/\\s+/g, '');")
ts_lines.append("             const fLast = (f.last_name || '').toLowerCase().replace(/\\s+/g, '');")
ts_lines.append("             // Check permutations")
ts_lines.append("             return (fFirst.includes(fnameClean) || fLast.includes(lnameClean) ||")
ts_lines.append("                     fFirst.includes(lnameClean) || fLast.includes(fnameClean));")
ts_lines.append("         });")
ts_lines.append("         ")
ts_lines.append("         if (match) {")
ts_lines.append("             updates.push({ id: match.id, ...updateData });")
ts_lines.append("         } else {")
ts_lines.append("             // console.log(`Skipped: ${fname} ${lname} (${dept})`);")
ts_lines.append("             skippedCount++;")
ts_lines.append("         }")
ts_lines.append("    }")

ts_lines.append("")
ts_lines.append("    // 3. Execute Updates")
ts_lines.append("    console.log(`Found ${updates.length} matches to update.`);")
ts_lines.append("    for (const u of updates) {")
ts_lines.append("        const { id, ...data } = u;")
ts_lines.append("        const { error } = await supabase.from('faculty_profiles').update(data).eq('id', id);")
ts_lines.append("        if (error) { console.error(`Failed ${id}:`, error.message); failCount++; }")
ts_lines.append("        else successCount++;")
ts_lines.append("    }")
ts_lines.append("")
ts_lines.append("    console.log(`Done. Success: ${successCount}, Failed: ${failCount}, Skipped: ${skippedCount}`);")
ts_lines.append("}")
ts_lines.append("applyFixes();")

out_path = "scripts/apply_real_data_fixes_v2.ts"
with open(out_path, "w") as f:
    f.write("\n".join(ts_lines))

print(f"Generated Smart Script: {out_path}")
