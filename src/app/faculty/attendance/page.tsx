"use client";

import { useState, useEffect, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { CalendarDays, Save, Grid3x3, List, CheckCircle2, XCircle, Clock, UserCheck, Users, TrendingUp, AlertCircle, RefreshCw } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { toast } from "sonner";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { cn } from "@/lib/utils";
import supabase from "@/lib/supabase";
import {
    getFacultyProfile,
    getFacultyTimetable,
    extractUniqueClasses,
    extractUniqueSubjects,
    getStudentsByClass,
    saveAttendance,
    loadAttendance,
    formatDate
} from "@/lib/attendance";

type AttendanceStatus = 'present' | 'absent' | 'late' | 'on_duty' | 'medical_leave';

interface PeriodAttendance {
    [studentId: string]: AttendanceStatus;
}

interface FacultyClass {
    id: string;
    dept_code: string;
    semester: number;
    section: string;
    display: string;
}

interface FacultySubject {
    id: string;
    course_code: string;
    course_name: string;
    display: string;
}

interface Student {
    id: string;
    roll_number: string;
    first_name: string;
    last_name: string;
    attendance: number;
}

function FacultyAttendanceContent() {
    const [loading, setLoading] = useState(true);
    const [loadingStudents, setLoadingStudents] = useState(false);
    const [saving, setSaving] = useState(false);

    // Data State
    const [facultyId, setFacultyId] = useState<string | null>(null);
    const [myClasses, setMyClasses] = useState<FacultyClass[]>([]);
    const [mySubjects, setMySubjects] = useState<FacultySubject[]>([]);
    const [students, setStudents] = useState<Student[]>([]);

    // Selection State
    const [selectedClassId, setSelectedClassId] = useState("");
    const [selectedSubjectId, setSelectedSubjectId] = useState("");
    const [selectedDate, setSelectedDate] = useState(formatDate(new Date()));

    const [viewMode, setViewMode] = useState<'list' | 'grid'>('grid');
    const [isSaved, setIsSaved] = useState(false);

    const searchParams = useSearchParams();

    // Store attendance for all 8 periods
    const [periodAttendance, setPeriodAttendance] = useState<{ [period: number]: PeriodAttendance }>({
        1: {}, 2: {}, 3: {}, 4: {}, 5: {}, 6: {}, 7: {}, 8: {},
    });

    // 1. Initial Load: Get Faculty Profile & Timetable
    useEffect(() => {
        const init = async () => {
            try {
                // Get current user
                const { data: { user } } = await supabase.auth.getUser();
                // If checking auth via email in a real app, query for faculty profile
                // For demo/testing, we might use a fixed email or the logged in user

                if (user) {
                    // Try to find connected faculty profile
                    const { data: profile } = await (supabase
                        .from('faculty_profiles') as any)
                        .select('id, employee_id')
                        .eq('user_id', user.id)
                        .single();

                    if (profile) {
                        setFacultyId(profile.id);
                        await loadFacultyData(profile.id);
                    } else {
                        // Fallback for testing users that might just be mapped by email
                        const { data: profileByEmail } = await (supabase
                            .from('faculty_profiles') as any)
                            .select('id, employee_id')
                            .eq('email', user.email)
                            .single();

                        if (profileByEmail) {
                            setFacultyId(profileByEmail.id);
                            await loadFacultyData(profileByEmail.id);
                        }
                    }
                } else {
                    // DEMO MODE: Load first faculty if not logged in (for unrestricted preview)
                    const { data: randomFac } = await (supabase.from('faculty_profiles') as any).select('id').limit(1).single();
                    if (randomFac) {
                        setFacultyId(randomFac.id);
                        await loadFacultyData(randomFac.id);
                    }
                }
            } catch (error) {
                console.error("Initialization error:", error);
                toast.error("Failed to load faculty profile");
            } finally {
                setLoading(false);
            }
        };

        init();
    }, []);

    const loadFacultyData = async (fid: string) => {
        const { data: timetable } = await getFacultyTimetable(fid);
        if (timetable) {
            const uniqueClasses = extractUniqueClasses(timetable);
            const uniqueSubjects = extractUniqueSubjects(timetable);

            setMyClasses(uniqueClasses);
            setMySubjects(uniqueSubjects);

            // Set defaults if available
            if (uniqueClasses.length > 0) setSelectedClassId(uniqueClasses[0].id);
            if (uniqueSubjects.length > 0) setSelectedSubjectId(uniqueSubjects[0].id);
        }
    };

    // 2. Load Students when Class Changes
    useEffect(() => {
        if (selectedClassId) {
            loadStudentsAndAttendance();
        }
    }, [selectedClassId, selectedSubjectId, selectedDate]);

    const loadStudentsAndAttendance = async () => {
        setLoadingStudents(true);
        try {
            const selectedClass = myClasses.find(c => c.id === selectedClassId);
            if (!selectedClass) return;

            // Fetch Students
            const { data: studentData } = await getStudentsByClass(
                selectedClass.dept_code,
                selectedClass.semester,
                selectedClass.section
            );

            if (studentData) {
                // Map to Student Interface
                const formattedStudents: Student[] = studentData.map(s => ({
                    id: s.id,
                    roll_number: s.roll_number,
                    first_name: s.first_name,
                    last_name: s.last_name,
                    attendance: 100 // Default, will calculate actual later if needed
                }));
                setStudents(formattedStudents);

                // Fetch Existing Attendance for this date/subject
                if (selectedSubjectId) {
                    const { data: existingAttendance } = await loadAttendance(selectedDate, selectedClassId, selectedSubjectId);

                    if (existingAttendance && existingAttendance.length > 0) {
                        // Reconstruct periodAttendance state
                        const loadedState: { [period: number]: PeriodAttendance } = {
                            1: {}, 2: {}, 3: {}, 4: {}, 5: {}, 6: {}, 7: {}, 8: {},
                        };

                        existingAttendance.forEach(record => {
                            if (loadedState[record.period_number]) {
                                loadedState[record.period_number][record.student_id] = record.status as AttendanceStatus;
                            }
                        });

                        setPeriodAttendance(loadedState);
                        setIsSaved(true);
                    } else {
                        // Reset if no data
                        setPeriodAttendance({
                            1: {}, 2: {}, 3: {}, 4: {}, 5: {}, 6: {}, 7: {}, 8: {},
                        });
                        setIsSaved(false);
                    }
                }
            }
        } catch (error) {
            console.error("Error loading students:", error);
            toast.error("Failed to load student list");
        } finally {
            setLoadingStudents(false);
        }
    };

    const toggleAttendance = (studentId: string, period: number, status?: AttendanceStatus) => {
        setPeriodAttendance(prev => {
            const currentStatus = prev[period]?.[studentId] || 'present';
            const newStatus = status || (currentStatus === 'present' ? 'absent' : 'present');

            return {
                ...prev,
                [period]: {
                    ...prev[period],
                    [studentId]: newStatus,
                },
            };
        });
        setIsSaved(false);
    };

    const getAttendanceStatus = (studentId: string, period: number): AttendanceStatus => {
        return periodAttendance[period]?.[studentId] || 'present';
    };

    const handleSave = async () => {
        if (!facultyId || !selectedClassId || !selectedSubjectId) {
            toast.error("Missing selection details");
            return;
        }

        setSaving(true);
        try {
            const recordsToSave: any[] = [];

            // Iterate through all periods and students
            // Only save non-default states OR save all to be explicit? 
            // Better to save explicit records for "present" too to differentiate from "not marked"

            for (let period = 1; period <= 8; period++) {
                // Check if any attendance is marked for this period
                // We'll assume if the user is saving, they want to save the current state of valid periods

                students.forEach(student => {
                    const status = getAttendanceStatus(student.id, period);
                    recordsToSave.push({
                        attendance_date: selectedDate,
                        student_id: student.id,
                        faculty_id: facultyId,
                        class_section_id: selectedClassId,
                        course_id: selectedSubjectId,
                        period_number: period,
                        status: status,
                        marked_by: facultyId
                    });
                });
            }

            const { error } = await saveAttendance(recordsToSave);

            if (error) throw error;

            setIsSaved(true);
            toast.success("Attendance saved successfully!");

        } catch (error: any) {
            console.error("Save error:", error);
            toast.error("Failed to save attendance");
        } finally {
            setSaving(false);
        }
    };

    const markAllPeriod = (period: number, status: AttendanceStatus) => {
        setPeriodAttendance(prev => {
            const newPeriodData: PeriodAttendance = {};
            students.forEach(student => {
                newPeriodData[student.id] = status;
            });
            return {
                ...prev,
                [period]: newPeriodData,
            };
        });
        setIsSaved(false);
    };

    const markAllPresent = () => {
        const allPresent: { [period: number]: PeriodAttendance } = {};
        for (let i = 1; i <= 8; i++) {
            allPresent[i] = {};
            // Empty object implies 'present' by default helper logic getAttendanceStatus
            // But to be explicit in state:
            // students.forEach(s => allPresent[i][s.id] = 'present');
        }
        setPeriodAttendance(allPresent);
        setIsSaved(false);
        toast.success('Reset all to Present');
    };

    const getStatusColor = (status: AttendanceStatus) => {
        switch (status) {
            case 'present': return 'bg-green-500 hover:bg-green-600';
            case 'absent': return 'bg-red-500 hover:bg-red-600';
            case 'late': return 'bg-yellow-500 hover:bg-yellow-600';
            case 'on_duty': return 'bg-blue-500 hover:bg-blue-600';
            case 'medical_leave': return 'bg-purple-500 hover:bg-purple-600';
        }
    };

    const getStatusIcon = (status: AttendanceStatus) => {
        switch (status) {
            case 'present': return <CheckCircle2 className="w-4 h-4" />;
            case 'absent': return <XCircle className="w-4 h-4" />;
            case 'late': return <Clock className="w-4 h-4" />;
            case 'on_duty': return <UserCheck className="w-4 h-4" />;
            case 'medical_leave': return <AlertCircle className="w-4 h-4" />;
        }
    };

    const getPeriodStats = (period: number) => {
        if (students.length === 0) return { present: 0, absent: 0, late: 0, onDuty: 0, medical: 0, percentage: "0.0" };

        const present = students.filter(s => getAttendanceStatus(s.id, period) === 'present').length;
        const absent = students.filter(s => getAttendanceStatus(s.id, period) === 'absent').length;
        const late = students.filter(s => getAttendanceStatus(s.id, period) === 'late').length;
        const onDuty = students.filter(s => getAttendanceStatus(s.id, period) === 'on_duty').length;
        const medical = students.filter(s => getAttendanceStatus(s.id, period) === 'medical_leave').length;
        const percentage = ((present + late + onDuty + medical) / students.length * 100).toFixed(1);

        return { present, absent, late, onDuty, medical, percentage };
    };

    const getTotalStats = () => {
        if (students.length === 0) return { totalPresent: 0, totalAbsent: 0, totalLate: 0, totalOnDuty: 0, totalMedical: 0, percentage: "0.0" };

        let totalPresent = 0, totalAbsent = 0, totalLate = 0, totalOnDuty = 0, totalMedical = 0;

        for (let period = 1; period <= 8; period++) {
            const stats = getPeriodStats(period);
            totalPresent += stats.present;
            totalAbsent += stats.absent;
            totalLate += stats.late;
            totalOnDuty += stats.onDuty;
            totalMedical += stats.medical;
        }

        const totalSlots = students.length * 8;
        const totalAttended = totalPresent + totalLate + totalOnDuty + totalMedical;
        const percentage = ((totalAttended / totalSlots) * 100).toFixed(1);

        return { totalPresent, totalAbsent, totalLate, totalOnDuty, totalMedical, percentage };
    };

    const totalStats = getTotalStats();

    if (loading) {
        return <div className="p-12 text-center">Loading faculty data...</div>;
    }

    if (myClasses.length === 0) {
        return (
            <div className="p-12 text-center space-y-4">
                <AlertCircle className="w-12 h-12 text-yellow-500 mx-auto" />
                <h3 className="text-xl font-bold">No Classes Found</h3>
                <p className="text-gray-500">You don't have any classes assigned in the timetable yet.</p>
                <p className="text-sm text-gray-400">Please contact the administrator or Dean to set up your schedule.</p>
            </div>
        );
    }

    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            {/* Header */}
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                        Smart Attendance System
                    </h1>
                    <p className="text-gray-500 mt-1">Mark attendance efficiently with real-time sync</p>
                </div>

                <div className="flex gap-2 flex-wrap">
                    <Button
                        variant="outline"
                        onClick={markAllPresent}
                        className="gap-2"
                        disabled={loadingStudents || students.length === 0}
                    >
                        <Users className="w-4 h-4" />
                        Reset to Present
                    </Button>
                    <Button
                        variant={isSaved ? "secondary" : "default"}
                        onClick={handleSave}
                        disabled={loadingStudents || students.length === 0 || saving}
                        className="min-w-[160px] gap-2 bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700"
                    >
                        {saving ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Save className={`w-4 h-4 ${!isSaved && 'animate-pulse'}`} />}
                        {saving ? "Saving..." : isSaved ? "Saved ✓" : "Save Attendance"}
                    </Button>
                </div>
            </div>

            {/* Stats Overview */}
            <div className="grid grid-cols-2 md:grid-cols-6 gap-4">
                <Card className="bg-gradient-to-br from-green-50 to-green-100 border-green-200">
                    <CardContent className="p-4">
                        <div className="flex items-center gap-2 mb-1">
                            <CheckCircle2 className="w-4 h-4 text-green-600" />
                            <span className="text-xs font-medium text-green-700">Present</span>
                        </div>
                        <div className="text-2xl font-bold text-green-900">{totalStats.totalPresent}</div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-red-50 to-red-100 border-red-200">
                    <CardContent className="p-4">
                        <div className="flex items-center gap-2 mb-1">
                            <XCircle className="w-4 h-4 text-red-600" />
                            <span className="text-xs font-medium text-red-700">Absent</span>
                        </div>
                        <div className="text-2xl font-bold text-red-900">{totalStats.totalAbsent}</div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-yellow-50 to-yellow-100 border-yellow-200">
                    <CardContent className="p-4">
                        <div className="flex items-center gap-2 mb-1">
                            <Clock className="w-4 h-4 text-yellow-600" />
                            <span className="text-xs font-medium text-yellow-700">Late</span>
                        </div>
                        <div className="text-2xl font-bold text-yellow-900">{totalStats.totalLate}</div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-blue-50 to-blue-100 border-blue-200">
                    <CardContent className="p-4">
                        <div className="flex items-center gap-2 mb-1">
                            <UserCheck className="w-4 h-4 text-blue-600" />
                            <span className="text-xs font-medium text-blue-700">On Duty</span>
                        </div>
                        <div className="text-2xl font-bold text-blue-900">{totalStats.totalOnDuty}</div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-purple-50 to-purple-100 border-purple-200">
                    <CardContent className="p-4">
                        <div className="flex items-center gap-2 mb-1">
                            <AlertCircle className="w-4 h-4 text-purple-600" />
                            <span className="text-xs font-medium text-purple-700">Medical</span>
                        </div>
                        <div className="text-2xl font-bold text-purple-900">{totalStats.totalMedical}</div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-indigo-50 to-indigo-100 border-indigo-200">
                    <CardContent className="p-4">
                        <div className="flex items-center gap-2 mb-1">
                            <TrendingUp className="w-4 h-4 text-indigo-600" />
                            <span className="text-xs font-medium text-indigo-700">Overall %</span>
                        </div>
                        <div className="text-2xl font-bold text-indigo-900">{totalStats.percentage}%</div>
                    </CardContent>
                </Card>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-4 gap-6">
                {/* Configuration Panel */}
                <Card className="lg:col-span-1 h-fit sticky top-6 border-0 shadow-lg ring-1 ring-gray-100">
                    <CardHeader className="bg-gray-50/50 pb-4">
                        <CardTitle className="flex items-center gap-2 text-base">
                            <CalendarDays className="w-5 h-5 text-blue-600" />
                            Session Details
                        </CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-5 pt-4">
                        {/* Date Selection */}
                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-700">Date</label>
                            <input
                                type="date"
                                value={selectedDate}
                                onChange={(e) => setSelectedDate(e.target.value)}
                                className="w-full p-2 border rounded-md text-sm focus:ring-2 focus:ring-blue-500 outline-none"
                            />
                        </div>

                        {/* Class Selection */}
                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-700">Class / Section</label>
                            <Select value={selectedClassId} onValueChange={setSelectedClassId}>
                                <SelectTrigger>
                                    <SelectValue placeholder="Select Class" />
                                </SelectTrigger>
                                <SelectContent>
                                    {myClasses.map(cls => (
                                        <SelectItem key={cls.id} value={cls.id}>
                                            {cls.display}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        {/* Subject Selection */}
                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-700">Subject</label>
                            <Select value={selectedSubjectId} onValueChange={setSelectedSubjectId}>
                                <SelectTrigger>
                                    <SelectValue placeholder="Select Subject" />
                                </SelectTrigger>
                                <SelectContent>
                                    {mySubjects.map(sub => (
                                        <SelectItem key={sub.id} value={sub.id}>
                                            {sub.display}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="pt-4 border-t space-y-3">
                            <div className="text-sm font-medium text-gray-700 mb-2">Class Strength</div>
                            <div className="flex justify-between items-center bg-gray-50 p-3 rounded-lg">
                                <span className="text-sm text-gray-600">Total Students</span>
                                {loadingStudents ? (
                                    <RefreshCw className="w-4 h-4 animate-spin text-gray-400" />
                                ) : (
                                    <span className="font-bold text-lg text-blue-600">{students.length}</span>
                                )}
                            </div>
                        </div>

                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-700">View Mode</label>
                            <div className="flex gap-2 p-1 bg-gray-100 rounded-lg">
                                <Button
                                    variant={viewMode === 'grid' ? 'default' : 'ghost'}
                                    size="sm"
                                    onClick={() => setViewMode('grid')}
                                    className="flex-1 gap-2 shadow-none"
                                >
                                    <Grid3x3 className="w-4 h-4" />
                                    Grid
                                </Button>
                                <Button
                                    variant={viewMode === 'list' ? 'default' : 'ghost'}
                                    size="sm"
                                    onClick={() => setViewMode('list')}
                                    className="flex-1 gap-2 shadow-none"
                                >
                                    <List className="w-4 h-4" />
                                    List
                                </Button>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                {/* Attendance Grid/List */}
                <div className="lg:col-span-3">
                    {loadingStudents ? (
                        <div className="h-64 flex flex-col items-center justify-center space-y-3 bg-white rounded-xl border border-dashed text-gray-400">
                            <RefreshCw className="w-8 h-8 animate-spin" />
                            <p>Loading class list...</p>
                        </div>
                    ) : students.length === 0 ? (
                        <div className="h-64 flex flex-col items-center justify-center space-y-3 bg-white rounded-xl border border-dashed text-gray-400">
                            <Users className="w-8 h-8 opacity-50" />
                            <p>No students found in this class section.</p>
                        </div>
                    ) : viewMode === 'grid' ? (
                        <Card className="border-0 shadow-md">
                            <CardHeader>
                                <CardTitle>Period-wise Attendance Grid</CardTitle>
                                <CardDescription>Click on any cell to cycle through statuses</CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="overflow-x-auto pb-4">
                                    <div className="min-w-[900px]">
                                        {/* Period Headers */}
                                        <div className="grid grid-cols-10 gap-2 mb-4 bg-gray-50 p-2 rounded-t-lg border-b">
                                            <div className="col-span-2 font-semibold text-sm text-gray-700 flex items-center">Student Name</div>
                                            {[1, 2, 3, 4, 5, 6, 7, 8].map(period => {
                                                const stats = getPeriodStats(period);
                                                return (
                                                    <div key={period} className="text-center">
                                                        <div className="font-bold text-sm text-gray-800 mb-1 bg-white inline-block px-2 rounded border">P{period}</div>
                                                        <div className="text-[10px] text-gray-500 font-mono">{stats.percentage}%</div>
                                                        <div className="flex gap-1 mt-1 justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                                                            <button
                                                                className="hover:scale-110 transition-transform text-green-600"
                                                                onClick={() => markAllPeriod(period, 'present')}
                                                                title="Mark all present"
                                                            >
                                                                <CheckCircle2 className="w-3 h-3" />
                                                            </button>
                                                            <button
                                                                className="hover:scale-110 transition-transform text-red-600"
                                                                onClick={() => markAllPeriod(period, 'absent')}
                                                                title="Mark all absent"
                                                            >
                                                                <XCircle className="w-3 h-3" />
                                                            </button>
                                                        </div>
                                                    </div>
                                                );
                                            })}
                                        </div>

                                        {/* Student Rows */}
                                        <div className="space-y-1">
                                            {students.map((student, idx) => (
                                                <div key={student.id} className={cn(
                                                    "grid grid-cols-10 gap-2 items-center group  p-2 rounded-lg transition-colors border border-transparent",
                                                    idx % 2 === 0 ? "bg-white" : "bg-gray-50/50",
                                                    "hover:border-blue-100 hover:bg-blue-50/30 hover:shadow-sm"
                                                )}>
                                                    <div className="col-span-2 pl-2">
                                                        <div className="font-medium text-sm text-gray-900">{student.first_name} {student.last_name}</div>
                                                        <div className="text-xs text-gray-500 font-mono mt-0.5 flex gap-2">
                                                            <span>{student.roll_number}</span>
                                                        </div>
                                                    </div>
                                                    {[1, 2, 3, 4, 5, 6, 7, 8].map(period => {
                                                        const status = getAttendanceStatus(student.id, period);
                                                        const nextStatus: AttendanceStatus =
                                                            status === 'present' ? 'absent' :
                                                                status === 'absent' ? 'late' :
                                                                    status === 'late' ? 'on_duty' :
                                                                        status === 'on_duty' ? 'medical_leave' : 'present';

                                                        return (
                                                            <button
                                                                key={period}
                                                                onClick={() => toggleAttendance(student.id, period, nextStatus)}
                                                                className={cn(
                                                                    "h-10 rounded transition-all duration-200 flex items-center justify-center mx-1",
                                                                    "hover:scale-105 hover:shadow-sm active:scale-95",
                                                                    getStatusColor(status),
                                                                    "text-white shadow-sm"
                                                                )}
                                                                title={`Period ${period}: ${status}`}
                                                            >
                                                                {getStatusIcon(status)}
                                                            </button>
                                                        );
                                                    })}
                                                </div>
                                            ))}
                                        </div>
                                    </div>
                                </div>
                            </CardContent>
                        </Card>
                    ) : (
                        <Tabs defaultValue="1" className="w-full">
                            <TabsList className="grid grid-cols-8 w-full bg-gray-100 p-1">
                                {[1, 2, 3, 4, 5, 6, 7, 8].map(period => {
                                    const stats = getPeriodStats(period);
                                    return (
                                        <TabsTrigger key={period} value={period.toString()} className="text-xs py-2">
                                            P{period}
                                            <span className={cn(
                                                "ml-1 h-2 w-2 rounded-full inline-block",
                                                Number(stats.percentage) > 90 ? "bg-green-500" : Number(stats.percentage) > 75 ? "bg-yellow-500" : "bg-red-500"
                                            )} />
                                        </TabsTrigger>
                                    );
                                })}
                            </TabsList>

                            {[1, 2, 3, 4, 5, 6, 7, 8].map(period => {
                                const stats = getPeriodStats(period);
                                return (
                                    <TabsContent key={period} value={period.toString()}>
                                        <Card>
                                            <CardHeader>
                                                <div className="flex justify-between items-center">
                                                    <div>
                                                        <CardTitle>Period {period} Attendance</CardTitle>
                                                        <CardDescription>
                                                            Present: {stats.present} | Absent: {stats.absent} | Late: {stats.late} | On Duty: {stats.onDuty}
                                                        </CardDescription>
                                                    </div>
                                                    <div className="flex gap-2">
                                                        <Button size="sm" variant="outline" onClick={() => markAllPeriod(period, 'present')} className="text-green-600 hover:text-green-700 hover:bg-green-50">
                                                            <CheckCircle2 className="w-4 h-4 mr-1" /> All Present
                                                        </Button>
                                                        <Button size="sm" variant="outline" onClick={() => markAllPeriod(period, 'absent')} className="text-red-600 hover:text-red-700 hover:bg-red-50">
                                                            <XCircle className="w-4 h-4 mr-1" /> All Absent
                                                        </Button>
                                                    </div>
                                                </div>
                                            </CardHeader>
                                            <CardContent>
                                                <div className="rounded-md border">
                                                    <Table>
                                                        <TableHeader>
                                                            <TableRow className="bg-gray-50">
                                                                <TableHead className="w-[120px]">Roll No</TableHead>
                                                                <TableHead>Student Name</TableHead>
                                                                <TableHead className="w-[200px] text-right">Status</TableHead>
                                                            </TableRow>
                                                        </TableHeader>
                                                        <TableBody>
                                                            {students.map((student) => {
                                                                const status = getAttendanceStatus(student.id, period);
                                                                return (
                                                                    <TableRow key={student.id} className={status === 'absent' ? "bg-red-50/40" : ""}>
                                                                        <TableCell className="font-mono text-sm">{student.roll_number}</TableCell>
                                                                        <TableCell className="font-medium">{student.first_name} {student.last_name}</TableCell>
                                                                        <TableCell className="text-right">
                                                                            <div className="flex items-center justify-end gap-2">
                                                                                <Select
                                                                                    value={status}
                                                                                    onValueChange={(value) => toggleAttendance(student.id, period, value as AttendanceStatus)}
                                                                                >
                                                                                    <SelectTrigger className={cn("w-[150px]",
                                                                                        status === 'present' && "text-green-600 font-medium",
                                                                                        status === 'absent' && "text-red-600 font-medium"
                                                                                    )}>
                                                                                        <SelectValue />
                                                                                    </SelectTrigger>
                                                                                    <SelectContent>
                                                                                        <SelectItem value="present">
                                                                                            <div className="flex items-center gap-2">
                                                                                                <CheckCircle2 className="w-4 h-4 text-green-600" />
                                                                                                Present
                                                                                            </div>
                                                                                        </SelectItem>
                                                                                        <SelectItem value="absent">
                                                                                            <div className="flex items-center gap-2">
                                                                                                <XCircle className="w-4 h-4 text-red-600" />
                                                                                                Absent
                                                                                            </div>
                                                                                        </SelectItem>
                                                                                        <SelectItem value="late">
                                                                                            <div className="flex items-center gap-2">
                                                                                                <Clock className="w-4 h-4 text-yellow-600" />
                                                                                                Late
                                                                                            </div>
                                                                                        </SelectItem>
                                                                                        <SelectItem value="on_duty">
                                                                                            <div className="flex items-center gap-2">
                                                                                                <UserCheck className="w-4 h-4 text-blue-600" />
                                                                                                On Duty
                                                                                            </div>
                                                                                        </SelectItem>
                                                                                        <SelectItem value="medical_leave">
                                                                                            <div className="flex items-center gap-2">
                                                                                                <AlertCircle className="w-4 h-4 text-purple-600" />
                                                                                                Medical Leave
                                                                                            </div>
                                                                                        </SelectItem>
                                                                                    </SelectContent>
                                                                                </Select>
                                                                            </div>
                                                                        </TableCell>
                                                                    </TableRow>
                                                                );
                                                            })}
                                                        </TableBody>
                                                    </Table>
                                                </div>
                                            </CardContent>
                                        </Card>
                                    </TabsContent>
                                );
                            })}
                        </Tabs>
                    )}
                </div>
            </div>
        </div>
    );
}

export default function FacultyAttendancePage() {
    return (
        <Suspense fallback={<div className="min-h-screen flex items-center justify-center">Loading attendance...</div>}>
            <FacultyAttendanceContent />
        </Suspense>
    );
}
