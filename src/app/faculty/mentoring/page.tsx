"use client";

import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { MessageSquare, Phone, Mail, TrendingUp, AlertTriangle, FileText } from "lucide-react";

// Mock Mentees List
const MENTEES = [
    { id: "21KN1A0501", name: "Aarav Sharma", year: "III-CSE-A", cgpa: 8.5, attendance: 92, backlogs: 0, status: "Good" },
    { id: "21KN1A0502", name: "Aditi Rao", year: "III-CSE-A", cgpa: 9.1, attendance: 96, backlogs: 0, status: "Excellent" },
    { id: "21KN1A0505", name: "Rohan Gupta", year: "III-CSE-A", cgpa: 6.8, attendance: 78, backlogs: 1, status: "At Risk" },
    { id: "21KN1A0508", name: "Zara Khan", year: "III-CSE-A", cgpa: 7.5, attendance: 85, backlogs: 0, status: "Good" },
    { id: "21KN1A0512", name: "K. Venkat", year: "III-CSE-A", cgpa: 6.2, attendance: 65, backlogs: 2, status: "Critical" },
];

export default function FacultyMentoringPage() {
    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Mentoring</h1>
                    <p className="text-gray-500">Track academic progress and guide your assigned mentees</p>
                </div>
                <div className="flex gap-2">
                    <Button variant="outline">
                        <FileText className="w-4 h-4 mr-2" /> Generate Report
                    </Button>
                </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                {/* Summary Stats */}
                <Card className="bg-white border-l-4 border-l-green-500 shadow-sm">
                    <CardContent className="p-6">
                        <div className="flex justify-between items-start">
                            <div>
                                <p className="text-gray-500 font-medium mb-1">Total Mentees</p>
                                <h2 className="text-3xl font-bold text-gray-900">{MENTEES.length}</h2>
                            </div>
                            <div className="p-3 bg-green-50 rounded-full">
                                <UsersIcon className="w-6 h-6 text-green-600" />
                            </div>
                        </div>
                    </CardContent>
                </Card>
                <Card className="bg-white border-l-4 border-l-orange-500 shadow-sm">
                    <CardContent className="p-6">
                        <div className="flex justify-between items-start">
                            <div>
                                <p className="text-gray-500 font-medium mb-1">Underperformers</p>
                                <h2 className="text-3xl font-bold text-orange-600">
                                    {MENTEES.filter(m => m.cgpa < 7.0 || m.backlogs > 0).length}
                                </h2>
                            </div>
                            <div className="p-3 bg-orange-50 rounded-full">
                                <AlertTriangle className="w-6 h-6 text-orange-600" />
                            </div>
                        </div>
                    </CardContent>
                </Card>
                <Card className="bg-white border-l-4 border-l-blue-500 shadow-sm">
                    <CardContent className="p-6">
                        <div className="flex justify-between items-start">
                            <div>
                                <p className="text-gray-500 font-medium mb-1">Avg CGPA</p>
                                <h2 className="text-3xl font-bold text-blue-600">
                                    {(MENTEES.reduce((acc, curr) => acc + curr.cgpa, 0) / MENTEES.length).toFixed(1)}
                                </h2>
                            </div>
                            <div className="p-3 bg-blue-50 rounded-full">
                                <TrendingUp className="w-6 h-6 text-blue-600" />
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Mentees Table */}
            <Card>
                <CardHeader>
                    <CardTitle>Assigned Students</CardTitle>
                    <CardDescription>Academic Year 2024-2025</CardDescription>
                </CardHeader>
                <CardContent>
                    <Table>
                        <TableHeader>
                            <TableRow>
                                <TableHead className="w-[80px]">Profile</TableHead>
                                <TableHead>Student Details</TableHead>
                                <TableHead className="text-center">CGPA</TableHead>
                                <TableHead className="text-center">Attendance</TableHead>
                                <TableHead className="text-center">Backlogs</TableHead>
                                <TableHead className="text-center">Status</TableHead>
                                <TableHead className="text-right">Actions</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {MENTEES.map((student) => (
                                <TableRow key={student.id}>
                                    <TableCell>
                                        <Avatar>
                                            <AvatarFallback className="bg-indigo-100 text-indigo-700 font-bold">
                                                {student.name.split(' ').map(n => n[0]).join('')}
                                            </AvatarFallback>
                                        </Avatar>
                                    </TableCell>
                                    <TableCell>
                                        <div className="font-medium text-gray-900">{student.name}</div>
                                        <div className="text-xs text-gray-500 font-mono">{student.id}</div>
                                    </TableCell>
                                    <TableCell className="text-center font-bold text-gray-700">{student.cgpa}</TableCell>
                                    <TableCell className="text-center">
                                        <span className={`px-2 py-1 rounded text-xs font-semibold ${student.attendance >= 75 ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'
                                            }`}>
                                            {student.attendance}%
                                        </span>
                                    </TableCell>
                                    <TableCell className="text-center">
                                        {student.backlogs > 0 ? (
                                            <Badge variant="destructive">{student.backlogs}</Badge>
                                        ) : (
                                            <span className="text-gray-400">-</span>
                                        )}
                                    </TableCell>
                                    <TableCell className="text-center">
                                        <Badge variant={
                                            student.status === 'Excellent' ? 'default' :
                                                student.status === 'Good' ? 'secondary' :
                                                    'destructive'
                                        } className={student.status === 'Excellent' ? 'bg-green-600' : ''}>
                                            {student.status}
                                        </Badge>
                                    </TableCell>
                                    <TableCell className="text-right">
                                        <div className="flex justify-end gap-2">
                                            <Button variant="ghost" size="icon" className="h-8 w-8 text-blue-600">
                                                <MessageSquare className="w-4 h-4" />
                                            </Button>
                                            <Button variant="ghost" size="icon" className="h-8 w-8 text-gray-600">
                                                <Phone className="w-4 h-4" />
                                            </Button>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>
        </div>
    );
}

function UsersIcon(props: any) {
    return (
        <svg
            {...props}
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
        >
            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
            <circle cx="9" cy="7" r="4" />
            <path d="M22 21v-2a4 4 0 0 0-3-3.87" />
            <path d="M16 3.13a4 4 0 0 1 0 7.75" />
        </svg>
    )
}
