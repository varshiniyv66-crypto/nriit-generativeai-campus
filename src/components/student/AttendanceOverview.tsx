"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { Badge } from "@/components/ui/badge";
import { AlertTriangle, CheckCircle2, TrendingUp, Calendar, BookOpen } from "lucide-react";
import { getStudentAttendancePercentage } from "@/lib/attendance";
import { cn } from "@/lib/utils";

interface AttendanceOverviewProps {
    studentId: string;
    className?: string;
}

export function AttendanceOverview({ studentId, className }: AttendanceOverviewProps) {
    const [attendance, setAttendance] = useState({ percentage: 0, total: 0, present: 0 });
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        if (studentId) {
            loadAttendance();
        }
    }, [studentId]);

    const loadAttendance = async () => {
        const { percentage, total, present } = await getStudentAttendancePercentage(studentId);
        setAttendance({ percentage, total, present });
        setLoading(false);
    };

    const getStatusColor = (percentage: number) => {
        if (percentage >= 90) return "from-green-500 to-emerald-500";
        if (percentage >= 75) return "from-yellow-500 to-orange-500";
        return "from-red-500 to-rose-500";
    };

    const getStatusIcon = (percentage: number) => {
        if (percentage >= 75) return <CheckCircle2 className="w-6 h-6 text-green-600" />;
        return <AlertTriangle className="w-6 h-6 text-red-600" />;
    };

    const getStatusText = (percentage: number) => {
        if (percentage >= 90) return { text: "Excellent", color: "text-green-700", bg: "bg-green-50" };
        if (percentage >= 75) return { text: "Good", color: "text-yellow-700", bg: "bg-yellow-50" };
        return { text: "Critical", color: "text-red-700", bg: "bg-red-50" };
    };

    if (loading) {
        return (
            <Card className={cn("border-t-4 border-t-blue-500", className)}>
                <CardContent className="p-6">
                    <div className="animate-pulse space-y-4">
                        <div className="h-20 bg-gray-200 rounded"></div>
                        <div className="h-4 bg-gray-200 rounded w-3/4"></div>
                    </div>
                </CardContent>
            </Card>
        );
    }

    const status = getStatusText(attendance.percentage);

    return (
        <Card className={cn("border-t-4 border-t-blue-500 hover:shadow-lg transition-shadow", className)}>
            <CardHeader>
                <CardTitle className="flex items-center justify-between">
                    <span className="flex items-center gap-2">
                        <Calendar className="w-5 h-5 text-blue-600" />
                        My Attendance
                    </span>
                    {getStatusIcon(attendance.percentage)}
                </CardTitle>
                <CardDescription>Overall attendance percentage</CardDescription>
            </CardHeader>
            <CardContent>
                <div className="space-y-6">
                    {/* Main Percentage Display */}
                    <div className="text-center">
                        <div className={`text-6xl font-bold bg-gradient-to-r ${getStatusColor(attendance.percentage)} bg-clip-text text-transparent`}>
                            {attendance.percentage}%
                        </div>
                        <p className="text-sm text-gray-500 mt-2">
                            {attendance.present} / {attendance.total} periods attended
                        </p>
                    </div>

                    {/* Progress Bar */}
                    <div className="space-y-2">
                        <Progress
                            value={attendance.percentage}
                            className={cn(
                                "h-3",
                                attendance.percentage >= 90 ? "[&>div]:bg-green-500" :
                                    attendance.percentage >= 75 ? "[&>div]:bg-yellow-500" :
                                        "[&>div]:bg-red-500"
                            )}
                        />
                        <div className="flex justify-between text-xs text-gray-500">
                            <span>0%</span>
                            <span>75% Required</span>
                            <span>100%</span>
                        </div>
                    </div>

                    {/* Status Badge */}
                    <div className="flex justify-center">
                        <Badge className={cn("px-4 py-2", status.bg, status.color, "border-0")}>
                            {status.text} Attendance
                        </Badge>
                    </div>

                    {/* Alerts */}
                    {attendance.percentage < 75 && (
                        <div className="bg-gradient-to-r from-red-50 to-rose-50 border-2 border-red-200 rounded-lg p-4">
                            <div className="flex items-start gap-3">
                                <AlertTriangle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                                <div>
                                    <div className="font-semibold text-red-900">Critical: Below 75% Requirement</div>
                                    <p className="text-sm text-red-700 mt-1">
                                        You need {Math.ceil((75 * attendance.total - attendance.present * 100) / 25)} more present periods to reach 75%
                                    </p>
                                </div>
                            </div>
                        </div>
                    )}

                    {attendance.percentage >= 90 && (
                        <div className="bg-gradient-to-r from-green-50 to-emerald-50 border-2 border-green-200 rounded-lg p-4">
                            <div className="flex items-start gap-3">
                                <TrendingUp className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
                                <div>
                                    <div className="font-semibold text-green-900">Excellent Performance!</div>
                                    <p className="text-sm text-green-700 mt-1">
                                        You're maintaining outstanding attendance. Keep it up!
                                    </p>
                                </div>
                            </div>
                        </div>
                    )}

                    {attendance.percentage >= 75 && attendance.percentage < 90 && (
                        <div className="bg-gradient-to-r from-blue-50 to-indigo-50 border-2 border-blue-200 rounded-lg p-4">
                            <div className="flex items-start gap-3">
                                <BookOpen className="w-5 h-5 text-blue-600 flex-shrink-0 mt-0.5" />
                                <div>
                                    <div className="font-semibold text-blue-900">Good Attendance</div>
                                    <p className="text-sm text-blue-700 mt-1">
                                        You're meeting the requirement. Aim for 90% for excellence!
                                    </p>
                                </div>
                            </div>
                        </div>
                    )}

                    {/* Quick Stats */}
                    <div className="grid grid-cols-3 gap-3 pt-4 border-t">
                        <div className="text-center">
                            <div className="text-2xl font-bold text-green-600">{attendance.present}</div>
                            <div className="text-xs text-gray-500">Present</div>
                        </div>
                        <div className="text-center">
                            <div className="text-2xl font-bold text-red-600">{attendance.total - attendance.present}</div>
                            <div className="text-xs text-gray-500">Absent</div>
                        </div>
                        <div className="text-center">
                            <div className="text-2xl font-bold text-blue-600">{attendance.total}</div>
                            <div className="text-xs text-gray-500">Total</div>
                        </div>
                    </div>
                </div>
            </CardContent>
        </Card>
    );
}
