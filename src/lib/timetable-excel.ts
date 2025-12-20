// Timetable Excel Upload Utility
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
 * Generate Excel template for timetable upload
 */
export function generateTimetableTemplate(): Blob {
    const wb = XLSX.utils.book_new();

    // Sheet 1: Timetable Grid
    const gridData = [
        ['NRIIT Timetable Template', '', '', '', '', '', '', '', ''],
        ['Academic Year: 2025-2026', '', '', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '', '', ''],
        ['Branch:', '', 'Section:', '', 'Semester:', '', 'Class Incharge:', '', 'Room No:'],
        ['', '', '', '', '', '', '', '', ''],
        ['Day/Period', 'P1\n9:00-9:50', 'P2\n9:50-10:40', 'P3\n10:50-11:40', 'P4\n11:40-12:30',
            'P5\n1:10-2:00', 'P6\n2:00-2:50', 'P7\n3:00-3:40', 'P8\n3:40-4:20'],
        ...DAYS.map(day => [day, '', '', '', '', '', '', '', '']),
    ];

    const ws1 = XLSX.utils.aoa_to_sheet(gridData);

    // Set column widths
    ws1['!cols'] = [
        { wch: 12 }, // Day
        { wch: 12 }, { wch: 12 }, { wch: 12 }, { wch: 12 },
        { wch: 12 }, { wch: 12 }, { wch: 12 }, { wch: 12 }
    ];

    XLSX.utils.book_append_sheet(wb, ws1, 'Timetable');

    // Sheet 2: Subject Mapping
    const mappingData = [
        ['Subject Code', 'Subject Name', 'Faculty Name', 'Type'],
        ['Example: SUB1', 'Operating Systems', 'Dr. A. Kumar', 'theory'],
        ['Example: LAB1', 'Deep Learning Lab', 'Dr. B. Sharma', 'lab'],
        ['COUN', 'Counseling', '-', 'special'],
        ['LIB', 'Library', '-', 'special'],
        ['TS', 'Telangana Studies', '-', 'special'],
        ['M/C', 'Moral & Cultural', '-', 'special'],
    ];

    const ws2 = XLSX.utils.aoa_to_sheet(mappingData);
    ws2['!cols'] = [{ wch: 15 }, { wch: 30 }, { wch: 20 }, { wch: 10 }];
    XLSX.utils.book_append_sheet(wb, ws2, 'Subject Mapping');

    // Sheet 3: Instructions
    const instructions = [
        ['NRIIT Timetable Upload Instructions'],
        [''],
        ['Step 1: Fill Metadata (Sheet 1, Row 4)'],
        ['- Enter Branch (e.g., CSE, IT, ECE)'],
        ['- Enter Section (e.g., A, B, C)'],
        ['- Enter Semester (1-8)'],
        ['- Enter Class Incharge name'],
        ['- Enter Room Number'],
        [''],
        ['Step 2: Fill Timetable Grid (Sheet 1, Rows 6-11)'],
        ['- Enter subject codes in each cell'],
        ['- Use codes from Subject Mapping sheet'],
        ['- Leave blank for free periods'],
        [''],
        ['Step 3: Define Subjects (Sheet 2)'],
        ['- Add all subject codes used in timetable'],
        ['- Provide full subject name'],
        ['- Assign faculty name'],
        ['- Specify type: theory, lab, or special'],
        [''],
        ['Step 4: Upload'],
        ['- Save this file'],
        ['- Go to Dean Dashboard → Timetable Management'],
        ['- Click "Upload Timetable"'],
        ['- Select this file'],
        ['- Review preview and confirm'],
    ];

    const ws3 = XLSX.utils.aoa_to_sheet(instructions);
    ws3['!cols'] = [{ wch: 60 }];
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

                // Parse Sheet 1: Timetable Grid
                const timetableSheet = wb.Sheets['Timetable'];
                if (!timetableSheet) {
                    throw new Error('Timetable sheet not found');
                }

                // Extract metadata from row 4
                const metadata: TimetableMetadata = {
                    branch: timetableSheet['B4']?.v || '',
                    section: timetableSheet['D4']?.v || '',
                    semester: parseInt(timetableSheet['F4']?.v) || 0,
                    classIncharge: timetableSheet['H4']?.v || '',
                    roomNo: timetableSheet['I4']?.v || '',
                    academicYear: '2025-2026',
                    batch: '2023-2027',
                };

                // Extract timetable entries (rows 6-11, cols B-I)
                const entries: TimetableEntry[] = [];
                DAYS.forEach((day, dayIndex) => {
                    const rowNum = 7 + dayIndex; // Row 7 = Monday, 8 = Tuesday, etc.
                    PERIODS.forEach((period, periodIndex) => {
                        const colLetter = String.fromCharCode(66 + periodIndex); // B, C, D, ...
                        const cellRef = `${colLetter}${rowNum}`;
                        const cellValue = timetableSheet[cellRef]?.v;

                        if (cellValue && cellValue.toString().trim()) {
                            entries.push({
                                day,
                                period,
                                subjectCode: cellValue.toString().trim(),
                            });
                        }
                    });
                });

                // Parse Sheet 2: Subject Mapping
                const mappingSheet = wb.Sheets['Subject Mapping'];
                const subjects: SubjectMapping[] = [];

                if (mappingSheet) {
                    let row = 2; // Start from row 2 (skip header)
                    while (true) {
                        const code = mappingSheet[`A${row}`]?.v;
                        if (!code || code.toString().startsWith('Example:')) {
                            row++;
                            if (row > 100) break; // Safety limit
                            continue;
                        }

                        subjects.push({
                            code: code.toString().trim(),
                            name: mappingSheet[`B${row}`]?.v?.toString() || '',
                            faculty: mappingSheet[`C${row}`]?.v?.toString() || '',
                            type: (mappingSheet[`D${row}`]?.v?.toString() || 'theory') as any,
                        });

                        row++;
                        if (row > 100) break; // Safety limit
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
