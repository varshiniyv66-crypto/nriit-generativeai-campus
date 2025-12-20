"""
Debug AIML Faculty Excel file
"""
import pandas as pd

excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\AIML Faculty list for NBA.xlsx"

# Read raw data
try:
    df = pd.read_excel(excel_file, header=None)
    print("First 10 rows of AIML file:")
    for i in range(min(10, len(df))):
        print(f"Row {i}: {df.iloc[i].tolist()}")
except Exception as e:
    print(f"Error reading file: {e}")
