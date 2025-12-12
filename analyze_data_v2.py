import pandas as pd
import os

# Read faculty file with proper encoding
filepath = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit\all l fcaualty nriit  all deapartmets 2025.xlsx"

print("=" * 80)
print("FACULTY DATA - TRYING DIFFERENT APPROACH")
print("=" * 80)

try:
    xl = pd.ExcelFile(filepath, engine='openpyxl')
    print(f"Sheets available: {xl.sheet_names}\n")
    
    for sheet_name in xl.sheet_names[:1]:  # Check first sheet
        print(f"\n📋 SHEET: {sheet_name}")
        print("-" * 60)
        
        # Try reading with different options
        df = pd.read_excel(filepath, sheet_name=sheet_name, engine='openpyxl')
        print(f"Columns: {list(df.columns)}")
        print(f"Shape: {df.shape}")
        print("\nFirst 10 rows:")
        print(df.head(10).to_string())
        
except Exception as e:
    print(f"Error: {e}")

# Now analyze student file
print("\n\n" + "=" * 80)
print("STUDENT DATA - I B.Tech I Sem")
print("=" * 80)

student_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit\I B.Tech I Sem Nominals Aug 2025.xlsx"

try:
    xl = pd.ExcelFile(student_file, engine='openpyxl')
    print(f"Sheets available: {xl.sheet_names}\n")
    
    for sheet_name in xl.sheet_names[:3]:  # Check first 3 sheets
        print(f"\n📋 SHEET: {sheet_name}")
        print("-" * 60)
        
        df = pd.read_excel(student_file, sheet_name=sheet_name, engine='openpyxl')
        print(f"Columns: {list(df.columns)}")
        print(f"Shape: {df.shape}")
        print("\nFirst 10 rows:")
        print(df.head(10).to_string())
        
except Exception as e:
    print(f"Error: {e}")

print("\n" + "=" * 80)
