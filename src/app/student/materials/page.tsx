"use client";

import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { FileText, Download, BookOpen, Video, ExternalLink } from "lucide-react";

const MATERIALS = [
    {
        subject: "Data Warehousing & Mining",
        code: "R203101",
        faculty: "Dr. K. Srinivas",
        units: [
            { title: "Unit 1: Introduction to Data Mining", type: "PDF", size: "2.4 MB", date: "2024-08-10" },
            { title: "Unit 2: Data Preprocessing", type: "PDF", size: "1.8 MB", date: "2024-08-25" },
            { title: "Unit 3: Classification Algorithms", type: "PPT", size: "5.2 MB", date: "2024-09-15" },
            { title: "Lab Manual: DWM Lab", type: "PDF", size: "3.5 MB", date: "2024-08-01" },
        ]
    },
    {
        subject: "Computer Networks",
        code: "R203102",
        faculty: "Mrs. P. Lakshmi",
        units: [
            { title: "Unit 1: OSI & TCP/IP Models", type: "PDF", size: "3.1 MB", date: "2024-08-12" },
            { title: "Unit 2: Physical & Data Link Layer", type: "PDF", size: "2.9 MB", date: "2024-08-30" },
            { title: "Video: Subnetting Explained", type: "Video", size: "External", date: "2024-09-05" },
        ]
    },
    {
        subject: "Web Technologies",
        code: "R203103",
        faculty: "Mr. B. Rajesh",
        units: [
            { title: "Unit 1: HTML5 & CSS3 Full Notes", type: "PDF", size: "4.5 MB", date: "2024-08-05" },
            { title: "Unit 2: JavaScript & DOM", type: "PDF", size: "2.2 MB", date: "2024-08-20" },
            { title: "ReactJS Project Starter Code", type: "ZIP", size: "12 MB", date: "2024-09-20" },
        ]
    }
];

export default function StudentMaterialsPage() {
    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Study Materials</h1>
                    <p className="text-gray-500">Access course content, lecture notes, and lab manuals</p>
                </div>
            </div>

            <div className="grid grid-cols-1 gap-6">
                {MATERIALS.map((subject, idx) => (
                    <Card key={idx} className="overflow-hidden border-t-4 border-t-blue-600 shadow-sm hover:shadow-md transition-shadow">
                        <CardHeader className="bg-gray-50/50 pb-4 border-b border-gray-100">
                            <div className="flex justify-between items-start">
                                <div>
                                    <div className="flex items-center gap-2 mb-1">
                                        <Badge variant="outline" className="bg-white">{subject.code}</Badge>
                                        <span className="text-sm text-gray-500 font-medium">{subject.faculty}</span>
                                    </div>
                                    <CardTitle className="text-xl md:text-2xl text-blue-900">{subject.subject}</CardTitle>
                                </div>
                                <div className="p-2 bg-blue-100 rounded-lg text-blue-700">
                                    <BookOpen className="w-6 h-6" />
                                </div>
                            </div>
                        </CardHeader>
                        <CardContent className="p-0">
                            <div className="divide-y divide-gray-100">
                                {subject.units.map((unit, uIdx) => (
                                    <div key={uIdx} className="p-4 flex items-center justify-between hover:bg-blue-50/30 transition-colors">
                                        <div className="flex items-center gap-4">
                                            <div className="p-2 bg-gray-100 rounded text-gray-600">
                                                {unit.type === 'PDF' && <FileText className="w-5 h-5 text-red-500" />}
                                                {unit.type === 'PPT' && <FileText className="w-5 h-5 text-orange-500" />}
                                                {unit.type === 'Video' && <Video className="w-5 h-5 text-blue-500" />}
                                                {unit.type === 'ZIP' && <FileText className="w-5 h-5 text-yellow-500" />}
                                            </div>
                                            <div>
                                                <h4 className="font-medium text-gray-900">{unit.title}</h4>
                                                <div className="flex items-center gap-3 text-xs text-gray-500 mt-1">
                                                    <span>{unit.date}</span>
                                                    <span>•</span>
                                                    <span>{unit.size}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <Button variant="ghost" size="sm" className="text-blue-600 hover:text-blue-800 hover:bg-blue-50">
                                            {unit.type === 'Video' ? <ExternalLink className="w-4 h-4" /> : <Download className="w-4 h-4" />}
                                            <span className="ml-2 hidden sm:inline">{unit.type === 'Video' ? "Watch" : "Download"}</span>
                                        </Button>
                                    </div>
                                ))}
                            </div>
                        </CardContent>
                    </Card>
                ))}
            </div>
        </div>
    );
}
