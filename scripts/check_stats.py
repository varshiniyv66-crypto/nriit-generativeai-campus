import json
import re

with open(r'src/data/placements_yearwise.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

def parse_pkg(pkg_str):
    if not pkg_str or pkg_str == "N/A": return 0.0
    # Remove LPA, strip
    val = re.sub(r'[^0-9.]', '', str(pkg_str))
    try:
        return float(val)
    except:
        return 0.0

print("Statistics Check:")
for dept, years in data.items():
    print(f"\nDepartment: {dept}")
    for year, students in years.items():
        packages = [parse_pkg(s['package']) for s in students]
        if not packages:
            print(f"  {year}: No data")
            continue
        max_pkg = max(packages)
        avg_pkg = sum(packages) / len(packages)
        print(f"  {year}: Highest={max_pkg} LPA, Avg={avg_pkg:.2f} LPA, Count={len(packages)}")
