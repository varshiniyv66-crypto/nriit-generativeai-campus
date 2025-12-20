"""Debug Placement File 1"""
import pandas as pd
import os

folder = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\LATEST  PLACAMNETS YEAR WISE"
filename = "ALL_BRANCHES_PLACED_DATA BY dr yvrr (1).xlsx"
file_path = os.path.join(folder, filename)

try:
    xl = pd.ExcelFile(file_path)
    print(f"File: {filename}")
    print(f"Sheets: {xl.sheet_names}")
    
    # Peek at first sheet
    df = pd.read_excel(file_path, sheet_name=xl.sheet_names[0], header=None)
    print(f"\nFirst 5 rows of sheet '{xl.sheet_names[0]}':")
    for i in range(min(5, len(df))):
        print(f"Row {i}: {df.iloc[i].tolist()}")
        
except Exception as e:
    print(f"Error: {e}")
