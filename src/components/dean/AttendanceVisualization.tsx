"use client";

import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import { TrendingUp, TrendingDown, Users, AlertTriangle, CheckCircle2, Calendar } from "lucide-react";
import { cn } from "@/lib/utils";

interface AttendanceData {
    department: string;
    totalStudents: number;
    presentToday: number;
    absentToday: number;
    averageAttendance: number;
    trend: 'up' | 'down' | 'stable';
    criticalStudents: number;
}

const MOCK_ATTENDANCE_DATA: AttendanceData[] = [
    { department: "CSE", totalStudents: 480, presentToday: 456, absentToday: 24, averageAttendance: 92.5, trend: 'up', criticalStudents: 12 },
    { department: "ECE", totalStudents: 360, presentToday: 324, absentToday: 36, averageAttendance: 88.3, trend: 'down', criticalStudents: 18 },
    { department: "MECH", totalStudents: 240, presentToday: 228, absentToday: 12, averageAttendance: 94.1, trend: 'up', criticalStudents: 5 },
    { department: "CIVIL", totalStudents: 180, presentToday: 162, absentToday: 18, averageAttendance: 87.8, trend: 'stable', criticalStudents: 8 },
    { department: "EEE", totalStudents: 120, presentToday: 108, absentToday: 12, averageAttendance: 89.2, trend: 'up', criticalStudents: 6 },
    { department: "IT", totalStudents: 60, presentToday: 54, absentToday: 6, averageAttendance: 91.7, trend: 'up', criticalStudents: 3 },
];

interface AttendanceVisualizationProps {
    className?: string;
}

