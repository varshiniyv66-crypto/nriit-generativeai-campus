"use client";

import { useState, useEffect } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { CalendarDays, Save, CheckCircle2, XCircle, Clock, UserCheck, AlertCircle, Search, Filter } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { toast } from "sonner";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { format } from "date-fns";
import { cn } from "@/lib/utils";

type AttendanceStatus = 'present' | 'absent' | 'late' | 'on_duty' | 'medical_leave';

interface PeriodAttendance {
    [studentId: string]: AttendanceStatus;
}

// Mock Data
const DEPARTMENTS = ["CSE", "ECE", "EEE", "MECH", "CIVIL", "IT"];
const CLASSES = ["II-CSE-A", "II-CSE-B", "III-CSE-A", "III-CSE-B", "IV-CSE-A"];
const STUDENTS = [
    { id: "21B81A0501", roll_number: "21B81A0501", first_name: "Aarav", last_name: "Sharma", attendance: 92 },
    { id: "21B81A0502", roll_number: "21B81A0502", first_name: "Aditi", last_name: "Rao", attendance: 88 },
    { id: "21B81A0503", roll_number: "21B81A0503", first_name: "Karthik", last_name: "Reddy", attendance: 95 },
    { id: "21B81A0504", roll_number: "21B81A0504", first_name: "Meera", last_name: "Nair", attendance: 78 },
    { id: "21B81A0505", roll_number: "21B81A0505", first_name: "Rohan", last_name: "Gupta", attendance: 85 },
];

