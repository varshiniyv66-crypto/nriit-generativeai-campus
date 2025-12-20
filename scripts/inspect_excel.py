
import pandas as pd
import os

file_path = r'c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit\all l fcaualty nriit  all deapartmets 2025.xlsx'

try:
    print(f"Reading file: {file_path}")
    df = pd.read_excel(file_path)
    print("\nCOLUMNS:")
    print(df.columns.tolist())
    print("\nSAMPLE DATA (First 3 rows):")
    print(df.head(3).to_string())
except Exception as e:
    print(f"Error: {e}")
