import pandas as pd
import os

directory = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\LATEST  PLACAMNETS YEAR WISE"
files = [f for f in os.listdir(directory) if not f.startswith('~$') and f.endswith('.xlsx')]

print("=" * 100)
print(f"{'FILENAME':<60} | {'SHEETS'}")
print("-" * 100)

for filename in files:
    filepath = os.path.join(directory, filename)
    try:
        xl = pd.ExcelFile(filepath)
        print(f"{filename:<60} | {', '.join(xl.sheet_names)}")
    except Exception as e:
        print(f"{filename:<60} | ERROR: {e}")

print("=" * 100)
