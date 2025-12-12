import json
import re

def parse_extracted_data(filename):
    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    data = {
        "about": {},
        "departments": {},
        "placements": {},
        "faculty": []
    }

    current_section = None
    current_dept = None
    buffer = []
    
    dept_map = {
        "COMPUTER SCIENCE": "CSE",
        "INFORMATION TECHNOLOGY": "IT",
        "CIVIL ENGINEERING": "CIVIL",
        "ELECTRONICS & COMMUNICATION": "ECE",
        "MBA": "MBA",
        "MCA": "MCA",
        "BSH": "BSH"
    }

    for line in lines:
        line = line.strip()
        if not line:
            continue
            
        if line.startswith("FILE:"):
            continue
        
        if line == "ABOUT US":
            current_section = "about"
            current_dept = None
            buffer = []
        
        elif "DEPARTMENT" in line and (any(d in line for d in dept_map.keys()) or "CHEMISTRY" in line or "PHYSICS" in line or "MATHEMATICS" in line):
             # Identify department
             for key, code in dept_map.items():
                 if key in line:
                     current_dept = code
                     if current_dept not in data["departments"]:
                         data["departments"][current_dept] = {"content": "", "tables": []}
                     current_section = "departments"
                     break
             # Handle BSH subjects
             if "CHEMISTRY" in line or "PHYSICS" in line or "MATHEMATICS" in line:
                 current_dept = "BSH"
                 if current_dept not in data["departments"]:
                     data["departments"][current_dept] = {"content": "", "tables": []}
                 current_section = "departments"

        elif line == "--- TABLE ---":
            # Process table if needed, for now just marking it
            pass
            
        elif current_section == "about":
            if "HISTORY" in line:
                data["about"]["history"] = ""
            elif "VISION" in line:
                data["about"]["vision"] = ""
            elif "MISSION" in line:
                 data["about"]["mission"] = ""
            
            # Simple accumulation for now, refinement can happen later
            if "history" in data["about"] and "vision" not in data["about"]:
                 data["about"]["history"] = (data["about"].get("history", "") + " " + line).strip()
            # ... (parsing specific sections is hard without strict markers, better to dump all text for manual review or smarter parsing)
            
            # Let's just store raw text chunks for now per section
            if "content" not in data["about"]:
                data["about"]["content"] = []
            data["about"]["content"].append(line)

        elif current_section == "departments" and current_dept:
            data["departments"][current_dept]["content"] += line + "\n"
            
            # Try to catch faculty
            if "|" in line and ("Professor" in line or "Asst" in line or "Assoc" in line):
                parts = [p.strip() for p in line.split("|")]
                if len(parts) >= 3:
                    faculty = {
                        "name": parts[1] if len(parts) > 1 else "",
                        "designation": parts[2] if len(parts) > 2 else "",
                        "department": current_dept
                    }
                    data["faculty"].append(faculty)

        elif "PLACEMENTS" in line:
            current_section = "placements"
        
        elif current_section == "placements":
             if "content" not in data["placements"]:
                 data["placements"]["content"] = []
             data["placements"]["content"].append(line)

    return data

if __name__ == "__main__":
    try:
        content = parse_extracted_data("extracted_data.txt")
        with open("src/data/extracted_content.json", "w", encoding='utf-8') as f:
            json.dump(content, f, indent=2)
        print("Successfully parsed data to src/data/extracted_content.json")
    except Exception as e:
        print(f"Error: {e}")