export default function DeanAttendancePage() {
    const [selectedDept, setSelectedDept] = useState("CSE");
    const [selectedClass, setSelectedClass] = useState("III-CSE-A");
    const [date, setDate] = useState<string>(new Date().toISOString().split('T')[0]);
    const [loading, setLoading] = useState(false);

    // Store attendance for all 8 periods of the selected day
    const [periodAttendance, setPeriodAttendance] = useState<{ [period: number]: PeriodAttendance }>({
        1: {}, 2: {}, 3: {}, 4: {}, 5: {}, 6: {}, 7: {}, 8: {}
    });

    // Initialize mock data
    useEffect(() => {
        setLoading(true);
        // Simulate API call
        setTimeout(() => {
            const initialAttendance: { [period: number]: PeriodAttendance } = {};
            for (let i = 1; i <= 8; i++) {
                const periodData: PeriodAttendance = {};
                STUDENTS.forEach(student => {
                    // Random attendance logic
                    const rand = Math.random();
                    if (rand > 0.9) periodData[student.id] = 'absent';
                    else if (rand > 0.85) periodData[student.id] = 'late';
                    else periodData[student.id] = 'present';
                });
                initialAttendance[i] = periodData;
            }
            setPeriodAttendance(initialAttendance);
            setLoading(false);
        }, 800);
    }, [selectedDept, selectedClass, date]);

    const handleAttendanceChange = (period: number, studentId: string, status: AttendanceStatus) => {
        setPeriodAttendance(prev => ({
            ...prev,
            [period]: {
                ...prev[period],
                [studentId]: status
            }
        }));
    };

    const handleSave = () => {
        toast.success("Attendance records updated successfully!");
    };

    const getStatusColor = (status: AttendanceStatus) => {
        switch (status) {
            case 'present': return 'bg-green-100 text-green-700 hover:bg-green-200';
            case 'absent': return 'bg-red-100 text-red-700 hover:bg-red-200';
            case 'late': return 'bg-yellow-100 text-yellow-700 hover:bg-yellow-200';
            case 'on_duty': return 'bg-blue-100 text-blue-700 hover:bg-blue-200';
            case 'medical_leave': return 'bg-purple-100 text-purple-700 hover:bg-purple-200';
            default: return 'bg-gray-100 text-gray-700';
        }
    };

    const StatusIcon = ({ status }: { status: AttendanceStatus }) => {
        switch (status) {
            case 'present': return <CheckCircle2 className="w-4 h-4" />;
            case 'absent': return <XCircle className="w-4 h-4" />;
            case 'late': return <Clock className="w-4 h-4" />;
            case 'on_duty': return <UserCheck className="w-4 h-4" />;
            case 'medical_leave': return <AlertCircle className="w-4 h-4" />;
            default: return null;
        }
    };

    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">University Attendance Management</h1>
                    <p className="text-gray-500">Monitor and edit attendance across all departments</p>
                </div>
                <div className="flex items-center gap-2">
                    <Button onClick={handleSave} className="bg-green-600 hover:bg-green-700 text-white gap-2 shadow-sm">
                        <Save className="w-4 h-4" />
                        Save Changes
                    </Button>
                </div>
            </div>

            {/* Filters */}
            <Card className="border-t-4 border-t-indigo-600">
                <CardContent className="p-6">
                    <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-700">Department</label>
                            <Select value={selectedDept} onValueChange={setSelectedDept}>
                                <SelectTrigger>
                                    <SelectValue />
                                </SelectTrigger>
                                <SelectContent>
                                    {DEPARTMENTS.map(dept => (
                                        <SelectItem key={dept} value={dept}>{dept}</SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>
                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-700">Class & Section</label>
                            <Select value={selectedClass} onValueChange={setSelectedClass}>
                                <SelectTrigger>
                                    <SelectValue />
                                </SelectTrigger>
                                <SelectContent>
                                    {CLASSES.map(cls => (
                                        <SelectItem key={cls} value={cls}>{cls}</SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>
                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-700">Date</label>
                            <input
                                type="date"
                                value={date}
                                onChange={(e) => setDate(e.target.value)}
                                className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                            />
                        </div>
                        <div className="flex items-end">
                            <Button variant="outline" className="w-full gap-2 border-dashed">
                                <Filter className="w-4 h-4" /> More Filters
                            </Button>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Attendance Grid */}
            <Tabs defaultValue="1" className="w-full">
                <div className="flex items-center justify-between mb-4">
                    <TabsList className="bg-white border">
                        {[1, 2, 3, 4, 5, 6, 7, 8].map(period => (
                            <TabsTrigger key={period} value={period.toString()} className="data-[state=active]:bg-indigo-50 data-[state=active]:text-indigo-700">
                                Period {period}
                            </TabsTrigger>
                        ))}
                    </TabsList>
                </div>

                {[1, 2, 3, 4, 5, 6, 7, 8].map(period => (
                    <TabsContent key={period} value={period.toString()}>
                        <Card>
                            <CardHeader>
                                <div className="flex justify-between items-center">
                                    <div>
                                        <CardTitle>Period {period} Attendance</CardTitle>
                                        <CardDescription>
                                            {selectedClass} • {date} • Total Students: {STUDENTS.length}
                                        </CardDescription>
                                    </div>
                                    <Badge variant="outline" className="bg-indigo-50 text-indigo-700 border-indigo-200">
                                        Editing Mode: Admin
                                    </Badge>
                                </div>
                            </CardHeader>
                            <CardContent>
                                {loading ? (
                                    <div className="h-40 flex items-center justify-center">
                                        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-600"></div>
                                    </div>
                                ) : (
                                    <div className="rounded-md border">
                                        <Table>
                                            <TableHeader>
                                                <TableRow className="bg-gray-50">
                                                    <TableHead className="w-[100px]">Roll No</TableHead>
                                                    <TableHead>Student Name</TableHead>
                                                    <TableHead className="w-[100px] text-center">Status</TableHead>
                                                    <TableHead className="text-right">Action</TableHead>
                                                </TableRow>
                                            </TableHeader>
                                            <TableBody>
                                                {STUDENTS.map(student => {
                                                    const status = periodAttendance[period]?.[student.id] || 'present';
                                                    return (
                                                        <TableRow key={student.id}>
                                                            <TableCell className="font-medium">{student.roll_number}</TableCell>
                                                            <TableCell>
                                                                <div className="font-medium">{student.first_name} {student.last_name}</div>
                                                                <div className="text-xs text-gray-500">{student.attendance}% Overall</div>
                                                            </TableCell>
                                                            <TableCell className="text-center">
                                                                <Badge variant="secondary" className={cn("capitalize gap-1", getStatusColor(status))}>
                                                                    <StatusIcon status={status} />
                                                                    {status.replace('_', ' ')}
                                                                </Badge>
                                                            </TableCell>
                                                            <TableCell className="text-right">
                                                                <div className="flex justify-end gap-1">
                                                                    <Button
                                                                        variant="ghost" size="sm"
                                                                        onClick={() => handleAttendanceChange(period, student.id, 'present')}
                                                                        className={cn("h-8 w-8 p-0", status === 'present' ? "bg-green-100 text-green-600" : "text-gray-400 hover:text-green-600")}
                                                                        title="Present"
                                                                    >
                                                                        <CheckCircle2 className="w-4 h-4" />
                                                                    </Button>
                                                                    <Button
                                                                        variant="ghost" size="sm"
                                                                        onClick={() => handleAttendanceChange(period, student.id, 'absent')}
                                                                        className={cn("h-8 w-8 p-0", status === 'absent' ? "bg-red-100 text-red-600" : "text-gray-400 hover:text-red-600")}
                                                                        title="Absent"
                                                                    >
                                                                        <XCircle className="w-4 h-4" />
                                                                    </Button>
                                                                    <Button
                                                                        variant="ghost" size="sm"
                                                                        onClick={() => handleAttendanceChange(period, student.id, 'late')}
                                                                        className={cn("h-8 w-8 p-0", status === 'late' ? "bg-yellow-100 text-yellow-600" : "text-gray-400 hover:text-yellow-600")}
                                                                        title="Late"
                                                                    >
                                                                        <Clock className="w-4 h-4" />
                                                                    </Button>
                                                                </div>
                                                            </TableCell>
                                                        </TableRow>
                                                    );
                                                })}
                                            </TableBody>
                                        </Table>
                                    </div>
                                )}
                            </CardContent>
                        </Card>
                    </TabsContent>
                ))}
            </Tabs>
        </div>
    );
}
