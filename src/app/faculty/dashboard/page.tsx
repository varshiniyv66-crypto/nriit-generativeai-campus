"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import {
    Users, Clock, FileText, CheckCircle2, AlertCircle, ArrowRight,
    BookOpen, TrendingUp, Calendar, Bell, Target, BarChart3,
    AlertTriangle, UserCheck, Upload, Award, MessageSquare, Brain, Zap, Sparkles,
    GraduationCap, ClipboardCheck
} from "lucide-react";
import { BarChart, Bar, LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, PieChart, Pie, Cell } from 'recharts';
import supabase from "@/lib/supabase";
import Link from "next/link";
import { DashboardSkeleton } from "@/components/ui/skeleton";
import { ThemeToggleSimple } from "@/components/theme-toggle";
import {
    AnimatedRadarChart,
    AnimatedAreaChart,
    AnimatedSegmentedBarChart,
    ComposedLineBarChart,
    MultiSeriesRadarChart
} from "@/components/charts/interactive-charts";

export default function FacultyDashboard() {
    const [user, setUser] = useState<any>(null);
    const [loading, setLoading] = useState(true);
    const [dashboardData, setDashboardData] = useState<any>({
        workload: 18,
        totalStudents: 240,
        mentees: 0,
        pendingMarks: 2,
        research: 12,
        todayClasses: [],
        atRiskStudents: [],
        mentoringAlerts: 0
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

            // Fetch faculty profile
            const { data: profile } = await supabase
                .from('faculty_profiles')
                .select('*')
                .eq('employee_id', parsedUser.employee_id)
                .single();

            if (profile) {
                // Fetch mentee count
                const { count: menteeCount } = await supabase
                    .from('student_profiles')
                    .select('*', { count: 'exact', head: true })
                    .eq('mentor_id', profile.id)
                    .eq('is_active', true);

                // Fetch mentee IDs first
                const { data: mentees } = await supabase
                    .from('student_profiles')
                    .select('id')
                    .eq('mentor_id', profile.id)
                    .eq('is_active', true);

                const menteeIds = mentees?.map(m => m.id) || [];

                // Fetch at-risk students (mentees with risk flags)
                const { data: riskStudents } = menteeIds.length > 0 ? await supabase
                    .from('student_risk_flags')
                    .select(`
                        *,
                        student:student_profiles (
                            roll_number,
                            first_name,
                            last_name,
                            current_semester
                        )
                    `)
                    .eq('is_resolved', false)
                    .in('student_id', menteeIds)
                    .limit(10) : { data: [] };

                setDashboardData({
                    workload: 18,
                    totalStudents: 240,
                    mentees: menteeCount || 0,
                    pendingMarks: 2,
                    research: 12,
                    todayClasses: [
                        { time: '09:00 - 09:50', year: 'III CSE-A', sub: 'Computer Networks', room: 'LH-101', students: 60, status: 'completed' },
                        { time: '10:50 - 11:40', year: 'II CSE-B', sub: 'Data Structures', room: 'LH-203', students: 65, status: 'upcoming' },
                        { time: '13:30 - 16:10', year: 'III CSE-A', sub: 'Networks Lab', room: 'Lab-3', students: 60, status: 'upcoming' },
                    ],
                    atRiskStudents: riskStudents || [],
                    mentoringAlerts: riskStudents?.length || 0
                });
            }

            setLoading(false);
        } catch (error) {
            console.error('Error loading dashboard:', error);
            setLoading(false);
        }
    };

    const name = user?.last_name ? `Dr. ${user.last_name}` : "Professor";

    // Chart data
    const attendanceData = [
        { class: 'CSE-A', attendance: 85 },
        { class: 'CSE-B', attendance: 78 },
        { class: 'IT-A', attendance: 92 },
        { class: 'IT-B', attendance: 88 },
    ];

    const mentoringTrendData = [
        { month: 'Aug', sessions: 12 },
        { month: 'Sep', sessions: 15 },
        { month: 'Oct', sessions: 18 },
        { month: 'Nov', sessions: 14 },
        { month: 'Dec', sessions: 10 },
    ];

    const riskDistribution = [
        { name: 'Low', value: 5, color: '#10b981' },
        { name: 'Medium', value: 3, color: '#f59e0b' },
        { name: 'High', value: 2, color: '#ef4444' },
    ];

    // NEW: Radar chart for teaching metrics
    const teachingMetricsData = [
        { metric: 'Attendance', score: 85 },
        { metric: 'Syllabus', score: 78 },
        { metric: 'Feedback', score: 92 },
        { metric: 'Research', score: 70 },
        { metric: 'Mentoring', score: 88 },
        { metric: 'Publications', score: 65 },
    ];

    // NEW: Area chart for class performance over time
    const classPerformanceData = [
        { month: 'Aug', cseA: 75, cseB: 72, itA: 80 },
        { month: 'Sep', cseA: 78, cseB: 75, itA: 82 },
        { month: 'Oct', cseA: 82, cseB: 78, itA: 85 },
        { month: 'Nov', cseA: 80, cseB: 80, itA: 88 },
        { month: 'Dec', cseA: 85, cseB: 82, itA: 90 },
    ];

    // NEW: Segmented bar chart for student results
    const studentResultsData = [
        { subject: 'CN', passed: 52, failed: 8 },
        { subject: 'DS', passed: 58, failed: 7 },
        { subject: 'OS', passed: 48, failed: 12 },
        { subject: 'DBMS', passed: 55, failed: 5 },
    ];

    // NEW: Composed chart for workload distribution
    const workloadData = [
        { day: 'Mon', hours: 6, average: 5 },
        { day: 'Tue', hours: 4, average: 5 },
        { day: 'Wed', hours: 5, average: 5 },
        { day: 'Thu', hours: 7, average: 5 },
        { day: 'Fri', hours: 3, average: 5 },
        { day: 'Sat', hours: 2, average: 5 },
    ];

    if (loading) {
        return <DashboardSkeleton />;
    }

    return (
        <div className="space-y-6 pb-8">
            {/* Header with Gradient */}
            <div className="relative overflow-hidden rounded-2xl bg-gradient-to-br from-indigo-600 via-purple-600 to-pink-600 p-8 text-white">
                <div className="absolute inset-0 bg-black/10"></div>
                {/* Theme Toggle */}
                <div className="absolute top-4 right-4 z-20">
                    <ThemeToggleSimple />
                </div>
                <div className="relative z-10">
                    <div className="flex items-center justify-between">
                        <div>
                            <h1 className="text-3xl font-bold mb-2">Good Morning, {name}! 👋</h1>
                            <p className="text-indigo-100">You have {dashboardData.todayClasses.filter((c: any) => c.status === 'upcoming').length} classes today</p>
                        </div>
                        <div className="flex gap-3">
                            <Button variant="secondary" className="gap-2 bg-white/20 hover:bg-white/30 text-white border-white/30">
                                <FileText className="w-4 h-4" />
                                Leave Request
                            </Button>
                            <Link href="/faculty/attendance">
                                <Button className="bg-white text-indigo-600 hover:bg-white/90 gap-2">
                                    <CheckCircle2 className="w-4 h-4" />
                                    Mark Attendance
                                </Button>
                            </Link>
                        </div>
                    </div>
                    <div className="mt-4 flex gap-4 text-sm">
                        <div className="flex items-center gap-2">
                            <Calendar className="h-4 w-4" />
                            <span>{new Date().toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' })}</span>
                        </div>
                        {user?.dept_code && (
                            <div className="flex items-center gap-2">
                                <BookOpen className="h-4 w-4" />
                                <span>{user.dept_code} Department</span>
                            </div>
                        )}
                    </div>
                </div>
            </div>

            {/* 🤖 AI TEACHING ASSISTANT */}
            <Card className="border-none shadow-xl bg-gradient-to-r from-violet-900 via-indigo-900 to-blue-900 text-white overflow-hidden relative">
                <div className="absolute top-0 right-0 w-64 h-64 bg-white/10 rounded-full blur-3xl -mr-32 -mt-32 animate-pulse"></div>
                <CardHeader>
                    <CardTitle className="flex items-center gap-3 text-xl">
                        <div className="p-2 bg-white/10 rounded-lg">
                            <Brain className="w-6 h-6 text-cyan-400" />
                        </div>
                        AI Teaching Assistant
                        <Badge variant="secondary" className="bg-cyan-500/20 text-cyan-300 border-cyan-500/50">Live</Badge>
                    </CardTitle>
                    <CardDescription className="text-gray-300">
                        Intelligent insights to optimize your teaching & research
                    </CardDescription>
                </CardHeader>
                <CardContent className="grid md:grid-cols-3 gap-6 relative z-10">
                    {/* Risk Alert */}
                    <div className={`bg-white/5 p-4 rounded-xl border backdrop-blur-sm hover:bg-white/10 transition-colors ${dashboardData.atRiskStudents.length > 0 ? 'border-red-500/30' : 'border-green-500/30'}`}>
                        <div className={`flex items-center gap-2 mb-2 font-semibold ${dashboardData.atRiskStudents.length > 0 ? 'text-red-400' : 'text-green-400'}`}>
                            {dashboardData.atRiskStudents.length > 0 ? <AlertTriangle className="w-4 h-4" /> : <CheckCircle2 className="w-4 h-4" />}
                            {dashboardData.atRiskStudents.length > 0 ? 'Detention Risk' : 'All Clear'}
                        </div>
                        <p className="text-sm text-gray-300 mb-3">
                            {dashboardData.atRiskStudents.length > 0 ? (
                                <>
                                    <span className="font-bold text-white">{dashboardData.atRiskStudents.length} Mentees</span> have critical alerts.
                                    Action: Schedule counseling immediately.
                                </>
                            ) : (
                                "No students at risk. Your mentees are maintaining good attendance!"
                            )}
                        </p>
                        <Link href="/faculty/mentoring">
                            <Button size="sm" variant="ghost" className={`${dashboardData.atRiskStudents.length > 0 ? 'text-red-400 hover:text-red-300' : 'text-green-400 hover:text-green-300'} hover:bg-white/5 p-0 h-auto`}>
                                View Mentees <ArrowRight className="w-3 h-3 ml-1" />
                            </Button>
                        </Link>
                    </div>

                    {/* Optimization */}
                    <div className="bg-white/5 p-4 rounded-xl border border-amber-500/30 backdrop-blur-sm hover:bg-white/10 transition-colors">
                        <div className="flex items-center gap-2 text-amber-400 mb-2 font-semibold">
                            <Zap className="w-4 h-4" />
                            Schedule Optimizer
                        </div>
                        <p className="text-sm text-gray-300 mb-3">
                            You have <span className="font-bold text-white">3 Free Periods</span> today between 10 AM - 1 PM.
                            Suggested: Work on "AI Research Paper".
                        </p>
                        <Button size="sm" variant="ghost" className="text-amber-400 hover:text-amber-300 hover:bg-white/5 p-0 h-auto">
                            My Calendar <ArrowRight className="w-3 h-3 ml-1" />
                        </Button>
                    </div>

                    {/* Insight */}
                    <div className="bg-white/5 p-4 rounded-xl border border-cyan-500/30 backdrop-blur-sm hover:bg-white/10 transition-colors">
                        <div className="flex items-center gap-2 text-cyan-400 mb-2 font-semibold">
                            <Sparkles className="w-4 h-4" />
                            Class Insight
                        </div>
                        <p className="text-sm text-gray-300 mb-3">
                            <span className="font-bold text-white">CSE-A</span> average marks dropped by 8% in Mid-1.
                            Suggested: Review "Unit 2: Graph Theory" topics.
                        </p>
                        <Button size="sm" variant="ghost" className="text-cyan-400 hover:text-cyan-300 hover:bg-white/5 p-0 h-auto">
                            View Analysis <ArrowRight className="w-3 h-3 ml-1" />
                        </Button>
                    </div>
                </CardContent>
            </Card>

            {/* Quick Stats Grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-6">
                {/* Workload */}
                <Card className="relative overflow-hidden border-l-4 border-l-indigo-500 hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600 dark:text-gray-400">Workload</CardTitle>
                        <div className="p-2 rounded-lg bg-indigo-100 dark:bg-indigo-900/50">
                            <Clock className="h-5 w-5 text-indigo-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900 dark:text-white">{dashboardData.workload} Hrs</div>
                        <p className="text-xs text-gray-500 mt-2">per week</p>
                    </CardContent>
                </Card>

                {/* Total Students */}
                <Card className="relative overflow-hidden border-l-4 border-l-green-500 hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600 dark:text-gray-400">Students</CardTitle>
                        <div className="p-2 rounded-lg bg-green-100 dark:bg-green-900/50">
                            <Users className="h-5 w-5 text-green-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900 dark:text-white">{dashboardData.totalStudents}</div>
                        <p className="text-xs text-gray-500 mt-2">Across 4 sections</p>
                    </CardContent>
                </Card>

                {/* Mentees */}
                <Card className="relative overflow-hidden border-l-4 border-l-purple-500 hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600 dark:text-gray-400">Mentees</CardTitle>
                        <div className="p-2 rounded-lg bg-purple-100 dark:bg-purple-900/50">
                            <UserCheck className="h-5 w-5 text-purple-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900 dark:text-white">{dashboardData.mentees}</div>
                        <p className="text-xs text-purple-600 mt-2 font-medium flex items-center gap-1">
                            {dashboardData.mentoringAlerts > 0 && (
                                <>
                                    <AlertTriangle className="h-3 w-3" />
                                    {dashboardData.mentoringAlerts} at risk
                                </>
                            )}
                            {dashboardData.mentoringAlerts === 0 && '✓ All on track'}
                        </p>
                    </CardContent>
                </Card>

                {/* Pending Marks */}
                <Card className="relative overflow-hidden border-l-4 border-l-amber-500 hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600 dark:text-gray-400">Pending Marks</CardTitle>
                        <div className="p-2 rounded-lg bg-amber-100 dark:bg-amber-900/50">
                            <AlertCircle className="h-5 w-5 text-amber-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900 dark:text-white">{dashboardData.pendingMarks}</div>
                        <p className="text-xs text-amber-600 mt-2 font-medium">Mid-1 Exams</p>
                    </CardContent>
                </Card>

                {/* Research */}
                <Card className="relative overflow-hidden border-l-4 border-l-blue-500 hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600 dark:text-gray-400">Research</CardTitle>
                        <div className="p-2 rounded-lg bg-blue-100 dark:bg-blue-900/50">
                            <Award className="h-5 w-5 text-blue-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900 dark:text-white">{dashboardData.research}</div>
                        <p className="text-xs text-gray-500 mt-2">Citations this year</p>
                    </CardContent>
                </Card>
            </div>

            {/* NEW: Interactive Charts Section */}
            <div className="grid lg:grid-cols-2 gap-6">
                {/* Radar Chart - Teaching Metrics */}
                <AnimatedRadarChart
                    data={teachingMetricsData}
                    title="Teaching Performance"
                    description="Your performance across key metrics"
                    dataKey="score"
                    nameKey="metric"
                    height={280}
                />

                {/* Area Chart - Class Performance */}
                <AnimatedAreaChart
                    data={classPerformanceData}
                    title="Class Performance Trends"
                    description="Average marks over time by section"
                    xAxisKey="month"
                    dataKeys={[
                        { key: 'cseA', color: 'blue', name: 'CSE-A' },
                        { key: 'cseB', color: 'purple', name: 'CSE-B' },
                        { key: 'itA', color: 'green', name: 'IT-A' },
                    ]}
                    height={280}
                />
            </div>

            {/* Segmented Bar + Composed Chart */}
            <div className="grid lg:grid-cols-2 gap-6">
                {/* Segmented Bar Chart - Student Results */}
                <AnimatedSegmentedBarChart
                    data={studentResultsData}
                    title="Subject-wise Results"
                    description="Pass/Fail distribution by subject"
                    xAxisKey="subject"
                    segments={[
                        { key: 'passed', color: '#10b981', name: 'Passed' },
                        { key: 'failed', color: '#ef4444', name: 'Failed' },
                    ]}
                    height={250}
                />

                {/* Composed Chart - Weekly Workload */}
                <ComposedLineBarChart
                    data={workloadData}
                    title="Weekly Workload Distribution"
                    description="Daily hours vs average"
                    xAxisKey="day"
                    barKey="hours"
                    lineKey="average"
                    height={250}
                />
            </div>

            {/* Main Content Grid */}
            <div className="grid lg:grid-cols-3 gap-6">
                {/* Left Column - 2/3 width */}
                <div className="lg:col-span-2 space-y-6">
                    {/* Today's Schedule with Quick Attendance */}
                    <Card className="hover:shadow-lg transition-shadow border-t-4 border-t-indigo-500">
                        <CardHeader className="flex flex-row items-center justify-between">
                            <div>
                                <CardTitle className="flex items-center gap-2">
                                    <Calendar className="h-5 w-5 text-indigo-600" />
                                    Today's Schedule & Attendance
                                </CardTitle>
                                <CardDescription>Mark attendance quickly or use full grid view</CardDescription>
                            </div>
                            <Link href="/faculty/attendance">
                                <Button size="sm" className="bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 gap-2">
                                    <CheckCircle2 className="w-4 h-4" />
                                    Open Grid View
                                </Button>
                            </Link>
                        </CardHeader>
                        <CardContent>
                            <div className="space-y-4">
                                {dashboardData.todayClasses.map((cls: any, i: number) => (
                                    <div key={i} className="flex items-center gap-4 p-4 rounded-xl border-2 border-gray-100 dark:border-gray-800 hover:border-indigo-300 dark:hover:border-indigo-700 hover:bg-gradient-to-r hover:from-indigo-50 hover:to-purple-50 dark:hover:from-indigo-900/20 dark:hover:to-purple-900/20 transition-all group">
                                        <div className="w-24 flex-shrink-0 text-center">
                                            <div className="text-sm font-bold text-gray-900 dark:text-white">{cls.time.split(' - ')[0]}</div>
                                            <div className="text-xs text-gray-500">{cls.time.split(' - ')[1]}</div>
                                        </div>
                                        <div className="flex-1 min-w-0">
                                            <div className="flex items-center gap-2 mb-1">
                                                <span className="font-semibold text-gray-900 dark:text-white truncate">{cls.sub}</span>
                                                <Badge variant="secondary" className="text-[10px] h-5 bg-indigo-100 dark:bg-indigo-900/50 text-indigo-700 dark:text-indigo-300">{cls.year}</Badge>
                                            </div>
                                            <div className="text-sm text-gray-500 flex items-center gap-4">
                                                <span className="flex items-center gap-1">
                                                    <Users className="w-3 h-3" /> {cls.students} Students
                                                </span>
                                                <span>{cls.room}</span>
                                            </div>
                                        </div>
                                        <div className="flex gap-2">
                                            {cls.status === 'completed' ? (
                                                <div className="flex items-center gap-2">
                                                    <Badge className="bg-green-100 dark:bg-green-900/50 text-green-700 dark:text-green-300 border-green-200">
                                                        <CheckCircle2 className="w-3 h-3 mr-1" /> Marked
                                                    </Badge>
                                                </div>
                                            ) : (
                                                <Link href="/faculty/attendance">
                                                    <Button size="sm" className="bg-gradient-to-r from-green-600 to-emerald-600 hover:from-green-700 hover:to-emerald-700 gap-2">
                                                        <CheckCircle2 className="w-4 h-4" />
                                                        Mark Now
                                                    </Button>
                                                </Link>
                                            )}
                                        </div>
                                    </div>
                                ))}

                                {/* Quick Stats */}
                                <div className="grid grid-cols-3 gap-3 mt-4 pt-4 border-t dark:border-gray-800">
                                    <div className="text-center p-3 rounded-lg bg-green-50 dark:bg-green-900/20 border border-green-200 dark:border-green-800">
                                        <div className="text-2xl font-bold text-green-700 dark:text-green-400">1</div>
                                        <div className="text-xs text-green-600 dark:text-green-500">Completed</div>
                                    </div>
                                    <div className="text-center p-3 rounded-lg bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-800">
                                        <div className="text-2xl font-bold text-blue-700 dark:text-blue-400">2</div>
                                        <div className="text-xs text-blue-600 dark:text-blue-500">Pending</div>
                                    </div>
                                    <div className="text-center p-3 rounded-lg bg-purple-50 dark:bg-purple-900/20 border border-purple-200 dark:border-purple-800">
                                        <div className="text-2xl font-bold text-purple-700 dark:text-purple-400">3</div>
                                        <div className="text-xs text-purple-600 dark:text-purple-500">Total Today</div>
                                    </div>
                                </div>
                            </div>
                        </CardContent>
                    </Card>

                    {/* Class-wise Attendance */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <BarChart3 className="h-5 w-5 text-green-600" />
                                Class-wise Attendance Snapshot
                            </CardTitle>
                            <CardDescription>Average attendance across your classes</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={250}>
                                <BarChart data={attendanceData}>
                                    <defs>
                                        <linearGradient id="attendanceBarGradient" x1="0" y1="0" x2="0" y2="1">
                                            <stop offset="5%" stopColor="#10b981" stopOpacity={1} />
                                            <stop offset="95%" stopColor="#059669" stopOpacity={0.8} />
                                        </linearGradient>
                                    </defs>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                    <XAxis dataKey="class" stroke="#888" fontSize={12} />
                                    <YAxis stroke="#888" fontSize={12} domain={[0, 100]} />
                                    <Tooltip
                                        contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }}
                                        formatter={(value: any) => [`${value}%`, 'Attendance']}
                                    />
                                    <Bar
                                        dataKey="attendance"
                                        fill="url(#attendanceBarGradient)"
                                        radius={[8, 8, 0, 0]}
                                        animationDuration={1200}
                                    />
                                </BarChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>

                    {/* Mentoring Sessions Trend */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <TrendingUp className="h-5 w-5 text-purple-600" />
                                Mentoring Activity
                            </CardTitle>
                            <CardDescription>Monthly mentoring sessions conducted</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={200}>
                                <LineChart data={mentoringTrendData}>
                                    <defs>
                                        <linearGradient id="mentoringGradient" x1="0" y1="0" x2="0" y2="1">
                                            <stop offset="5%" stopColor="#a855f7" stopOpacity={0.8} />
                                            <stop offset="95%" stopColor="#a855f7" stopOpacity={0.1} />
                                        </linearGradient>
                                    </defs>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                    <XAxis dataKey="month" stroke="#888" fontSize={12} />
                                    <YAxis stroke="#888" fontSize={12} />
                                    <Tooltip
                                        contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }}
                                        formatter={(value: any) => [`${value}`, 'Sessions']}
                                    />
                                    <Line
                                        type="monotone"
                                        dataKey="sessions"
                                        stroke="#a855f7"
                                        strokeWidth={3}
                                        dot={{ fill: '#a855f7', r: 5 }}
                                        activeDot={{ r: 8, fill: '#7e22ce' }}
                                        animationDuration={1500}
                                    />
                                </LineChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>
                </div>

                {/* Right Column - 1/3 width */}
                <div className="space-y-6">
                    {/* At-Risk Students (Top 10) */}
                    <Card className="border-t-4 border-t-red-500 hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2 text-lg">
                                <AlertTriangle className="h-5 w-5 text-red-600" />
                                At-Risk Students
                            </CardTitle>
                            <CardDescription>Top 10 mentees needing attention</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="space-y-3 max-h-96 overflow-y-auto">
                                {dashboardData.atRiskStudents.length > 0 ? (
                                    dashboardData.atRiskStudents.map((risk: any, i: number) => (
                                        <div key={i} className="flex items-center justify-between p-3 bg-red-50 dark:bg-red-900/20 rounded-lg border border-red-200 dark:border-red-800">
                                            <div className="flex items-center gap-3">
                                                <div className="w-10 h-10 rounded-full bg-red-100 dark:bg-red-900/50 text-red-600 flex items-center justify-center font-bold text-sm">
                                                    {risk.student?.first_name?.[0]}{risk.student?.last_name?.[0]}
                                                </div>
                                                <div>
                                                    <div className="text-sm font-medium text-gray-900 dark:text-white">
                                                        {risk.student?.first_name} {risk.student?.last_name}
                                                    </div>
                                                    <div className="text-xs text-gray-500">{risk.student?.roll_number}</div>
                                                </div>
                                            </div>
                                            <Badge
                                                variant="destructive"
                                                className={`text-[10px] ${risk.risk_level === 'critical' ? 'bg-red-600' :
                                                    risk.risk_level === 'high' ? 'bg-orange-600' :
                                                        risk.risk_level === 'medium' ? 'bg-yellow-600' :
                                                            'bg-blue-600'
                                                    }`}
                                            >
                                                {risk.risk_type}
                                            </Badge>
                                        </div>
                                    ))
                                ) : (
                                    <div className="text-center py-8 text-gray-500">
                                        <CheckCircle2 className="h-12 w-12 mx-auto mb-2 text-green-500" />
                                        <p className="text-sm">No at-risk students!</p>
                                        <p className="text-xs">All mentees are on track</p>
                                    </div>
                                )}
                            </div>
                            <Link href="/faculty/mentoring">
                                <Button variant="link" className="w-full text-purple-600 p-0 h-auto text-sm mt-4">
                                    View Mentoring Dashboard <ArrowRight className="w-3 h-3 ml-1" />
                                </Button>
                            </Link>
                        </CardContent>
                    </Card>

                    {/* Risk Distribution */}
                    {dashboardData.atRiskStudents.length > 0 && (
                        <Card className="hover:shadow-lg transition-shadow">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2 text-lg">
                                    <Target className="h-5 w-5 text-orange-600" />
                                    Risk Distribution
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <ResponsiveContainer width="100%" height={150}>
                                    <PieChart>
                                        <Pie
                                            data={riskDistribution}
                                            cx="50%"
                                            cy="50%"
                                            innerRadius={40}
                                            outerRadius={60}
                                            paddingAngle={5}
                                            dataKey="value"
                                            animationDuration={1200}
                                        >
                                            {riskDistribution.map((entry, index) => (
                                                <Cell key={`cell-${index}`} fill={entry.color} />
                                            ))}
                                        </Pie>
                                        <Tooltip />
                                    </PieChart>
                                </ResponsiveContainer>
                                <div className="flex justify-center gap-4 mt-4">
                                    {riskDistribution.map((entry, i) => (
                                        <div key={i} className="flex items-center gap-2">
                                            <div className="w-3 h-3 rounded-full" style={{ backgroundColor: entry.color }}></div>
                                            <span className="text-xs text-gray-600 dark:text-gray-400">{entry.name}: {entry.value}</span>
                                        </div>
                                    ))}
                                </div>
                            </CardContent>
                        </Card>
                    )}

                    {/* Quick Actions */}
                    <Card className="bg-gradient-to-br from-blue-50 to-indigo-50 dark:from-blue-900/20 dark:to-indigo-900/20 border-blue-200 dark:border-blue-800 hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="text-blue-700 dark:text-blue-300 text-lg">Quick Actions</CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-3">
                            <Button variant="outline" className="w-full justify-start gap-2 hover:bg-blue-100 dark:hover:bg-blue-900/50">
                                <Upload className="w-4 h-4" />
                                Upload Materials
                            </Button>
                            <Link href="/faculty/marks" className="block">
                                <Button variant="outline" className="w-full justify-start gap-2 hover:bg-blue-100 dark:hover:bg-blue-900/50">
                                    <FileText className="w-4 h-4" />
                                    Enter Marks
                                </Button>
                            </Link>
                            <Button variant="outline" className="w-full justify-start gap-2 hover:bg-blue-100 dark:hover:bg-blue-900/50">
                                <MessageSquare className="w-4 h-4" />
                                Schedule Mentoring
                            </Button>
                            <Button variant="outline" className="w-full justify-start gap-2 hover:bg-blue-100 dark:hover:bg-blue-900/50">
                                <Award className="w-4 h-4" />
                                Update Research
                            </Button>
                        </CardContent>
                    </Card>

                    {/* NBA Tasks */}
                    <Card className="bg-gradient-to-br from-amber-50 to-orange-50 dark:from-amber-900/20 dark:to-orange-900/20 border-amber-200 dark:border-amber-800 hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="text-amber-700 dark:text-amber-300 text-lg flex items-center gap-2">
                                <Bell className="h-5 w-5" />
                                NBA Tasks
                            </CardTitle>
                            <CardDescription>Pending accreditation tasks</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="text-sm text-gray-700 dark:text-gray-300 mb-3">
                                Please upload <strong>Course Outcomes (CO)</strong> mapping for Computer Networks by Friday.
                            </div>
                            <Button size="sm" variant="outline" className="w-full text-amber-700 dark:text-amber-300 border-amber-300 dark:border-amber-700 hover:bg-amber-100 dark:hover:bg-amber-900/50">
                                <FileText className="w-3 h-3 mr-2" /> Upload Evidence
                            </Button>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </div>
    );
}
