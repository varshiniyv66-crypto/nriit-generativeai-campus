"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Save, Lock, AlertCircle, CheckCircle2, Users } from "lucide-react";
import { toast } from "sonner";
import supabase from "@/lib/supabase";

export default function FacultyMarksPage() {
    const [loading, setLoading] = useState(true);
    const [user, setUser] = useState<any>(null);
    const [courses, setCourses] = useState<any[]>([]);
    const [students, setStudents] = useState<any[]>([]);
    const [selectedCourse, setSelectedCourse] = useState("");
    const [selectedExam, setSelectedExam] = useState("mid_1");
    const [marks, setMarks] = useState<Record<string, string>>({});
    const [isSaving, setIsSaving] = useState(false);
    const [existingMarks, setExistingMarks] = useState<any[]>([]);

    useEffect(() => {
        loadInitialData();
    }, []);

    useEffect(() => {
        if (selectedCourse) {
            loadStudentsForCourse();
        }
    }, [selectedCourse, selectedExam]);

    const loadInitialData = async () => {
        try {
            const stored = localStorage.getItem('nriit_user');
            if (!stored) return;

            const parsedUser = JSON.parse(stored);
            setUser(parsedUser);

            // Get faculty profile
            const { data: profile } = await supabase
                .from('faculty_profiles')
                .select('id, dept_code')
                .eq('employee_id', parsedUser.employee_id)
                .single();

            if (profile) {
                // Fetch courses for this department
                const { data: courseData } = await supabase
                    .from('courses')
                    .select('id, course_code, course_name, semester')
                    .eq('dept_code', profile.dept_code)
                    .eq('is_active', true)
                    .order('semester');

                if (courseData) {
                    setCourses(courseData);
                    if (courseData.length > 0) {
                        setSelectedCourse(courseData[0].id);
                    }
                }
            }

            setLoading(false);
        } catch (error) {
            console.error('Error loading data:', error);
            setLoading(false);
        }
    };

    const loadStudentsForCourse = async () => {
        try {
            const course = courses.find(c => c.id === selectedCourse);
            if (!course) return;

            const stored = localStorage.getItem('nriit_user');
            const parsedUser = stored ? JSON.parse(stored) : null;

            // Get faculty profile for dept_code
            const { data: profile } = await supabase
                .from('faculty_profiles')
                .select('dept_code')
                .eq('employee_id', parsedUser?.employee_id)
                .single();

            if (profile) {
                // Fetch students from this department and semester
                const { data: studentData } = await supabase
                    .from('student_profiles')
                    .select('id, roll_number, first_name, last_name')
                    .eq('dept_code', profile.dept_code)
                    .eq('current_semester', course.semester)
                    .eq('is_active', true)
                    .order('roll_number')
                    .limit(60);

                if (studentData) {
                    setStudents(studentData);

                    // Fetch existing marks for these students
                    const { data: existingData } = await supabase
                        .from('internal_marks')
                        .select('student_id, marks_obtained')
                        .eq('course_id', selectedCourse)
                        .eq('exam_type', selectedExam);

                    if (existingData) {
                        setExistingMarks(existingData);
                        // Populate marks state with existing marks
                        const marksMap: Record<string, string> = {};
                        existingData.forEach((m: any) => {
                            marksMap[m.student_id] = m.marks_obtained?.toString() || '';
                        });
                        setMarks(marksMap);
                    }
                }
            }
        } catch (error) {
            console.error('Error loading students:', error);
        }
    };

    const handleMarkChange = (studentId: string, val: string) => {
        // Validation: 0-30
        if (val === "" || (Number(val) >= 0 && Number(val) <= 30)) {
            setMarks(prev => ({ ...prev, [studentId]: val }));
        }
    };

    const handleSave = async () => {
        setIsSaving(true);
        try {
            // Prepare marks data
            const marksToInsert = Object.entries(marks)
                .filter(([_, val]) => val !== '')
                .map(([studentId, marksObtained]) => ({
                    student_id: studentId,
                    course_id: selectedCourse,
                    exam_type: selectedExam,
                    academic_year: '2024-25',
                    semester_type: 'odd',
                    marks_obtained: parseFloat(marksObtained),
                    max_marks: 20
                }));

            // Upsert marks
            for (const mark of marksToInsert) {
                await supabase
                    .from('internal_marks')
                    .upsert(mark, {
                        onConflict: 'student_id,course_id,exam_type,academic_year,semester_type'
                    });
            }

            toast.success(`Saved ${marksToInsert.length} marks successfully!`);
        } catch (error) {
            console.error('Error saving marks:', error);
            toast.error('Failed to save marks. Please try again.');
        }
        setIsSaving(false);
    };

    const handleFreeze = () => {
        toast.info("Marks freezing will be enabled after HOD approval system is configured.");
    };

    if (loading) {
        return (
            <div className="flex items-center justify-center h-[60vh]">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            </div>
        );
    }

    const selectedCourseName = courses.find(c => c.id === selectedCourse)?.course_name || '';

    return (
        <div className="space-y-6 animate-fade-in-up">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Marks Entry</h1>
                    <p className="text-gray-500">Enter and manage internal assessment marks</p>
                </div>

                <div className="flex gap-2">
                    <Button
                        onClick={handleSave}
                        disabled={isSaving}
                        className="min-w-[120px] bg-gradient-to-r from-blue-600 to-indigo-600"
                    >
                        {isSaving ? "Saving..." : "Save Marks"}
                        <Save className={`w-4 h-4 ml-2 ${isSaving && 'animate-spin'}`} />
                    </Button>
                    <Button variant="outline" onClick={handleFreeze}>
                        Freeze <Lock className="w-4 h-4 ml-2" />
                    </Button>
                </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                {/* Controls */}
                <Card className="md:col-span-1 h-fit">
                    <CardHeader>
                        <CardTitle>Configuration</CardTitle>
                        <CardDescription>Select course and exam details</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="space-y-2">
                            <label className="text-sm font-medium">Subject / Course</label>
                            <Select value={selectedCourse} onValueChange={setSelectedCourse}>
                                <SelectTrigger>
                                    <SelectValue placeholder="Select Course" />
                                </SelectTrigger>
                                <SelectContent>
                                    {courses.map((course) => (
                                        <SelectItem key={course.id} value={course.id}>
                                            {course.course_code} - {course.course_name}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="space-y-2">
                            <label className="text-sm font-medium">Exam Type</label>
                            <Select value={selectedExam} onValueChange={setSelectedExam}>
                                <SelectTrigger>
                                    <SelectValue />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="mid_1">Mid Semester I</SelectItem>
                                    <SelectItem value="mid_2">Mid Semester II</SelectItem>
                                    <SelectItem value="internal_1">Internal Assessment 1</SelectItem>
                                    <SelectItem value="internal_2">Internal Assessment 2</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="pt-4 border-t border-gray-100">
                            <div className="flex items-center gap-2 text-sm text-gray-600 bg-gray-50 p-3 rounded-md">
                                <Users className="w-4 h-4" />
                                <span>{students.length} students loaded</span>
                            </div>
                        </div>

                        <div className="flex items-start gap-2 text-sm text-amber-600 bg-amber-50 p-3 rounded-md">
                            <AlertCircle className="w-4 h-4 mt-0.5" />
                            <p>Mid Exams are max 20 marks. Ensure all entries are validated before freezing.</p>
                        </div>
                    </CardContent>
                </Card>

                {/* Marks Table */}
                <Card className="md:col-span-2">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            {selectedCourseName || 'Select a course'}
                        </CardTitle>
                        <CardDescription>
                            Editing marks for {selectedExam === 'mid_1' ? 'Mid Semester I' :
                                selectedExam === 'mid_2' ? 'Mid Semester II' : selectedExam}
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        {students.length > 0 ? (
                            <>
                                <div className="rounded-md border max-h-[500px] overflow-y-auto">
                                    <Table>
                                        <TableHeader className="sticky top-0 bg-white">
                                            <TableRow>
                                                <TableHead className="w-[120px]">Roll No</TableHead>
                                                <TableHead>Student Name</TableHead>
                                                <TableHead className="w-[150px] text-right">Marks (Max 20)</TableHead>
                                            </TableRow>
                                        </TableHeader>
                                        <TableBody>
                                            {students.map((student) => (
                                                <TableRow key={student.id}>
                                                    <TableCell className="font-mono text-sm">{student.roll_number}</TableCell>
                                                    <TableCell>{student.first_name} {student.last_name}</TableCell>
                                                    <TableCell className="text-right">
                                                        <Input
                                                            type="number"
                                                            min="0"
                                                            max="20"
                                                            placeholder="0"
                                                            className="w-20 ml-auto text-right"
                                                            value={marks[student.id] || ""}
                                                            onChange={(e) => handleMarkChange(student.id, e.target.value)}
                                                        />
                                                    </TableCell>
                                                </TableRow>
                                            ))}
                                        </TableBody>
                                    </Table>
                                </div>
                                <div className="mt-4 flex justify-between items-center text-sm text-gray-500">
                                    <span>Total Students: {students.length}</span>
                                    <span>Marks Entered: {Object.values(marks).filter(v => v !== '').length}</span>
                                </div>
                            </>
                        ) : (
                            <div className="text-center py-12 text-gray-500">
                                <Users className="w-12 h-12 mx-auto mb-4 opacity-50" />
                                <p>No students found for selected course</p>
                                <p className="text-sm">Select a course to load students</p>
                            </div>
                        )}
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
