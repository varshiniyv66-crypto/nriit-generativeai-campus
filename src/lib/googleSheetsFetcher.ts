/**
 * Google Sheets Faculty Data Fetcher
 * 
 * This utility fetches faculty data from a published Google Sheet CSV
 * When faculty update the sheet, website automatically shows updated data
 */

// Form Responses Sheet - Columns: Timestamp, Email, TIME, Date, Full Name, PAN, Department, Designation, Photo, Resume
export const GOOGLE_SHEETS_FORM_RESPONSES_URL = 'https://docs.google.com/spreadsheets/d/1oNalDameuL9dwLfdrUqNGc9gFjefQZgYWI912xic0yw/export?format=csv';

// Faculty Template Sheet - Columns: SNo, Name, Designation, Qualification, Department, DOJ, PAN, Nature, PhotoURL, ResumeURL
export const GOOGLE_SHEETS_FACULTY_TEMPLATE_URL = 'https://docs.google.com/spreadsheets/d/1fAc7WZvomyBwxRb87AC3Vdwe6lTXmcxh5bymxNk5Mvs/export?format=csv';

export interface FacultyFromSheet {
    sno: string;
    name: string;
    designation: string;
    qualification: string;
    department: string;
    doj: string;
    pan: string;
    nature: string;
    photoUrl: string;
    resumeUrl: string;
}

/**
 * Fetches faculty data from published Google Sheet
 * @param sheetUrl - Published Google Sheet CSV URL
 * @returns Array of faculty data
 */
export async function fetchFacultyFromGoogleSheet(sheetUrl: string): Promise<FacultyFromSheet[]> {
    try {
        const response = await fetch(sheetUrl, {
            cache: 'no-store', // Always fetch fresh data
            next: { revalidate: 60 } // Revalidate every 60 seconds
        });

        if (!response.ok) {
            console.error('Failed to fetch Google Sheet:', response.statusText);
            return [];
        }

        const csv = await response.text();
        const lines = csv.split('\n');

        // Skip header row
        const faculty: FacultyFromSheet[] = [];

        for (let i = 1; i < lines.length; i++) {
            const line = lines[i].trim();
            if (!line) continue;

            // Parse CSV (handle quoted fields)
            const fields = parseCSVLine(line);

            if (fields.length >= 10) {
                faculty.push({
                    sno: fields[0] || '',
                    name: fields[1] || '',
                    designation: fields[2] || '',
                    qualification: fields[3] || '',
                    department: fields[4] || '',
                    doj: fields[5] || '',
                    pan: fields[6] || '',
                    nature: fields[7] || '',
                    photoUrl: fields[8] || '',
                    resumeUrl: fields[9] || ''
                });
            }
        }

        return faculty;
    } catch (error) {
        console.error('Error fetching faculty from Google Sheet:', error);
        return [];
    }
}

/**
 * Parse a CSV line handling quoted fields
 */
function parseCSVLine(line: string): string[] {
    const result: string[] = [];
    let current = '';
    let inQuotes = false;

    for (let i = 0; i < line.length; i++) {
        const char = line[i];

        if (char === '"') {
            inQuotes = !inQuotes;
        } else if (char === ',' && !inQuotes) {
            result.push(current.trim());
            current = '';
        } else {
            current += char;
        }
    }

    result.push(current.trim());
    return result;
}

/**
 * Generate avatar URL if no photo provided
 */
export function generateAvatarUrl(name: string, index: number): string {
    const cleanName = name.replace(/Dr\.|Mr\.|Mrs\.|Ms\.|\./g, '').trim();
    const encodedName = encodeURIComponent(cleanName);
    const bgColors = ['4F46E5', 'F97316', '16A34A', '0EA5E9', 'A855F7'];
    const bgColor = bgColors[index % bgColors.length];

    return `https://ui-avatars.com/api/?name=${encodedName}&background=${bgColor}&color=fff&size=128&font-size=0.35&bold=true`;
}
