"use client";

import { Card, CardContent, CardHeader, CardTitle, CardDescription, CardFooter } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import Link from "next/link";
import { Clock, MapPin, CalendarDays, Users, CheckCircle2 } from "lucide-react";

// Mock Weekly Schedule
const SCHEDULE = {
    Monday: [
        { period: 1, time: "09:00 - 09:50", subject: "Data Mining", class: "III-CSE-A", room: "LH-301", type: "Lecture" },
        { period: 2, time: "09:50 - 10:40", subject: "Data Mining", class: "III-CSE-B", room: "LH-302", type: "Lecture" },
        { period: 5, time: "13:20 - 14:10", subject: "Mentoring", class: "III-CSE-A", room: "Staff Room", type: "Activity" },
    ],
    Tuesday: [
        { period: 1, time: "09:00 - 09:50", subject: "Data Mining", class: "III-CSE-B", room: "LH-302", type: "Lecture" },
        { period: 3, time: "10:50 - 11:40", subject: "Data Mining", class: "III-CSE-A", room: "LH-301", type: "Lecture" },
        { period: 6, time: "14:10 - 15:00", subject: "Project Review", class: "IV-CSE-A", room: "Lab-2", type: "Lab" },
    ],
    Wednesday: [
        { period: 2, time: "09:50 - 10:40", subject: "Data Mining", class: "III-CSE-A", room: "LH-301", type: "Lecture" },
        { period: 5, time: "13:20 - 16:30", subject: "DM Lab", class: "III-CSE-A", room: "Lab-4", type: "Lab" },
    ],
    Thursday: [
        { period: 1, time: "09:00 - 09:50", subject: "Data Mining", class: "III-CSE-B", room: "LH-302", type: "Lecture" },
        { period: 4, time: "11:40 - 12:30", subject: "Association Activity", class: "All CSE", room: "Seminar Hall", type: "Activity" },
    ],
    Friday: [
        { period: 3, time: "10:50 - 11:40", subject: "Data Mining", class: "III-CSE-B", room: "LH-302", type: "Lecture" },
        { period: 5, time: "13:20 - 16:30", subject: "DM Lab", class: "III-CSE-B", room: "Lab-4", type: "Lab" },
    ]
};

const TODAY = "Wednesday"; // Mocking today

export default function FacultyClassesPage() {
    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">My Classes</h1>
                    <p className="text-gray-500">View your weekly timetable and class locations</p>
                </div>
                <div className="flex items-center gap-2 px-4 py-2 bg-indigo-50 text-indigo-700 rounded-full font-medium">
                    <CalendarDays className="w-5 h-5" />
                    Today is {TODAY}
                </div>
            </div>

            {/* Today's Schedule Highlight */}
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 space-y-4">
                    <h2 className="text-lg font-semibold text-gray-700">Today's Schedule</h2>
                    {SCHEDULE[TODAY].map((cls, idx) => (
                        <Card key={idx} className="border-l-4 border-l-indigo-600 shadow-sm hover:shadow-md transition-shadow">
                            <CardContent className="p-4">
                                <div className="flex justify-between items-start mb-2">
                                    <div className="flex items-center gap-2 text-indigo-700 font-bold">
                                        <Clock className="w-4 h-4" />
                                        {cls.time}
                                    </div>
                                    <Badge variant={cls.type === 'Lab' ? 'secondary' : 'outline'}>{cls.type}</Badge>
                                </div>
                                <h3 className="text-xl font-bold text-gray-900 mb-1">{cls.subject}</h3>
                                <div className="flex justify-between items-center text-sm text-gray-600">
                                    <div className="flex items-center gap-1">
                                        <Users className="w-4 h-4" /> {cls.class}
                                    </div>
                                    <div className="flex items-center gap-1">
                                        <MapPin className="w-4 h-4" /> {cls.room}
                                    </div>
                                </div>
                            </CardContent>
                            <CardFooter className="bg-gray-50/50 p-4 border-t border-gray-100">
                                <Link href={`/faculty/attendance?class=${cls.class}&subject=${cls.subject}&period=${cls.period}`} className="w-full">
                                    <Button className="w-full bg-indigo-600 hover:bg-indigo-700 text-white gap-2">
                                        <CheckCircle2 className="w-4 h-4" />
                                        Mark Attendance
                                    </Button>
                                </Link>
                            </CardFooter>
                        </Card>
                    ))}
                    {SCHEDULE[TODAY].length === 0 && (
                        <div className="p-4 bg-gray-50 rounded-lg text-center text-gray-500">
                            No classes scheduled for today.
                        </div>
                    )}
                </div>

                {/* Weekly Timetable */}
                <Card className="lg:col-span-2">
                    <CardHeader>
                        <CardTitle>Weekly Timetable</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-6">
                            {Object.entries(SCHEDULE).map(([day, classes]) => (
                                day !== TODAY && (
                                    <div key={day} className="border-b border-gray-100 last:border-0 pb-4 last:pb-0">
                                        <h3 className="font-semibold text-gray-800 mb-3 flex items-center gap-2">
                                            <span className="w-2 h-2 rounded-full bg-gray-300"></span> {day}
                                        </h3>
                                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pl-4">
                                            {classes.map((cls, idx) => (
                                                <div key={idx} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg border border-gray-100">
                                                    <div>
                                                        <div className="font-medium text-gray-900 text-sm">{cls.subject}</div>
                                                        <div className="text-xs text-gray-500">{cls.time}</div>
                                                    </div>
                                                    <div className="text-right">
                                                        <div className="text-xs font-bold text-indigo-600">{cls.class}</div>
                                                        <div className="text-xs text-gray-400">{cls.room}</div>
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                    </div>
                                )
                            ))}
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}

