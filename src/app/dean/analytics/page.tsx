"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import {
    BarChart3, TrendingUp, Users, GraduationCap, BookOpen, Award,
    Download, RefreshCw, Target, Brain, Sparkles, ChartPie
} from "lucide-react";
import {
    LineChart, Line, BarChart, Bar, XAxis, YAxis, CartesianGrid,
    Tooltip, ResponsiveContainer, PieChart, Pie, Cell, Area, AreaChart
} from 'recharts';
import supabase from "@/lib/supabase";

export default function DeanAnalyticsPage() {
    const [loading, setLoading] = useState(true);
    const [selectedPeriod, setSelectedPeriod] = useState("semester");
    const [analytics, setAnalytics] = useState({
        totalStudents: 0,
        totalFaculty: 0,
        avgAttendance: 0,
        avgGPA: 0
    });

    useEffect(() => {
        loadAnalytics();
    }, []);

    const loadAnalytics = async () => {
        try {
            const { count: studentCount } = await supabase
                .from('student_profiles')
                .select('*', { count: 'exact', head: true })
                .eq('is_active', true);

            const { count: facultyCount } = await supabase
                .from('faculty_profiles')
                .select('*', { count: 'exact', head: true })
                .eq('is_active', true);

            setAnalytics({
                totalStudents: studentCount || 0,
                totalFaculty: facultyCount || 0,
                avgAttendance: 82.5,
                avgGPA: 8.2
            });

            setLoading(false);
        } catch (error) {
            console.error('Error loading analytics:', error);
            setLoading(false);
        }
    };

    // Chart Data
    const enrollmentTrend = [
        { year: '2020', students: 1200 },
        { year: '2021', students: 1350 },
        { year: '2022', students: 1450 },
        { year: '2023', students: 1520 },
        { year: '2024', students: 1560 },
    ];

    const departmentDistribution = [
        { name: 'CSE', value: 240, color: '#3b82f6' },
        { name: 'IT', value: 240, color: '#10b981' },
        { name: 'ECE', value: 240, color: '#f59e0b' },
        { name: 'CIVIL', value: 240, color: '#ef4444' },
        { name: 'CSE-DS', value: 120, color: '#8b5cf6' },
        { name: 'CSE-AI', value: 120, color: '#ec4899' },
        { name: 'MBA', value: 120, color: '#06b6d4' },
        { name: 'MCA', value: 120, color: '#84cc16' },
    ];

    const attendanceTrend = [
        { month: 'Aug', CSE: 85, IT: 82, ECE: 78, CIVIL: 80 },
        { month: 'Sep', CSE: 88, IT: 84, ECE: 81, CIVIL: 83 },
        { month: 'Oct', CSE: 86, IT: 85, ECE: 82, CIVIL: 84 },
        { month: 'Nov', CSE: 82, IT: 80, ECE: 79, CIVIL: 81 },
        { month: 'Dec', CSE: 84, IT: 82, ECE: 80, CIVIL: 82 },
    ];

    const performanceData = [
        { dept: 'CSE', gpa: 8.4 },
        { dept: 'IT', gpa: 8.1 },
        { dept: 'ECE', gpa: 7.9 },
        { dept: 'CIVIL', gpa: 7.8 },
        { dept: 'CSE-DS', gpa: 8.6 },
        { dept: 'CSE-AI', gpa: 8.5 },
        { dept: 'MBA', gpa: 8.2 },
        { dept: 'MCA', gpa: 8.0 },
    ];

    if (loading) {
        return (
            <div className="flex items-center justify-center h-[60vh]">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-purple-600"></div>
            </div>
        );
    }

    return (
        <div className="space-y-6">
            {/* Header */}
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Analytics Dashboard</h1>
                    <p className="text-gray-500 mt-1">Comprehensive insights across all departments</p>
                </div>
                <div className="flex gap-3">
                    <Select value={selectedPeriod} onValueChange={setSelectedPeriod}>
                        <SelectTrigger className="w-40">
                            <SelectValue placeholder="Period" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="month">This Month</SelectItem>
                            <SelectItem value="semester">This Semester</SelectItem>
                            <SelectItem value="year">This Year</SelectItem>
                        </SelectContent>
                    </Select>
                    <Button variant="outline" className="gap-2">
                        <RefreshCw className="w-4 h-4" />
                        Refresh
                    </Button>
                    <Button className="gap-2 bg-gradient-to-r from-purple-600 to-pink-600">
                        <Download className="w-4 h-4" />
                        Export
                    </Button>
                </div>
            </div>

            {/* AI Insights Banner */}
            <Card className="bg-gradient-to-r from-violet-900 via-indigo-900 to-blue-900 text-white border-none">
                <CardContent className="p-6">
                    <div className="flex items-start gap-4">
                        <div className="p-3 bg-white/10 rounded-xl">
                            <Brain className="w-8 h-8 text-cyan-400" />
                        </div>
                        <div className="flex-1">
                            <h3 className="text-lg font-semibold flex items-center gap-2">
                                AI Analytics Insights
                                <Badge className="bg-cyan-500/20 text-cyan-300 border-cyan-500/50">Live</Badge>
                            </h3>
                            <div className="grid md:grid-cols-3 gap-4 mt-4">
                                <div className="bg-white/5 p-3 rounded-lg">
                                    <div className="flex items-center gap-2 text-green-400 font-medium">
                                        <Sparkles className="w-4 h-4" />
                                        Positive Trend
                                    </div>
                                    <p className="text-sm text-gray-300 mt-1">
                                        CSE-DS has shown 12% improvement in overall performance this semester.
                                    </p>
                                </div>
                                <div className="bg-white/5 p-3 rounded-lg">
                                    <div className="flex items-center gap-2 text-amber-400 font-medium">
                                        <Target className="w-4 h-4" />
                                        Action Needed
                                    </div>
                                    <p className="text-sm text-gray-300 mt-1">
                                        ECE department attendance is 4% below target. Recommend intervention.
                                    </p>
                                </div>
                                <div className="bg-white/5 p-3 rounded-lg">
                                    <div className="flex items-center gap-2 text-blue-400 font-medium">
                                        <Award className="w-4 h-4" />
                                        Achievement
                                    </div>
                                    <p className="text-sm text-gray-300 mt-1">
                                        156 students achieved above 9.0 CGPA this semester - 8% increase!
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Quick Stats */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                <Card className="border-l-4 border-l-blue-500">
                    <CardContent className="pt-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-sm text-gray-500">Total Students</p>
                                <p className="text-3xl font-bold mt-1">{analytics.totalStudents.toLocaleString()}</p>
                            </div>
                            <GraduationCap className="h-10 w-10 text-blue-500" />
                        </div>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-indigo-500">
                    <CardContent className="pt-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-sm text-gray-500">Total Faculty</p>
                                <p className="text-3xl font-bold mt-1">{analytics.totalFaculty}</p>
                            </div>
                            <Users className="h-10 w-10 text-indigo-500" />
                        </div>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-green-500">
                    <CardContent className="pt-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-sm text-gray-500">Avg Attendance</p>
                                <p className="text-3xl font-bold mt-1">{analytics.avgAttendance}%</p>
                            </div>
                            <BarChart3 className="h-10 w-10 text-green-500" />
                        </div>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-purple-500">
                    <CardContent className="pt-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-sm text-gray-500">Average GPA</p>
                                <p className="text-3xl font-bold mt-1">{analytics.avgGPA}</p>
                            </div>
                            <TrendingUp className="h-10 w-10 text-purple-500" />
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Charts Grid */}
            <div className="grid lg:grid-cols-2 gap-6">
                {/* Enrollment Trend */}
                <Card className="hover:shadow-lg transition-shadow">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <TrendingUp className="h-5 w-5 text-blue-600" />
                            Enrollment Trend
                        </CardTitle>
                        <CardDescription>Year-wise student enrollment</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <ResponsiveContainer width="100%" height={250}>
                            <AreaChart data={enrollmentTrend}>
                                <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                <XAxis dataKey="year" stroke="#888" fontSize={12} />
                                <YAxis stroke="#888" fontSize={12} />
                                <Tooltip />
                                <Area type="monotone" dataKey="students" stroke="#3b82f6" fill="#3b82f6" fillOpacity={0.2} strokeWidth={2} />
                            </AreaChart>
                        </ResponsiveContainer>
                    </CardContent>
                </Card>

                {/* Department Distribution */}
                <Card className="hover:shadow-lg transition-shadow">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <ChartPie className="h-5 w-5 text-purple-600" />
                            Department Distribution
                        </CardTitle>
                        <CardDescription>Students per department</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <ResponsiveContainer width="100%" height={250}>
                            <PieChart>
                                <Pie
                                    data={departmentDistribution}
                                    cx="50%"
                                    cy="50%"
                                    innerRadius={60}
                                    outerRadius={90}
                                    paddingAngle={2}
                                    dataKey="value"
                                    label={({ name, value }) => `${name}: ${value}`}
                                >
                                    {departmentDistribution.map((entry, index) => (
                                        <Cell key={`cell-${index}`} fill={entry.color} />
                                    ))}
                                </Pie>
                                <Tooltip />
                            </PieChart>
                        </ResponsiveContainer>
                    </CardContent>
                </Card>

                {/* Attendance Trend */}
                <Card className="hover:shadow-lg transition-shadow">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <BarChart3 className="h-5 w-5 text-green-600" />
                            Attendance Trends
                        </CardTitle>
                        <CardDescription>Monthly attendance by department</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <ResponsiveContainer width="100%" height={250}>
                            <LineChart data={attendanceTrend}>
                                <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                <XAxis dataKey="month" stroke="#888" fontSize={12} />
                                <YAxis stroke="#888" fontSize={12} domain={[70, 100]} />
                                <Tooltip />
                                <Line type="monotone" dataKey="CSE" stroke="#3b82f6" strokeWidth={2} dot={{ r: 4 }} />
                                <Line type="monotone" dataKey="IT" stroke="#10b981" strokeWidth={2} dot={{ r: 4 }} />
                                <Line type="monotone" dataKey="ECE" stroke="#f59e0b" strokeWidth={2} dot={{ r: 4 }} />
                                <Line type="monotone" dataKey="CIVIL" stroke="#ef4444" strokeWidth={2} dot={{ r: 4 }} />
                            </LineChart>
                        </ResponsiveContainer>
                        <div className="flex justify-center gap-4 mt-4">
                            <div className="flex items-center gap-2">
                                <div className="w-3 h-3 rounded-full bg-blue-500"></div>
                                <span className="text-xs text-gray-600">CSE</span>
                            </div>
                            <div className="flex items-center gap-2">
                                <div className="w-3 h-3 rounded-full bg-green-500"></div>
                                <span className="text-xs text-gray-600">IT</span>
                            </div>
                            <div className="flex items-center gap-2">
                                <div className="w-3 h-3 rounded-full bg-amber-500"></div>
                                <span className="text-xs text-gray-600">ECE</span>
                            </div>
                            <div className="flex items-center gap-2">
                                <div className="w-3 h-3 rounded-full bg-red-500"></div>
                                <span className="text-xs text-gray-600">CIVIL</span>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                {/* Performance by Department */}
                <Card className="hover:shadow-lg transition-shadow">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <Award className="h-5 w-5 text-amber-600" />
                            Performance by Department
                        </CardTitle>
                        <CardDescription>Average GPA per department</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <ResponsiveContainer width="100%" height={250}>
                            <BarChart data={performanceData}>
                                <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                                <XAxis dataKey="dept" stroke="#888" fontSize={12} />
                                <YAxis stroke="#888" fontSize={12} domain={[7, 10]} />
                                <Tooltip />
                                <Bar dataKey="gpa" fill="#8b5cf6" radius={[8, 8, 0, 0]} />
                            </BarChart>
                        </ResponsiveContainer>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
