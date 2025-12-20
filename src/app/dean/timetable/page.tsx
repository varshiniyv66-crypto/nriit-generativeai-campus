"use client";

import { useState, useCallback } from "react";
import {
    Calendar,
    Upload,
    Download,
    FileSpreadsheet,
    CheckCircle2,
    AlertCircle,
    Loader2,
    Building2,
    Users,
    Clock,
    Trash2,
    Eye,
    ChevronDown,
    Table,
    FileText
} from "lucide-react";
import { toast } from "sonner";
import { DEPARTMENTS } from "@/lib/constants";

// Types for timetable upload
interface TimetableEntry {
    employee_id: string;
    faculty_name?: string;
    course_code: string;
    course_name?: string;
    dept_code: string;
    semester: number;
    section: string;
    day: string;
    period: number;
    room?: string;
    isValid: boolean;
    errors?: string[];
}

interface FacultyMapping {
    subject: string;
    faculty_name: string;
}

interface UploadSummary {
    total: number;
    valid: number;
    warnings: number;
    errors: number;
}

// Period mapping from time to period number
const TIME_TO_PERIOD: Record<string, number> = {
    "9:00": 1, "09:00": 1,
    "9:50": 2, "09:50": 2,
    "10:50": 3,
    "11:40": 4,
    "1:10": 5, "13:10": 5, "13:30": 5,
    "2:00": 6, "14:00": 6, "14:20": 6,
    "3:00": 7, "15:00": 7, "15:20": 7,
    "3:40": 8, "15:40": 8, "16:10": 8,
};

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

