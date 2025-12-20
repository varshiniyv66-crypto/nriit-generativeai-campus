
import pandas as pd
import warnings
warnings.simplefilter(action='ignore', category=UserWarning)

file_path = r'c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit\all l fcaualty nriit  all deapartmets 2025.xlsx'

def clean_text(text):
    if pd.isna(text): return ""
    return str(text).replace("_x0000_", "").strip()

try:
    print(f"Reading file (header=None): {file_path}")
    df = pd.read_excel(file_path, header=None, engine='openpyxl')
    
    # Clean all data
    print("Cleaning data...")
    df_clean = df.astype(str).applymap(clean_text)
    
    print("Searching for 'Sowjanya'...")
    search_term = 'sowjanya'
    
    found_rows = []
    
    for index, row in df_clean.iterrows():
        row_str = row.str.lower().str.cat(sep=' ')
        if search_term in row_str:
            print(f"\n--- Found Match @ Row {index} ---")
            print(row.to_string())
            found_rows.append(row)
            
    if not found_rows:
        print("No rows found matching 'Sowjanya'.")
    else:
        print(f"\nFound {len(found_rows)} matches.")

except Exception as e:
    print(f"Error: {e}")
