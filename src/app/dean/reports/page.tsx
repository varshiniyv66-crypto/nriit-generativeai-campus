"use client";

import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { FileText, Download, BarChart, Printer } from "lucide-react";

export default function DeanReportsPage() {
    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            <h1 className="text-3xl font-bold text-gray-900">Academic Reports</h1>
            <p className="text-gray-500">Generate and download comprehensive academic reports</p>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <Card className="hover:shadow-md transition-shadow">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <FileText className="w-5 h-5 text-indigo-600" />
                            Attendance Reports
                        </CardTitle>
                        <CardDescription>Monthly and semester-wise attendance analysis</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-3">
                        <Button variant="outline" className="w-full justify-start gap-2">
                            <Download className="w-4 h-4" /> Download Monthly Report (PDF)
                        </Button>
                        <Button variant="outline" className="w-full justify-start gap-2">
                            <Printer className="w-4 h-4" /> Print Shortage List
                        </Button>
                    </CardContent>
                </Card>

                <Card className="hover:shadow-md transition-shadow">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <BarChart className="w-5 h-5 text-green-600" />
                            Performance Reports
                        </CardTitle>
                        <CardDescription>Academic performance and result analysis</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-3">
                        <Button variant="outline" className="w-full justify-start gap-2">
                            <Download className="w-4 h-4" /> Exam Results Summary
                        </Button>
                        <Button variant="outline" className="w-full justify-start gap-2">
                            <Download className="w-4 h-4" /> Department Wise Analysis
                        </Button>
                    </CardContent>
                </Card>

                <Card className="hover:shadow-md transition-shadow">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <FileText className="w-5 h-5 text-purple-600" />
                            Faculty Reports
                        </CardTitle>
                        <CardDescription>Faculty workload and feedback reports</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-3">
                        <Button variant="outline" className="w-full justify-start gap-2">
                            <Download className="w-4 h-4" /> Workload Summary
                        </Button>
                        <Button variant="outline" className="w-full justify-start gap-2">
                            <Download className="w-4 h-4" /> Student Feedback Report
                        </Button>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
