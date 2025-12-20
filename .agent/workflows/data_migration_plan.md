---
description: Comprehensive plan for migrating NBA and Faculty data to Supabase
---
# Data Migration Plan: NBA & Faculty Data

This plan outlines the steps to populate the Supabase database with real-world data extracted from the NBA Self-Assessment Reports (SARs) provided in CSV format.

## 1. Data Sources
*   **Faculty Data**: `e-NBA-prequalifier-cse.csv`, `e-NBA-prequalifier-ece.csv`, `e-NBA-prequalifier-it.csv`.
*   **Admissions Data**: Extracted from `e-NBA-prequalifier-cse.csv` (Sampled for CSE).
*   **Vision & Mission**: Placeholder text used; requires manual update from the department website or specific text files.

## 2. Approach
We utilize a Python script to parse the semi-structured text in the CSV files. The script extracts:
*   Faculty Name (fuzzy matched to existing profiles)
*   PAN Number (Unique Identifier for NBA)
*   Qualification (Ph.D, M.Tech, etc.)
*   Date of Joining
*   Designation
*   Admissions Statistics (Intake vs Admitted)

## 3. Execution Steps

### Step 1: Apply Schema Changes
Run the following SQL script to create the necessary tables for NBA data (`nba_admissions`, `nba_program_details`, etc.) and extend the `faculty_profiles` table.

File: `import_step3_nba_schema.sql`

### Step 2: Import Extracted Data
Run the following SQL script to populate the tables. This script performs `UPDATE` operations on existing faculty profiles to enrich them with NBA data and `INSERT` operations for admissions data.

File: `import_step3_nba_data.sql`

*(Note: This file acts as a generated artifact from `parse_nba_csv.py`)*

### Step 3: Verification
Verify the data by checking the Faculty Dashboard or running:
```sql
SELECT * FROM faculty_profiles WHERE pan_no IS NOT NULL;
SELECT * FROM nba_admissions;
```

## 4. Future Enhancements
*   **Full Document Parsing**: Utilize OCR or advanced HTML parsing for the remaining `.htm` files to extract specific CO-PO mappings.
*   **Lab Details**: Extract lab equipment and utilization details from `e-NBA-prequalifier-*.csv` if available.
