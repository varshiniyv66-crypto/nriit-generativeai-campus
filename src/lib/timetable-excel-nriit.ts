// NRIIT Official Timetable Excel Template Generator
import * as XLSX from 'xlsx';

export interface TimetableMetadata {
    branch: string;
    section: string;
    semester: number;
    classIncharge: string;
    roomNo: string;
    academicYear: string;
    batch: string;
}

export interface TimetableEntry {
    day: string;
    period: number;
    subjectCode: string;
    facultyName?: string;
}

export interface SubjectMapping {
    code: string;
    name: string;
    faculty: string;
    type: 'theory' | 'lab' | 'special';
}

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
const PERIODS = [1, 2, 3, 4, 5, 6, 7, 8];

/**
 * Generate Excel template matching OFFICIAL NRIIT FORMAT
 */
export function generateTimetableTemplate(): Blob {
    const wb = XLSX.utils.book_new();

    // Sheet 1: OFFICIAL NRIIT TIMETABLE FORMAT
    const gridData = [
        // Row 1: Title
        ['III B.Tech II-Sem Time Table (2023-2027 Batch)'],
        // Row 2: Academic Year
        ['Academic Year: 2025-2026'],
        // Row 3: Empty
        [''],
        // Row 4: Metadata fields
        ['Branch:', '', 'Section:', '', 'Class Incharge:', '', 'Room No:', ''],
        // Row 5: Empty
        [''],
        // Row 6: Column headers
        ['Day/Timings', 'P1 (9:00-9:50)', 'P2 (9:50-10:40)', 'BREAK', 'P3 (10:50-11:40)', 'P4 (11:40-12:30)',
            'LUNCH BREAK', 'P5 (1:10-2:00)', 'P6 (2:00-2:50)', 'BREAK', 'P7 (3:00-3:40)', 'P8 (3:40-4:20)'],
        // Rows 7-12: Days (Monday to Saturday)
        ['Monday', '', '', '', '', '', '', '', '', '', '', ''],
        ['Tuesday', '', '', '', '', '', '', '', '', '', '', ''],
        ['Wednesday', '', '', '', '', '', '', '', '', '', '', ''],
        ['Thursday', '', '', '', '', '', '', '', '', '', '', ''],
        ['Friday', '', '', '', '', '', '', '', '', '', '', ''],
        ['Saturday', '', '', '', '', '', '', '', '', '', '', ''],
        // Row 13: Empty
        [''],
        // Row 14-20: Legend
        ['Lab Name', 'Faculty Name'],
        ['Deep Learning Lab', ''],
        ['Data Visualization Lab', ''],
        ['COUN', ''],
        ['LIB', ''],
        ['TS', ''],
        ['M/C', ''],
    ];

    const ws1 = XLSX.utils.aoa_to_sheet(gridData);

    // Set column widths to match NRIIT format
    ws1['!cols'] = [
        { wch: 15 }, // Day column
        { wch: 14 }, { wch: 14 }, { wch: 10 }, // P1, P2, BREAK
        { wch: 14 }, { wch: 14 }, { wch: 14 }, // P3, P4, LUNCH
        { wch: 14 }, { wch: 14 }, { wch: 10 }, // P5, P6, BREAK
        { wch: 14 }, { wch: 14 }                // P7, P8
    ];

    XLSX.utils.book_append_sheet(wb, ws1, 'Timetable');

    // Sheet 2: Subject Mapping (for reference)
    const mappingData = [
        ['Subject Code', 'Subject Name', 'Faculty Name', 'Type'],
        ['Instructions:', 'Fill this sheet with all subjects used in the timetable'],
        ['Example: OS', 'Operating Systems', 'Dr. A. Kumar', 'theory'],
        ['Example: DL', 'Deep Learning', 'Dr. B. Sharma', 'theory'],
        ['Example: DLLAB', 'Deep Learning Lab', 'Dr. C. Patel', 'lab'],
        ['COUN', 'Counseling', '-', 'special'],
        ['LIB', 'Library', '-', 'special'],
        ['TS', 'Telangana Studies', '-', 'special'],
        ['M/C', 'Moral & Cultural', '-', 'special'],
    ];

    const ws2 = XLSX.utils.aoa_to_sheet(mappingData);
    ws2['!cols'] = [{ wch: 15 }, { wch: 35 }, { wch: 25 }, { wch: 12 }];
    XLSX.utils.book_append_sheet(wb, ws2, 'Subject Mapping');

    // Sheet 3: Instructions
    const instructions = [
        ['NRIIT Timetable Upload - Instructions'],
        [''],
        ['HOW TO FILL THIS TEMPLATE:'],
        [''],
        ['1. METADATA (Sheet 1, Row 4):'],
        ['   - Branch: Enter department code (CSE, IT, ECE, CIVIL, EVT, MBA, MCA)'],
        ['   - Section: Enter section letter (A, B, C, D)'],
        ['   - Class Incharge: Enter faculty name'],
        ['   - Room No: Enter classroom number'],
        [''],
        ['2. TIMETABLE GRID (Sheet 1, Rows 7-12):'],
        ['   - Enter subject codes in each period cell'],
        ['   - Use short codes (e.g., OS, DL, CC, SPM)'],
        ['   - Leave cells blank for free periods'],
        ['   - BREAK and LUNCH BREAK columns are for display only'],
        [''],
        ['3. SUBJECT MAPPING (Sheet 2):'],
        ['   - List ALL subject codes you used in the timetable'],
        ['   - Provide full subject name'],
        ['   - Assign faculty name for each subject'],
        ['   - Specify type: theory, lab, or special'],
        [''],
        ['4. UPLOAD:'],
        ['   - Save this file after filling'],
        ['   - Go to Dean Dashboard → Upload Timetable'],
        ['   - Select this file'],
        ['   - Review preview'],
        ['   - Click Upload'],
        [''],
        ['NOTES:'],
        ['- P1-P6 are 50 minutes each'],
        ['- P7-P8 are 40 minutes each'],
        ['- Special subjects: COUN, LIB, TS, M/C'],
        ['- System will auto-create all database entries'],
    ];

    const ws3 = XLSX.utils.aoa_to_sheet(instructions);
    ws3['!cols'] = [{ wch: 70 }];
    XLSX.utils.book_append_sheet(wb, ws3, 'Instructions');

    // Generate blob
    const wbout = XLSX.write(wb, { bookType: 'xlsx', type: 'array' });
    return new Blob([wbout], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
}

/**
 * Parse uploaded timetable Excel file
 */
export function parseTimetableExcel(file: File): Promise<{
    metadata: TimetableMetadata;
    entries: TimetableEntry[];
    subjects: SubjectMapping[];
}> {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();

        reader.onload = (e) => {
            try {
                const data = e.target?.result;
                const wb = XLSX.read(data, { type: 'array' });

                const timetableSheet = wb.Sheets['Timetable'];
                if (!timetableSheet) {
                    throw new Error('Timetable sheet not found');
                }

                // Extract metadata from row 4 (B4, D4, F4, H4)
                const metadata: TimetableMetadata = {
                    branch: timetableSheet['B4']?.v || '',
                    section: timetableSheet['D4']?.v || '',
                    semester: 0, // Will be derived from title or set manually
                    classIncharge: timetableSheet['F4']?.v || '',
                    roomNo: timetableSheet['H4']?.v || '',
                    academicYear: '2025-2026',
                    batch: '2023-2027',
                };

                // Extract timetable entries (rows 7-12, columns B,C,E,F,H,I,K,L)
                // Skip BREAK columns (D, G, J)
                const entries: TimetableEntry[] = [];
                const periodColumns = ['B', 'C', 'E', 'F', 'H', 'I', 'K', 'L']; // P1-P8

                DAYS.forEach((day, dayIndex) => {
                    const rowNum = 7 + dayIndex;
                    periodColumns.forEach((col, periodIndex) => {
                        const cellRef = `${col}${rowNum}`;
                        const cellValue = timetableSheet[cellRef]?.v;

                        if (cellValue && cellValue.toString().trim()) {
                            entries.push({
                                day,
                                period: periodIndex + 1,
                                subjectCode: cellValue.toString().trim(),
                            });
                        }
                    });
                });

                // Parse Sheet 2: Subject Mapping
                const mappingSheet = wb.Sheets['Subject Mapping'];
                const subjects: SubjectMapping[] = [];

                if (mappingSheet) {
                    let row = 3; // Start from row 3 (skip header and instructions)
                    while (row < 100) {
                        const code = mappingSheet[`A${row}`]?.v;
                        if (!code || code.toString().startsWith('Example:')) {
                            row++;
                            continue;
                        }

                        const name = mappingSheet[`B${row}`]?.v?.toString() || '';
                        const faculty = mappingSheet[`C${row}`]?.v?.toString() || '';
                        const type = (mappingSheet[`D${row}`]?.v?.toString() || 'theory') as any;

                        if (name) {
                            subjects.push({
                                code: code.toString().trim(),
                                name,
                                faculty,
                                type,
                            });
                        }

                        row++;
                    }
                }

                resolve({ metadata, entries, subjects });
            } catch (error) {
                reject(error);
            }
        };

        reader.onerror = () => reject(new Error('Failed to read file'));
        reader.readAsArrayBuffer(file);
    });
}

/**
 * Download template file
 */
export function downloadTimetableTemplate() {
    const blob = generateTimetableTemplate();
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `NRIIT_Timetable_Template_${new Date().toISOString().split('T')[0]}.xlsx`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
}
