"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import {
    Users, GraduationCap, Building2, TrendingUp, AlertCircle,
    UserPlus, FileText, BarChart3, Award, Calendar, Bell,
    CheckCircle2, Clock, Target, BookOpen, Briefcase, Star,
    ArrowRight, TrendingDown, Activity, DollarSign, UserCheck, Filter
} from "lucide-react";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { format } from "date-fns";
import { cn } from "@/lib/utils";
import {
    BarChart, Bar, LineChart, Line, XAxis, YAxis, CartesianGrid,
    Tooltip, ResponsiveContainer, PieChart, Pie, Cell, AreaChart, Area
} from 'recharts';
import supabase from "@/lib/supabase";
import Link from "next/link";

export default function DeanDashboard() {
    const [user, setUser] = useState<any>(null);
    const [loading, setLoading] = useState(true);
    const [dashboardData, setDashboardData] = useState<any>({
        totalFaculty: 0,
        totalStudents: 0,
        totalDepartments: 0,
        atRiskStudents: 0,
        facultyByDept: [],
        studentsByDept: [],
        recentActivities: [],
        pendingApprovals: 0,
        placementRate: 0,
        researchPublications: 0
    });

    const [date, setDate] = useState<Date | undefined>(new Date());
    const [selectedPeriod, setSelectedPeriod] = useState("all");
    const [selectedDept, setSelectedDept] = useState("all");
    const [selectedSection, setSelectedSection] = useState("all");

    useEffect(() => {
        loadDashboardData();
    }, []);

    const loadDashboardData = async () => {
        try {
            const stored = localStorage.getItem('nriit_user');
            if (!stored) return;

            const parsedUser = JSON.parse(stored);
            setUser(parsedUser);

            // Fetch comprehensive dashboard data
            const [
                { count: facultyCount },
                { count: studentCount },
                { count: deptCount },
                { count: riskCount },
                { data: deptData },
                { data: facultyByDept },
                { data: studentsByDept }
            ] = await Promise.all([
                supabase.from('faculty_profiles').select('*', { count: 'exact', head: true }).eq('is_active', true),
                supabase.from('student_profiles').select('*', { count: 'exact', head: true }).eq('is_active', true),
                supabase.from('departments').select('*', { count: 'exact', head: true }),
                supabase.from('student_risk_flags').select('*', { count: 'exact', head: true }).eq('is_resolved', false),
                supabase.from('departments').select('*'),
                supabase.from('faculty_profiles').select('department_id, departments(dept_name)').eq('is_active', true),
                supabase.from('student_profiles').select('department_id, departments(dept_name)').eq('is_active', true)
            ]);

            // Process faculty by department
            const facultyDeptMap = new Map();
            facultyByDept?.forEach((f: any) => {
                const deptName = f.departments?.dept_name || 'Unknown';
                facultyDeptMap.set(deptName, (facultyDeptMap.get(deptName) || 0) + 1);
            });

            // Process students by department
            const studentDeptMap = new Map();
            studentsByDept?.forEach((s: any) => {
                const deptName = s.departments?.dept_name || 'Unknown';
                studentDeptMap.set(deptName, (studentDeptMap.get(deptName) || 0) + 1);
            });

            const facultyByDeptData = Array.from(facultyDeptMap.entries()).map(([name, count]) => ({
                dept: name.replace('Department of ', ''),
                count
            }));

            const studentsByDeptData = Array.from(studentDeptMap.entries()).map(([name, count]) => ({
                dept: name.replace('Department of ', ''),
                count
            }));

            setDashboardData({
                totalFaculty: facultyCount || 0,
                totalStudents: studentCount || 0,
                totalDepartments: deptCount || 0,
                atRiskStudents: riskCount || 0,
                facultyByDept: facultyByDeptData,
                studentsByDept: studentsByDeptData,
                pendingApprovals: 8,
                placementRate: 87,
                researchPublications: 142,
                recentActivities: [
                    { type: 'faculty', action: 'New faculty joined', dept: 'CSE', time: '2 hours ago' },
                    { type: 'student', action: 'Bulk student enrollment', dept: 'ECE', time: '5 hours ago' },
                    { type: 'approval', action: 'Leave request pending', dept: 'MECH', time: '1 day ago' },
                ]
            });

            setLoading(false);
        } catch (error) {
            console.error('Error loading dashboard:', error);
            setLoading(false);
        }
    };

    // Chart data
    const departmentPerformanceData = [
        { dept: 'CSE', performance: 92, target: 90 },
        { dept: 'ECE', performance: 88, target: 85 },
        { dept: 'MECH', performance: 85, target: 85 },
        { dept: 'CIVIL', performance: 83, target: 80 },
        { dept: 'EEE', performance: 87, target: 85 },
        { dept: 'IT', performance: 90, target: 88 },
    ];

    const enrollmentTrendData = [
        { year: '2020', students: 1420 },
        { year: '2021', students: 1485 },
        { year: '2022', students: 1520 },
        { year: '2023', students: 1560 },
        { year: '2024', students: 1600 },
    ];

    const facultyDistribution = [
        { name: 'Professors', value: 15, color: '#6366f1' },
        { name: 'Assoc. Prof', value: 28, color: '#8b5cf6' },
        { name: 'Asst. Prof', value: 45, color: '#a855f7' },
        { name: 'Lecturers', value: 12, color: '#c084fc' },
    ];

    // Custom Dot for Chart Highlighting
    const CustomDot = (props: any) => {
        const { cx, cy, payload } = props;
        const isSelected = selectedPeriod !== 'all' && payload.period === `P${selectedPeriod}`;

        if (selectedPeriod !== 'all' && !isSelected) {
            return <circle cx={cx} cy={cy} r={3} fill="#e5e7eb" stroke="none" />;
        }

        return (
            <circle
                cx={cx}
                cy={cy}
                r={isSelected ? 7 : 4}
                fill={isSelected ? "#ef4444" : "#0d9488"}
                stroke="white"
                strokeWidth={2}
            />
        );
    };

    const placementTrendData = [
        { month: 'Aug', placed: 45 },
        { month: 'Sep', placed: 78 },
        { month: 'Oct', placed: 112 },
        { month: 'Nov', placed: 156 },
        { month: 'Dec', placed: 189 },
    ];

    const [trendData, setTrendData] = useState([
        { period: 'P1', attendance: 85, time: '09:00' },
        { period: 'P2', attendance: 92, time: '09:50' },
        { period: 'P3', attendance: 88, time: '10:50' },
        { period: 'P4', attendance: 75, time: '11:40' },
        { period: 'P5', attendance: 65, time: '13:30' },
        { period: 'P6', attendance: 0, time: '14:20' },
        { period: 'P7', attendance: 0, time: '15:20' },
        { period: 'P8', attendance: 0, time: '16:10' },
    ]);

    // Simulate data change when filters change
    useEffect(() => {
        // In a real app, this would fetch from API based on selectedDept, selectedSection, date
        const generateRandomTrend = () => {
            const base = selectedDept === 'all' ? 80 : Math.floor(Math.random() * 20) + 70;
            return [
                { period: 'P1', attendance: base + Math.floor(Math.random() * 10), time: '09:00', predicted: base + 2 },
                { period: 'P2', attendance: base + Math.floor(Math.random() * 10), time: '09:50', predicted: base + 4 },
                { period: 'P3', attendance: base - Math.floor(Math.random() * 5), time: '10:50', predicted: base },
                { period: 'P4', attendance: base - Math.floor(Math.random() * 10), time: '11:40', predicted: base - 2 },
                { period: 'P5', attendance: base - 15, time: '13:30', predicted: base - 10 }, // Lunch dip
                { period: 'P6', attendance: 0, time: '14:20', predicted: base - 5 },
                { period: 'P7', attendance: 0, time: '15:20', predicted: base - 8 },
                { period: 'P8', attendance: 0, time: '16:10', predicted: base - 10 },
            ];
        };

        setTrendData(generateRandomTrend());
    }, [selectedDept, selectedSection, date]);

    if (loading) {
        return (
            <div className="flex items-center justify-center h-screen">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600"></div>
            </div>
        );
    }

    return (
        <div className="space-y-6 pb-8">
            {/* Premium Header with Gradient */}
            <div className="relative overflow-hidden rounded-2xl bg-gradient-to-br from-indigo-600 via-purple-600 to-pink-600 p-8 text-white">
                <div className="absolute inset-0 bg-black/10"></div>
                <div className="absolute top-0 right-0 w-96 h-96 bg-white/5 rounded-full -mr-48 -mt-48"></div>
                <div className="absolute bottom-0 left-0 w-64 h-64 bg-white/5 rounded-full -ml-32 -mb-32"></div>

                <div className="relative z-10">
                    <div className="flex items-center justify-between">
                        <div>
                            <h1 className="text-4xl font-bold mb-2">Dean's Dashboard 🎓</h1>
                            <p className="text-indigo-100 text-lg">Academic Excellence & Strategic Oversight</p>
                        </div>
                        <div className="flex gap-3">
                            <Link href="/dean/faculty">
                                <Button className="bg-white text-indigo-600 hover:bg-white/90 gap-2 shadow-lg">
                                    <UserPlus className="w-4 h-4" />
                                    Manage Faculty
                                </Button>
                            </Link>
                            <Link href="/dean/reports">
                                <Button variant="secondary" className="gap-2 bg-white/20 hover:bg-white/30 text-white border-white/30">
                                    <FileText className="w-4 h-4" />
                                    Generate Reports
                                </Button>
                            </Link>
                        </div>
                    </div>
                    <div className="mt-6 flex gap-6 text-sm">
                        <div className="flex items-center gap-2">
                            <Calendar className="h-4 w-4" />
                            <span>{new Date().toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' })}</span>
                        </div>
                        <div className="flex items-center gap-2">
                            <Building2 className="h-4 w-4" />
                            <span>NRI Institute of Technology</span>
                        </div>
                    </div>
                </div>
            </div>

            {/* 🧠 NEURAL AI INSIGHTS ENGINE - FLAGSHIP FEATURE */}
            <Card className="border-none shadow-2xl bg-gradient-to-r from-indigo-900 via-purple-900 to-indigo-900 text-white overflow-hidden relative">
                <div className="absolute top-0 right-0 w-64 h-64 bg-white/10 rounded-full blur-3xl -mr-32 -mt-32"></div>
                <CardHeader>
                    <CardTitle className="flex items-center gap-3 text-xl">
                        <div className="p-2 bg-white/10 rounded-lg animate-pulse">
                            <Briefcase className="w-6 h-6 text-cyan-400" />
                        </div>
                        Neural AI Insights Engine
                        <Badge variant="secondary" className="bg-cyan-500/20 text-cyan-300 border-cyan-500/50">Live Analysis</Badge>
                    </CardTitle>
                    <CardDescription className="text-gray-300">
                        AI-driven strategic recommendations based on current campus patterns.
                    </CardDescription>
                </CardHeader>
                <CardContent className="grid md:grid-cols-3 gap-6 relative z-10">
                    <div className="bg-white/5 p-4 rounded-xl border border-white/10 backdrop-blur-sm hover:bg-white/10 transition-colors">
                        <div className="flex items-center gap-2 text-amber-400 mb-2 font-semibold">
                            <AlertCircle className="w-4 h-4" />
                            Retention Risk Detected
                        </div>
                        <p className="text-sm text-gray-300 mb-3">
                            <span className="font-bold text-white">12 Students</span> in III-CSE-B show a <span className="text-red-300">15% drop</span> in attendance over the last 3 days.
                        </p>
                        <Button size="sm" variant="ghost" className="text-cyan-400 hover:text-cyan-300 hover:bg-white/5 p-0 h-auto">
                            View Risk Profile <ArrowRight className="w-3 h-3 ml-1" />
                        </Button>
                    </div>

                    <div className="bg-white/5 p-4 rounded-xl border border-white/10 backdrop-blur-sm hover:bg-white/10 transition-colors">
                        <div className="flex items-center gap-2 text-cyan-400 mb-2 font-semibold">
                            <TrendingDown className="w-4 h-4" />
                            Post-Lunch Dip Analyzed
                        </div>
                        <p className="text-sm text-gray-300 mb-3">
                            Period 5 consistently sees a <span className="font-bold text-white">20% drop</span>. AI Recommendation: Schedule practical labs instead of theory during this slot.
                        </p>
                        <Button size="sm" variant="ghost" className="text-cyan-400 hover:text-cyan-300 hover:bg-white/5 p-0 h-auto">
                            Auto-Reschedule <ArrowRight className="w-3 h-3 ml-1" />
                        </Button>
                    </div>

                    <div className="bg-white/5 p-4 rounded-xl border border-white/10 backdrop-blur-sm hover:bg-white/10 transition-colors">
                        <div className="flex items-center gap-2 text-green-400 mb-2 font-semibold">
                            <Star className="w-4 h-4" />
                            Top Performance Zone
                        </div>
                        <p className="text-sm text-gray-300 mb-3">
                            <span className="font-bold text-white">CSE Department</span> is outperforming targets by 8%. Predicted to match "Gold Medal" accreditation standards.
                        </p>
                        <Button size="sm" variant="ghost" className="text-green-400 hover:text-green-300 hover:bg-white/5 p-0 h-auto">
                            View Accreditation Report <ArrowRight className="w-3 h-3 ml-1" />
                        </Button>
                    </div>
                </CardContent>
            </Card >

            {/* Key Metrics Grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                {/* Total Faculty */}
                <Card className="relative overflow-hidden border-l-4 border-l-indigo-500 hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Total Faculty</CardTitle>
                        <div className="p-3 rounded-xl bg-gradient-to-br from-indigo-500 to-indigo-600 shadow-lg">
                            <Users className="h-5 w-5 text-white" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{dashboardData.totalFaculty}</div>
                        <p className="text-xs text-green-600 mt-2 font-medium flex items-center gap-1">
                            <TrendingUp className="h-3 w-3" />
                            +5 this semester
                        </p>
                        <Link href="/dean/faculty">
                            <Button variant="link" className="p-0 h-auto text-xs text-indigo-600 mt-2">
                                View All <ArrowRight className="w-3 h-3 ml-1" />
                            </Button>
                        </Link>
                    </CardContent>
                </Card>

                {/* Total Students */}
                <Card className="relative overflow-hidden border-l-4 border-l-green-500 hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Total Students</CardTitle>
                        <div className="p-3 rounded-xl bg-gradient-to-br from-green-500 to-green-600 shadow-lg">
                            <GraduationCap className="h-5 w-5 text-white" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{dashboardData.totalStudents}</div>
                        <p className="text-xs text-green-600 mt-2 font-medium flex items-center gap-1">
                            <TrendingUp className="h-3 w-3" />
                            +40 this year
                        </p>
                        <Progress value={95} className="h-1 mt-3" />
                        <p className="text-xs text-gray-500 mt-1">95% capacity</p>
                    </CardContent>
                </Card>

                {/* Departments */}
                <Card className="relative overflow-hidden border-l-4 border-l-purple-500 hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Departments</CardTitle>
                        <div className="p-3 rounded-xl bg-gradient-to-br from-purple-500 to-purple-600 shadow-lg">
                            <Building2 className="h-5 w-5 text-white" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{dashboardData.totalDepartments}</div>
                        <p className="text-xs text-gray-500 mt-2">Active programs</p>
                        <Link href="/dean/analytics">
                            <Button variant="link" className="p-0 h-auto text-xs text-purple-600 mt-2">
                                View Analytics <ArrowRight className="w-3 h-3 ml-1" />
                            </Button>
                        </Link>
                    </CardContent>
                </Card>

                {/* At-Risk Students */}
                <Card className="relative overflow-hidden border-l-4 border-l-red-500 hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">At-Risk Students</CardTitle>
                        <div className="p-3 rounded-xl bg-gradient-to-br from-red-500 to-red-600 shadow-lg">
                            <AlertCircle className="h-5 w-5 text-white" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{dashboardData.atRiskStudents}</div>
                        <p className="text-xs text-red-600 mt-2 font-medium">Requires attention</p>
                        <Button variant="link" className="p-0 h-auto text-xs text-red-600 mt-2">
                            View Details <ArrowRight className="w-3 h-3 ml-1" />
                        </Button>
                    </CardContent>
                </Card>
            </div>

            {/* Secondary Metrics */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <Card className="hover:shadow-lg transition-shadow border-t-4 border-t-blue-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Placement Rate</CardTitle>
                        <Target className="h-5 w-5 text-blue-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{dashboardData.placementRate}%</div>
                        <Progress value={dashboardData.placementRate} className="h-2 mt-3" />
                        <p className="text-xs text-gray-500 mt-2">2024 Batch</p>
                    </CardContent>
                </Card>

                <Card className="hover:shadow-lg transition-shadow border-t-4 border-t-amber-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Research Publications</CardTitle>
                        <Award className="h-5 w-5 text-amber-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{dashboardData.researchPublications}</div>
                        <p className="text-xs text-green-600 mt-2 font-medium flex items-center gap-1">
                            <TrendingUp className="h-3 w-3" />
                            +18 this quarter
                        </p>
                    </CardContent>
                </Card>

                <Card className="hover:shadow-lg transition-shadow border-t-4 border-t-orange-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Pending Approvals</CardTitle>
                        <Clock className="h-5 w-5 text-orange-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{dashboardData.pendingApprovals}</div>
                        <Button variant="link" className="p-0 h-auto text-xs text-orange-600 mt-2">
                            Review Now <ArrowRight className="w-3 h-3 ml-1" />
                        </Button>
                    </CardContent>
                </Card>
            </div >

            {/* Filter Bar (NEW) */}
            < div className="bg-white p-4 rounded-xl border border-gray-200 shadow-sm flex flex-wrap items-center gap-4" >
                <div className="flex items-center gap-2 text-gray-500 font-medium">
                    <Filter className="w-4 h-4" />
                    Filters:
                </div>

                {/* Date Picker (Native) */}
                <div className="relative">
                    <Calendar className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-gray-500 pointer-events-none" />
                    <input
                        type="date"
                        value={date ? format(date, "yyyy-MM-dd") : ""}
                        onChange={(e) => setDate(e.target.value ? new Date(e.target.value) : undefined)}
                        className="pl-9 pr-3 py-2 h-10 w-[240px] rounded-md border border-gray-200 bg-white text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
                    />
                </div>

                {/* Department Select */}
                <Select value={selectedDept} onValueChange={setSelectedDept}>
                    <SelectTrigger className="w-[200px]">
                        <SelectValue placeholder="Select Department" />
                    </SelectTrigger>
                    <SelectContent>
                        <SelectItem value="all">All Departments</SelectItem>
                        <SelectItem value="cse">CSE</SelectItem>
                        <SelectItem value="ece">ECE</SelectItem>
                        <SelectItem value="eee">EEE</SelectItem>
                        <SelectItem value="mech">Mechanical</SelectItem>
                        <SelectItem value="civil">Civil</SelectItem>
                        <SelectItem value="it">IT</SelectItem>
                    </SelectContent>
                </Select>

                {/* Section Select */}
                <Select value={selectedSection} onValueChange={setSelectedSection}>
                    <SelectTrigger className="w-[140px]">
                        <SelectValue placeholder="Select Section" />
                    </SelectTrigger>
                    <SelectContent>
                        <SelectItem value="all">All Sections</SelectItem>
                        <SelectItem value="A">Section A</SelectItem>
                        <SelectItem value="B">Section B</SelectItem>
                        <SelectItem value="C">Section C</SelectItem>
                        <SelectItem value="D">Section D</SelectItem>
                    </SelectContent>
                </Select>

                {/* Period Select */}
                <Select value={selectedPeriod} onValueChange={setSelectedPeriod}>
                    <SelectTrigger className="w-[180px]">
                        <SelectValue placeholder="Select Period" />
                    </SelectTrigger>
                    <SelectContent>
                        <SelectItem value="all">All Periods</SelectItem>
                        <SelectItem value="1">Period 1 (09:00 - 09:50)</SelectItem>
                        <SelectItem value="2">Period 2 (09:50 - 10:40)</SelectItem>
                        <SelectItem value="3">Period 3 (10:50 - 11:40)</SelectItem>
                        <SelectItem value="4">Period 4 (11:40 - 12:30)</SelectItem>
                        <SelectItem value="5">Period 5 (13:20 - 14:10)</SelectItem>
                        <SelectItem value="6">Period 6 (14:10 - 15:00)</SelectItem>
                        <SelectItem value="7">Period 7 (15:00 - 15:50)</SelectItem>
                        <SelectItem value="8">Period 8 (15:50 - 16:40)</SelectItem>
                    </SelectContent>
                </Select>

                <Button variant="ghost" onClick={() => { setDate(new Date()); setSelectedDept("all"); setSelectedSection("all"); setSelectedPeriod("all"); }} className="ml-auto text-sm text-gray-500 hover:text-red-500">
                    Reset Filters
                </Button>
            </div >

            {/* Main Analytics Grid */}
            <div className="grid lg:grid-cols-3 gap-6">
                {/* Left Column - 2/3 width */}
                <div className="lg:col-span-2 space-y-6">

                    {/* Today's Attendance Trend (NEW) */}
                    <Card className="hover:shadow-lg transition-shadow border-t-4 border-t-teal-500">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <Clock className="h-5 w-5 text-teal-600" />
                                Today's Attendance Trend (Period-wise) {selectedDept !== 'all' && `- ${selectedDept.toUpperCase()}`} {selectedSection !== 'all' && `(Sec ${selectedSection})`}
                            </CardTitle>
                            <CardDescription>Real-time attendance % across all periods</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={250}>
                                <AreaChart data={trendData}>
                                    <defs>
                                        <linearGradient id="colorAttendance" x1="0" y1="0" x2="0" y2="1">
                                            <stop offset="5%" stopColor="#0d9488" stopOpacity={0.3} />
                                            <stop offset="95%" stopColor="#0d9488" stopOpacity={0} />
                                        </linearGradient>
                                    </defs>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                    <XAxis dataKey="period" stroke="#888" fontSize={12} />
                                    <YAxis stroke="#888" fontSize={12} domain={[0, 100]} />
                                    <Tooltip
                                        contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }}
                                    />
                                    <Area
                                        type="monotone"
                                        dataKey="predicted"
                                        stroke="#9ca3af"
                                        strokeDasharray="5 5"
                                        strokeWidth={2}
                                        fill="none"
                                        name="AI Projection"
                                    />
                                    <Area
                                        type="monotone"
                                        dataKey="attendance"
                                        stroke="#0d9488"
                                        strokeWidth={3}
                                        fillOpacity={1}
                                        fill="url(#colorAttendance)"
                                        dot={<CustomDot />}
                                        name="Actual Attendance"
                                    />
                                </AreaChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>
                    {/* Department Performance */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <BarChart3 className="h-5 w-5 text-indigo-600" />
                                Department Performance Overview
                            </CardTitle>
                            <CardDescription>Academic performance vs targets</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={300}>
                                <BarChart data={departmentPerformanceData}>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                    <XAxis dataKey="dept" stroke="#888" fontSize={12} />
                                    <YAxis stroke="#888" fontSize={12} domain={[0, 100]} />
                                    <Tooltip
                                        contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }}
                                    />
                                    <Bar dataKey="performance" fill="#6366f1" radius={[8, 8, 0, 0]} />
                                    <Bar dataKey="target" fill="#e0e7ff" radius={[8, 8, 0, 0]} />
                                </BarChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>

                    {/* Enrollment Trend */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <TrendingUp className="h-5 w-5 text-green-600" />
                                Student Enrollment Trend
                            </CardTitle>
                            <CardDescription>5-year enrollment growth</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={250}>
                                <AreaChart data={enrollmentTrendData}>
                                    <defs>
                                        <linearGradient id="colorStudents" x1="0" y1="0" x2="0" y2="1">
                                            <stop offset="5%" stopColor="#10b981" stopOpacity={0.3} />
                                            <stop offset="95%" stopColor="#10b981" stopOpacity={0} />
                                        </linearGradient>
                                    </defs>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                    <XAxis dataKey="year" stroke="#888" fontSize={12} />
                                    <YAxis stroke="#888" fontSize={12} />
                                    <Tooltip
                                        contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }}
                                    />
                                    <Area type="monotone" dataKey="students" stroke="#10b981" strokeWidth={3} fillOpacity={1} fill="url(#colorStudents)" />
                                </AreaChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>

                    {/* Placement Trend */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <Briefcase className="h-5 w-5 text-blue-600" />
                                Placement Progress (2024 Batch)
                            </CardTitle>
                            <CardDescription>Monthly placement statistics</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={200}>
                                <LineChart data={placementTrendData}>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                    <XAxis dataKey="month" stroke="#888" fontSize={12} />
                                    <YAxis stroke="#888" fontSize={12} />
                                    <Tooltip
                                        contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }}
                                    />
                                    <Line type="monotone" dataKey="placed" stroke="#3b82f6" strokeWidth={3} dot={{ fill: '#3b82f6', r: 5 }} />
                                </LineChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>
                </div>

                {/* Right Column - 1/3 width */}
                <div className="space-y-6">
                    {/* Faculty Distribution */}
                    <Card className="hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2 text-lg">
                                <Users className="h-5 w-5 text-purple-600" />
                                Faculty Distribution
                            </CardTitle>
                        </CardHeader>
                        <CardContent>
                            <ResponsiveContainer width="100%" height={200}>
                                <PieChart>
                                    <Pie
                                        data={facultyDistribution}
                                        cx="50%"
                                        cy="50%"
                                        innerRadius={50}
                                        outerRadius={80}
                                        paddingAngle={5}
                                        dataKey="value"
                                    >
                                        {facultyDistribution.map((entry, index) => (
                                            <Cell key={`cell-${index}`} fill={entry.color} />
                                        ))}
                                    </Pie>
                                    <Tooltip />
                                </PieChart>
                            </ResponsiveContainer>
                            <div className="space-y-2 mt-4">
                                {facultyDistribution.map((entry, i) => (
                                    <div key={i} className="flex items-center justify-between text-sm">
                                        <div className="flex items-center gap-2">
                                            <div className="w-3 h-3 rounded-full" style={{ backgroundColor: entry.color }}></div>
                                            <span className="text-gray-600">{entry.name}</span>
                                        </div>
                                        <span className="font-semibold text-gray-900">{entry.value}</span>
                                    </div>
                                ))}
                            </div>
                        </CardContent>
                    </Card>

                    {/* Recent Activities */}
                    <Card className="border-t-4 border-t-indigo-500 hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2 text-lg">
                                <Activity className="h-5 w-5 text-indigo-600" />
                                Recent Activities
                            </CardTitle>
                        </CardHeader>
                        <CardContent>
                            <div className="space-y-4">
                                {dashboardData.recentActivities.map((activity: any, i: number) => (
                                    <div key={i} className="flex items-start gap-3 p-3 rounded-lg bg-gray-50 hover:bg-gray-100 transition-colors">
                                        <div className={`p-2 rounded-lg ${activity.type === 'faculty' ? 'bg-indigo-100' :
                                            activity.type === 'student' ? 'bg-green-100' :
                                                'bg-orange-100'
                                            }`}>
                                            {activity.type === 'faculty' && <UserCheck className="h-4 w-4 text-indigo-600" />}
                                            {activity.type === 'student' && <GraduationCap className="h-4 w-4 text-green-600" />}
                                            {activity.type === 'approval' && <Clock className="h-4 w-4 text-orange-600" />}
                                        </div>
                                        <div className="flex-1 min-w-0">
                                            <p className="text-sm font-medium text-gray-900">{activity.action}</p>
                                            <p className="text-xs text-gray-500 mt-1">{activity.dept} • {activity.time}</p>
                                        </div>
                                    </div>
                                ))}
                            </div>
                            <Button variant="link" className="w-full text-indigo-600 p-0 h-auto text-sm mt-4">
                                View All Activities <ArrowRight className="w-3 h-3 ml-1" />
                            </Button>
                        </CardContent>
                    </Card>

                    {/* Quick Actions */}
                    <Card className="bg-gradient-to-br from-indigo-50 to-purple-50 border-indigo-200 hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="text-indigo-700 text-lg">Quick Actions</CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-3">
                            <Link href="/dean/faculty">
                                <Button className="w-full justify-start gap-2 bg-indigo-600 hover:bg-indigo-700 text-white">
                                    <UserPlus className="w-4 h-4" />
                                    Add New Faculty
                                </Button>
                            </Link>
                            <Button variant="outline" className="w-full justify-start gap-2 hover:bg-indigo-100">
                                <FileText className="w-4 h-4" />
                                Generate Report
                            </Button>
                            <Button variant="outline" className="w-full justify-start gap-2 hover:bg-indigo-100">
                                <Bell className="w-4 h-4" />
                                Send Announcement
                            </Button>
                            <Button variant="outline" className="w-full justify-start gap-2 hover:bg-indigo-100">
                                <BarChart3 className="w-4 h-4" />
                                View Analytics
                            </Button>
                        </CardContent>
                    </Card>

                    {/* Accreditation Status */}
                    <Card className="bg-gradient-to-br from-amber-50 to-orange-50 border-amber-200 hover:shadow-lg transition-shadow">
                        <CardHeader>
                            <CardTitle className="text-amber-700 text-lg flex items-center gap-2">
                                <Star className="h-5 w-5" />
                                Accreditation Status
                            </CardTitle>
                        </CardHeader>
                        <CardContent>
                            <div className="space-y-3">
                                <div>
                                    <div className="flex items-center justify-between mb-2">
                                        <span className="text-sm font-medium text-gray-700">NAAC</span>
                                        <Badge className="bg-green-600">A+ Grade</Badge>
                                    </div>
                                    <Progress value={95} className="h-2" />
                                </div>
                                <div>
                                    <div className="flex items-center justify-between mb-2">
                                        <span className="text-sm font-medium text-gray-700">NBA (CSE)</span>
                                        <Badge className="bg-blue-600">Accredited</Badge>
                                    </div>
                                    <Progress value={88} className="h-2" />
                                </div>
                                <Link href="/accreditation">
                                    <Button variant="link" className="p-0 h-auto text-xs text-amber-700 mt-2">
                                        View Details <ArrowRight className="w-3 h-3 ml-1" />
                                    </Button>
                                </Link>
                            </div>
                        </CardContent>
                    </Card>
                </div>
            </div>

            {/* Department-wise Faculty & Students */}
            <div className="grid lg:grid-cols-2 gap-6">
                <Card className="hover:shadow-lg transition-shadow">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <Users className="h-5 w-5 text-indigo-600" />
                            Faculty by Department
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-3">
                            {dashboardData.facultyByDept.slice(0, 6).map((dept: any, i: number) => (
                                <div key={i} className="flex items-center justify-between p-3 rounded-lg bg-gray-50 hover:bg-indigo-50 transition-colors">
                                    <span className="text-sm font-medium text-gray-700">{dept.dept}</span>
                                    <Badge variant="secondary">{dept.count} Faculty</Badge>
                                </div>
                            ))}
                        </div>
                    </CardContent>
                </Card>

                <Card className="hover:shadow-lg transition-shadow">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <GraduationCap className="h-5 w-5 text-green-600" />
                            Students by Department
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-3">
                            {dashboardData.studentsByDept.slice(0, 6).map((dept: any, i: number) => (
                                <div key={i} className="flex items-center justify-between p-3 rounded-lg bg-gray-50 hover:bg-green-50 transition-colors">
                                    <span className="text-sm font-medium text-gray-700">{dept.dept}</span>
                                    <Badge variant="secondary">{dept.count} Students</Badge>
                                </div>
                            ))}
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
