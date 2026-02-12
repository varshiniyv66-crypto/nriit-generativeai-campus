"use client";

import { useState } from "react";
import * as XLSX from "xlsx";
import {
    Upload,
    FileSpreadsheet,
    CheckCircle2,
    ArrowLeft,
    Calendar as CalendarIcon,
    AlertCircle
} from "lucide-react";
import Link from "next/link";

// Types
interface DailyAbsentee {
    rollNumber: string;
    name: string;
    absentPeriods: number[];
}

interface HourlyAttendanceReportProps {
    classId: string;
    backLink: string;
    titlePrefix?: string;
}

export default function HourlyAttendanceReport({ classId, backLink, titlePrefix = "" }: HourlyAttendanceReportProps) {
    const [file, setFile] = useState<File | null>(null);
    const [parsing, setParsing] = useState(false);
    const [activeTab, setActiveTab] = useState<"daily" | "register">("daily");

    // Data State
    const [excelData, setExcelData] = useState<any[]>([]);
    const [absentees, setAbsentees] = useState<DailyAbsentee[]>([]);
    const [selectedDate, setSelectedDate] = useState<string>("");
    const [availableDates, setAvailableDates] = useState<string[]>([]);

    // Excel Serial Date Converter
    const excelDateToJSDate = (serial: number) => {
        const utc_days = Math.floor(serial - 25569);
        const utc_value = utc_days * 86400;
        const date_info = new Date(utc_value * 1000);
        return date_info.toLocaleDateString('en-GB'); // DD/MM/YYYY
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

    const processExcelData = async (data: any[][]) => {
        // 1. Extract Dates (Row 1, Index 1)
        // 2. Extract Periods (Row 2, Index 2)
        // 3. Extract Students (Row 5+, Index 5+)

        if (data.length < 5) return;

        const dateRow = data[1];
        const periodRow = data[2];

        // Find valid date columns
        const dateMap: Record<number, string> = {};
        const uniqueDates = new Set<string>();

        for (let col = 1; col < dateRow.length; col++) {
            const rawDate = dateRow[col];
            if (rawDate && typeof rawDate === 'number') {
                const fmtDate = excelDateToJSDate(rawDate);
                dateMap[col] = fmtDate;
                uniqueDates.add(fmtDate);
            } else if (rawDate && typeof rawDate === 'string' && rawDate.includes('/')) {
                dateMap[col] = rawDate;
                uniqueDates.add(rawDate);
            } else if (!rawDate && dateMap[col - 1]) {
                dateMap[col] = dateMap[col - 1];
            }
        }

        const sortedDates = Array.from(uniqueDates).sort((a, b) => {
            const [d1, m1, y1] = a.split('/').map(Number);
            const [d2, m2, y2] = b.split('/').map(Number);
            return new Date(y2, m2 - 1, d2).getTime() - new Date(y1, m1 - 1, d1).getTime();
        });

        setAvailableDates(sortedDates);
        if (sortedDates.length > 0) {
            analyzeDailyAbsentees(sortedDates[0], data, dateMap, periodRow);
        }
    };

    const analyzeDailyAbsentees = async (
        targetDate: string,
        data: any[][],
        dateMap: Record<number, string>,
        periodRow: any[]
    ) => {
        setSelectedDate(targetDate);

        const dailyAbsentees: DailyAbsentee[] = [];

        for (let row = 5; row < data.length; row++) {
            const rollNo = data[row][0]?.toString();
            // Try to get name from Column B (Index 1) if available, else placeholder
            const rawName = data[row][1]?.toString();
            const name = (rawName && rawName.length > 2) ? rawName : "Student " + rollNo;

            if (!rollNo || rollNo.length < 5) continue;

            const absentPeriods: number[] = [];

            for (let col = 1; col < data[row].length; col++) {
                if (dateMap[col] === targetDate) {
                    const status = data[row][col]?.toString().toUpperCase();
                    if (status === 'A') {
                        let periods = periodRow[col]?.toString();
                        if (periods) {
                            // Extract numbers from "1", "1,2", "1-2" etc.
                            // For simplicity assuming standard "1" or "lab"
                            const pList = periods.split(',').map((p: string) => parseInt(p.trim())).filter((n: number) => !isNaN(n));
                            if (pList.length === 0 && periods.toLowerCase().includes('lab')) {
                                // If it says 'LAB', maybe we consider it as 3 periods? 
                                // For now, let's just default to a generic '1' if parsing fails but text exists, 
                                // but better to rely on explicit numbers if possible.
                            }
                            absentPeriods.push(...pList);
                        }
                    }
                }
            }

            if (absentPeriods.length > 0) {
                dailyAbsentees.push({
                    rollNumber: rollNo,
                    name: name,
                    absentPeriods: Array.from(new Set(absentPeriods)).sort((a, b) => a - b)
                });
            }
        }

        setAbsentees(dailyAbsentees);
    };

    return (
        <div className="max-w-7xl mx-auto space-y-6 pb-20">
            <div className="flex items-center gap-4">
                <Link href={backLink} className="p-2 hover:bg-gray-100 rounded-lg text-gray-600 transition-colors">
                    <ArrowLeft className="w-5 h-5" />
                </Link>
                <div>
                    <h1 className="text-2xl font-bold text-gray-900 uppercase">
                        {titlePrefix} {classId.replace(/-/g, ' ')}
                    </h1>
                    <p className="text-gray-500 text-sm">Hourly Attendance Analytics</p>
                </div>
            </div>

            <div className="bg-white p-6 rounded-2xl border border-gray-200 shadow-sm">
                <div className="max-w-xl mx-auto">
                    <label className="flex flex-col items-center justify-center w-full h-32 border-2 border-dashed border-gray-300 rounded-xl cursor-pointer bg-gray-50 hover:bg-gray-100 transition-all">
                        <div className="flex flex-col items-center justify-center pt-5 pb-6">
                            {file ? (
                                <>
                                    <FileSpreadsheet className="w-8 h-8 text-green-600 mb-2" />
                                    <p className="text-sm text-gray-700 font-medium">{file.name}</p>
                                    <p className="text-xs text-gray-500">Click to change file</p>
                                </>
                            ) : (
                                <>
                                    <Upload className="w-8 h-8 text-gray-400 mb-2" />
                                    <p className="text-sm text-gray-500"><span className="font-semibold text-blue-600">Click to upload</span> attendance sheet</p>
                                    <p className="text-xs text-gray-400">Supports .xlsx files</p>
                                </>
                            )}
                        </div>
                        <input type="file" className="hidden" accept=".xlsx" onChange={handleFileUpload} />
                    </label>
                </div>
            </div>

            {excelData.length > 0 && (
                <div className="space-y-6">
                    <div className="flex gap-1 bg-gray-100 p-1 rounded-xl w-fit">
                        <button
                            onClick={() => setActiveTab('daily')}
                            className={`px-4 py-2 text-sm font-medium rounded-lg transition-all ${activeTab === 'daily' ? 'bg-white text-gray-900 shadow-sm' : 'text-gray-500 hover:text-gray-900'}`}
                        >
                            Daily Analytics
                        </button>
                        <button
                            onClick={() => setActiveTab('register')}
                            className={`px-4 py-2 text-sm font-medium rounded-lg transition-all ${activeTab === 'register' ? 'bg-white text-gray-900 shadow-sm' : 'text-gray-500 hover:text-gray-900'}`}
                        >
                            Full Register View
                        </button>
                    </div>

                    {activeTab === 'daily' && (
                        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden">
                            <div className="p-4 border-b border-gray-100 bg-gray-50 flex items-center justify-between flex-wrap gap-4">
                                <div className="flex items-center gap-2">
                                    <CalendarIcon className="w-5 h-5 text-gray-500" />
                                    <select
                                        className="bg-white border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-2"
                                        value={selectedDate}
                                        onChange={(e) => {
                                            const date = e.target.value;
                                            const dateRow = excelData[1];
                                            const periodRow = excelData[2];
                                            // Re-build dateMap 
                                            const dateMap: Record<number, string> = {};
                                            for (let col = 1; col < dateRow.length; col++) {
                                                const rawDate = dateRow[col];
                                                if (rawDate && typeof rawDate === 'number') {
                                                    dateMap[col] = excelDateToJSDate(rawDate);
                                                } else if (rawDate && typeof rawDate === 'string' && rawDate.includes('/')) {
                                                    dateMap[col] = rawDate;
                                                } else if (!rawDate && dateMap[col - 1]) {
                                                    dateMap[col] = dateMap[col - 1];
                                                }
                                            }
                                            analyzeDailyAbsentees(date, excelData, dateMap, periodRow);
                                        }}
                                    >
                                        {availableDates.map(date => (
                                            <option key={date} value={date}>{date}</option>
                                        ))}
                                    </select>
                                </div>
                                <div className="flex gap-2">
                                    <span className="px-3 py-1 bg-red-100 text-red-700 rounded-full text-xs font-bold flex items-center gap-1">
                                        {absentees.length} Students Absent
                                    </span>
                                </div>
                            </div>

                            <div className="overflow-x-auto">
                                <table className="w-full text-sm text-left">
                                    <thead className="text-xs text-gray-500 uppercase bg-gray-50 border-b border-gray-100">
                                        <tr>
                                            <th className="px-6 py-4 font-medium">Student Info</th>
                                            <th className="px-6 py-4 font-medium">Absent Analytics (Periods)</th>
                                            <th className="px-6 py-4 font-medium text-right">Total Missed</th>
                                        </tr>
                                    </thead>
                                    <tbody className="divide-y divide-gray-100">
                                        {absentees.map((student) => (
                                            <tr key={student.rollNumber} className="hover:bg-gray-50 transition-colors">
                                                <td className="px-6 py-4">
                                                    <div className="flex flex-col">
                                                        <span className="font-bold text-gray-900">{student.name}</span>
                                                        <span className="font-mono text-xs text-gray-500">{student.rollNumber}</span>
                                                    </div>
                                                </td>
                                                <td className="px-6 py-4">
                                                    <div className="flex flex-wrap gap-2 items-center">
                                                        <span className="text-xs text-gray-400 mr-2">Missed:</span>
                                                        {[1, 2, 3, 4, 5, 6, 7, 8].map(p => {
                                                            const isAbsent = student.absentPeriods.includes(p);
                                                            return (
                                                                <div
                                                                    key={p}
                                                                    className={`w-8 h-8 rounded-lg flex items-center justify-center text-xs font-bold transition-all ${isAbsent
                                                                            ? 'bg-red-500 text-white shadow-md shadow-red-200 scale-110'
                                                                            : 'bg-gray-100 text-gray-300 scale-100'
                                                                        }`}
                                                                    title={isAbsent ? `Absent for Period ${p}` : `Present`}
                                                                >
                                                                    {p}
                                                                </div>
                                                            );
                                                        })}
                                                    </div>
                                                </td>
                                                <td className="px-6 py-4 text-right">
                                                    <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                                        {student.absentPeriods.length} hrs
                                                    </span>
                                                </td>
                                            </tr>
                                        ))}
                                        {absentees.length === 0 && (
                                            <tr>
                                                <td colSpan={3} className="px-6 py-12 text-center text-gray-500">
                                                    <CheckCircle2 className="w-12 h-12 text-green-500 mx-auto mb-3" />
                                                    <p className="font-medium">All Clear!</p>
                                                    <p className="text-sm">No absences recorded for this date.</p>
                                                </td>
                                            </tr>
                                        )}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    )}

                    {activeTab === 'register' && (
                        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden p-6 text-center text-gray-500">
                            <FileSpreadsheet className="w-16 h-16 text-gray-300 mx-auto mb-4" />
                            <p>Full spreadsheet view coming soon.</p>
                        </div>
                    )}
                </div>
            )}
        </div>
    );
}
