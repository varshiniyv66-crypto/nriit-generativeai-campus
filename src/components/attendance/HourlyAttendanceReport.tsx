"use client";

import { useState, useEffect } from "react";
import * as XLSX from "xlsx";
import {
    Upload,
    FileSpreadsheet,
    CheckCircle2,
    ArrowLeft,
    Calendar as CalendarIcon,
    AlertCircle,
    Sun,
    Moon,
    Clock,
    UserX,
    Filter,
    RefreshCw
} from "lucide-react";
import Link from "next/link";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { fetchAttendanceCsv } from "@/app/actions/attendance";

// Types
type AbsentStatus = 'Full Day' | 'Forenoon' | 'Afternoon' | 'Partial';

interface DailyAbsentee {
    rollNumber: string;
    name: string;
    absentPeriods: number[];
    status: AbsentStatus;
    counselingNote: string;
}

interface HourlyAttendanceReportProps {
    classId: string;
    backLink: string;
    titlePrefix?: string;
}

export default function HourlyAttendanceReport({ classId, backLink, titlePrefix = "" }: HourlyAttendanceReportProps) {
    const [file, setFile] = useState<File | null>(null);
    const [loading, setLoading] = useState(false);
    const [parsing, setParsing] = useState(false); // Kept for manual upload compatibility
    const [activeTab, setActiveTab] = useState<"counseling" | "daily" | "register">("counseling");

    // Data State
    const [excelData, setExcelData] = useState<any[]>([]);
    const [absentees, setAbsentees] = useState<DailyAbsentee[]>([]);
    const [selectedDate, setSelectedDate] = useState<string>("");
    const [availableDates, setAvailableDates] = useState<string[]>([]);

    // Stats
    const [stats, setStats] = useState({
        fullDay: 0,
        forenoon: 0,
        afternoon: 0,
        partial: 0
    });

    // State for Date Filtering
    const [dateHierarchy, setDateHierarchy] = useState<Record<string, Record<string, string[]>>>({});
    const [selectedYear, setSelectedYear] = useState<string>("");
    const [selectedMonth, setSelectedMonth] = useState<string>("");

    // Initialize Data from Server
    useEffect(() => {
        loadLiveAttendance();
    }, [classId]);

    const loadLiveAttendance = async () => {
        setLoading(true);
        try {
            const result = await fetchAttendanceCsv(classId);
            if (result.success && result.data) {
                // Parse CSV string
                parseCsvData(result.data);
            }
        } catch (err) {
            console.error("Auto-fetch failed", err);
        } finally {
            setLoading(false);
        }
    };

    const parseCsvData = (csvText: string) => {
        const workbook = XLSX.read(csvText, { type: 'string' });
        const sheetName = workbook.SheetNames[0];
        const sheet = workbook.Sheets[sheetName];
        const jsonData = XLSX.utils.sheet_to_json(sheet, { header: 1, defval: "" }) as any[][];

        setExcelData(jsonData);
        processExcelData(jsonData);
    };

    // Excel Serial Date Converter
    const excelDateToJSDate = (serial: number) => {
        const utc_days = Math.floor(serial - 25569);
        const utc_value = utc_days * 86400;
        const date_info = new Date(utc_value * 1000);
        // Force strict DD/MM/YYYY format
        const day = date_info.getDate().toString().padStart(2, '0');
        const month = (date_info.getMonth() + 1).toString().padStart(2, '0');
        const year = date_info.getFullYear();
        return `${day}/${month}/${year}`;
    };

    const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const uploadedFile = e.target.files?.[0];
        if (!uploadedFile) return;

        setFile(uploadedFile);
        setParsing(true);
        setAbsentees([]);

        try {
            const arrayBuffer = await uploadedFile.arrayBuffer();
            const workbook = XLSX.read(arrayBuffer);
            const sheetName = workbook.SheetNames[0];
            const sheet = workbook.Sheets[sheetName];
            // Get raw data as array of arrays
            const jsonData = XLSX.utils.sheet_to_json(sheet, { header: 1, defval: "" }) as any[][];

            setExcelData(jsonData);
            processExcelData(jsonData);
        } catch (err) {
            console.error("Parsing Error:", err);
            alert("Failed to parse Excel file. Please ensure it fits the standard format.");
        } finally {
            setParsing(false);
        }
    };

    // Group dates by Year -> Month
    const groupDates = (dates: string[]) => {
        const groups: Record<string, Record<string, string[]>> = {};

        dates.forEach(dateStr => {
            const parts = dateStr.split(/[-/]/); // DD/MM/YYYY
            if (parts.length !== 3) return;

            const year = parts[2];
            const monthIndex = parseInt(parts[1]) - 1;
            const monthName = new Date(parseInt(year), monthIndex).toLocaleString('default', { month: 'long' });

            if (!groups[year]) groups[year] = {};
            if (!groups[year][monthName]) groups[year][monthName] = [];

            groups[year][monthName].push(dateStr);
        });

        return groups;
    };

    const processExcelData = async (data: any[][]) => {
        if (data.length < 5) return;

        const dateRowIndex = 1;
        const periodRowIndex = 2;

        let maxCol = 0;
        data.slice(0, 20).forEach(row => {
            if (row.length > maxCol) maxCol = row.length;
        });

        const dateRow = data[dateRowIndex] || [];
        const periodRow = data[periodRowIndex] || [];

        const dateMap: Record<number, string> = {};
        const uniqueDates = new Set<string>();
        const rawDateStrings: string[] = [];

        // 1. Collect all raw strings first to infer format
        for (let col = 1; col < maxCol; col++) {
            const rawDate = dateRow[col];
            if (typeof rawDate === 'string' && (rawDate.includes('/') || rawDate.includes('-'))) {
                rawDateStrings.push(rawDate);
            }
        }

        // 2. Infer Date Format (DD/MM vs MM/DD)
        // If we see any part[0] > 12, it MUST be DD/MM.
        // If we see any part[1] > 12, it MUST be MM/DD.
        let isDDMM = true; // Default to India/UK
        let formatDetected = false;

        for (const d of rawDateStrings) {
            const parts = d.split(/[-/]/);
            if (parts.length === 3) {
                const p0 = parseInt(parts[0]);
                const p1 = parseInt(parts[1]);

                if (p0 > 12) {
                    isDDMM = true;
                    formatDetected = true;
                    break;
                }
                if (p1 > 12) {
                    isDDMM = false;
                    formatDetected = true;
                    break;
                }
            }
        }

        // 3. Process Columns with inferred format
        for (let col = 1; col < maxCol; col++) {
            const rawDate = dateRow[col];
            let fmtDate = "";

            if (rawDate && typeof rawDate === 'number') {
                fmtDate = excelDateToJSDate(rawDate); // Returns DD/MM/YYYY
            } else if (rawDate && typeof rawDate === 'string' && (rawDate.includes('/') || rawDate.includes('-'))) {
                const parts = rawDate.split(/[-/]/);
                if (parts.length === 3) {
                    if (isDDMM) {
                        // Keep as DD/MM/YYYY
                        fmtDate = `${parts[0].padStart(2, '0')}/${parts[1].padStart(2, '0')}/${parts[2]}`;
                    } else {
                        // Convert MM/DD/YYYY -> DD/MM/YYYY
                        fmtDate = `${parts[1].padStart(2, '0')}/${parts[0].padStart(2, '0')}/${parts[2]}`;
                    }
                } else {
                    fmtDate = rawDate;
                }
            } else if (!rawDate && dateMap[col - 1]) {
                fmtDate = dateMap[col - 1]; // Propagate
            }

            if (fmtDate) {
                dateMap[col] = fmtDate;
                uniqueDates.add(fmtDate);
            }
        }

        const sortedDates = Array.from(uniqueDates).sort((a, b) => {
            const parseDate = (d: string) => {
                const parts = d.split(/[-/]/);
                if (parts.length !== 3) return 0;
                // Always parse as DD/MM/YYYY now because we normalized it above
                return new Date(parseInt(parts[2]), parseInt(parts[1]) - 1, parseInt(parts[0])).getTime();
            };
            return parseDate(b) - parseDate(a); // Descending
        });

        setAvailableDates(sortedDates);

        const hierarchy = groupDates(sortedDates);
        setDateHierarchy(hierarchy);

        // Auto-select latest VALID date (<= Today + 1 buffer) to avoid typos like Year 2026 in 2025
        if (sortedDates.length > 0) {
            const now = new Date();
            // Allow 1 day buffer for timezone diffs
            const limit = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 2).getTime();

            let bestDate = sortedDates[0];

            // Find first date <= limit
            for (const d of sortedDates) {
                const parts = d.split('/');
                const ts = new Date(parseInt(parts[2]), parseInt(parts[1]) - 1, parseInt(parts[0])).getTime();
                if (ts < limit) {
                    bestDate = d;
                    break;
                }
            }

            const parts = bestDate.split(/[-/]/);
            const year = parts[2];
            const monthName = new Date(parseInt(year), parseInt(parts[1]) - 1).toLocaleString('default', { month: 'long' });

            setSelectedYear(year);
            setSelectedMonth(monthName);
            analyzeDailyAbsentees(latestDate, data, dateMap, periodRow, maxCol);
        }
    };

    const determineStatus = (periods: number[]): { status: AbsentStatus, note: string } => {
        const fnPeriods = [1, 2, 3, 4];
        const anPeriods = [5, 6, 7];

        const missedFN = periods.filter(p => fnPeriods.includes(p));
        const missedAN = periods.filter(p => anPeriods.includes(p));

        const isSignificantFN = missedFN.length >= 3;
        const isSignificantAN = missedAN.length >= 2;

        if (isSignificantFN && isSignificantAN) {
            return { status: 'Full Day', note: 'Absent for entire day.' };
        }
        if (isSignificantFN) {
            return { status: 'Forenoon', note: 'Missed Morning Session.' };
        }
        if (isSignificantAN) {
            return { status: 'Afternoon', note: 'Missed Afternoon Session (Post-Lunch).' };
        }

        if (periods.length === 1 && periods[0] === 1) {
            return { status: 'Partial', note: 'Late Comer (Period 1 Absent).' };
        }

        return { status: 'Partial', note: `Bunking / Irregular (${periods.join(', ')})` };
    };

    const analyzeDailyAbsentees = async (
        targetDate: string,
        data: any[][],
        dateMap: Record<number, string>,
        periodRow: any[],
        maxCol: number
    ) => {
        setSelectedDate(targetDate);

        const dailyAbsentees: DailyAbsentee[] = [];
        const currentStats = { fullDay: 0, forenoon: 0, afternoon: 0, partial: 0 };

        // Auto-detect start row for students
        // Look for the first row where Column 0 matches a Roll Number pattern (e.g., "22KP...")
        let startRow = 5;
        for (let r = 3; r < data.length; r++) {
            const cell = data[r][0]?.toString() || "";
            // Simple check: contains numbers and letters, length > 5
            if (/[0-9]/.test(cell) && /[a-zA-Z]/.test(cell) && cell.length > 6) {
                startRow = r;
                break;
            }
        }

        for (let row = startRow; row < data.length; row++) {
            const rollNo = data[row][0]?.toString();
            // Try to get name from Column B (Index 1) if available, else placeholder
            const rawName = data[row][1]?.toString();
            const name = (rawName && rawName.length > 2) ? rawName : "Student " + rollNo;

            if (!rollNo || rollNo.length < 5) continue;

            const absentPeriods: number[] = [];

            for (let col = 1; col < maxCol; col++) {
                // Check if this column belongs to the selected date
                if (dateMap[col] === targetDate) {
                    const status = data[row][col]?.toString().toUpperCase();

                    if (status === 'A' || status === 'ABSENT' || status === 'ABS') {
                        let periods = periodRow[col]?.toString();
                        if (periods) {
                            const pList = periods.split(/[,&-]/).map((p: string) => parseInt(p.trim())).filter((n: number) => !isNaN(n));
                            absentPeriods.push(...pList);
                        }
                    }
                }
            }

            if (absentPeriods.length > 0) {
                const uniquePeriods = Array.from(new Set(absentPeriods)).sort((a, b) => a - b);
                const { status, note } = determineStatus(uniquePeriods);

                // Update Stats
                if (status === 'Full Day') currentStats.fullDay++;
                else if (status === 'Forenoon') currentStats.forenoon++;
                else if (status === 'Afternoon') currentStats.afternoon++;
                else currentStats.partial++;

                dailyAbsentees.push({
                    rollNumber: rollNo,
                    name: name,
                    absentPeriods: uniquePeriods,
                    status: status,
                    counselingNote: note
                });
            }
        }

        // Sort by severity
        dailyAbsentees.sort((a, b) => {
            const severity = { 'Full Day': 4, 'Forenoon': 3, 'Afternoon': 2, 'Partial': 1 };
            return severity[b.status] - severity[a.status];
        });

        setStats(currentStats);
        setAbsentees(dailyAbsentees);
    };

    return (
        <div className="max-w-7xl mx-auto space-y-6 pb-20">
            {/* Header with Navigation */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div className="flex items-center gap-4">
                    <Link href={backLink} className="p-2 hover:bg-gray-100 rounded-lg text-gray-600 transition-colors">
                        <ArrowLeft className="w-5 h-5" />
                    </Link>
                    <div>
                        <h1 className="text-2xl font-black text-gray-900 uppercase tracking-tight flex items-center gap-3">
                            {titlePrefix} {classId.replace(/-/g, ' ')}
                            <button
                                onClick={loadLiveAttendance}
                                disabled={loading}
                                className={`p-2 rounded-full hover:bg-gray-100 transition-all ${loading ? 'animate-spin text-blue-600' : 'text-gray-400 hover:text-blue-600'}`}
                                title="Refresh Live Data"
                            >
                                <RefreshCw className="w-5 h-5" />
                            </button>
                        </h1>
                        <p className="text-gray-500 font-medium">Hourly Attendance Counsel {loading && <span className="text-blue-600 ml-2 text-sm animate-pulse">Syncing...</span>}</p>
                    </div>
                </div>

                {/* Hierarchical Date Selector */}
                {excelData.length > 0 && (
                    <div className="flex flex-wrap items-center gap-2 bg-white p-1.5 rounded-xl border border-gray-200 shadow-sm">
                        <div className="px-3 py-1.5 bg-blue-50 rounded-lg">
                            <CalendarIcon className="w-4 h-4 text-blue-600" />
                        </div>

                        {/* Year Selector */}
                        <select
                            className="bg-transparent border-none text-gray-900 font-bold text-sm focus:ring-0 cursor-pointer outline-none"
                            value={selectedYear}
                            onChange={(e) => {
                                const yr = e.target.value;
                                setSelectedYear(yr);
                                // Default to first month of new year
                                const months = Object.keys(dateHierarchy[yr] || {});
                                if (months.length > 0) setSelectedMonth(months[0]);
                            }}
                        >
                            {Object.keys(dateHierarchy).sort((a, b) => b.localeCompare(a)).map(year => (
                                <option key={year} value={year}>{year}</option>
                            ))}
                        </select>

                        <span className="text-gray-300">/</span>

                        {/* Month Selector */}
                        <select
                            className="bg-transparent border-none text-gray-900 font-bold text-sm focus:ring-0 cursor-pointer outline-none min-w-[100px]"
                            value={selectedMonth}
                            onChange={(e) => setSelectedMonth(e.target.value)}
                        >
                            {selectedYear && dateHierarchy[selectedYear] && Object.keys(dateHierarchy[selectedYear]).map(month => (
                                <option key={month} value={month}>{month}</option>
                            ))}
                        </select>

                        <span className="text-gray-300">/</span>

                        {/* Date Selector */}
                        <select
                            className="bg-transparent border-none text-gray-900 font-bold text-sm focus:ring-0 cursor-pointer outline-none min-w-[100px]"
                            value={selectedDate}
                            onChange={(e) => {
                                const date = e.target.value;
                                // Re-run analysis for selected date
                                const dateRow = excelData[1];
                                const periodRow = excelData[2];

                                let maxCol = 0;
                                excelData.slice(0, 20).forEach(row => { if (row.length > maxCol) maxCol = row.length; });

                                const dateMap: Record<number, string> = {};
                                for (let col = 1; col < maxCol; col++) {
                                    const rawDate = dateRow[col];
                                    if (rawDate && typeof rawDate === 'number') {
                                        dateMap[col] = excelDateToJSDate(rawDate);
                                    } else if (rawDate && typeof rawDate === 'string' && (rawDate.includes('/') || rawDate.includes('-'))) {
                                        dateMap[col] = rawDate;
                                    } else if (!rawDate && dateMap[col - 1]) {
                                        dateMap[col] = dateMap[col - 1];
                                    }
                                }

                                analyzeDailyAbsentees(date, excelData, dateMap, periodRow, maxCol);
                            }}
                        >
                            {selectedYear && selectedMonth && dateHierarchy[selectedYear]?.[selectedMonth]?.map(date => (
                                <option key={date} value={date}>{date}</option>
                            ))}
                        </select>
                    </div>
                )}
            </div>

            {/* Status Messages for Loading */}
            {loading && !excelData.length && (
                <div className="py-20 text-center">
                    <div className="animate-spin w-12 h-12 border-4 border-blue-600 border-t-transparent rounded-full mx-auto mb-4"></div>
                    <p className="text-gray-500 font-medium">Fetching live attendance sheet from Google...</p>
                </div>
            )}

            {/* Upload Section - Collapses when file is loaded */}
            {!loading && !excelData.length && !file && (
                <div className="bg-white p-8 rounded-2xl border-2 border-dashed border-gray-300 hover:border-blue-400 hover:bg-blue-50/10 transition-all cursor-pointer group text-center">
                    <label className="cursor-pointer">
                        <div className="w-16 h-16 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center mx-auto mb-4 group-hover:scale-110 transition-transform">
                            <Upload className="w-8 h-8" />
                        </div>
                        <h3 className="text-lg font-bold text-gray-900">Upload Data Manually</h3>
                        <p className="text-gray-500 text-sm mt-1 mb-4">We couldn't auto-load the Google Sheet. Please upload the .xlsx file.</p>
                        <span className="px-4 py-2 bg-blue-600 text-white rounded-lg text-sm font-bold shadow-md shadow-blue-200 group-hover:shadow-lg transition-all">Browse Files</span>
                        <input type="file" className="hidden" accept=".xlsx" onChange={handleFileUpload} />
                    </label>
                </div>
            )}

            {/* Dashboard View */}
            {excelData.length > 0 && (
                <Tabs value={activeTab} onValueChange={(v) => setActiveTab(v as any)} className="space-y-6">
                    <TabsList className="bg-white p-1 rounded-xl border border-gray-200 shadow-sm h-auto inline-flex">
                        <TabsTrigger value="counseling" className="px-4 py-2 data-[state=active]:bg-blue-600 data-[state=active]:text-white rounded-lg transition-all flex items-center gap-2">
                            <UserX className="w-4 h-4" /> Counseling View
                        </TabsTrigger>
                        <TabsTrigger value="daily" className="px-4 py-2 data-[state=active]:bg-gray-900 data-[state=active]:text-white rounded-lg transition-all flex items-center gap-2">
                            <Clock className="w-4 h-4" /> Raw Timeline
                        </TabsTrigger>
                        <TabsTrigger value="register" className="px-4 py-2 data-[state=active]:bg-gray-900 data-[state=active]:text-white rounded-lg transition-all flex items-center gap-2">
                            <FileSpreadsheet className="w-4 h-4" /> Register
                        </TabsTrigger>
                    </TabsList>

                    <TabsContent value="counseling" className="space-y-6">
                        {/* Stats Cards */}
                        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                            <Card className="border-l-4 border-l-red-500 shadow-sm">
                                <CardContent className="p-4">
                                    <p className="text-xs font-bold text-gray-500 uppercase tracking-wider mb-1">Full Day Absent</p>
                                    <h3 className="text-2xl font-black text-red-600">{stats.fullDay}</h3>
                                </CardContent>
                            </Card>
                            <Card className="border-l-4 border-l-yellow-500 shadow-sm">
                                <CardContent className="p-4">
                                    <p className="text-xs font-bold text-gray-500 uppercase tracking-wider mb-1">Forenoon Only</p>
                                    <h3 className="text-2xl font-black text-yellow-600">{stats.forenoon}</h3>
                                </CardContent>
                            </Card>
                            <Card className="border-l-4 border-l-orange-500 shadow-sm">
                                <CardContent className="p-4">
                                    <p className="text-xs font-bold text-gray-500 uppercase tracking-wider mb-1">Afternoon Only</p>
                                    <h3 className="text-2xl font-black text-orange-600">{stats.afternoon}</h3>
                                </CardContent>
                            </Card>
                            <Card className="border-l-4 border-l-gray-400 shadow-sm">
                                <CardContent className="p-4">
                                    <p className="text-xs font-bold text-gray-500 uppercase tracking-wider mb-1">Partial / Late</p>
                                    <h3 className="text-2xl font-black text-gray-700">{stats.partial}</h3>
                                </CardContent>
                            </Card>
                        </div>

                        {/* Counseling List */}
                        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden">
                            <div className="overflow-x-auto">
                                <table className="w-full text-sm text-left">
                                    <thead className="text-xs text-gray-500 uppercase bg-gray-50 border-b border-gray-100">
                                        <tr>
                                            <th className="px-6 py-4 font-medium">Student Profile</th>
                                            <th className="px-6 py-4 font-medium">Status Category</th>
                                            <th className="px-6 py-4 font-medium">Counseling Insight</th>
                                            <th className="px-6 py-4 font-medium text-right">Periods Missed</th>
                                        </tr>
                                    </thead>
                                    <tbody className="divide-y divide-gray-100">
                                        {absentees.map((student) => (
                                            <tr key={student.rollNumber} className="hover:bg-gray-50 transition-colors group">
                                                <td className="px-6 py-4">
                                                    <div className="flex flex-col">
                                                        <span className="font-bold text-gray-900 group-hover:text-blue-600 transition-colors">{student.name}</span>
                                                        <span className="font-mono text-xs text-gray-500">{student.rollNumber}</span>
                                                    </div>
                                                </td>
                                                <td className="px-6 py-4">
                                                    <Badge variant="outline" className={`
                                                        ${student.status === 'Full Day' ? 'bg-red-50 text-red-700 border-red-200' : ''}
                                                        ${student.status === 'Afternoon' ? 'bg-orange-50 text-orange-700 border-orange-200' : ''}
                                                        ${student.status === 'Forenoon' ? 'bg-yellow-50 text-yellow-700 border-yellow-200' : ''}
                                                        ${student.status === 'Partial' ? 'bg-gray-50 text-gray-700 border-gray-200' : ''}
                                                     `}>
                                                        {student.status}
                                                    </Badge>
                                                </td>
                                                <td className="px-6 py-4">
                                                    <div className="text-gray-700 font-medium flex items-center gap-2">
                                                        {student.status === 'Afternoon' && <Moon className="w-4 h-4 text-orange-400" />}
                                                        {student.status === 'Forenoon' && <Sun className="w-4 h-4 text-yellow-500" />}
                                                        {student.status === 'Full Day' && <AlertCircle className="w-4 h-4 text-red-500" />}
                                                        {student.counselingNote}
                                                    </div>
                                                </td>
                                                <td className="px-6 py-4 text-right">
                                                    <div className="flex flex-col items-end gap-1">
                                                        <span className="text-xs font-bold text-gray-400 mb-1">Total: {student.absentPeriods.length} hrs</span>
                                                        <div className="flex justify-end gap-1">
                                                            {student.absentPeriods.map(p => (
                                                                <span key={p} className="w-6 h-6 rounded flex items-center justify-center text-xs font-bold bg-gray-100 text-gray-600 border border-gray-200" title={`Absent Period ${p}`}>
                                                                    {p}
                                                                </span>
                                                            ))}
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))}
                                        {absentees.length === 0 && (
                                            <tr>
                                                <td colSpan={4} className="px-6 py-12 text-center text-gray-500">
                                                    <CheckCircle2 className="w-12 h-12 text-green-500 mx-auto mb-3" />
                                                    <p className="font-medium">Perfect Attendance!</p>
                                                    <p className="text-sm">No counseling needed for this date.</p>
                                                </td>
                                            </tr>
                                        )}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </TabsContent>

                    <TabsContent value="daily">
                        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden p-6">
                            <div className="overflow-x-auto">
                                <table className="w-full text-sm text-left">
                                    <thead className="text-xs text-gray-500 uppercase bg-gray-50 border-b border-gray-100">
                                        <tr>
                                            <th className="px-6 py-4">Student</th>
                                            <th className="px-6 py-4">Absent Timeline (1-8)</th>
                                        </tr>
                                    </thead>
                                    <tbody className="divide-y divide-gray-100">
                                        {absentees.map((student) => (
                                            <tr key={student.rollNumber} className="hover:bg-gray-50">
                                                <td className="px-6 py-4 font-medium">{student.name} <span className="text-gray-400 font-normal">({student.rollNumber})</span></td>
                                                <td className="px-6 py-4">
                                                    <div className="flex gap-2">
                                                        {[1, 2, 3, 4, 5, 6, 7, 8].map(p => {
                                                            const isAbsent = student.absentPeriods.includes(p);
                                                            return (
                                                                <div key={p} className={`w-8 h-8 rounded-lg flex items-center justify-center font-bold text-xs ${isAbsent ? 'bg-red-500 text-white' : 'bg-gray-50 text-gray-300'
                                                                    }`}>
                                                                    {p}
                                                                </div>
                                                            )
                                                        })}
                                                    </div>
                                                </td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </TabsContent>

                    <TabsContent value="register">
                        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden p-12 text-center text-gray-500">
                            <FileSpreadsheet className="w-16 h-16 text-gray-300 mx-auto mb-4" />
                            <h3 className="text-lg font-bold text-gray-900">Full Register View</h3>
                            <p>This view will show the complete P/A grid for the entire month.</p>
                        </div>
                    </TabsContent>
                </Tabs>
            )}
        </div>
    );
}
