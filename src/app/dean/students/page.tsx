"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import {
    GraduationCap, Search, Filter, Download, Users, BookOpen,
    TrendingUp, AlertTriangle, CheckCircle2
} from "lucide-react";
import supabase from "@/lib/supabase";

export default function DeanStudentsPage() {
    const [loading, setLoading] = useState(true);
    const [students, setStudents] = useState<any[]>([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [selectedDept, setSelectedDept] = useState("all");
    const [selectedYear, setSelectedYear] = useState("all");
    const [stats, setStats] = useState({
        totalStudents: 0,
        atRisk: 0,
        topPerformers: 0
    });

    useEffect(() => {
        loadStudents();
    }, []);

    const loadStudents = async () => {
        try {
            // Fetch student stats
            const { count: totalCount } = await supabase
                .from('student_profiles')
                .select('*', { count: 'exact', head: true })
                .eq('is_active', true);

            // Fetch at-risk students count
            const { count: riskCount } = await supabase
                .from('student_risk_flags')
                .select('*', { count: 'exact', head: true })
                .eq('is_resolved', false);

            // Fetch student list with department info
            const { data: studentData } = await supabase
                .from('student_profiles')
                .select(`
                    id, roll_number, first_name, last_name, email,
                    dept_code, current_semester, section, is_active
                `)
                .eq('is_active', true)
                .order('roll_number')
                .limit(100);

            setStats({
                totalStudents: totalCount || 0,
                atRisk: riskCount || 0,
                topPerformers: Math.floor((totalCount || 0) * 0.1) // Top 10%
            });

            setStudents(studentData || []);
            setLoading(false);
        } catch (error) {
            console.error('Error loading students:', error);
            setLoading(false);
        }
    };

    // Filter students
    const filteredStudents = students.filter(student => {
        const matchesSearch =
            student.roll_number?.toLowerCase().includes(searchTerm.toLowerCase()) ||
            `${student.first_name} ${student.last_name}`.toLowerCase().includes(searchTerm.toLowerCase());
        const matchesDept = selectedDept === "all" || student.dept_code === selectedDept;
        const matchesYear = selectedYear === "all" ||
            (selectedYear === "1" && student.current_semester <= 2) ||
            (selectedYear === "2" && student.current_semester >= 3 && student.current_semester <= 4) ||
            (selectedYear === "3" && student.current_semester >= 5 && student.current_semester <= 6) ||
            (selectedYear === "4" && student.current_semester >= 7);
        return matchesSearch && matchesDept && matchesYear;
    });

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
                    <h1 className="text-3xl font-bold text-gray-900">Student Management</h1>
                    <p className="text-gray-500 mt-1">Overview of all students across departments</p>
                </div>
                <Button className="gap-2 bg-gradient-to-r from-purple-600 to-pink-600">
                    <Download className="w-4 h-4" />
                    Export Report
                </Button>
            </div>

            {/* Stats Cards */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <Card className="border-l-4 border-l-blue-500">
                    <CardHeader className="flex flex-row items-center justify-between pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Total Students</CardTitle>
                        <GraduationCap className="h-5 w-5 text-blue-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{stats.totalStudents.toLocaleString()}</div>
                        <p className="text-xs text-gray-500 mt-1">Across all departments</p>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-red-500">
                    <CardHeader className="flex flex-row items-center justify-between pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">At-Risk Students</CardTitle>
                        <AlertTriangle className="h-5 w-5 text-red-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{stats.atRisk}</div>
                        <p className="text-xs text-red-600 mt-1">Needs immediate attention</p>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-green-500">
                    <CardHeader className="flex flex-row items-center justify-between pb-2">
                        <CardTitle className="text-sm font-medium text-gray-600">Top Performers</CardTitle>
                        <TrendingUp className="h-5 w-5 text-green-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">{stats.topPerformers}</div>
                        <p className="text-xs text-green-600 mt-1">Top 10% performers</p>
                    </CardContent>
                </Card>
            </div>

            {/* Filters */}
            <Card>
                <CardContent className="pt-6">
                    <div className="flex flex-wrap gap-4">
                        <div className="flex-1 min-w-64">
                            <div className="relative">
                                <Search className="absolute left-3 top-2.5 h-4 w-4 text-gray-400" />
                                <Input
                                    placeholder="Search by name or roll number..."
                                    className="pl-10"
                                    value={searchTerm}
                                    onChange={(e) => setSearchTerm(e.target.value)}
                                />
                            </div>
                        </div>
                        <Select value={selectedDept} onValueChange={setSelectedDept}>
                            <SelectTrigger className="w-40">
                                <SelectValue placeholder="Department" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">All Departments</SelectItem>
                                <SelectItem value="CSE">CSE</SelectItem>
                                <SelectItem value="CSE-DS">CSE-DS</SelectItem>
                                <SelectItem value="CSE-AI">CSE-AI</SelectItem>
                                <SelectItem value="IT">IT</SelectItem>
                                <SelectItem value="ECE">ECE</SelectItem>
                                <SelectItem value="CIVIL">CIVIL</SelectItem>
                                <SelectItem value="MBA">MBA</SelectItem>
                                <SelectItem value="MCA">MCA</SelectItem>
                            </SelectContent>
                        </Select>
                        <Select value={selectedYear} onValueChange={setSelectedYear}>
                            <SelectTrigger className="w-32">
                                <SelectValue placeholder="Year" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">All Years</SelectItem>
                                <SelectItem value="1">1st Year</SelectItem>
                                <SelectItem value="2">2nd Year</SelectItem>
                                <SelectItem value="3">3rd Year</SelectItem>
                                <SelectItem value="4">4th Year</SelectItem>
                            </SelectContent>
                        </Select>
                    </div>
                </CardContent>
            </Card>

            {/* Student List */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Users className="h-5 w-5 text-purple-600" />
                        Student Directory
                    </CardTitle>
                    <CardDescription>
                        Showing {filteredStudents.length} of {students.length} students
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b bg-gray-50">
                                    <th className="text-left p-3 font-medium text-gray-600">Roll No</th>
                                    <th className="text-left p-3 font-medium text-gray-600">Name</th>
                                    <th className="text-left p-3 font-medium text-gray-600">Department</th>
                                    <th className="text-left p-3 font-medium text-gray-600">Semester</th>
                                    <th className="text-left p-3 font-medium text-gray-600">Section</th>
                                    <th className="text-left p-3 font-medium text-gray-600">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                {filteredStudents.slice(0, 20).map((student, index) => (
                                    <tr key={student.id} className="border-b hover:bg-gray-50">
                                        <td className="p-3 font-mono text-sm">{student.roll_number}</td>
                                        <td className="p-3 font-medium">{student.first_name} {student.last_name}</td>
                                        <td className="p-3">
                                            <Badge variant="secondary" className="bg-blue-100 text-blue-700">
                                                {student.dept_code}
                                            </Badge>
                                        </td>
                                        <td className="p-3">{student.current_semester}</td>
                                        <td className="p-3">{student.section}</td>
                                        <td className="p-3">
                                            <Badge className="bg-green-100 text-green-700 border-green-200">
                                                <CheckCircle2 className="w-3 h-3 mr-1" />
                                                Active
                                            </Badge>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                    {filteredStudents.length > 20 && (
                        <div className="mt-4 text-center text-sm text-gray-500">
                            Showing first 20 results. Use filters to narrow down.
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
