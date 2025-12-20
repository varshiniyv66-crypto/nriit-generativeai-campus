
import pandas as pd
import sys

# Suppress harmless warnings
import warnings
warnings.simplefilter(action='ignore', category=UserWarning)

file_path = r'c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit\all l fcaualty nriit  all deapartmets 2025.xlsx'

try:
    print(f"Reading file: {file_path}")
    # Using openpyxl engine
    df = pd.read_excel(file_path, engine='openpyxl')
    
    # Normalize column names
    df.columns = df.columns.astype(str).str.strip().str.lower()
    print(f"Columns found: {list(df.columns)}")

    # Search for Sowjanya
    print("\nSearching for 'Sowjanya'...")
    search_term = 'sowjanya'
    
    # Iterate through rows
    found = False
    for index, row in df.iterrows():
        # Convert row to string and search
        row_str = row.astype(str).str.lower().str.cat(sep=' ')
        if search_term in row_str:
            print(f"\n--- Found Match @ Row {index + 2} ---")
            # Print non-null values
            for col in df.columns:
                val = row[col]
                if pd.notna(val):
                    print(f"{col}: {val}")
            found = True

    if not found:
        print("No match found for 'Sowjanya'.")

except Exception as e:
    print(f"Error: {e}")
