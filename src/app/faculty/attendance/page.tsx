"use client";

import { useState, useEffect, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { CalendarDays, Save, Grid3x3, List, CheckCircle2, XCircle, Clock, UserCheck, Users, TrendingUp, AlertCircle } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { toast } from "sonner";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { cn } from "@/lib/utils";
import supabase from "@/lib/supabase";

type AttendanceStatus = 'present' | 'absent' | 'late' | 'on_duty' | 'medical_leave';

interface PeriodAttendance {
    [studentId: string]: AttendanceStatus;
}

interface FacultyClass {
    class_section_id: string;
    dept_code: string;
    semester: number;
    section: string;
    course_code: string;
    course_name: string;
    day_of_week: number;
    period_number: number;
}

interface Student {
    id: string;
    roll_number: string;
    first_name: string;
    last_name: string;
    attendance: number;
}

// Mock Student List (temporary - will be replaced with database data)
const STUDENTS = [
    { id: "21B81A0501", roll_number: "21B81A0501", first_name: "Aarav", last_name: "Sharma", attendance: 92 },
    { id: "21B81A0502", roll_number: "21B81A0502", first_name: "Aditi", last_name: "Rao", attendance: 88 },
    { id: "21B81A0503", roll_number: "21B81A0503", first_name: "Karthik", last_name: "Reddy", attendance: 95 },
    { id: "21B81A0504", roll_number: "21B81A0504", first_name: "Meera", last_name: "Nair", attendance: 78 },
    { id: "21B81A0505", roll_number: "21B81A0505", first_name: "Rohan", last_name: "Gupta", attendance: 85 },
    { id: "21B81A0506", roll_number: "21B81A0506", first_name: "Sneha", last_name: "Patel", attendance: 91 },
    { id: "21B81A0507", roll_number: "21B81A0507", first_name: "Vikram", last_name: "Singh", attendance: 73 },
    { id: "21B81A0508", roll_number: "21B81A0508", first_name: "Zara", last_name: "Khan", attendance: 89 },
    { id: "21B81A0509", roll_number: "21B81A0509", first_name: "Ishaan", last_name: "Verma", attendance: 94 },
    { id: "21B81A0510", roll_number: "21B81A0510", first_name: "Priya", last_name: "Krishna", attendance: 87 },
    { id: "21B81A0511", roll_number: "21B81A0511", first_name: "Arjun", last_name: "Desai", attendance: 82 },
    { id: "21B81A0512", roll_number: "21B81A0512", first_name: "Diya", last_name: "Menon", attendance: 90 },
];

function FacultyAttendanceContent() {
    const [loading, setLoading] = useState(true);
    const [facultyId, setFacultyId] = useState<string | null>(null);
    const [myClasses, setMyClasses] = useState<FacultyClass[]>([]);
    const [mySubjects, setMySubjects] = useState<any[]>([]);
    const [students, setStudents] = useState<Student[]>([]);

    const [selectedClass, setSelectedClass] = useState("");
    const [selectedSubject, setSelectedSubject] = useState("");
    const [viewMode, setViewMode] = useState<'list' | 'grid'>('grid');
    const [isSaved, setIsSaved] = useState(false);

    const searchParams = useSearchParams();

    useEffect(() => {
        const classParam = searchParams.get('class');
        const subjectParam = searchParams.get('subject');

        if (classParam) setSelectedClass(classParam);
        if (subjectParam) setSelectedSubject(subjectParam);
    }, [searchParams]);

    // Store attendance for all 8 periods
    const [periodAttendance, setPeriodAttendance] = useState<{ [period: number]: PeriodAttendance }>({
        1: {},
        2: {},
        3: {},
        4: {},
        5: {},
        6: {},
        7: {},
        8: {},
    });

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

    const handleSave = () => {
        toast.promise(new Promise(resolve => setTimeout(resolve, 1000)), {
            loading: 'Saving attendance...',
            success: () => {
                setIsSaved(true);
                return 'Attendance marked successfully for all periods';
            },
            error: 'Failed to save attendance',
        });
    };

    const markAllPeriod = (period: number, status: AttendanceStatus) => {
        setPeriodAttendance(prev => {
            const newPeriodData: PeriodAttendance = {};
            STUDENTS.forEach(student => {
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
        }
        setPeriodAttendance(allPresent);
        setIsSaved(false);
        toast.success('All students marked present for all periods');
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
        const present = STUDENTS.filter(s => getAttendanceStatus(s.id, period) === 'present').length;
        const absent = STUDENTS.filter(s => getAttendanceStatus(s.id, period) === 'absent').length;
        const late = STUDENTS.filter(s => getAttendanceStatus(s.id, period) === 'late').length;
        const onDuty = STUDENTS.filter(s => getAttendanceStatus(s.id, period) === 'on_duty').length;
        const medical = STUDENTS.filter(s => getAttendanceStatus(s.id, period) === 'medical_leave').length;
        const percentage = ((present + late + onDuty + medical) / STUDENTS.length * 100).toFixed(1);

        return { present, absent, late, onDuty, medical, percentage };
    };

    const getTotalStats = () => {
        let totalPresent = 0, totalAbsent = 0, totalLate = 0, totalOnDuty = 0, totalMedical = 0;

        for (let period = 1; period <= 8; period++) {
            const stats = getPeriodStats(period);
            totalPresent += stats.present;
            totalAbsent += stats.absent;
            totalLate += stats.late;
            totalOnDuty += stats.onDuty;
            totalMedical += stats.medical;
        }

        const totalSlots = STUDENTS.length * 8;
        const totalAttended = totalPresent + totalLate + totalOnDuty + totalMedical;
        const percentage = ((totalAttended / totalSlots) * 100).toFixed(1);

        return { totalPresent, totalAbsent, totalLate, totalOnDuty, totalMedical, percentage };
    };

    const totalStats = getTotalStats();

    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            {/* Header */}
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                        Smart Attendance System
                    </h1>
                    <p className="text-gray-500 mt-1">Mark attendance efficiently with our advanced grid interface</p>
                </div>

                <div className="flex gap-2 flex-wrap">
                    <Button
                        variant="outline"
                        onClick={markAllPresent}
                        className="gap-2"
                    >
                        <Users className="w-4 h-4" />
                        Mark All Present
                    </Button>
                    <Button
                        variant={isSaved ? "secondary" : "default"}
                        onClick={handleSave}
                        className="min-w-[160px] gap-2 bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700"
                    >
                        <Save className={`w-4 h-4 ${!isSaved && 'animate-pulse'}`} />
                        {isSaved ? "Saved ✓" : "Save Attendance"}
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
                <Card className="lg:col-span-1 h-fit sticky top-6">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <CalendarDays className="w-5 h-5 text-blue-600" />
                            Session Details
                        </CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="p-3 bg-gradient-to-r from-blue-50 to-purple-50 rounded-lg border border-blue-100">
                            <div className="text-xs text-gray-600 mb-1">Today's Date</div>
                            <div className="font-semibold text-gray-900">
                                {new Date().toLocaleDateString('en-US', { weekday: 'long', month: 'short', day: 'numeric', year: 'numeric' })}
                            </div>
                        </div>

                        <div className="space-y-2">
                            <label className="text-sm font-medium">Class / Section</label>
                            <Select value={selectedClass} onValueChange={setSelectedClass}>
                                <SelectTrigger>
                                    <SelectValue />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="III-CSE-A">III Year - CSE A</SelectItem>
                                    <SelectItem value="III-CSE-B">III Year - CSE B</SelectItem>
                                    <SelectItem value="II-CSE-A">II Year - CSE A</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="space-y-2">
                            <label className="text-sm font-medium">Subject</label>
                            <Select value={selectedSubject} onValueChange={setSelectedSubject}>
                                <SelectTrigger>
                                    <SelectValue />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="dm">Data Mining</SelectItem>
                                    <SelectItem value="cn">Computer Networks</SelectItem>
                                    <SelectItem value="wt">Web Technologies</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="space-y-2">
                            <label className="text-sm font-medium">View Mode</label>
                            <div className="flex gap-2">
                                <Button
                                    variant={viewMode === 'grid' ? 'default' : 'outline'}
                                    size="sm"
                                    onClick={() => setViewMode('grid')}
                                    className="flex-1 gap-2"
                                >
                                    <Grid3x3 className="w-4 h-4" />
                                    Grid
                                </Button>
                                <Button
                                    variant={viewMode === 'list' ? 'default' : 'outline'}
                                    size="sm"
                                    onClick={() => setViewMode('list')}
                                    className="flex-1 gap-2"
                                >
                                    <List className="w-4 h-4" />
                                    List
                                </Button>
                            </div>
                        </div>

                        <div className="pt-4 border-t space-y-3">
                            <div className="text-sm font-medium text-gray-700 mb-2">Class Strength</div>
                            <div className="flex justify-between items-center">
                                <span className="text-sm text-gray-600">Total Students</span>
                                <span className="font-bold text-lg">{STUDENTS.length}</span>
                            </div>
                        </div>

                        {/* Status Legend */}
                        <div className="pt-4 border-t space-y-2">
                            <div className="text-sm font-medium text-gray-700 mb-2">Status Legend</div>
                            <div className="space-y-1.5">
                                <div className="flex items-center gap-2 text-xs">
                                    <div className="w-3 h-3 rounded-full bg-green-500"></div>
                                    <span>Present</span>
                                </div>
                                <div className="flex items-center gap-2 text-xs">
                                    <div className="w-3 h-3 rounded-full bg-red-500"></div>
                                    <span>Absent</span>
                                </div>
                                <div className="flex items-center gap-2 text-xs">
                                    <div className="w-3 h-3 rounded-full bg-yellow-500"></div>
                                    <span>Late</span>
                                </div>
                                <div className="flex items-center gap-2 text-xs">
                                    <div className="w-3 h-3 rounded-full bg-blue-500"></div>
                                    <span>On Duty</span>
                                </div>
                                <div className="flex items-center gap-2 text-xs">
                                    <div className="w-3 h-3 rounded-full bg-purple-500"></div>
                                    <span>Medical Leave</span>
                                </div>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                {/* Attendance Grid/List */}
                <div className="lg:col-span-3">
                    {viewMode === 'grid' ? (
                        <Card>
                            <CardHeader>
                                <CardTitle>Period-wise Attendance Grid</CardTitle>
                                <CardDescription>Click on any cell to cycle through statuses: Present → Absent → Late → On Duty → Medical → Present</CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="overflow-x-auto">
                                    <div className="min-w-[900px]">
                                        {/* Period Headers */}
                                        <div className="grid grid-cols-10 gap-2 mb-4">
                                            <div className="col-span-2 font-semibold text-sm text-gray-700">Student Name</div>
                                            {[1, 2, 3, 4, 5, 6, 7, 8].map(period => {
                                                const stats = getPeriodStats(period);
                                                return (
                                                    <div key={period} className="text-center">
                                                        <div className="font-semibold text-sm text-gray-700 mb-1">P{period}</div>
                                                        <div className="text-xs text-gray-500">{stats.percentage}%</div>
                                                        <div className="flex gap-1 mt-1 justify-center">
                                                            <Button
                                                                size="sm"
                                                                variant="ghost"
                                                                className="h-5 w-5 p-0 hover:bg-green-100"
                                                                onClick={() => markAllPeriod(period, 'present')}
                                                                title="Mark all present"
                                                            >
                                                                <CheckCircle2 className="w-3 h-3 text-green-600" />
                                                            </Button>
                                                            <Button
                                                                size="sm"
                                                                variant="ghost"
                                                                className="h-5 w-5 p-0 hover:bg-red-100"
                                                                onClick={() => markAllPeriod(period, 'absent')}
                                                                title="Mark all absent"
                                                            >
                                                                <XCircle className="w-3 h-3 text-red-600" />
                                                            </Button>
                                                        </div>
                                                    </div>
                                                );
                                            })}
                                        </div>

                                        {/* Student Rows */}
                                        <div className="space-y-2">
                                            {STUDENTS.map((student) => (
                                                <div key={student.id} className="grid grid-cols-10 gap-2 items-center group hover:bg-gray-50 p-2 rounded-lg transition-colors">
                                                    <div className="col-span-2">
                                                        <div className="font-medium text-sm">{student.first_name} {student.last_name}</div>
                                                        <div className="text-xs text-gray-500 font-mono">{student.id}</div>
                                                        <div className="text-xs text-gray-400">Overall: {student.attendance}%</div>
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
                                                                    "h-12 rounded-lg transition-all duration-200 flex items-center justify-center",
                                                                    "hover:scale-105 hover:shadow-md active:scale-95",
                                                                    "border-2 border-transparent hover:border-gray-300",
                                                                    getStatusColor(status),
                                                                    "text-white font-medium"
                                                                )}
                                                                title={`Click to change status (Current: ${status})`}
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
                            <TabsList className="grid grid-cols-8 w-full">
                                {[1, 2, 3, 4, 5, 6, 7, 8].map(period => {
                                    const stats = getPeriodStats(period);
                                    return (
                                        <TabsTrigger key={period} value={period.toString()} className="relative">
                                            Period {period}
                                            <Badge variant="secondary" className="ml-1 text-xs">
                                                {stats.percentage}%
                                            </Badge>
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
                                                            Present: {stats.present} | Absent: {stats.absent} | Late: {stats.late} | On Duty: {stats.onDuty} | Medical: {stats.medical}
                                                        </CardDescription>
                                                    </div>
                                                    <div className="flex gap-2">
                                                        <Button size="sm" variant="outline" onClick={() => markAllPeriod(period, 'present')}>
                                                            All Present
                                                        </Button>
                                                        <Button size="sm" variant="outline" onClick={() => markAllPeriod(period, 'absent')}>
                                                            All Absent
                                                        </Button>
                                                    </div>
                                                </div>
                                            </CardHeader>
                                            <CardContent>
                                                <div className="rounded-md border">
                                                    <Table>
                                                        <TableHeader>
                                                            <TableRow>
                                                                <TableHead className="w-[120px]">Roll No</TableHead>
                                                                <TableHead>Student Name</TableHead>
                                                                <TableHead className="w-[100px]">Overall %</TableHead>
                                                                <TableHead className="w-[200px] text-right">Status</TableHead>
                                                            </TableRow>
                                                        </TableHeader>
                                                        <TableBody>
                                                            {STUDENTS.map((student) => {
                                                                const status = getAttendanceStatus(student.id, period);
                                                                return (
                                                                    <TableRow key={student.id} className={status === 'absent' ? "bg-red-50/50" : ""}>
                                                                        <TableCell className="font-mono text-sm">{student.id}</TableCell>
                                                                        <TableCell className="font-medium">{student.first_name} {student.last_name}</TableCell>
                                                                        <TableCell>
                                                                            <Badge variant={student.attendance >= 75 ? "default" : "destructive"}>
                                                                                {student.attendance}%
                                                                            </Badge>
                                                                        </TableCell>
                                                                        <TableCell className="text-right">
                                                                            <div className="flex items-center justify-end gap-2">
                                                                                <Select
                                                                                    value={status}
                                                                                    onValueChange={(value) => toggleAttendance(student.id, period, value as AttendanceStatus)}
                                                                                >
                                                                                    <SelectTrigger className="w-[150px]">
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
