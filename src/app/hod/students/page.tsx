"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import {
    GraduationCap, Search, Download, Users, TrendingUp, AlertTriangle, CheckCircle2
} from "lucide-react";
import supabase from "@/lib/supabase";

export default function HODStudentsPage() {
    const [loading, setLoading] = useState(true);
    const [students, setStudents] = useState<any[]>([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [selectedYear, setSelectedYear] = useState("all");
    const [selectedSection, setSelectedSection] = useState("all");

    useEffect(() => {
        loadStudents();
    }, []);

    const loadStudents = async () => {
        try {
            const stored = localStorage.getItem('nriit_user');
            const currentUser = stored ? JSON.parse(stored) : null;
            const deptCode = currentUser?.dept_code || 'CSE';

            const { data } = await supabase
                .from('student_profiles')
                .select('*')
                .eq('dept_code', deptCode)
                .eq('is_active', true)
                .order('roll_number')
                .limit(200);

            setStudents(data || []);
            setLoading(false);
        } catch (error) {
            console.error('Error loading students:', error);
            setLoading(false);
        }
    };

    const filteredStudents = students.filter(student => {
        const matchesSearch =
            student.roll_number?.toLowerCase().includes(searchTerm.toLowerCase()) ||
            `${student.first_name} ${student.last_name}`.toLowerCase().includes(searchTerm.toLowerCase());
        const matchesYear = selectedYear === "all" ||
            (selectedYear === "1" && student.current_semester <= 2) ||
            (selectedYear === "2" && student.current_semester >= 3 && student.current_semester <= 4) ||
            (selectedYear === "3" && student.current_semester >= 5 && student.current_semester <= 6) ||
            (selectedYear === "4" && student.current_semester >= 7);
        const matchesSection = selectedSection === "all" || student.section === selectedSection;
        return matchesSearch && matchesYear && matchesSection;
    });

    // Stats
    const yearWiseCount = {
        "1": students.filter(s => s.current_semester <= 2).length,
        "2": students.filter(s => s.current_semester >= 3 && s.current_semester <= 4).length,
        "3": students.filter(s => s.current_semester >= 5 && s.current_semester <= 6).length,
        "4": students.filter(s => s.current_semester >= 7).length,
    };

    if (loading) {
        return (
            <div className="flex items-center justify-center h-[60vh]">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            </div>
        );
    }

    return (
        <div className="space-y-6">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-2xl font-bold text-gray-900">Department Students</h1>
                    <p className="text-gray-500">Manage and view student records</p>
                </div>
                <Button className="gap-2">
                    <Download className="w-4 h-4" />
                    Export List
                </Button>
            </div>

            {/* Year-wise Stats */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                {Object.entries(yearWiseCount).map(([year, count]) => (
                    <Card key={year} className="border-l-4 border-l-blue-500">
                        <CardContent className="pt-4">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-500">Year {year}</p>
                                    <p className="text-2xl font-bold">{count}</p>
                                </div>
                                <GraduationCap className="w-8 h-8 text-blue-500" />
                            </div>
                        </CardContent>
                    </Card>
                ))}
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
                        <Select value={selectedSection} onValueChange={setSelectedSection}>
                            <SelectTrigger className="w-32">
                                <SelectValue placeholder="Section" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">All Sections</SelectItem>
                                <SelectItem value="A">Section A</SelectItem>
                                <SelectItem value="B">Section B</SelectItem>
                            </SelectContent>
                        </Select>
                    </div>
                </CardContent>
            </Card>

            {/* Student List */}
            <Card>
                <CardHeader>
                    <CardTitle>Student Directory</CardTitle>
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
                                    <th className="text-left p-3 font-medium text-gray-600">Semester</th>
                                    <th className="text-left p-3 font-medium text-gray-600">Section</th>
                                    <th className="text-left p-3 font-medium text-gray-600">Email</th>
                                    <th className="text-left p-3 font-medium text-gray-600">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                {filteredStudents.slice(0, 30).map((student) => (
                                    <tr key={student.id} className="border-b hover:bg-gray-50">
                                        <td className="p-3 font-mono text-sm">{student.roll_number}</td>
                                        <td className="p-3 font-medium">{student.first_name} {student.last_name}</td>
                                        <td className="p-3">{student.current_semester}</td>
                                        <td className="p-3">{student.section}</td>
                                        <td className="p-3 text-sm text-gray-500">{student.email}</td>
                                        <td className="p-3">
                                            <Badge className="bg-green-100 text-green-700">
                                                <CheckCircle2 className="w-3 h-3 mr-1" />
                                                Active
                                            </Badge>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                    {filteredStudents.length > 30 && (
                        <div className="mt-4 text-center text-sm text-gray-500">
                            Showing first 30 results. Use filters to narrow down.
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
