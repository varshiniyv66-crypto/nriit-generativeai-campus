"use client";

import { BookOpen, Monitor, Cpu, Radio, Lightbulb, Building, Briefcase, GraduationCap, Cog, Zap, Sparkles, CheckCircle2 } from "lucide-react";
import { motion } from "framer-motion";
import Link from "next/link";

const programmes = [
    {
        category: "Undergraduate (B.Tech)",
        duration: "4 Years",
        items: [
            { name: "Computer Science & Engineering", icon: Monitor, alias: "CSE" },
            { name: "IT (Information Technology)", icon: Cpu, alias: "IT" },
            { name: "Electronics & Communication", icon: Radio, alias: "ECE" },
            { name: "Mechanical Engineering", icon: Cog, alias: "ME" },
            { name: "Civil Engineering", icon: Building, alias: "CE" },
            { name: "CSE (Artificial Intelligence & ML)", icon: Lightbulb, alias: "AI-ML" },
            { name: "CSE (Data Science)", icon: Monitor, alias: "DS" },
            { name: "Electric Vehicles Technology", icon: Zap, alias: "EVT" },
        ]
    },
    {
        category: "Postgraduate (M.Tech)",
        duration: "2 Years",
        items: [
            { name: "Structural Engineering", icon: Building, alias: "M.Tech CE" },
            { name: "VLSI & Embedded Systems", icon: Cpu, alias: "M.Tech ECE" },
            { name: "Computer Science & Engineering", icon: Monitor, alias: "M.Tech CSE" },
        ]
    },
    {
        category: "Management & Applications",
        duration: "2 Years",
        items: [
            { name: "Master of Business Administration", icon: Briefcase, alias: "MBA" },
            { name: "Master of Computer Applications", icon: GraduationCap, alias: "MCA" },
        ]
    }
];

export default function ProgrammesPage() {
    return (
        <div className="min-h-screen bg-[#F8FAFC] pt-32 pb-20">
            <div className="container mx-auto px-4">
                {/* Header */}
                <div className="text-center max-w-3xl mx-auto mb-20">
                    <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-blue-50 text-blue-600 text-[10px] font-bold uppercase tracking-widest mb-4">
                        <BookOpen className="w-3 h-3" /> Academic Portfolio
                    </div>
                    <h1 className="text-5xl md:text-6xl font-black text-slate-900 mb-6 tracking-tight">
                        Academic <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600">Programmes</span>
                    </h1>
                    <p className="text-slate-600 text-lg">
                        Explore our wide range of industry-aligned undergraduate and postgraduate courses designed for excellence.
                    </p>
                </div>

                {/* Categories */}
                <div className="space-y-20">
                    {programmes.map((category, idx) => (
                        <div key={idx}>
                            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-10 pb-4 border-b border-slate-200">
                                <h2 className="text-3xl font-bold text-slate-900 flex items-center gap-3">
                                    <Sparkles className="w-6 h-6 text-[#D4AF37]" /> {category.category}
                                </h2>
                                <span className="px-4 py-1 rounded-full bg-slate-900 text-white text-[10px] font-black uppercase tracking-widest self-start">
                                    Duration: {category.duration}
                                </span>
                            </div>

                            <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
                                {category.items.map((item, i) => (
                                    <motion.div
                                        key={i}
                                        whileHover={{ y: -5 }}
                                        className="group bg-white p-6 rounded-3xl border border-slate-200 shadow-xl shadow-slate-200/50 hover:border-blue-500 transition-all cursor-pointer"
                                    >
                                        <div className="w-12 h-12 rounded-xl bg-slate-50 flex items-center justify-center mb-6 group-hover:bg-blue-600 group-hover:text-white transition-all text-slate-600">
                                            <item.icon className="w-6 h-6" />
                                        </div>
                                        <h3 className="font-bold text-slate-900 mb-2 leading-tight group-hover:text-blue-600 transition-colors">{item.name}</h3>
                                        <div className="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-6">{item.alias}</div>

                                        <ul className="space-y-2 mb-8">
                                            <li className="flex items-center gap-2 text-[10px] text-slate-500 font-bold uppercase tracking-tight">
                                                <CheckCircle2 className="w-3 h-3 text-emerald-500" /> AICTE Approved
                                            </li>
                                            <li className="flex items-center gap-2 text-[10px] text-slate-500 font-bold uppercase tracking-tight">
                                                <CheckCircle2 className="w-3 h-3 text-emerald-500" /> JNTUK Affiliated
                                            </li>
                                        </ul>

                                        <Link
                                            href={`/departments/${item.alias.toLowerCase().replace('.', '')}`}
                                            className="w-full py-3 rounded-xl border border-slate-100 bg-slate-50 text-[10px] font-black uppercase tracking-widest text-slate-600 text-center block hover:bg-slate-900 hover:text-white transition-all"
                                        >
                                            View Curriculum
                                        </Link>
                                    </motion.div>
                                ))}
                            </div>
                        </div>
                    ))}
                </div>

                {/* Footer Advice */}
                <div className="mt-32 p-12 rounded-[3.5rem] bg-gradient-to-br from-blue-600/5 to-indigo-600/5 border border-blue-100 flex flex-col md:flex-row items-center justify-between gap-8">
                    <div className="max-w-xl text-center md:text-left">
                        <h3 className="text-2xl font-bold text-slate-900 mb-2">Unsure about which path to choose?</h3>
                        <p className="text-slate-500 text-sm">Our academic counselors are here to help you match your passion with the right programme.</p>
                    </div>
                    <Link
                        href="/enquire"
                        className="px-10 py-4 rounded-2xl bg-slate-900 text-white font-bold shadow-2xl hover:bg-blue-600 transition-all shrink-0"
                    >
                        Talk to an Expert
                    </Link>
                </div>
            </div>
        </div>
    );
}