export default function DeanTimetablePage() {
    const [selectedDept, setSelectedDept] = useState<string>("");
    const [academicYear, setAcademicYear] = useState<string>("2024-25");
    const [semester, setSemester] = useState<number>(3);
    const [section, setSection] = useState<string>("A");
    const [entries, setEntries] = useState<TimetableEntry[]>([]);
    const [isUploading, setIsUploading] = useState(false);
    const [isProcessing, setIsProcessing] = useState(false);
    const [dragActive, setDragActive] = useState(false);
    const [uploadSummary, setUploadSummary] = useState<UploadSummary | null>(null);
    const [showPreview, setShowPreview] = useState(false);
    const [uploadFormat, setUploadFormat] = useState<'csv' | 'grid'>('csv');

    // For grid format
    const [gridData, setGridData] = useState<string[][]>([]);
    const [facultyMappings, setFacultyMappings] = useState<FacultyMapping[]>([]);

    const departments = Object.entries(DEPARTMENTS).map(([code, info]) => ({
        code,
        name: info.name
    }));

    // Parse CSV format
    const parseCSVFormat = (text: string): TimetableEntry[] => {
        const lines = text.trim().split('\n');
        const headers = lines[0].split(',').map(h => h.trim().toLowerCase());

        const entries: TimetableEntry[] = [];

        for (let i = 1; i < lines.length; i++) {
            const values = lines[i].split(',').map(v => v.trim());
            const entry: any = {};

            headers.forEach((header, idx) => {
                entry[header] = values[idx] || '';
            });

            const timetableEntry: TimetableEntry = {
                employee_id: entry.employee_id || '',
                faculty_name: entry.faculty_name || '',
                course_code: entry.course_code || '',
                course_name: entry.course_name || '',
                dept_code: entry.dept_code || selectedDept,
                semester: parseInt(entry.semester) || semester,
                section: entry.section || section,
                day: entry.day || '',
                period: parseInt(entry.period) || 0,
                room: entry.room || '',
                isValid: true,
                errors: [],
            };

            // Validation
            if (!timetableEntry.employee_id) {
                timetableEntry.isValid = false;
                timetableEntry.errors?.push('Missing employee_id');
            }
            if (!timetableEntry.course_code) {
                timetableEntry.isValid = false;
                timetableEntry.errors?.push('Missing course_code');
            }
            if (!timetableEntry.day || !DAYS.includes(timetableEntry.day)) {
                timetableEntry.isValid = false;
                timetableEntry.errors?.push('Invalid day');
            }
            if (timetableEntry.period < 1 || timetableEntry.period > 8) {
                timetableEntry.isValid = false;
                timetableEntry.errors?.push('Invalid period (must be 1-8)');
            }

            entries.push(timetableEntry);
        }

        return entries;
    };

    // Parse NRIIT Grid format (Day x Period grid + Faculty mapping)
    const parseGridFormat = (text: string): TimetableEntry[] => {
        const lines = text.trim().split('\n');
        const entries: TimetableEntry[] = [];

        // Find the grid section and faculty mapping section
        let currentSection: 'grid' | 'faculty' | null = null;
        let gridStartRow = -1;
        let facultyStartRow = -1;

        // Parse to find sections
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i].toLowerCase();
            if (line.includes('day') && line.includes('hours')) {
                gridStartRow = i;
                currentSection = 'grid';
            }
            if (line.includes('subject') && line.includes('faculty')) {
                facultyStartRow = i;
                currentSection = 'faculty';
            }
        }

        // Extract faculty mappings
        const facultyMap: Record<string, string> = {};
        if (facultyStartRow >= 0) {
            for (let i = facultyStartRow + 1; i < lines.length; i++) {
                const parts = lines[i].split('|').map(p => p.trim()).filter(p => p);
                if (parts.length >= 2) {
                    const subject = parts[0].toLowerCase().replace(/[^a-z0-9]/g, '');
                    facultyMap[subject] = parts[1];
                }
            }
        }

        // Extract grid data
        if (gridStartRow >= 0) {
            // Parse header row to get period positions
            const headerLine = lines[gridStartRow];
            const headerParts = headerLine.split('|').map(p => p.trim());

            // Parse each day
            for (let i = gridStartRow + 1; i < lines.length; i++) {
                const line = lines[i];
                if (line.includes('SUBJECT') || line.includes('Faculty')) break;

                const parts = line.split('|').map(p => p.trim());
                if (parts.length < 2) continue;

                const day = parts[0];
                if (!DAYS.some(d => day.toLowerCase().includes(d.toLowerCase()))) continue;

                const matchedDay = DAYS.find(d => day.toLowerCase().includes(d.toLowerCase())) || day;

                // Parse each period
                let periodNum = 1;
                for (let j = 1; j < parts.length && periodNum <= 8; j++) {
                    const subject = parts[j].trim();
                    if (!subject || subject.toLowerCase() === 'break' || subject.toLowerCase() === 'lunch') {
                        continue;
                    }
                    if (subject.toLowerCase() === 'library' || subject.toLowerCase() === 'sports' || subject.toLowerCase() === 'crt') {
                        periodNum++;
                        continue;
                    }

                    // Find faculty for this subject
                    const subjectKey = subject.toLowerCase().replace(/[^a-z0-9]/g, '');
                    const facultyName = facultyMap[subjectKey] || 'Unknown Faculty';

                    // Create entry
                    entries.push({
                        employee_id: 'AUTO_' + subjectKey,
                        faculty_name: facultyName,
                        course_code: subject.split(' ')[0] || subject,
                        course_name: subject,
                        dept_code: selectedDept,
                        semester: semester,
                        section: section,
                        day: matchedDay,
                        period: periodNum,
                        room: `${selectedDept}-${semester}01`,
                        isValid: true,
                        errors: facultyName === 'Unknown Faculty' ? ['Faculty mapping not found'] : undefined,
                    });

                    periodNum++;
                }
            }
        }

        return entries;
    };

    // Handle file drop
    const handleDrag = useCallback((e: React.DragEvent) => {
        e.preventDefault();
        e.stopPropagation();
        if (e.type === "dragenter" || e.type === "dragover") {
            setDragActive(true);
        } else if (e.type === "dragleave") {
            setDragActive(false);
        }
    }, []);

    const handleDrop = useCallback((e: React.DragEvent) => {
        e.preventDefault();
        e.stopPropagation();
        setDragActive(false);

        if (e.dataTransfer.files && e.dataTransfer.files[0]) {
            handleFile(e.dataTransfer.files[0]);
        }
    }, [selectedDept, semester, section, uploadFormat]);

    const handleFileInput = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files && e.target.files[0]) {
            handleFile(e.target.files[0]);
        }
    };

    const handleFile = async (file: File) => {
        if (!selectedDept) {
            toast.error("Please select a department first");
            return;
        }

        setIsProcessing(true);
        toast.info(`Processing ${file.name}...`);

        try {
            const text = await file.text();
            let parsedEntries: TimetableEntry[] = [];

            // Detect format
            if (text.includes('employee_id') && text.includes(',')) {
                // CSV format
                parsedEntries = parseCSVFormat(text);
            } else if (text.includes('Day') || text.includes('Monday') || text.includes('SUBJECT')) {
                // Grid format
                parsedEntries = parseGridFormat(text);
            } else {
                // Try CSV anyway
                parsedEntries = parseCSVFormat(text);
            }

            // Override dept/semester/section if not in file
            parsedEntries = parsedEntries.map(e => ({
                ...e,
                dept_code: e.dept_code || selectedDept,
                semester: e.semester || semester,
                section: e.section || section,
            }));

            setEntries(parsedEntries);
            setUploadSummary({
                total: parsedEntries.length,
                valid: parsedEntries.filter(e => e.isValid && (!e.errors || e.errors.length === 0)).length,
                warnings: parsedEntries.filter(e => e.isValid && e.errors && e.errors.length > 0).length,
                errors: parsedEntries.filter(e => !e.isValid).length,
            });
            setShowPreview(true);
            toast.success(`Parsed ${parsedEntries.length} entries from ${file.name}`);
        } catch (error) {
            console.error("Error parsing file:", error);
            toast.error("Failed to parse file. Please check the format.");
        } finally {
            setIsProcessing(false);
        }
    };

    const handleUpload = async () => {
        if (!selectedDept || entries.length === 0) {
            toast.error("No data to upload");
            return;
        }

        const validEntries = entries.filter(e => e.isValid);
        if (validEntries.length === 0) {
            toast.error("No valid entries to upload");
            return;
        }

        setIsUploading(true);

        try {
            const response = await fetch('/api/dean/timetable', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    dept_code: selectedDept,
                    academic_year: academicYear,
                    entries: validEntries,
                }),
            });

            if (response.ok) {
                const result = await response.json();
                toast.success(`Successfully uploaded ${validEntries.length} timetable entries!`);

                setEntries([]);
                setUploadSummary(null);
                setShowPreview(false);
            } else {
                const error = await response.json();
                toast.error(error.message || "Failed to upload timetable");
            }
        } catch (error) {
            console.error("Upload error:", error);
            toast.error("Failed to upload timetable. Please try again.");
        } finally {
            setIsUploading(false);
        }
    };

    const downloadTemplate = () => {
        const headers = "employee_id,faculty_name,course_code,course_name,dept_code,semester,section,day,period,room";
        const sampleRow = `FAC001,Dr. A. Kumar,${selectedDept}301,Sample Course,${selectedDept},${semester},${section},Monday,1,${selectedDept}-301`;
        const content = `${headers}\n${sampleRow}`;

        const blob = new Blob([content], { type: 'text/csv' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `timetable_template_${selectedDept || 'dept'}_sem${semester}.csv`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);

        toast.success("Template downloaded!");
    };

    return (
        <div className="space-y-6">
            {/* Header */}
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div>
                    <h1 className="text-2xl font-bold text-white flex items-center gap-3">
                        <Calendar className="w-7 h-7 text-indigo-400" />
                        Timetable Management
                    </h1>
                    <p className="text-slate-400 mt-1">
                        Upload department timetables (supports CSV and Grid formats)
                    </p>
                </div>
                <div className="flex items-center gap-3">
                    <button
                        onClick={downloadTemplate}
                        disabled={!selectedDept}
                        className="flex items-center gap-2 px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-200 rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                        <Download className="w-4 h-4" />
                        Download Template
                    </button>
                </div>
            </div>

            {/* Configuration Section */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                {/* Department Selector */}
                <div className="bg-slate-900/50 border border-slate-800 rounded-xl p-4">
                    <label className="block text-sm font-medium text-slate-300 mb-2">
                        <Building2 className="w-4 h-4 inline mr-2" />
                        Department
                    </label>
                    <div className="relative">
                        <select
                            value={selectedDept}
                            onChange={(e) => setSelectedDept(e.target.value)}
                            className="w-full bg-slate-800 border border-slate-700 rounded-lg px-3 py-2 text-white appearance-none cursor-pointer focus:ring-2 focus:ring-indigo-500 focus:border-transparent text-sm"
                        >
                            <option value="">Select Dept</option>
                            {departments.map(dept => (
                                <option key={dept.code} value={dept.code}>
                                    {dept.code}
                                </option>
                            ))}
                        </select>
                        <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                    </div>
                </div>

                {/* Semester */}
                <div className="bg-slate-900/50 border border-slate-800 rounded-xl p-4">
                    <label className="block text-sm font-medium text-slate-300 mb-2">
                        <FileText className="w-4 h-4 inline mr-2" />
                        Semester
                    </label>
                    <div className="relative">
                        <select
                            value={semester}
                            onChange={(e) => setSemester(parseInt(e.target.value))}
                            className="w-full bg-slate-800 border border-slate-700 rounded-lg px-3 py-2 text-white appearance-none cursor-pointer focus:ring-2 focus:ring-indigo-500 focus:border-transparent text-sm"
                        >
                            {[1, 2, 3, 4, 5, 6, 7, 8].map(s => (
                                <option key={s} value={s}>Semester {s}</option>
                            ))}
                        </select>
                        <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                    </div>
                </div>

                {/* Section */}
                <div className="bg-slate-900/50 border border-slate-800 rounded-xl p-4">
                    <label className="block text-sm font-medium text-slate-300 mb-2">
                        <Users className="w-4 h-4 inline mr-2" />
                        Section
                    </label>
                    <div className="relative">
                        <select
                            value={section}
                            onChange={(e) => setSection(e.target.value)}
                            className="w-full bg-slate-800 border border-slate-700 rounded-lg px-3 py-2 text-white appearance-none cursor-pointer focus:ring-2 focus:ring-indigo-500 focus:border-transparent text-sm"
                        >
                            {['A', 'B', 'C', 'D'].map(s => (
                                <option key={s} value={s}>Section {s}</option>
                            ))}
                        </select>
                        <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                    </div>
                </div>

                {/* Academic Year */}
                <div className="bg-slate-900/50 border border-slate-800 rounded-xl p-4">
                    <label className="block text-sm font-medium text-slate-300 mb-2">
                        <Clock className="w-4 h-4 inline mr-2" />
                        Academic Year
                    </label>
                    <div className="relative">
                        <select
                            value={academicYear}
                            onChange={(e) => setAcademicYear(e.target.value)}
                            className="w-full bg-slate-800 border border-slate-700 rounded-lg px-3 py-2 text-white appearance-none cursor-pointer focus:ring-2 focus:ring-indigo-500 focus:border-transparent text-sm"
                        >
                            <option value="2024-25">2024-25</option>
                            <option value="2023-24">2023-24</option>
                            <option value="2025-26">2025-26</option>
                        </select>
                        <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                    </div>
                </div>
            </div>

            {/* Supported Formats Info */}
            <div className="bg-indigo-900/20 border border-indigo-800/50 rounded-xl p-4">
                <h3 className="text-indigo-300 font-medium mb-2 flex items-center gap-2">
                    <Table className="w-5 h-5" />
                    Supported Timetable Formats
                </h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                    <div className="text-slate-300">
                        <p className="font-medium text-indigo-400">📊 CSV Format (Recommended)</p>
                        <p className="text-slate-400">Standard CSV with columns: employee_id, faculty_name, course_code, day, period, etc.</p>
                    </div>
                    <div className="text-slate-300">
                        <p className="font-medium text-indigo-400">📋 Grid Format (NRIIT Style)</p>
                        <p className="text-slate-400">Day x Period grid with Subject-Faculty mapping table at bottom.</p>
                    </div>
                </div>
            </div>

            {/* Upload Section */}
            <div className="bg-slate-900/50 border border-slate-800 rounded-xl p-6">
                <h2 className="text-lg font-semibold text-white mb-4 flex items-center gap-2">
                    <Upload className="w-5 h-5 text-indigo-400" />
                    Upload Timetable File
                </h2>

                {/* Drag & Drop Zone */}
                <div
                    onDragEnter={handleDrag}
                    onDragLeave={handleDrag}
                    onDragOver={handleDrag}
                    onDrop={handleDrop}
                    className={`
                        relative border-2 border-dashed rounded-xl p-8 text-center transition-all
                        ${dragActive
                            ? 'border-indigo-500 bg-indigo-500/10'
                            : 'border-slate-700 hover:border-slate-600 bg-slate-800/30'
                        }
                        ${!selectedDept ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer'}
                    `}
                >
                    <input
                        type="file"
                        accept=".csv,.txt,.xlsx,.xls"
                        onChange={handleFileInput}
                        disabled={!selectedDept || isProcessing}
                        className="absolute inset-0 w-full h-full opacity-0 cursor-pointer disabled:cursor-not-allowed"
                    />

                    {isProcessing ? (
                        <div className="flex flex-col items-center gap-3">
                            <Loader2 className="w-10 h-10 text-indigo-400 animate-spin" />
                            <p className="text-slate-300">Processing file...</p>
                        </div>
                    ) : (
                        <div className="flex flex-col items-center gap-3">
                            <FileSpreadsheet className="w-12 h-12 text-slate-500" />
                            <div>
                                <p className="text-slate-300 font-medium">
                                    Drop timetable file here
                                </p>
                                <p className="text-slate-500 text-sm mt-1">
                                    Supports CSV, TXT (grid format)
                                </p>
                            </div>
                        </div>
                    )}
                </div>

                {!selectedDept && (
                    <p className="text-amber-500 text-sm mt-3 flex items-center gap-2">
                        <AlertCircle className="w-4 h-4" />
                        Please select department, semester, and section first
                    </p>
                )}
            </div>

            {/* Preview Section */}
            {showPreview && entries.length > 0 && (
                <div className="bg-slate-900/50 border border-slate-800 rounded-xl overflow-hidden">
                    {/* Summary Header */}
                    <div className="p-6 border-b border-slate-800">
                        <div className="flex items-center justify-between">
                            <h2 className="text-lg font-semibold text-white flex items-center gap-2">
                                <Eye className="w-5 h-5 text-indigo-400" />
                                Preview: {selectedDept} Sem-{semester} Section-{section} ({uploadSummary?.total} entries)
                            </h2>
                            <button
                                onClick={() => {
                                    setEntries([]);
                                    setUploadSummary(null);
                                    setShowPreview(false);
                                }}
                                className="text-slate-400 hover:text-red-400 transition-colors"
                            >
                                <Trash2 className="w-5 h-5" />
                            </button>
                        </div>

                        {/* Summary Stats */}
                        {uploadSummary && (
                            <div className="grid grid-cols-3 gap-4 mt-4">
                                <div className="bg-emerald-500/10 border border-emerald-500/30 rounded-lg p-3 text-center">
                                    <CheckCircle2 className="w-5 h-5 text-emerald-400 mx-auto mb-1" />
                                    <p className="text-2xl font-bold text-emerald-400">{uploadSummary.valid}</p>
                                    <p className="text-xs text-emerald-400/70">Valid</p>
                                </div>
                                <div className="bg-amber-500/10 border border-amber-500/30 rounded-lg p-3 text-center">
                                    <AlertCircle className="w-5 h-5 text-amber-400 mx-auto mb-1" />
                                    <p className="text-2xl font-bold text-amber-400">{uploadSummary.warnings}</p>
                                    <p className="text-xs text-amber-400/70">Warnings</p>
                                </div>
                                <div className="bg-red-500/10 border border-red-500/30 rounded-lg p-3 text-center">
                                    <AlertCircle className="w-5 h-5 text-red-400 mx-auto mb-1" />
                                    <p className="text-2xl font-bold text-red-400">{uploadSummary.errors}</p>
                                    <p className="text-xs text-red-400/70">Errors</p>
                                </div>
                            </div>
                        )}
                    </div>

                    {/* Entries Table */}
                    <div className="overflow-x-auto max-h-96">
                        <table className="w-full text-sm">
                            <thead className="bg-slate-800/50 sticky top-0">
                                <tr className="text-slate-400 text-left">
                                    <th className="px-4 py-3">Status</th>
                                    <th className="px-4 py-3">Faculty</th>
                                    <th className="px-4 py-3">Course</th>
                                    <th className="px-4 py-3">Day</th>
                                    <th className="px-4 py-3">Period</th>
                                    <th className="px-4 py-3">Room</th>
                                </tr>
                            </thead>
                            <tbody>
                                {entries.slice(0, 100).map((entry, idx) => (
                                    <tr
                                        key={idx}
                                        className={`
                                            border-t border-slate-800/50 
                                            ${entry.isValid ? 'text-slate-300' : 'text-red-400 bg-red-500/5'}
                                        `}
                                    >
                                        <td className="px-4 py-2">
                                            {entry.isValid ? (
                                                entry.errors && entry.errors.length > 0 ? (
                                                    <span title={entry.errors.join(', ')}><AlertCircle className="w-4 h-4 text-amber-400" /></span>
                                                ) : (
                                                    <CheckCircle2 className="w-4 h-4 text-emerald-400" />
                                                )
                                            ) : (
                                                <span title={entry.errors?.join(', ')}><AlertCircle className="w-4 h-4 text-red-400" /></span>
                                            )}
                                        </td>
                                        <td className="px-4 py-2">
                                            <div>
                                                <p className="font-medium">{entry.faculty_name || 'Unknown'}</p>
                                                <p className="text-xs text-slate-500">{entry.employee_id}</p>
                                            </div>
                                        </td>
                                        <td className="px-4 py-2">
                                            <div>
                                                <p className="font-medium">{entry.course_code}</p>
                                                <p className="text-xs text-slate-500">{entry.course_name}</p>
                                            </div>
                                        </td>
                                        <td className="px-4 py-2">{entry.day}</td>
                                        <td className="px-4 py-2">{entry.period}</td>
                                        <td className="px-4 py-2">{entry.room || '-'}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                        {entries.length > 100 && (
                            <p className="text-center text-slate-500 py-3">
                                Showing 100 of {entries.length} entries...
                            </p>
                        )}
                    </div>

                    {/* Action Buttons */}
                    <div className="p-6 border-t border-slate-800 flex justify-end gap-3">
                        <button
                            onClick={() => {
                                setEntries([]);
                                setUploadSummary(null);
                                setShowPreview(false);
                            }}
                            className="px-6 py-2.5 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-lg transition-colors"
                        >
                            Cancel
                        </button>
                        <button
                            onClick={handleUpload}
                            disabled={isUploading || (uploadSummary?.valid || 0) === 0}
                            className="flex items-center gap-2 px-6 py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                        >
                            {isUploading ? (
                                <>
                                    <Loader2 className="w-4 h-4 animate-spin" />
                                    Uploading...
                                </>
                            ) : (
                                <>
                                    <Upload className="w-4 h-4" />
                                    Upload {uploadSummary?.valid || 0} Entries
                                </>
                            )}
                        </button>
                    </div>
                </div>
            )}

            {/* Quick Guide */}
            <div className="bg-slate-900/50 border border-slate-800 rounded-xl p-6">
                <h3 className="text-white font-medium mb-3">📋 Quick Guide</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-slate-400">
                    <div>
                        <p className="text-indigo-400 font-medium mb-1">For CSV Format:</p>
                        <ol className="list-decimal list-inside space-y-1">
                            <li>Select department, semester, section</li>
                            <li>Download template</li>
                            <li>Fill in faculty assignments</li>
                            <li>Upload and confirm</li>
                        </ol>
                    </div>
                    <div>
                        <p className="text-indigo-400 font-medium mb-1">For Grid Format:</p>
                        <ol className="list-decimal list-inside space-y-1">
                            <li>Copy timetable from Word/Excel</li>
                            <li>Paste into text file (.txt)</li>
                            <li>Include Subject-Faculty mapping</li>
                            <li>Upload the text file</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    );
}
