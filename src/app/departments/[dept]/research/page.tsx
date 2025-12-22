
"use client";

import { useParams } from "next/navigation";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { departments as staticDepartments } from "@/data/departments";
import { Microscope, BookOpen, Home, AlertCircle, TrendingUp, Users, Lightbulb, FileText, ArrowRight, Sparkles, Globe } from "lucide-react";
import { motion } from "framer-motion";
import { researchData } from "@/data/research-data";

export default function ResearchPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const deptInfo = staticDepartments[deptCode.toLowerCase()];

    // Dynamic Data
    const deptKey = deptCode.toLowerCase();
    const currentData = researchData[deptKey] || researchData['cse'];
    const stats = currentData.stats;
    const researchAreas = currentData.focusAreas;
    const publications = currentData.publications;

    const containerVariants = {
        hidden: { opacity: 0 },
        visible: { opacity: 1, transition: { staggerChildren: 0.1 } }
    };

    const itemVariants = {
        hidden: { opacity: 0, y: 30 },
        visible: { opacity: 1, y: 0, transition: { type: "spring" as const, stiffness: 50 } }
    };

    return (
        <div className="min-h-screen bg-[#FAFAFA] text-slate-900 font-sans selection:bg-blue-100 pb-20 overflow-x-hidden">

            {/* 1. HERO SECTION: Clean, International, Tech-Forward */}
            <div className="relative pt-20 pb-16 px-6 overflow-hidden">
                {/* Subtle Tech Background Mesh */}
                <div className="absolute top-0 right-0 w-[800px] h-[800px] bg-gradient-to-bl from-blue-100/50 via-purple-100/30 to-transparent rounded-full blur-[100px] -translate-y-1/2 translate-x-1/2 opacity-60" />
                <div className="absolute top-20 left-10 w-4 h-4 bg-blue-500 rounded-full blur-[2px] opacity-20 animate-pulse" />
                <div className="absolute bottom-10 right-1/4 w-6 h-6 bg-purple-500 rounded-full blur-[4px] opacity-20 animate-bounce delay-700" />

                <div className="container mx-auto relative z-10">
                    <motion.div
                        initial={{ opacity: 0, x: -20 }}
                        animate={{ opacity: 1, x: 0 }}
                        className="flex items-center gap-2 mb-8"
                    >
                        <a href="/" className="px-4 py-2 bg-white rounded-full shadow-sm hover:shadow-md border border-slate-100 text-slate-500 hover:text-blue-600 transition-all text-xs font-bold uppercase tracking-widest flex items-center gap-2">
                            <Home className="w-3 h-3" /> Campus Root
                        </a>
                        <span className="w-1 h-1 bg-slate-300 rounded-full" />
                        <span className="text-xs font-bold text-slate-400 uppercase tracking-widest">{deptCode} Wing</span>
                    </motion.div>

                    <motion.div
                        initial={{ opacity: 0, y: 30 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ duration: 0.7, ease: "easeOut" }}
                        className="max-w-4xl"
                    >
                        <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-blue-600/5 border border-blue-600/10 text-blue-700 text-[10px] font-black uppercase tracking-[0.2em] mb-6">
                            <Globe className="w-3 h-3" />
                            Global Innovation Hub
                        </div>
                        <h1 className="text-5xl md:text-6xl font-black text-slate-900 tracking-tighter mb-6 leading-[0.9]">
                            Research <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-violet-600">&</span> <br />
                            Development
                        </h1>
                        <p className="text-xl md:text-2xl text-slate-500 max-w-2xl leading-relaxed font-medium">
                            Pioneering the future of <span className="text-slate-900 underline decoration-blue-300/50 decoration-4 underline-offset-4">{deptInfo?.name}</span> through cutting-edge inquiry and industrial collaboration.
                        </p>
                    </motion.div>
                </div>
            </div>

            {/* 2. STATS ORBIT: High-End Visuals */}
            <div className="container mx-auto px-6 mb-24 relative z-20">
                <motion.div
                    variants={containerVariants}
                    initial="hidden"
                    animate="visible"
                    className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6"
                >
                    {stats.map((stat, i) => (
                        <motion.div key={i} variants={itemVariants}>
                            <div className="group relative bg-white rounded-3xl p-8 hover:-translate-y-2 transition-transform duration-500 shadow-[0_10px_40px_-15px_rgba(0,0,0,0.05)] hover:shadow-[0_20px_50px_-10px_rgba(37,99,235,0.15)] border border-slate-100 overflow-hidden">
                                <div className={`absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-${stat.color}-50 to-transparent rounded-bl-full opacity-50 group-hover:scale-110 transition-transform duration-500`} />

                                <div className="relative z-10">
                                    <div className={`w-12 h-12 rounded-2xl bg-${stat.color}-50 flex items-center justify-center mb-6 group-hover:rotate-12 transition-transform duration-300`}>
                                        <stat.icon className={`w-6 h-6 text-${stat.color}-600`} />
                                    </div>
                                    <h3 className="text-4xl font-black text-slate-900 mb-2 tracking-tight">
                                        {stat.value}
                                    </h3>
                                    <p className="text-xs font-bold text-slate-400 uppercase tracking-widest">{stat.label}</p>
                                </div>
                            </div>
                        </motion.div>
                    ))}
                </motion.div>

                {/* 3. CONTENT GRID: Publications & Areas */}
                <div className="grid lg:grid-cols-12 gap-12">

                    {/* Focus Areas (Left Column) */}
                    <div className="lg:col-span-4 space-y-8">
                        <motion.div
                            initial={{ opacity: 0, x: -20 }}
                            whileInView={{ opacity: 1, x: 0 }}
                            viewport={{ once: true }}
                            className="bg-slate-900 rounded-[2.5rem] p-10 text-white relative overflow-hidden"
                        >
                            <div className="absolute top-0 right-0 w-64 h-64 bg-blue-600/20 rounded-full blur-[80px]" />
                            <div className="absolute bottom-0 left-0 w-48 h-48 bg-purple-600/20 rounded-full blur-[60px]" />

                            <div className="relative z-10">
                                <h3 className="text-2xl font-black mb-8 flex items-center gap-3">
                                    <Microscope className="w-6 h-6 text-blue-400" />
                                    Focus Domains
                                </h3>
                                <div className="space-y-4">
                                    {researchAreas.map((area, i) => (
                                        <div key={i} className="flex items-center gap-4 group cursor-default">
                                            <span className="flex-shrink-0 w-8 h-8 rounded-full bg-white/10 flex items-center justify-center text-xs font-bold text-blue-300 border border-white/5 group-hover:bg-blue-500 group-hover:text-white transition-colors">
                                                0{i + 1}
                                            </span>
                                            <p className="text-sm font-bold text-slate-300 group-hover:text-white transition-colors">
                                                {area}
                                            </p>
                                        </div>
                                    ))}
                                </div>
                                <div className="mt-10 pt-10 border-t border-white/10">
                                    <p className="text-xs text-slate-400 leading-relaxed mb-4">
                                        Interested in collaborative research?
                                    </p>
                                    <button className="w-full py-4 bg-white text-slate-900 rounded-xl font-bold hover:bg-blue-50 transition-colors flex items-center justify-center gap-2 group">
                                        Connect with Dean
                                        <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                                    </button>
                                </div>
                            </div>
                        </motion.div>
                    </div>

                    {/* Publications Feed (Right Column) */}
                    <div className="lg:col-span-8">
                        <div className="flex items-end justify-between mb-10 border-b border-slate-200 pb-4">
                            <h2 className="text-3xl font-black text-slate-900 tracking-tight">
                                Recent Publications
                            </h2>
                            <div className="flex items-center gap-2 text-sm font-bold text-slate-400 uppercase tracking-wider">
                                <BookOpen className="w-4 h-4" />
                                Index 2024-25
                            </div>
                        </div>

                        <div className="space-y-6">
                            {publications.length > 0 ? (
                                publications.map((pub, idx) => (
                                    <motion.div
                                        key={idx}
                                        initial={{ opacity: 0, y: 20 }}
                                        whileInView={{ opacity: 1, y: 0 }}
                                        viewport={{ once: true }}
                                        transition={{ delay: idx * 0.1 }}
                                        className="group bg-white rounded-2xl p-8 border border-slate-100 shadow-sm hover:shadow-xl hover:border-blue-100 transition-all duration-300 cursor-pointer"
                                    >
                                        <div className="flex flex-col md:flex-row gap-6 md:items-start justify-between">
                                            <div className="flex-1 space-y-3">
                                                <div className="flex items-center gap-3">
                                                    <span className="px-3 py-1 rounded-full bg-blue-50 text-blue-700 text-[10px] font-black uppercase tracking-widest border border-blue-100">
                                                        {pub.year}
                                                    </span>
                                                    <span className="text-xs font-bold text-slate-400 uppercase tracking-wide flex items-center gap-1">
                                                        <Sparkles className="w-3 h-3 text-yellow-500" />
                                                        {pub.journal}
                                                    </span>
                                                </div>
                                                <h3 className="text-xl font-bold text-slate-900 leading-tight group-hover:text-blue-600 transition-colors">
                                                    {pub.title}
                                                </h3>
                                                <div className="flex items-center gap-2">
                                                    <div className="w-5 h-0.5 bg-slate-200 rounded-full" />
                                                    <p className="text-sm font-semibold text-slate-500">
                                                        {pub.author}
                                                    </p>
                                                </div>
                                            </div>

                                            <div className="md:self-center shrink-0">
                                                <div className="w-12 h-12 rounded-full border-2 border-slate-100 flex items-center justify-center text-slate-300 group-hover:border-blue-500 group-hover:bg-blue-500 group-hover:text-white transition-all duration-300">
                                                    <ArrowRight className="w-5 h-5 -rotate-45 group-hover:rotate-0 transition-transform" />
                                                </div>
                                            </div>
                                        </div>
                                    </motion.div>
                                ))
                            ) : (
                                <div className="bg-slate-50 rounded-3xl p-16 text-center border-2 border-dashed border-slate-200">
                                    <div className="w-16 h-16 bg-white rounded-full flex items-center justify-center mx-auto mb-4 shadow-sm">
                                        <AlertCircle className="w-8 h-8 text-slate-300" />
                                    </div>
                                    <h3 className="text-lg font-bold text-slate-900 mb-1">No Records Found</h3>
                                    <p className="text-slate-400">Publications are being indexed for this academic year.</p>
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
