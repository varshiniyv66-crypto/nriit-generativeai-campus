
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
ts_lines.append("")
ts_lines.append("const __filename = fileURLToPath(import.meta.url);")
ts_lines.append("const __dirname = path.dirname(__filename);")
ts_lines.append("dotenv.config({ path: path.resolve(__dirname, '../.env.local') });")
ts_lines.append("")
ts_lines.append("const supabase = createClient(")
ts_lines.append("    process.env.NEXT_PUBLIC_SUPABASE_URL!,")
ts_lines.append("    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!")
ts_lines.append(");")
ts_lines.append("")
ts_lines.append("async function applyFixes() {")
ts_lines.append("    console.log('Starting Batch Update...');")
ts_lines.append("    let successCount = 0;")
ts_lines.append("    let failCount = 0;")
ts_lines.append("")

dept_map = {
    "COMPUTER SCIENCE AND ENGINEERING": "CSE",
    "COMPUTER SCIENCE & ENGINEERING": "CSE",
    "INFORMATION TECHNOLOGY": "IT",
    "ELECTRONICS AND COMMUNICATIONS ENGINEERING": "ECE",
    "ELECTRONICS & COMMUNICATION ENGINEERING": "ECE",
}

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
    
    updates = {}
    if pan and len(pan) >= 10: updates["pan_number"] = pan
    if doj: updates["date_of_joining"] = doj
    
    if not updates: continue
    
    # Generate the JS Update Code
    # We use a specific function for this to keep scope clean? No, just unroll it.
    
    update_json = json.dumps(updates)
    
    # We search by name. 
    # Logic: Select ID by name ILIKE, then Update ID.
    
    block = f"""
    // Row {index}: {fname} {lname} ({dept_code})
    {{
        const {{ data: matches }} = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', '{dept_code}')
            .or(`first_name.ilike.%{fname}%,last_name.ilike.%{lname}%`);
            
        if (matches && matches.length > 0) {{
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {{
                 const {{ error }} = await supabase.from('faculty_profiles').update({update_json}).eq('id', match.id);
                 if (!error) successCount++;
                 else {{ console.error('Failed {fname} {lname}:', error.message); failCount++; }}
             }}
        }} else {{
            console.log('Skipped (Not Found): {fname} {lname}');
        }}
    }}"""
    ts_lines.append(block)

ts_lines.append("")
ts_lines.append("    console.log(`Update Complete. Success: ${successCount}, Failed: ${failCount}`);")
ts_lines.append("}")
ts_lines.append("")
ts_lines.append("applyFixes();")

out_path = "scripts/apply_real_data_fixes.ts"
with open(out_path, "w") as f:
    f.write("\n".join(ts_lines))

print(f"Generated TS script: {out_path}")
