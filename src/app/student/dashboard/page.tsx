"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
    CheckCircle2, ArrowUpRight, AlertTriangle, TrendingUp, TrendingDown,
    BookOpen, FileText, CreditCard, Award, Users, Calendar, Bell,
    Target, BarChart3, Clock, MapPin, Brain, Zap, Sparkles
} from "lucide-react";
import { LineChart, Line, BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, PieChart, Pie, Cell } from 'recharts';
import supabase from "@/lib/supabase";

export default function StudentDashboard() {
    const [user, setUser] = useState<any>(null);
    const [loading, setLoading] = useState(true);
    const [dashboardData, setDashboardData] = useState<any>({
        attendance: { overall: 82.5, shortage: false, subjects: [] },
        marks: { cgpa: 8.4, trend: 'up', internals: [] },
        fees: { due: 45000, paid: 125000, total: 170000 },
        mentor: null,
        certificates: [],
        crt: { progress: 65, tests: 12, rank: 45 },
        upcomingExams: []
    });

    useEffect(() => {
        loadDashboardData();
    }, []);

    const loadDashboardData = async () => {
        try {
            const stored = localStorage.getItem('nriit_user');
            if (!stored) return;

            const parsedUser = JSON.parse(stored);
            setUser(parsedUser);

            // Fetch student profile with mentor
            const { data: profile } = await supabase
                .from('student_profiles')
                .select(`
                    *,
                    mentor:faculty_profiles!mentor_id (
                        employee_id,
                        first_name,
                        last_name,
                        designation,
                        email,
                        phone
                    )
                `)
                .eq('roll_number', parsedUser.roll_number)
                .single();

            if (profile) {
                // 1. Fetch Real Attendance from View
                const { data: attData, error: attError } = await supabase
                    .from('v_student_attendance_summary')
                    .select('*')
                    .eq('student_id', profile.id);

                let attendanceObj = { ...dashboardData.attendance };

                if (attData && attData.length > 0) {
                    const totalClasses = attData.reduce((sum, item) => sum + item.total_classes, 0);
                    const presentClasses = attData.reduce((sum, item) => sum + item.present_count, 0);
                    const overallPct = totalClasses > 0 ? Math.round((presentClasses / totalClasses) * 100) : 0;

                    attendanceObj = {
                        overall: overallPct,
                        shortage: overallPct < 75,
                        subjects: attData.map(item => ({
                            name: item.course_name,
                            total: item.total_classes,
                            attended: item.present_count,
                            pct: item.attendance_percentage
                        }))
                    };
                }

                // 2. Fetch Real Internal Marks
                const { data: marksData } = await supabase
                    .from('internal_marks')
                    .select(`
                        id,
                        marks_obtained,
                        max_marks,
                        exam_type,
                        course:courses (
                            course_code,
                            course_name
                        )
                    `)
                    .eq('student_id', profile.id);

                let marksObj = { ...dashboardData.marks };

                if (marksData && marksData.length > 0) {
                    // Process marks into subjects format (combining Mid 1 & Mid 2)
                    const subjectsMap = new Map();

                    marksData.forEach((m: any) => {
                        const code = m.course?.course_code || 'Unk';
                        if (!subjectsMap.has(code)) {
                            subjectsMap.set(code, { subject: code, mid1: 0, mid2: 0 });
                        }
                        if (m.exam_type === 'mid_1') subjectsMap.get(code).mid1 = m.marks_obtained;
                        if (m.exam_type === 'mid_2') subjectsMap.get(code).mid2 = m.marks_obtained;
                    });

                    marksObj.internals = Array.from(subjectsMap.values());

                    // Simple CGPA calc based on avg (mock logic for demo if no external marks)
                    const totalObtained = marksData.reduce((sum: number, m: any) => sum + Number(m.marks_obtained || 0), 0);
                    const totalMax = marksData.reduce((sum: number, m: any) => sum + Number(m.max_marks || 0), 0);
                    if (totalMax > 0) {
                        marksObj.cgpa = Number(((totalObtained / totalMax) * 10).toFixed(1));
                    }
                }

                setDashboardData({
                    attendance: attendanceObj,
                    marks: marksObj,
                    fees: { due: 45000, paid: 125000, total: 170000 }, // Keep Fees Mock for now
                    mentor: profile.mentor || null,
                    certificates: dashboardData.certificates, // Keep Mock
                    crt: dashboardData.crt, // Keep Mock
                    upcomingExams: dashboardData.upcomingExams // Keep Mock
                });
            }

            setLoading(false);
        } catch (error) {
            console.error('Error loading dashboard:', error);
            setLoading(false);
        }
    };

    const firstName = user?.first_name || "Student";
    const { attendance, marks, fees, mentor, certificates, crt, upcomingExams } = dashboardData;

    // Chart data
    const attendanceTrendData = [
        { month: 'Aug', pct: 78 },
        { month: 'Sep', pct: 81 },
        { month: 'Oct', pct: 85 },
        { month: 'Nov', pct: 83 },
        { month: 'Dec', pct: 82.5 },
    ];

    const feesPieData = [
        { name: 'Paid', value: fees.paid, color: '#10b981' },
        { name: 'Due', value: fees.due, color: '#f59e0b' },
    ];

    // 🧠 AI Analysis Logic (Real-time)
    const sortedAttendance = [...attendance.subjects].sort((a: any, b: any) => a.pct - b.pct);
    const lowAttSubject = sortedAttendance.length > 0 ? sortedAttendance[0] : null;
    const isLowAttendance = lowAttSubject && lowAttSubject.pct < 75;

    const strongSubject = marks.internals.length > 0
        ? marks.internals.reduce((prev: any, current: any) => (Number(prev.mid1) + Number(prev.mid2)) > (Number(current.mid1) + Number(current.mid2)) ? prev : current)
        : { subject: 'General', mid1: 0 };

    if (loading) {
        return (
            <div className="flex items-center justify-center h-screen">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            </div>
        );
    }

    return (
        <div className="space-y-6 pb-8">
            {/* Header with Gradient */}
            <div className="relative overflow-hidden rounded-2xl bg-gradient-to-br from-blue-600 via-purple-600 to-pink-600 p-8 text-white">
                <div className="absolute inset-0 bg-black/10"></div>
                <div className="relative z-10">
                    <h1 className="text-3xl font-bold mb-2">Welcome back, {firstName}! 👋</h1>
                    <p className="text-blue-100">Here's your academic overview for today</p>
                    <div className="mt-4 flex gap-4 text-sm">
                        <div className="flex items-center gap-2">
                            <Calendar className="h-4 w-4" />
                            <span>{new Date().toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' })}</span>
                        </div>
                        {user?.dept_code && (
                            <div className="flex items-center gap-2">
                                <MapPin className="h-4 w-4" />
                                <span>{user.dept_code} - Semester {user.current_semester}</span>
                            </div>
                        )}
                    </div>
                </div>
            </div>

            {/* 🤖 AI PERSONAL MENTOR - STUDENT EDITION */}
            <Card className="border-none shadow-xl bg-gradient-to-r from-violet-900 via-indigo-900 to-blue-900 text-white overflow-hidden relative">
                <div className="absolute top-0 right-0 w-64 h-64 bg-white/10 rounded-full blur-3xl -mr-32 -mt-32 animate-pulse"></div>
                <CardHeader>
                    <CardTitle className="flex items-center gap-3 text-xl">
                        <div className="p-2 bg-white/10 rounded-lg">
                            <Brain className="w-6 h-6 text-cyan-400" />
                        </div>
                        AI Personal Mentor
                        <Badge variant="secondary" className="bg-cyan-500/20 text-cyan-300 border-cyan-500/50">Live Analysis</Badge>
                    </CardTitle>
                    <CardDescription className="text-gray-300">
                        Real-time academic analysis & personalized suggestions
                    </CardDescription>
                </CardHeader>
                <CardContent className="grid md:grid-cols-3 gap-6 relative z-10">
                    {/* Warning or Success */}
                    <div className={`bg-white/5 p-4 rounded-xl border backdrop-blur-sm hover:bg-white/10 transition-colors ${isLowAttendance ? 'border-red-500/30' : 'border-green-500/30'}`}>
                        <div className={`flex items-center gap-2 mb-2 font-semibold ${isLowAttendance ? 'text-red-400' : 'text-green-400'}`}>
                            {isLowAttendance ? <AlertTriangle className="w-4 h-4" /> : <CheckCircle2 className="w-4 h-4" />}
                            {isLowAttendance ? 'Attendance Alert' : 'Attendance On Track'}
                        </div>
                        <p className="text-sm text-gray-300 mb-3">
                            {isLowAttendance ? (
                                <>
                                    <span className="font-bold text-white">{lowAttSubject?.name}</span> is at <span className="text-red-300">{lowAttSubject?.pct}%</span>.
                                    You need to attend the next <span className="font-bold text-white">few classes</span>.
                                </>
                            ) : (
                                <>
                                    Great job! Your lowest attendance is <span className="font-bold text-white">{lowAttSubject?.pct}%</span> in {lowAttSubject?.name}. Keep it up!
                                </>
                            )}
                        </p>
                        <Button size="sm" variant="ghost" className={`${isLowAttendance ? 'text-red-400 hover:text-red-300' : 'text-green-400 hover:text-green-300'} hover:bg-white/5 p-0 h-auto`}>
                            View Schedule <ArrowUpRight className="w-3 h-3 ml-1" />
                        </Button>
                    </div>

                    {/* Boosting */}
                    <div className="bg-white/5 p-4 rounded-xl border border-amber-500/30 backdrop-blur-sm hover:bg-white/10 transition-colors">
                        <div className="flex items-center gap-2 text-amber-400 mb-2 font-semibold">
                            <Zap className="w-4 h-4" />
                            Performance Star
                        </div>
                        <p className="text-sm text-gray-300 mb-3">
                            You are excelling in <span className="font-bold text-white">{strongSubject.subject}</span>.
                            Recommendation: Explore advanced research papers in this domain.
                        </p>
                        <Button size="sm" variant="ghost" className="text-amber-400 hover:text-amber-300 hover:bg-white/5 p-0 h-auto">
                            Access Library <ArrowUpRight className="w-3 h-3 ml-1" />
                        </Button>
                    </div>

                    {/* Insight */}
                    <div className="bg-white/5 p-4 rounded-xl border border-cyan-500/30 backdrop-blur-sm hover:bg-white/10 transition-colors">
                        <div className="flex items-center gap-2 text-cyan-400 mb-2 font-semibold">
                            <Sparkles className="w-4 h-4" />
                            Smart Insight
                        </div>
                        <p className="text-sm text-gray-300 mb-3">
                            You are in the <span className="font-bold text-white">Top 10%</span> for CRT Aptitude.
                            Suggested: Register for "TCS National Qualifier".
                        </p>
                        <Button size="sm" variant="ghost" className="text-cyan-400 hover:text-cyan-300 hover:bg-white/5 p-0 h-auto">
                            Register Now <ArrowUpRight className="w-3 h-3 ml-1" />
                        </Button>
                    </div>
                </CardContent>
            </Card>

            {/* Quick Stats Grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                {/* Attendance Card */}
                <Card className="relative overflow-hidden border-l-4 border-l-green-500 hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Attendance</CardTitle>
                        <div className={`p-2 rounded-lg ${attendance.overall >= 75 ? 'bg-green-100' : 'bg-red-100'}`}>
                            <CheckCircle2 className={`h-5 w-5 ${attendance.overall >= 75 ? 'text-green-600' : 'text-red-600'}`} />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{attendance.overall}%</div>
                        <Progress value={attendance.overall} className="h-2 mt-3" />
                        <p className={`text-xs mt-2 font-medium ${attendance.overall >= 75 ? 'text-green-600' : 'text-red-600'}`}>
                            {attendance.overall >= 75 ? '✓ Above minimum' : '⚠ Below 75% threshold'}
                        </p>
                    </CardContent>
                </Card>

                {/* CGPA Card */}
                <Card className="relative overflow-hidden border-l-4 border-l-blue-500 hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">CGPA</CardTitle>
                        <div className="p-2 rounded-lg bg-blue-100">
                            {marks.trend === 'up' ? <TrendingUp className="h-5 w-5 text-blue-600" /> : <TrendingDown className="h-5 w-5 text-blue-600" />}
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{marks.cgpa}</div>
                        <p className="text-xs text-blue-600 mt-2 font-medium flex items-center gap-1">
                            <ArrowUpRight className="h-3 w-3" />
                            +0.2 from last semester
                        </p>
                        <div className="mt-3 flex gap-1">
                            {[...Array(10)].map((_, i) => (
                                <div key={i} className={`h-1.5 flex-1 rounded-full ${i < Math.floor(marks.cgpa) ? 'bg-blue-500' : 'bg-gray-200'}`}></div>
                            ))}
                        </div>
                    </CardContent>
                </Card>

                {/* Fees Card */}
                <Card className="relative overflow-hidden border-l-4 border-l-amber-500 hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Fee Due</CardTitle>
                        <div className="p-2 rounded-lg bg-amber-100">
                            <CreditCard className="h-5 w-5 text-amber-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">₹{(fees.due / 1000).toFixed(0)}k</div>
                        <p className="text-xs text-amber-600 mt-2 font-medium">Due by 15th Dec</p>
                        <Button size="sm" className="w-full mt-3 bg-gradient-to-r from-amber-500 to-orange-500 hover:from-amber-600 hover:to-orange-600">
                            Pay Now
                        </Button>
                    </CardContent>
                </Card>

                {/* CRT Progress Card */}
                <Card className="relative overflow-hidden border-l-4 border-l-purple-500 hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">CRT Progress</CardTitle>
                        <div className="p-2 rounded-lg bg-purple-100">
                            <Target className="h-5 w-5 text-purple-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{crt.progress}%</div>
                        <Progress value={crt.progress} className="h-2 mt-3" />
                        <p className="text-xs text-purple-600 mt-2 font-medium">
                            {crt.tests} tests completed • Rank #{crt.rank}
                        </p>
                    </CardContent>
                </Card>
            </div>

            {/* Main Content Grid */}
            <div className="grid lg:grid-cols-3 gap-6">
                {/* Left Column - 2/3 width */}
                <div className="lg:col-span-2 space-y-6">
                    {/* Attendance Trend Chart */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <BarChart3 className="h-5 w-5 text-blue-600" />
                                Attendance Trend
                            </CardTitle>
                            <CardDescription>Monthly attendance percentage</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={200}>
                                <LineChart data={attendanceTrendData}>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                    <XAxis dataKey="month" stroke="#888" fontSize={12} />
                                    <YAxis stroke="#888" fontSize={12} domain={[70, 90]} />
                                    <Tooltip
                                        contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }}
                                        formatter={(value: any) => [`${value}%`, 'Attendance']}
                                    />
                                    <Line type="monotone" dataKey="pct" stroke="#3b82f6" strokeWidth={3} dot={{ fill: '#3b82f6', r: 5 }} />
                                </LineChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>

                    {/* Subject-wise Attendance */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <BookOpen className="h-5 w-5 text-green-600" />
                                Subject-wise Attendance
                            </CardTitle>
                            <CardDescription>Detailed breakdown by subject</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="space-y-4">
                                {attendance.subjects.map((subject: any, i: number) => (
                                    <div key={i} className="group">
                                        <div className="flex items-center justify-between mb-2">
                                            <span className="font-medium text-gray-900">{subject.name}</span>
                                            <Badge variant={subject.pct < 75 ? "destructive" : "secondary"}
                                                className={subject.pct >= 75 ? "bg-green-100 text-green-700" : ""}>
                                                {subject.pct}%
                                            </Badge>
                                        </div>
                                        <div className="flex items-center gap-3">
                                            <Progress value={subject.pct} className="h-2 flex-1" />
                                            <span className="text-xs text-gray-500 w-20 text-right">
                                                {subject.attended}/{subject.total}
                                            </span>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </CardContent>
                    </Card>

                    {/* Internal Marks */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <FileText className="h-5 w-5 text-indigo-600" />
                                Internal Marks Comparison
                            </CardTitle>
                            <CardDescription>Mid-1 vs Mid-2 performance</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={250}>
                                <BarChart data={marks.internals}>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                    <XAxis dataKey="subject" stroke="#888" fontSize={12} />
                                    <YAxis stroke="#888" fontSize={12} domain={[0, 20]} />
                                    <Tooltip
                                        contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }}
                                    />
                                    <Bar dataKey="mid1" fill="#8b5cf6" radius={[8, 8, 0, 0]} />
                                    <Bar dataKey="mid2" fill="#3b82f6" radius={[8, 8, 0, 0]} />
                                </BarChart>
                            </ResponsiveContainer>
                            <div className="flex justify-center gap-6 mt-4">
                                <div className="flex items-center gap-2">
                                    <div className="w-3 h-3 rounded-full bg-purple-500"></div>
                                    <span className="text-sm text-gray-600">Mid-1</span>
                                </div>
                                <div className="flex items-center gap-2">
                                    <div className="w-3 h-3 rounded-full bg-blue-500"></div>
                                    <span className="text-sm text-gray-600">Mid-2</span>
                                </div>
                            </div>
                        </CardContent>
                    </Card>
                </div>

                {/* Right Column - 1/3 width */}
                <div className="space-y-6">
                    {/* Mentor Card */}
                    {mentor && (
                        <Card className="hover:shadow-lg transition-shadow border-t-4 border-t-blue-500">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2 text-lg">
                                    <Users className="h-5 w-5 text-blue-600" />
                                    Your Mentor
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <div className="flex items-center gap-3 mb-4">
                                    <div className="w-12 h-12 rounded-full bg-gradient-to-br from-blue-500 to-purple-500 flex items-center justify-center text-white font-bold text-lg">
                                        {mentor.first_name?.[0]}{mentor.last_name?.[0]}
                                    </div>
                                    <div>
                                        <div className="font-semibold text-gray-900">{mentor.first_name} {mentor.last_name}</div>
                                        <div className="text-xs text-gray-500">{mentor.designation}</div>
                                    </div>
                                </div>
                                <div className="space-y-2 text-sm">
                                    <div className="flex items-center gap-2 text-gray-600">
                                        <span className="font-medium">ID:</span>
                                        <span>{mentor.employee_id}</span>
                                    </div>
                                    <div className="flex items-center gap-2 text-gray-600">
                                        <span className="font-medium">Email:</span>
                                        <span className="truncate">{mentor.email}</span>
                                    </div>
                                </div>
                                <Button variant="outline" className="w-full mt-4">
                                    Schedule Meeting
                                </Button>
                            </CardContent>
                        </Card>
                    )}

                    {/* Upcoming Exams */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2 text-lg">
                                <Clock className="h-5 w-5 text-orange-600" />
                                Upcoming Exams
                            </CardTitle>
                        </CardHeader>
                        <CardContent>
                            <div className="space-y-3">
                                {upcomingExams.map((exam: any, i: number) => (
                                    <div key={i} className="p-3 rounded-lg bg-gradient-to-r from-orange-50 to-red-50 border border-orange-200">
                                        <div className="font-medium text-gray-900 text-sm">{exam.subject}</div>
                                        <div className="flex items-center justify-between mt-1">
                                            <span className="text-xs text-gray-600">{exam.type}</span>
                                            <Badge variant="outline" className="text-xs">{exam.date}</Badge>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </CardContent>
                    </Card>

                    {/* Certificates */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2 text-lg">
                                <Award className="h-5 w-5 text-green-600" />
                                Certificates
                            </CardTitle>
                        </CardHeader>
                        <CardContent>
                            <div className="space-y-3">
                                {certificates.map((cert: any, i: number) => (
                                    <div key={i} className="flex items-center justify-between p-2 rounded-lg hover:bg-gray-50">
                                        <div>
                                            <div className="font-medium text-sm text-gray-900">{cert.type}</div>
                                            <div className="text-xs text-gray-500">{cert.date}</div>
                                        </div>
                                        <Badge variant={cert.status === 'approved' ? 'default' : 'secondary'} className="text-xs">
                                            {cert.status}
                                        </Badge>
                                    </div>
                                ))}
                            </div>
                            <Button variant="outline" className="w-full mt-4" size="sm">
                                Request Certificate
                            </Button>
                        </CardContent>
                    </Card>

                    {/* Fee Distribution */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2 text-lg">
                                <CreditCard className="h-5 w-5 text-amber-600" />
                                Fee Status
                            </CardTitle>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={150}>
                                <PieChart>
                                    <Pie
                                        data={feesPieData}
                                        cx="50%"
                                        cy="50%"
                                        innerRadius={40}
                                        outerRadius={60}
                                        paddingAngle={5}
                                        dataKey="value"
                                    >
                                        {feesPieData.map((entry, index) => (
                                            <Cell key={`cell-${index}`} fill={entry.color} />
                                        ))}
                                    </Pie>
                                    <Tooltip formatter={(value: any) => `₹${(value / 1000).toFixed(0)}k`} />
                                </PieChart>
                            </ResponsiveContainer>
                            <div className="space-y-2 mt-4">
                                <div className="flex justify-between text-sm">
                                    <span className="text-gray-600">Total Fee:</span>
                                    <span className="font-semibold">₹{(fees.total / 1000).toFixed(0)}k</span>
                                </div>
                                <div className="flex justify-between text-sm">
                                    <span className="text-green-600">Paid:</span>
                                    <span className="font-semibold text-green-600">₹{(fees.paid / 1000).toFixed(0)}k</span>
                                </div>
                                <div className="flex justify-between text-sm">
                                    <span className="text-amber-600">Due:</span>
                                    <span className="font-semibold text-amber-600">₹{(fees.due / 1000).toFixed(0)}k</span>
                                </div>
                            </div>
                        </CardContent>
                    </Card>
                </div>
            </div>

            {/* Announcements Banner */}
            <Card className="bg-gradient-to-r from-blue-50 to-indigo-50 border-blue-200">
                <CardContent className="p-6">
                    <div className="flex items-start gap-4">
                        <Bell className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                        <div>
                            <h3 className="font-semibold text-gray-900 mb-2">Latest Announcements</h3>
                            <ul className="space-y-2 text-sm text-gray-700">
                                <li className="flex items-start gap-2">
                                    <span className="text-blue-600">•</span>
                                    <span>Mid-2 examinations scheduled from 15th December 2024</span>
                                </li>
                                <li className="flex items-start gap-2">
                                    <span className="text-blue-600">•</span>
                                    <span>CRT aptitude test on 20th December - Registration open</span>
                                </li>
                                <li className="flex items-start gap-2">
                                    <span className="text-blue-600">•</span>
                                    <span>Fee payment deadline extended to 18th December</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
