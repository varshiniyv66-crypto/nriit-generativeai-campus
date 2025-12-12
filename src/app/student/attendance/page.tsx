"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Progress } from "@/components/ui/progress";
import { CheckCircle2, XCircle, Clock, CalendarDays, TrendingUp, AlertTriangle } from "lucide-react";
import supabase from "@/lib/supabase";

export default function StudentAttendancePage() {
    const [loading, setLoading] = useState(true);
    const [user, setUser] = useState<any>(null);
    const [attendanceSummary, setAttendanceSummary] = useState<any[]>([]);
    const [recentLogs, setRecentLogs] = useState<any[]>([]);
    const [overallStats, setOverallStats] = useState({
        totalClasses: 0,
        present: 0,
        absent: 0,
        percentage: 0
    });

    useEffect(() => {
        loadAttendanceData();
    }, []);

    const loadAttendanceData = async () => {
        try {
            const stored = localStorage.getItem('nriit_user');
            if (!stored) return;

            const parsedUser = JSON.parse(stored);
            setUser(parsedUser);

            // Get student profile
            const { data: profile } = await supabase
                .from('student_profiles')
                .select('id')
                .eq('roll_number', parsedUser.roll_number)
                .single();

            if (profile) {
                // Fetch attendance summary by subject
                const { data: summary } = await supabase
                    .from('v_student_attendance_summary')
                    .select('*')
                    .eq('student_id', profile.id);

                if (summary && summary.length > 0) {
                    setAttendanceSummary(summary);

                    // Calculate overall stats
                    const totalClasses = summary.reduce((sum: number, item: any) => sum + (item.total_classes || 0), 0);
                    const presentClasses = summary.reduce((sum: number, item: any) => sum + (item.present_count || 0), 0);
                    const absentClasses = summary.reduce((sum: number, item: any) => sum + (item.absent_count || 0), 0);
                    const percentage = totalClasses > 0 ? Math.round((presentClasses / totalClasses) * 100) : 0;

                    setOverallStats({
                        totalClasses,
                        present: presentClasses,
                        absent: absentClasses,
                        percentage
                    });
                }

                // Fetch recent attendance logs
                const { data: logs } = await supabase
                    .from('period_attendance')
                    .select(`
                        id, attendance_date, period_number, status,
                        course:courses (course_code, course_name)
                    `)
                    .eq('student_id', profile.id)
                    .order('attendance_date', { ascending: false })
                    .order('period_number', { ascending: true })
                    .limit(20);

                if (logs) {
                    setRecentLogs(logs);
                }
            }

            setLoading(false);
        } catch (error) {
            console.error('Error loading attendance:', error);
            setLoading(false);
        }
    };

    if (loading) {
        return (
            <div className="flex items-center justify-center h-[60vh]">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            </div>
        );
    }

    return (
        <div className="space-y-6 animate-fade-in-up">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">My Attendance</h1>
                    <p className="text-gray-500">Track your daily class attendance and shortages</p>
                </div>
                <Badge
                    variant={overallStats.percentage >= 75 ? "default" : "destructive"}
                    className={`text-lg px-4 py-1 ${overallStats.percentage >= 75 ? 'bg-green-600' : 'bg-red-600'}`}
                >
                    {overallStats.percentage}% Overall
                </Badge>
            </div>

            {/* Stats Cards */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                {[
                    { label: "Total Classes", value: overallStats.totalClasses, icon: CalendarDays, color: "text-blue-600", bg: "bg-blue-50" },
                    { label: "Present", value: overallStats.present, icon: CheckCircle2, color: "text-green-600", bg: "bg-green-50" },
                    { label: "Absent", value: overallStats.absent, icon: XCircle, color: "text-red-600", bg: "bg-red-50" },
                    {
                        label: "Status",
                        value: overallStats.percentage >= 75 ? "Safe" : "At Risk",
                        icon: overallStats.percentage >= 75 ? TrendingUp : AlertTriangle,
                        color: overallStats.percentage >= 75 ? "text-green-600" : "text-amber-600",
                        bg: overallStats.percentage >= 75 ? "bg-green-50" : "bg-amber-50"
                    },
                ].map((stat, i) => (
                    <Card key={i} className="border-none shadow-sm bg-white/50 backdrop-blur-sm">
                        <CardContent className="p-4 flex items-center justify-between">
                            <div>
                                <p className="text-sm font-medium text-gray-500">{stat.label}</p>
                                <div className="text-2xl font-bold">{stat.value}</div>
                            </div>
                            <div className={`p-3 rounded-full ${stat.bg}`}>
                                <stat.icon className={`w-6 h-6 ${stat.color}`} />
                            </div>
                        </CardContent>
                    </Card>
                ))}
            </div>

            {/* Subject-wise Attendance */}
            <Card className="border shadow-sm">
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <CalendarDays className="w-5 h-5 text-blue-600" />
                        Subject-wise Attendance
                    </CardTitle>
                    <CardDescription>Attendance breakdown by course</CardDescription>
                </CardHeader>
                <CardContent>
                    {attendanceSummary.length > 0 ? (
                        <div className="space-y-4">
                            {attendanceSummary.map((subject: any, i: number) => (
                                <div key={i} className="group">
                                    <div className="flex items-center justify-between mb-2">
                                        <div>
                                            <span className="font-medium text-gray-900">{subject.course_name}</span>
                                            <span className="text-xs text-gray-500 ml-2">({subject.course_code})</span>
                                        </div>
                                        <Badge
                                            variant={subject.attendance_percentage < 75 ? "destructive" : "secondary"}
                                            className={subject.attendance_percentage >= 75 ? "bg-green-100 text-green-700" : ""}
                                        >
                                            {subject.attendance_percentage || 0}%
                                        </Badge>
                                    </div>
                                    <div className="flex items-center gap-3">
                                        <Progress
                                            value={subject.attendance_percentage || 0}
                                            className="h-2 flex-1"
                                        />
                                        <span className="text-xs text-gray-500 w-20 text-right">
                                            {subject.present_count}/{subject.total_classes}
                                        </span>
                                    </div>
                                </div>
                            ))}
                        </div>
                    ) : (
                        <div className="text-center py-8 text-gray-500">
                            <CalendarDays className="w-12 h-12 mx-auto mb-4 opacity-50" />
                            <p>No attendance data available</p>
                            <p className="text-sm">Attendance records will appear here once marked</p>
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* Recent Activity */}
            <Card className="border shadow-sm">
                <CardHeader>
                    <CardTitle>Recent Activity</CardTitle>
                    <CardDescription>Latest attendance records</CardDescription>
                </CardHeader>
                <CardContent>
                    {recentLogs.length > 0 ? (
                        <Table>
                            <TableHeader>
                                <TableRow>
                                    <TableHead>Date</TableHead>
                                    <TableHead>Period</TableHead>
                                    <TableHead>Subject</TableHead>
                                    <TableHead>Status</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {recentLogs.map((log: any) => (
                                    <TableRow key={log.id}>
                                        <TableCell className="font-medium">{log.attendance_date}</TableCell>
                                        <TableCell>{log.period_number}</TableCell>
                                        <TableCell>{log.course?.course_name || log.course?.course_code}</TableCell>
                                        <TableCell>
                                            <Badge
                                                variant={log.status === 'present' ? 'default' : 'destructive'}
                                                className={log.status === 'present'
                                                    ? 'bg-green-100 text-green-700 hover:bg-green-100'
                                                    : log.status === 'late'
                                                        ? 'bg-amber-100 text-amber-700 hover:bg-amber-100'
                                                        : 'bg-red-100 text-red-700 hover:bg-red-100'}
                                            >
                                                {log.status === 'present' ? <CheckCircle2 className="w-3 h-3 mr-1" /> :
                                                    log.status === 'late' ? <Clock className="w-3 h-3 mr-1" /> :
                                                        <XCircle className="w-3 h-3 mr-1" />}
                                                {log.status.charAt(0).toUpperCase() + log.status.slice(1)}
                                            </Badge>
                                        </TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    ) : (
                        <div className="text-center py-8 text-gray-500">
                            <Clock className="w-12 h-12 mx-auto mb-4 opacity-50" />
                            <p>No recent attendance logs</p>
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
