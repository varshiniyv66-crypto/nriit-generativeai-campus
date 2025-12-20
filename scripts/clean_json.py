import json
import re

def clean_text(text):
    if not isinstance(text, str):
        return text
    
    # Common bad characters replacement
    replacements = {
        '\u00e1': ' ',    # Often used as a space or dash
        '\u00c6': "'s",   # Usually principal's etc
        '\u00f6': '"',    # Quotes
        '\u00fb': '-',    # Dash
        '\u00f2': '• ',   # Bullet point
        '\u00d4': '"',    # Quotes
        '\u00f4': '"',    # Quotes
        '\u00e2': '"',    # Quotes
    }
    
    for bad, good in replacements.items():
        text = text.replace(bad, good)
    
    # Fix double spaces
    text = re.sub(r' +', ' ', text)
    
    return text

def clean_data(data):
    if isinstance(data, dict):
        return {k: clean_data(v) for k, v in data.items()}
    elif isinstance(data, list):
        return [clean_data(v) for v in data]
    else:
        return clean_text(data)

file_path = r'c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\extracted_content.json'

with open(file_path, 'r', encoding='utf-8') as f:
    data = json.load(f)

cleaned_data = clean_data(data)

with open(file_path, 'w', encoding='utf-8') as f:
    json.dump(cleaned_data, f, indent=2)

print("Data cleaned successfully!")
