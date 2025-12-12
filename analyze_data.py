import pandas as pd
import os

# Path to data folder
data_folder = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit"

# List all Excel files
print("=" * 60)
print("ANALYZING NRIIT DATA FILES")
print("=" * 60)

for filename in os.listdir(data_folder):
    if filename.endswith('.xlsx') and not filename.startswith('~$'):
        filepath = os.path.join(data_folder, filename)
        print(f"\n📁 FILE: {filename}")
        print("-" * 50)
        
        try:
            # Read Excel file
            xl = pd.ExcelFile(filepath)
            print(f"   Sheets: {xl.sheet_names}")
            
            # Read first sheet
            df = pd.read_excel(filepath, header=None)
            print(f"   Rows: {len(df)}, Columns: {len(df.columns)}")
            
            # Show first few rows to understand structure
            print("   First 5 rows preview:")
            for i in range(min(5, len(df))):
                row_vals = [str(v)[:30] for v in df.iloc[i].values if pd.notna(v)]
                print(f"      {i}: {' | '.join(row_vals[:5])}")
                
        except Exception as e:
            print(f"   ERROR: {e}")

print("\n" + "=" * 60)
print("ANALYSIS COMPLETE")
print("=" * 60)
