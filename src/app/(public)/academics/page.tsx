"use client";

import React from "react";
import { BookOpen, GraduationCap, Calendar, Download, Clock, FileText, Phone, ChevronRight, ArrowLeft } from "lucide-react";
import Link from "next/link";

const programs = [
    {
        category: "UG (B.Tech)",
        courses: ["Computer Science", "Electronics & Comm", "Mechanical", "Civil", "EEE", "IT", "AI & DS"],
        count: 7
    },
    {
        category: "PG (M.Tech)",
        courses: ["Computer Science", "VLSI Design", "Structural Engg", "Power Systems"],
        count: 4
    },
    {
        category: "Management",
        courses: ["MBA (General)", "MBA (Fintech)"],
        count: 2
    },
    {
        category: "Doctoral",
        courses: ["Ph.D in Engineering & Sciences"],
        count: 1
    }
];

const resources = [
    { name: "R22 Regulations Syllabus", icon: FileText },
    { name: "Academic Regulations (R20)", icon: FileText },
    { name: "Exam Timetable (May 2025)", icon: Calendar },
    { name: "Bus Route Map", icon: FileText },
    { name: "Anti-Ragging Policy", icon: FileText },
];

const academicCalendar = [
    { event: "Commencement of Class Work", date: "15 July 2024", applicable: "B.Tech III & IV Year" },
    { event: "First Mid Examinations", date: "12-18 Sept 2024", applicable: "All Years" },
    { event: "Dussehra Vacation", date: "14-19 Oct 2024", applicable: "All Students" },
    { event: "End Semester Examinations", date: "20 Nov - 05 Dec 2024", applicable: "All Years" },
    { event: "Practical Exams", date: "06 Dec - 12 Dec 2024", applicable: "All Years" },
];

