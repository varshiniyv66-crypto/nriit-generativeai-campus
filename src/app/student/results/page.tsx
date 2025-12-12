"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Download, Trophy, TrendingUp, BookOpen, Award } from "lucide-react";
import { Button } from "@/components/ui/button";
import supabase from "@/lib/supabase";

export default function StudentResultsPage() {
    const [loading, setLoading] = useState(true);
    const [user, setUser] = useState<any>(null);
    const [marks, setMarks] = useState<any[]>([]);
    const [selectedSemester, setSelectedSemester] = useState("current");
    const [stats, setStats] = useState({
        sgpa: 0,
        totalCredits: 0,
        passedSubjects: 0,
        totalSubjects: 0
    });

    useEffect(() => {
        loadMarksData();
    }, []);

    const loadMarksData = async () => {
        try {
            const stored = localStorage.getItem('nriit_user');
            if (!stored) return;

            const parsedUser = JSON.parse(stored);
            setUser(parsedUser);

            // Get student profile
            const { data: profile } = await supabase
                .from('student_profiles')
                .select('id, current_semester')
                .eq('roll_number', parsedUser.roll_number)
                .single();

            if (profile) {
                // Fetch internal marks
                const { data: marksData } = await supabase
                    .from('internal_marks')
                    .select(`
                        id, marks_obtained, max_marks, exam_type,
                        course:courses (course_code, course_name, credits)
                    `)
                    .eq('student_id', profile.id)
                    .order('exam_type');

                if (marksData && marksData.length > 0) {
                    // Group marks by course
                    const courseMarks: { [key: string]: any } = {};

                    marksData.forEach((mark: any) => {
                        const courseCode = mark.course?.course_code;
                        if (!courseCode) return;

                        if (!courseMarks[courseCode]) {
                            courseMarks[courseCode] = {
                                courseCode,
                                courseName: mark.course?.course_name,
                                credits: mark.course?.credits || 3,
                                mid1: null,
                                mid2: null,
                                total: 0,
                                grade: '-',
                                points: 0
                            };
                        }

                        if (mark.exam_type === 'mid_1') {
                            courseMarks[courseCode].mid1 = mark.marks_obtained;
                        } else if (mark.exam_type === 'mid_2') {
                            courseMarks[courseCode].mid2 = mark.marks_obtained;
                        }
                    });

                    // Calculate totals and grades
                    const processedMarks = Object.values(courseMarks).map((course: any) => {
                        const mid1 = course.mid1 || 0;
                        const mid2 = course.mid2 || 0;
                        const total = mid1 + mid2;
                        const percentage = (total / 40) * 100;

                        let grade = 'F';
                        let points = 0;
                        if (percentage >= 90) { grade = 'O'; points = 10; }
                        else if (percentage >= 80) { grade = 'A+'; points = 9; }
                        else if (percentage >= 70) { grade = 'A'; points = 8; }
                        else if (percentage >= 60) { grade = 'B+'; points = 7; }
                        else if (percentage >= 50) { grade = 'B'; points = 6; }
                        else if (percentage >= 45) { grade = 'C'; points = 5; }
                        else if (percentage >= 40) { grade = 'P'; points = 4; }

                        return {
                            ...course,
                            total,
                            grade,
                            points
                        };
                    });

                    setMarks(processedMarks);

                    // Calculate SGPA
                    let totalCredits = 0;
                    let totalPoints = 0;
                    let passedSubjects = 0;

                    processedMarks.forEach((course: any) => {
                        totalCredits += course.credits;
                        totalPoints += course.credits * course.points;
                        if (course.points >= 4) passedSubjects++;
                    });

                    const sgpa = totalCredits > 0 ? (totalPoints / totalCredits).toFixed(2) : 0;

                    setStats({
                        sgpa: parseFloat(sgpa as string),
                        totalCredits,
                        passedSubjects,
                        totalSubjects: processedMarks.length
                    });
                }
            }

            setLoading(false);
        } catch (error) {
            console.error('Error loading marks:', error);
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
                    <h1 className="text-3xl font-bold text-gray-900">Examination Results</h1>
                    <p className="text-gray-500">View your semester-wise grades and download memos</p>
                </div>
                <div className="flex items-center gap-2">
                    <Select value={selectedSemester} onValueChange={setSelectedSemester}>
                        <SelectTrigger className="w-[180px]">
                            <SelectValue placeholder="Select Semester" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="current">Current Semester</SelectItem>
                            <SelectItem value="3-1">III Year - I Sem</SelectItem>
                            <SelectItem value="2-2">II Year - II Sem</SelectItem>
                            <SelectItem value="2-1">II Year - I Sem</SelectItem>
                        </SelectContent>
                    </Select>
                    <Button variant="outline" size="icon">
                        <Download className="w-4 h-4" />
                    </Button>
                </div>
            </div>

            {/* Grade Card Summary */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                <Card className="bg-gradient-to-br from-blue-600 to-indigo-700 text-white border-none shadow-lg">
                    <CardContent className="p-6 flex items-center justify-between">
                        <div>
                            <p className="text-blue-100 font-medium mb-1">Semester SGPA</p>
                            <h2 className="text-4xl font-bold">{stats.sgpa}</h2>
                            <p className="text-blue-200 text-sm mt-2">
                                {stats.sgpa >= 8.5 ? 'Distinction' : stats.sgpa >= 7.0 ? 'First Class' : 'Passed'}
                            </p>
                        </div>
                        <div className="h-16 w-16 bg-white/20 rounded-full flex items-center justify-center backdrop-blur-md">
                            <Trophy className="w-8 h-8 text-white" />
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardContent className="p-6 flex items-center justify-between">
                        <div>
                            <p className="text-gray-500 font-medium mb-1">Total Credits</p>
                            <h2 className="text-3xl font-bold">{stats.totalCredits}</h2>
                            <p className="text-green-600 text-sm mt-2">All earned</p>
                        </div>
                        <div className="h-14 w-14 bg-purple-100 rounded-full flex items-center justify-center">
                            <BookOpen className="w-7 h-7 text-purple-600" />
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardContent className="p-6 flex items-center justify-between">
                        <div>
                            <p className="text-gray-500 font-medium mb-1">Subjects Passed</p>
                            <h2 className="text-3xl font-bold">{stats.passedSubjects}/{stats.totalSubjects}</h2>
                            <p className="text-green-600 text-sm mt-2">
                                {stats.passedSubjects === stats.totalSubjects ? 'All clear!' : 'Keep going'}
                            </p>
                        </div>
                        <div className="h-14 w-14 bg-green-100 rounded-full flex items-center justify-center">
                            <Award className="w-7 h-7 text-green-600" />
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardContent className="p-6 flex items-center justify-between">
                        <div>
                            <p className="text-gray-500 font-medium mb-1">Performance</p>
                            <h2 className="text-3xl font-bold">
                                {stats.sgpa >= 9 ? 'A+' : stats.sgpa >= 8 ? 'A' : stats.sgpa >= 7 ? 'B+' : 'B'}
                            </h2>
                            <p className="text-blue-600 text-sm mt-2">Overall Grade</p>
                        </div>
                        <div className="h-14 w-14 bg-blue-100 rounded-full flex items-center justify-center">
                            <TrendingUp className="w-7 h-7 text-blue-600" />
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Marks Table */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <BookOpen className="w-5 h-5 text-blue-600" />
                        Subject-wise Marks
                    </CardTitle>
                    <CardDescription>Internal Examinations - Mid 1 & Mid 2</CardDescription>
                </CardHeader>
                <CardContent>
                    {marks.length > 0 ? (
                        <Table>
                            <TableHeader>
                                <TableRow>
                                    <TableHead>Subject Code</TableHead>
                                    <TableHead>Subject Name</TableHead>
                                    <TableHead className="text-center">Credits</TableHead>
                                    <TableHead className="text-center">Mid-1 (20)</TableHead>
                                    <TableHead className="text-center">Mid-2 (20)</TableHead>
                                    <TableHead className="text-center">Total (40)</TableHead>
                                    <TableHead className="text-center">Grade</TableHead>
                                    <TableHead className="text-center">Points</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {marks.map((res: any) => (
                                    <TableRow key={res.courseCode}>
                                        <TableCell className="font-mono text-gray-500">{res.courseCode}</TableCell>
                                        <TableCell className="font-medium">{res.courseName}</TableCell>
                                        <TableCell className="text-center">{res.credits}</TableCell>
                                        <TableCell className="text-center">{res.mid1 !== null ? res.mid1 : '-'}</TableCell>
                                        <TableCell className="text-center">{res.mid2 !== null ? res.mid2 : '-'}</TableCell>
                                        <TableCell className="text-center font-bold">{res.total}</TableCell>
                                        <TableCell className="text-center">
                                            <Badge
                                                variant="secondary"
                                                className={`font-bold w-10 justify-center ${res.grade === 'O' ? 'bg-green-100 text-green-700' :
                                                        res.grade === 'A+' ? 'bg-blue-100 text-blue-700' :
                                                            res.grade === 'A' ? 'bg-indigo-100 text-indigo-700' :
                                                                res.grade === 'F' ? 'bg-red-100 text-red-700' :
                                                                    'bg-gray-100 text-gray-700'
                                                    }`}
                                            >
                                                {res.grade}
                                            </Badge>
                                        </TableCell>
                                        <TableCell className="text-center font-mono">{res.points}</TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    ) : (
                        <div className="text-center py-12 text-gray-500">
                            <BookOpen className="w-12 h-12 mx-auto mb-4 opacity-50" />
                            <p>No marks data available</p>
                            <p className="text-sm">Results will appear here once published</p>
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
