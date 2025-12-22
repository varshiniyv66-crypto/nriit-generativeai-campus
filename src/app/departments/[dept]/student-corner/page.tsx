
"use client";

import { useParams } from "next/navigation";
import { Home, Book, Clock, GraduationCap, FileText, Download, ExternalLink, CalendarDays } from "lucide-react";
import { motion } from "framer-motion";
import { Badge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";

export default function StudentCornerPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();

    const resources = [
        {
            title: "Time Tables",
            description: "Semester-wise class schedules and lab slots.",
            icon: Clock,
            color: "blue",
            link: "#"
        },
        {
            title: "Syllabus",
            description: "Curriculum details for R20, R19, and R16 regulations.",
            icon: Book,
            color: "emerald",
            link: "#"
        },
        {
            title: "Exam Results",
            description: "Internal and external examination scores portal.",
            icon: GraduationCap,
            color: "purple",
            link: "#"
        },
        {
            title: "Previous Papers",
            description: "Archive of last 5 years' question papers.",
            icon: FileText,
            color: "amber",
            link: "#"
        },
        {
            title: "Academic Calendar",
            description: "Key dates for exams, holidays, and events.",
            icon: CalendarDays,
            color: "pink",
            link: "#"
        },
        {
            title: "Lab Manuals",
            description: "Digital copies of all laboratory records.",
            icon: Download,
            color: "cyan",
            link: "#"
        }
    ];

    return (
        <div className="min-h-screen bg-[#FDFCF8] text-slate-900 font-sans pb-20 selection:bg-sky-100">
            {/* 1. HERO SECTION: Stunning Light Theme */}
            <div className="relative pt-24 pb-16 px-6 overflow-hidden">
                {/* Background Globs */}
                <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-sky-50 rounded-full blur-[100px] opacity-70 pointer-events-none" />

                <div className="container mx-auto relative z-10">
                    <motion.div
                        initial={{ opacity: 0, x: -10 }}
                        animate={{ opacity: 1, x: 0 }}
                        className="inline-flex items-center gap-2 mb-6"
                    >
                        <Badge variant="outline" className="bg-white/80 backdrop-blur-md px-4 py-1.5 rounded-full border-slate-200 text-slate-500 font-bold tracking-widest uppercase">
                            Academic Hub
                        </Badge>
                        <span className="w-1 h-1 bg-slate-300 rounded-full" />
                        <span className="text-xs font-bold text-sky-600 uppercase tracking-widest">{deptCode} Resources</span>
                    </motion.div>

                    <h1 className="text-5xl md:text-7xl font-black text-slate-900 tracking-tighter mb-4">
                        Student <span className="text-sky-500">Corner</span>
                    </h1>
                    <p className="text-xl text-slate-500 max-w-xl font-medium">
                        Your central hub for academic resources, schedules, and downloads.
                    </p>
                </div>
            </div>

            {/* 2. BENTO GRID OF RESOURCES */}
            <div className="container mx-auto px-6 max-w-6xl">
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {resources.map((res, i) => (
                        <motion.a
                            href={res.link}
                            key={i}
                            initial={{ opacity: 0, y: 20 }}
                            animate={{ opacity: 1, y: 0 }}
                            transition={{ delay: i * 0.1 }}
                            whileHover={{ scale: 1.02 }}
                            whileTap={{ scale: 0.98 }}
                            className="group bg-white rounded-[2rem] p-8 border border-slate-100 shadow-[0_5px_15px_-5px_rgba(0,0,0,0.02)] hover:shadow-[0_20px_40px_-10px_rgba(14,165,233,0.15)] transition-all duration-300 flex flex-col justify-between h-[240px] relative overflow-hidden"
                        >
                            <div className={`absolute top-0 right-0 w-32 h-32 bg-${res.color}-50 rounded-bl-[100px] -mr-8 -mt-8 transition-transform group-hover:scale-125`} />

                            <div className="relative">
                                <div className={`w-14 h-14 rounded-2xl bg-${res.color}-50 text-${res.color}-600 flex items-center justify-center mb-6 group-hover:rotate-12 transition-transform`}>
                                    <res.icon className="w-7 h-7" />
                                </div>
                                <h3 className="text-2xl font-black text-slate-900 mb-2 group-hover:text-slate-700">{res.title}</h3>
                                <p className="text-sm text-slate-400 font-medium leading-relaxed">{res.description}</p>
                            </div>

                            <div className="relative flex justify-end">
                                <div className={`w-10 h-10 rounded-full bg-slate-50 flex items-center justify-center text-slate-300 group-hover:bg-${res.color}-500 group-hover:text-white transition-all`}>
                                    <ExternalLink className="w-4 h-4" />
                                </div>
                            </div>
                        </motion.a>
                    ))}
                </div>

                {/* Additional Notice Section */}
                <div className="mt-12 bg-slate-900 rounded-[2rem] p-10 text-center relative overflow-hidden">
                    <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/carbon-fibre.png')] opacity-10" />
                    <div className="relative z-10">
                        <h3 className="text-2xl font-bold text-white mb-2">Need Help?</h3>
                        <p className="text-slate-400 mb-6">Contact the department office for specific inquiries.</p>
                        <button className="px-6 py-3 bg-white text-slate-900 rounded-xl font-bold hover:bg-slate-100 transition-colors">
                            Contact Administration
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}