export function AttendanceVisualization({ className }: AttendanceVisualizationProps) {
    const totalStudents = MOCK_ATTENDANCE_DATA.reduce((sum, dept) => sum + dept.totalStudents, 0);
    const totalPresent = MOCK_ATTENDANCE_DATA.reduce((sum, dept) => sum + dept.presentToday, 0);
    const totalAbsent = MOCK_ATTENDANCE_DATA.reduce((sum, dept) => sum + dept.absentToday, 0);
    const overallPercentage = ((totalPresent / totalStudents) * 100).toFixed(1);
    const totalCritical = MOCK_ATTENDANCE_DATA.reduce((sum, dept) => sum + dept.criticalStudents, 0);

    return (
        <div className={cn("space-y-6", className)}>
            {/* Overall Stats */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                <Card className="bg-gradient-to-br from-blue-50 to-blue-100 border-blue-200">
                    <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-sm font-medium text-blue-700">Total Students</p>
                                <h3 className="text-3xl font-bold text-blue-900 mt-1">{totalStudents}</h3>
                            </div>
                            <Users className="w-10 h-10 text-blue-600 opacity-50" />
                        </div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-green-50 to-green-100 border-green-200">
                    <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-sm font-medium text-green-700">Present Today</p>
                                <h3 className="text-3xl font-bold text-green-900 mt-1">{totalPresent}</h3>
                                <p className="text-xs text-green-600 mt-1">{overallPercentage}%</p>
                            </div>
                            <CheckCircle2 className="w-10 h-10 text-green-600 opacity-50" />
                        </div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-red-50 to-red-100 border-red-200">
                    <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-sm font-medium text-red-700">Absent Today</p>
                                <h3 className="text-3xl font-bold text-red-900 mt-1">{totalAbsent}</h3>
                                <p className="text-xs text-red-600 mt-1">{((totalAbsent / totalStudents) * 100).toFixed(1)}%</p>
                            </div>
                            <Calendar className="w-10 h-10 text-red-600 opacity-50" />
                        </div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-orange-50 to-orange-100 border-orange-200">
                    <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-sm font-medium text-orange-700">Critical Students</p>
                                <h3 className="text-3xl font-bold text-orange-900 mt-1">{totalCritical}</h3>
                                <p className="text-xs text-orange-600 mt-1">Below 75%</p>
                            </div>
                            <AlertTriangle className="w-10 h-10 text-orange-600 opacity-50" />
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Department-wise Breakdown */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Users className="w-5 h-5 text-blue-600" />
                        Department-wise Attendance Overview
                    </CardTitle>
                    <CardDescription>Real-time attendance statistics across all departments</CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="space-y-4">
                        {MOCK_ATTENDANCE_DATA.map((dept) => {
                            const percentage = ((dept.presentToday / dept.totalStudents) * 100).toFixed(1);
                            const isLow = parseFloat(percentage) < 85;

                            return (
                                <div key={dept.department} className="p-4 rounded-lg border bg-gradient-to-r from-gray-50 to-white hover:shadow-md transition-shadow">
                                    <div className="flex items-center justify-between mb-3">
                                        <div className="flex items-center gap-3">
                                            <div className="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-purple-500 flex items-center justify-center text-white font-bold">
                                                {dept.department}
                                            </div>
                                            <div>
                                                <h4 className="font-semibold text-gray-900">{dept.department} Department</h4>
                                                <p className="text-sm text-gray-500">
                                                    {dept.presentToday} / {dept.totalStudents} students present
                                                </p>
                                            </div>
                                        </div>

                                        <div className="flex items-center gap-4">
                                            <div className="text-right">
                                                <div className="flex items-center gap-2">
                                                    <span className={cn(
                                                        "text-2xl font-bold",
                                                        isLow ? "text-red-600" : "text-green-600"
                                                    )}>
                                                        {percentage}%
                                                    </span>
                                                    {dept.trend === 'up' && <TrendingUp className="w-5 h-5 text-green-600" />}
                                                    {dept.trend === 'down' && <TrendingDown className="w-5 h-5 text-red-600" />}
                                                </div>
                                                <p className="text-xs text-gray-500 mt-1">
                                                    Avg: {dept.averageAttendance}%
                                                </p>
                                            </div>

                                            {dept.criticalStudents > 0 && (
                                                <Badge variant="destructive" className="gap-1">
                                                    <AlertTriangle className="w-3 h-3" />
                                                    {dept.criticalStudents} Critical
                                                </Badge>
                                            )}
                                        </div>
                                    </div>

                                    <div className="space-y-2">
                                        <Progress
                                            value={parseFloat(percentage)}
                                            className={cn(
                                                "h-3",
                                                isLow ? "[&>div]:bg-red-500" : "[&>div]:bg-green-500"
                                            )}
                                        />

                                        <div className="flex justify-between text-xs text-gray-500">
                                            <span className="flex items-center gap-1">
                                                <div className="w-2 h-2 rounded-full bg-green-500"></div>
                                                Present: {dept.presentToday}
                                            </span>
                                            <span className="flex items-center gap-1">
                                                <div className="w-2 h-2 rounded-full bg-red-500"></div>
                                                Absent: {dept.absentToday}
                                            </span>
                                            <span className="flex items-center gap-1">
                                                <div className="w-2 h-2 rounded-full bg-orange-500"></div>
                                                Critical: {dept.criticalStudents}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                </CardContent>
            </Card>

            {/* Attendance Heatmap */}
            <Card>
                <CardHeader>
                    <CardTitle>Weekly Attendance Heatmap</CardTitle>
                    <CardDescription>Attendance patterns across the week</CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="space-y-3">
                        {MOCK_ATTENDANCE_DATA.map((dept) => (
                            <div key={dept.department} className="flex items-center gap-3">
                                <div className="w-16 text-sm font-medium text-gray-700">{dept.department}</div>
                                <div className="flex-1 flex gap-1">
                                    {['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map((day, idx) => {
                                        // Generate random attendance for demo
                                        const dayAttendance = 85 + Math.random() * 15;
                                        const intensity = dayAttendance >= 95 ? 'bg-green-600' :
                                            dayAttendance >= 90 ? 'bg-green-500' :
                                                dayAttendance >= 85 ? 'bg-green-400' :
                                                    dayAttendance >= 80 ? 'bg-yellow-400' :
                                                        dayAttendance >= 75 ? 'bg-orange-400' : 'bg-red-400';

                                        return (
                                            <div
                                                key={day}
                                                className={cn(
                                                    "flex-1 h-12 rounded flex items-center justify-center text-white text-xs font-medium",
                                                    "hover:scale-105 transition-transform cursor-pointer",
                                                    intensity
                                                )}
                                                title={`${day}: ${dayAttendance.toFixed(1)}%`}
                                            >
                                                {day}
                                            </div>
                                        );
                                    })}
                                </div>
                            </div>
                        ))}
                    </div>

                    <div className="mt-4 flex items-center justify-center gap-4 text-xs text-gray-600">
                        <span className="flex items-center gap-1">
                            <div className="w-3 h-3 rounded bg-green-600"></div>
                            95-100%
                        </span>
                        <span className="flex items-center gap-1">
                            <div className="w-3 h-3 rounded bg-green-500"></div>
                            90-95%
                        </span>
                        <span className="flex items-center gap-1">
                            <div className="w-3 h-3 rounded bg-green-400"></div>
                            85-90%
                        </span>
                        <span className="flex items-center gap-1">
                            <div className="w-3 h-3 rounded bg-yellow-400"></div>
                            80-85%
                        </span>
                        <span className="flex items-center gap-1">
                            <div className="w-3 h-3 rounded bg-orange-400"></div>
                            75-80%
                        </span>
                        <span className="flex items-center gap-1">
                            <div className="w-3 h-3 rounded bg-red-400"></div>
                            Below 75%
                        </span>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
