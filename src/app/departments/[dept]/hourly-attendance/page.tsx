"use client";

import { use } from "react";
import Link from "next/link";
import {
    Users,
    ChevronRight,
    BarChart3,
    FileSpreadsheet,
    Clock
} from "lucide-react";

// Mock Classes Data - In a real app, this might come from an API or constant
// We will filter this based on the department param
const CLASSES = [
    { id: "4-2-cse-a", name: "4-2 CSE A", department: "CSE", year: 4, section: "A" },
    { id: "4-2-cse-b", name: "4-2 CSE B", department: "CSE", year: 4, section: "B" },
    { id: "4-2-cse-c", name: "4-2 CSE C", department: "CSE", year: 4, section: "C" },
    { id: "3-2-cse-a", name: "3-2 CSE A", department: "CSE", year: 3, section: "A" },
    { id: "3-2-cse-b", name: "3-2 CSE B", department: "CSE", year: 3, section: "B" },
    { id: "3-2-cse-c", name: "3-2 CSE C", department: "CSE", year: 3, section: "C" },
    { id: "2-2-cse-a", name: "2-2 CSE A", department: "CSE", year: 2, section: "A" },
    { id: "2-2-cse-b", name: "2-2 CSE B", department: "CSE", year: 2, section: "B" },
    { id: "2-2-cse-c", name: "2-2 CSE C", department: "CSE", year: 2, section: "C" },
    { id: "2-2-cse-d", name: "2-2 CSE D", department: "CSE", year: 2, section: "D" },
    // Add some other depts to test filtering
    { id: "4-2-ece-a", name: "4-2 ECE A", department: "ECE", year: 4, section: "A" },
    { id: "4-2-it-a", name: "4-2 IT A", department: "IT", year: 4, section: "A" },
];

export default function DepartmentHourlyAttendanceHub({ params }: { params: Promise<{ dept: string }> }) {
    const resolvedParams = use(params);
    const deptCode = resolvedParams.dept.toUpperCase();

    // Filter classes for this department
    const deptClasses = CLASSES.filter(c => c.department === deptCode);

    return (
        <div className="space-y-8 max-w-7xl mx-auto p-6 pb-20">
            {/* Header */}
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900 flex items-center gap-3">
                        <Clock className="w-8 h-8 text-blue-600" />
                        Hourly Attendance
                    </h1>
                    <p className="text-gray-500 mt-1">
                        {deptCode} Department - Daily Absentee Reporting
                    </p>
                </div>
            </div>

            {/* Quick Stats / Info */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div className="bg-gradient-to-br from-blue-500 to-blue-600 rounded-2xl p-6 text-white shadow-lg">
                    <div className="flex items-start justify-between">
                        <div>
                            <p className="text-blue-100 font-medium mb-1">My Classes</p>
                            <h3 className="text-3xl font-bold">{deptClasses.length}</h3>
                        </div>
                        <div className="p-3 bg-white/20 rounded-xl backdrop-blur-sm">
                            <Users className="w-6 h-6 text-white" />
                        </div>
                    </div>
                    <p className="text-sm text-blue-100 mt-4">Active sections in {deptCode}</p>
                </div>

                <div className="bg-white rounded-2xl p-6 border border-gray-100 shadow-sm">
                    <div className="flex items-start justify-between">
                        <div>
                            <p className="text-gray-500 font-medium mb-1">Today's Reports</p>
                            <h3 className="text-3xl font-bold text-gray-900">0</h3>
                        </div>
                        <div className="p-3 bg-purple-50 rounded-xl">
                            <FileSpreadsheet className="w-6 h-6 text-purple-600" />
                        </div>
                    </div>
                    <p className="text-sm text-gray-500 mt-4">Upload sheets to generate reports</p>
                </div>
            </div>

            {/* Class Grid */}
            <div className="space-y-6">
                <h2 className="text-xl font-semibold text-gray-800 flex items-center gap-2">
                    <Users className="w-5 h-5 text-gray-500" />
                    Select Class Section
                </h2>

                {deptClasses.length > 0 ? (
                    <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                        {deptClasses.map((cls) => (
                            <Link
                                key={cls.id}
                                href={`/departments/${resolvedParams.dept}/hourly-attendance/${cls.id}`}
                                className="group relative bg-white border border-gray-200 hover:border-blue-400 p-6 rounded-2xl shadow-sm hover:shadow-md transition-all duration-200 text-center"
                            >
                                <div className="mb-3 inline-flex items-center justify-center w-12 h-12 rounded-full bg-blue-50 text-blue-600 group-hover:bg-blue-600 group-hover:text-white transition-colors duration-200">
                                    <span className="font-bold text-lg">{cls.section}</span>
                                </div>
                                <h3 className="text-lg font-bold text-gray-900 group-hover:text-blue-600 transition-colors">
                                    {cls.name}
                                </h3>
                                <p className="text-sm text-gray-500 mt-1">
                                    Year {cls.year}
                                </p>

                                <div className="absolute top-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity transform group-hover:translate-x-1">
                                    <ChevronRight className="w-5 h-5 text-blue-400" />
                                </div>
                            </Link>
                        ))}
                    </div>
                ) : (
                    <div className="text-center py-12 bg-gray-50 rounded-2xl border border-dashed border-gray-300">
                        <p className="text-gray-500">No classes found for {deptCode}.</p>
                    </div>
                )}
            </div>
        </div>
    );
}
