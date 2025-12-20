"""Check sheets in CE/MBA/MCA Excel"""
import pandas as pd
excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\ce, mba & mca sTAFF lIST updated.xlsx"
xl = pd.ExcelFile(excel_file)
print(f"Sheets: {xl.sheet_names}")
