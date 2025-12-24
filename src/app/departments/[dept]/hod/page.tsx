"use client";

import { useParams } from "next/navigation";
import { User, Award, Quote, Mail, Phone, Calendar, Briefcase, CheckCircle2, TrendingUp, Users } from "lucide-react";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { departments as staticDepartments } from "@/data/departments";

const DEPT_NAMES: Record<string, string> = {
    'CSE': 'Computer Science',
    'IT': 'Information Technology',
    'CSE-DS': 'Data Science',
    'CSE-AI': 'Artificial Intelligence',
    'ECE': 'Electronics & Communication',
    'EEE': 'Electrical Engineering',
    'CIVIL': 'Civil Engineering',
    'MECH': 'Mechanical Engineering',
};

export default function HODPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const deptName = DEPT_NAMES[deptCode] || deptCode;

    // Fetch HOD Data
    const staticDeptInfo = (staticDepartments as any)[deptCode] || {};
    const hodName = staticDeptInfo?.hod?.name || "Head of Department";
    const hodDesignation = staticDeptInfo?.hod?.designation || "Professor & Head";
    const hodMessage = staticDeptInfo?.hod?.message || "Welcome to our department. We are dedicated to providing the best learning environment for our students and fostering a culture of innovation and research.";
    const hodPhoto = staticDeptInfo?.hod?.photo;

    // Default statistics if not available
    const stats = {
        experience: "15+ Years",
        publications: "20+",
        patents: "2"
    };

    return (
        <div className="container mx-auto p-6 max-w-5xl space-y-8 animate-in fade-in duration-500">
            {/* Header Section */}
            <div className="space-y-2">
                <h1 className="text-3xl font-bold tracking-tight text-[#1E3A8A]">Head of Department's Message</h1>
                <p className="text-slate-500">Leadership & Academic Direction for {deptName}</p>
            </div>

            {/* Main Profile Card - Horizontal Layout "Plan A" */}
            <Card className="border-t-4 border-t-[#E5A818] shadow-xl bg-white overflow-hidden">
                <div className="flex flex-col md:flex-row">
                    {/* Left Column: Photo & Quick Info - Reduced width to w-64 */}
                    <div className="md:w-64 bg-slate-50 border-r border-slate-100 flex flex-col shrink-0">
                        <div className="aspect-[3/4] relative overflow-hidden group">
                            <img
                                src={hodPhoto || `https://ui-avatars.com/api/?name=${encodeURIComponent(hodName)}&background=1E4080&color=fff&size=512`}
                                alt={hodName}
                                className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-[#E5A818]/90 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-end justify-center pb-6">
                                <Badge variant="secondary" className="bg-white/90 text-[#E5A818] hover:bg-white cursor-pointer">View Full Profile</Badge>
                            </div>
                        </div>

                        <div className="p-6 space-y-6">
                            <div>
                                <h3 className="text-lg font-bold text-[#1E3A8A] leading-tight">{hodName}</h3>
                                <p className="text-sm font-medium text-amber-600 mt-1">{hodDesignation}</p>
                                <p className="text-xs text-slate-500 mt-0.5">{deptCode} Department</p>
                            </div>

                            <div className="space-y-3 pt-4 border-t border-slate-200">
                                <div className="flex items-center gap-3 text-sm text-slate-600">
                                    <div className="w-8 h-8 rounded-full bg-blue-50 flex items-center justify-center shrink-0">
                                        <Award className="w-4 h-4 text-blue-600" />
                                    </div>
                                    <div>
                                        <p className="text-xs font-semibold uppercase tracking-wider text-slate-400">Experience</p>
                                        <p>{stats.experience}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-3 text-sm text-slate-600">
                                    <div className="w-8 h-8 rounded-full bg-amber-50 flex items-center justify-center shrink-0">
                                        <Briefcase className="w-4 h-4 text-amber-600" />
                                    </div>
                                    <div>
                                        <p className="text-xs font-semibold uppercase tracking-wider text-slate-400">Publications</p>
                                        <p>{stats.publications} International</p>
                                    </div>
                                </div>
                            </div>

                            <div className="pt-4">
                                <Button className="w-full bg-[#1E3A8A] hover:bg-[#152C6B] text-white">
                                    <Mail className="w-4 h-4 mr-2" /> Contact HOD
                                </Button>
                            </div>
                        </div>
                    </div>

                    {/* Right Column: Message Content */}
                    <div className="flex-1 p-8 md:p-10 bg-white">
                        <div className="max-w-3xl">
                            <Quote className="w-12 h-12 text-[#E5A818]/20 mb-6" />

                            <h2 className="text-2xl font-bold text-slate-900 mb-6">Welcome to {deptCode}</h2>

                            <div className="prose prose-slate prose-lg text-slate-600 space-y-6">
                                <p className="italic text-xl text-slate-700 font-medium border-l-4 border-[#E5A818] pl-4 bg-amber-50/50 py-2 rounded-r-lg">
                                    "{hodMessage.substring(0, 150)}..."
                                </p>

                                <p>
                                    {hodMessage}
                                </p>

                                <p>
                                    Our department focuses on holistic development, combining strong theoretical foundations with practical application. We encourage our students to think outside the box and innovate.
                                </p>

                                <div className="grid sm:grid-cols-2 gap-4 my-8">
                                    <Card className="bg-slate-50 border-none shadow-sm">
                                        <CardContent className="p-4 flex items-start gap-3">
                                            <TrendingUp className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
                                            <div>
                                                <h4 className="font-semibold text-slate-900 text-sm">Academic Excellence</h4>
                                                <p className="text-xs text-slate-500 mt-1">Consistently high pass percentage and university ranks.</p>
                                            </div>
                                        </CardContent>
                                    </Card>
                                    <Card className="bg-slate-50 border-none shadow-sm">
                                        <CardContent className="p-4 flex items-start gap-3">
                                            <Users className="w-5 h-5 text-blue-600 shrink-0 mt-0.5" />
                                            <div>
                                                <h4 className="font-semibold text-slate-900 text-sm">Student Support</h4>
                                                <p className="text-xs text-slate-500 mt-1">Dedicated mentoring and counseling for every student.</p>
                                            </div>
                                        </CardContent>
                                    </Card>
                                </div>

                                <div className="pt-8 mt-8 border-t border-slate-100 flex items-center justify-between">
                                    <div>
                                        <p className="font-signature text-3xl text-[#1E3A8A]">{hodName.split(' ')[0]}...</p>
                                        <p className="text-sm text-slate-500 mt-1">{hodDesignation}</p>
                                    </div>
                                    <img src="/logo.png" alt="NRIIT" className="h-12 opacity-20 grayscale" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </Card>
        </div>
    );
}