export default function AcademicsPage() {
    return (
        <>
            <section className="pt-32 pb-20">
                <div className="container mx-auto px-4">
                    {/* Back Button */}
                    <Link href="/" className="inline-flex items-center gap-2 text-slate-500 hover:text-[#4CAF50] transition-colors mb-8 font-medium">
                        <ArrowLeft className="w-4 h-4" />
                        Back to Home
                    </Link>

                    {/* Header */}
                    <div className="mb-16">
                        <span className="text-[#4CAF50] font-bold text-xs uppercase tracking-[0.2em] block mb-2">Excellence in Education</span>
                        <div className="flex flex-col lg:flex-row justify-between items-start gap-8">
                            <h1 className="text-4xl md:text-6xl font-black text-[#0F172A]">Academic Affairs</h1>
                            <p className="text-slate-500 max-w-md text-sm leading-relaxed">
                                Our curriculum is designed to foster critical thinking and practical skills for the modern world.
                            </p>
                        </div>
                    </div>

                    <div className="grid lg:grid-cols-3 gap-8">
                        {/* Programs Offered */}
                        <div className="lg:col-span-2 space-y-6">
                            <div className="flex items-center gap-3 mb-6">
                                <BookOpen className="w-5 h-5 text-[#0F172A]" />
                                <h3 className="text-xl font-bold text-[#0F172A]">Programs Offered</h3>
                            </div>

                            <div className="grid md:grid-cols-2 gap-4">
                                {programs.map((program, idx) => (
                                    <div
                                        key={idx}
                                        className="bg-white p-6 rounded-2xl border-2 border-[#4CAF50]/20 hover:border-[#4CAF50] transition-all group cursor-pointer hover:shadow-lg"
                                    >
                                        <div className="flex justify-between items-start mb-4">
                                            <h4 className="text-lg font-bold text-[#0F172A] group-hover:text-[#4CAF50] transition-colors">
                                                {program.category}
                                            </h4>
                                            <span className="text-xs font-bold text-[#4CAF50] bg-[#4CAF50]/10 px-3 py-1 rounded-full">
                                                {program.count} Courses
                                            </span>
                                        </div>
                                        <ul className="space-y-2">
                                            {program.courses.map((course, i) => (
                                                <li key={i} className="text-sm text-slate-600 flex items-center gap-2">
                                                    <span className="w-1 h-1 bg-[#4CAF50] rounded-full" />
                                                    {course}
                                                </li>
                                            ))}
                                        </ul>
                                    </div>
                                ))}
                            </div>

                            {/* Academic Calendar */}
                            <div className="mt-12">
                                <div className="flex items-center justify-between mb-6">
                                    <div className="flex items-center gap-3">
                                        <Clock className="w-5 h-5 text-[#0F172A]" />
                                        <h3 className="text-xl font-bold text-[#0F172A]">Academic Calendar</h3>
                                    </div>
                                    <span className="text-xs font-bold text-white bg-[#4CAF50] px-4 py-1.5 rounded-full">2024-25</span>
                                </div>

                                <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden">
                                    <div className="grid grid-cols-3 bg-slate-50 px-6 py-3 border-b border-slate-200">
                                        <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Event Description</span>
                                        <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Scheduled Dates</span>
                                        <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Applicability</span>
                                    </div>
                                    {academicCalendar.map((item, idx) => (
                                        <div
                                            key={idx}
                                            className={`grid grid-cols-3 px-6 py-4 hover:bg-slate-50 transition-colors ${idx !== academicCalendar.length - 1 ? 'border-b border-slate-100' : ''}`}
                                        >
                                            <span className={`text-sm font-semibold ${item.event.includes('Vacation') || item.event.includes('Examinations') ? 'text-[#F5A201]' : 'text-[#0F172A]'}`}>
                                                {item.event}
                                            </span>
                                            <span className="text-sm text-[#4CAF50] font-medium">{item.date}</span>
                                            <span className="text-sm text-slate-500">{item.applicable}</span>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        </div>

                        {/* Right Sidebar */}
                        <div className="space-y-6">
                            {/* Resource Center */}
                            <div className="bg-[#0F172A] p-6 rounded-2xl text-white">
                                <h4 className="text-lg font-bold mb-4 text-[#F5A201]">Resource Center</h4>
                                <div className="space-y-3">
                                    {resources.map((resource, idx) => (
                                        <Link
                                            key={idx}
                                            href="#"
                                            className="flex items-center justify-between p-3 bg-white/5 rounded-xl hover:bg-white/10 transition-colors group"
                                        >
                                            <div className="flex items-center gap-3">
                                                <resource.icon className="w-4 h-4 text-slate-400" />
                                                <span className="text-sm font-medium">{resource.name}</span>
                                            </div>
                                            <Download className="w-4 h-4 text-slate-400 group-hover:text-[#F5A201] transition-colors" />
                                        </Link>
                                    ))}
                                </div>
                            </div>

                            {/* Exam Branch */}
                            <div className="bg-white p-6 rounded-2xl border border-slate-200">
                                <h4 className="text-lg font-bold text-[#0F172A] mb-2">Exam Branch</h4>
                                <p className="text-sm text-slate-500 mb-6">
                                    For queries regarding transcripts, hall tickets, and re-evaluation.
                                </p>
                                <div className="flex items-center gap-3 text-sm text-slate-600 mb-4">
                                    <Clock className="w-4 h-4 text-[#4CAF50]" />
                                    <div>
                                        <span className="font-bold">Working Hours</span>
                                        <span className="text-slate-400 block">10:00 AM - 4:00 PM</span>
                                    </div>
                                </div>
                                <Link
                                    href="/contact"
                                    className="w-full flex items-center justify-center gap-2 bg-slate-100 hover:bg-slate-200 text-[#0F172A] font-bold py-3 rounded-xl transition-colors"
                                >
                                    Contact Controller of Exams
                                    <ChevronRight className="w-4 h-4" />
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </>
    );
}
