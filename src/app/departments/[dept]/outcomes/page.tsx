
"use client";

import { useParams } from "next/navigation";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { DEPARTMENT_ACADEMIC_DATA, PROGRAM_OUTCOMES } from "@/data/academic-outcomes";
import { Award, Target, CheckCircle2, Home, Globe, Zap, BookOpen, Sparkles, ArrowRight, GraduationCap } from "lucide-react";
import { motion } from "framer-motion";

export default function OutcomesPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const academicData = DEPARTMENT_ACADEMIC_DATA[deptCode];

    if (!academicData) {
        return (
            <div className="min-h-screen flex flex-col items-center justify-center bg-[#FAFAFA]">
                <div className="w-16 h-16 border-4 border-blue-600 border-t-transparent rounded-full animate-spin mb-4" />
                <p className="text-slate-400 font-bold tracking-widest text-xs uppercase">Initializing Profile...</p>
            </div>
        );
    }

    const containerVariants = {
        hidden: { opacity: 0 },
        visible: { opacity: 1, transition: { staggerChildren: 0.1 } }
    };

    const itemVariants = {
        hidden: { opacity: 0, y: 30 },
        visible: { opacity: 1, y: 0, transition: { type: "spring" as const, stiffness: 50 } }
    };

    return (
        <div className="min-h-screen bg-[#FAFAFA] text-slate-900 font-sans selection:bg-purple-100 pb-20 overflow-x-hidden">

            {/* 1. HERO SECTION: Clean, International, Tech-Forward */}
            <div className="relative pt-20 pb-16 px-6 overflow-hidden">
                {/* Subtle Tech Background Mesh */}
                <div className="absolute top-0 left-0 w-[800px] h-[800px] bg-gradient-to-tr from-purple-100/40 via-blue-100/30 to-transparent rounded-full blur-[100px] -translate-y-1/2 -translate-x-1/2 opacity-60" />

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
                        <span className="text-xs font-bold text-slate-400 uppercase tracking-widest">Academics</span>
                    </motion.div>

                    <motion.div
                        initial={{ opacity: 0, y: 30 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ duration: 0.7, ease: "easeOut" }}
                        className="max-w-4xl"
                    >
                        <div className="relative mb-8 rounded-[2.5rem] bg-gradient-to-r from-white via-indigo-50/50 to-blue-50/30 p-10 md:p-14 overflow-hidden border border-white/60 shadow-xl backdrop-blur-sm">
                            <div className="absolute top-0 right-0 w-96 h-96 bg-purple-200/20 rounded-full blur-[100px] pointer-events-none -translate-y-1/2 translate-x-1/2" />
                            <div className="absolute bottom-0 left-0 w-64 h-64 bg-blue-200/20 rounded-full blur-[80px] pointer-events-none translate-y-1/2 -translate-x-1/2" />

                            <div className="relative z-10">
                                <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-indigo-100/50 border border-indigo-200/50 text-indigo-700 text-[10px] font-black uppercase tracking-[0.2em] mb-6">
                                    <GraduationCap className="w-3 h-3" />
                                    Curriculum Standards
                                </div>
                                <h1 className="text-5xl md:text-7xl font-black text-slate-900 tracking-tighter mb-6 leading-[0.9]">
                                    Academic <span className="text-transparent bg-clip-text bg-gradient-to-r from-indigo-600 to-purple-600">Outcomes</span>
                                </h1>
                                <p className="text-xl md:text-2xl text-slate-600 max-w-2xl leading-relaxed font-medium">
                                    Defining student success through rigorous <span className="text-slate-900 font-bold decoration-indigo-200 underline decoration-4 underline-offset-4">Program Educational Objectives (PEOs)</span> and <span className="text-slate-900 font-bold decoration-purple-200 underline decoration-4 underline-offset-4">Outcomes (POs)</span> aligned with global engineering standards.
                                </p>
                            </div>
                        </div>
                    </motion.div>
                </div>
            </div>

            <div className="container mx-auto px-6 max-w-7xl relative z-20">
                <motion.div
                    variants={containerVariants}
                    initial="hidden"
                    animate="visible"
                    className="space-y-16"
                >
                    {/* 2. PEOs Section (Program Educational Objectives) */}
                    <div className="relative">
                        <div className="flex items-end justify-between mb-8 border-b border-slate-200 pb-4">
                            <h2 className="text-3xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                                <span className="bg-blue-600 text-white w-10 h-10 rounded-xl flex items-center justify-center shadow-lg shadow-blue-200">
                                    <Target className="w-5 h-5" />
                                </span>
                                Program Educational Objectives
                            </h2>
                            <Badge className="bg-blue-50 text-blue-700 hover:bg-blue-100 border-none px-3 py-1 uppercase tracking-wider text-[10px] font-black">
                                Career Success
                            </Badge>
                        </div>

                        <div className="grid md:grid-cols-2 gap-6">
                            {academicData.peos.map((peo, idx) => (
                                <motion.div
                                    key={peo.id}
                                    variants={itemVariants}
                                    whileHover={{ y: -5 }}
                                    className="group bg-white p-8 rounded-3xl border border-slate-100 shadow-sm hover:shadow-xl hover:border-blue-100 transition-all duration-300 relative overflow-hidden"
                                >
                                    <div className="absolute top-0 right-0 w-32 h-32 bg-gradient-to-bl from-blue-50 to-transparent rounded-bl-full opacity-50 group-hover:scale-110 transition-transform" />

                                    <div className="relative z-10 flex gap-6">
                                        <div className="flex-shrink-0">
                                            <div className="w-14 h-14 rounded-2xl bg-slate-50 text-slate-400 group-hover:bg-blue-600 group-hover:text-white transition-all duration-300 flex items-center justify-center font-black text-lg">
                                                {peo.id}
                                            </div>
                                        </div>
                                        <div>
                                            <p className="text-lg text-slate-700 font-medium leading-relaxed group-hover:text-slate-900 transition-colors">
                                                {peo.statement}
                                            </p>
                                        </div>
                                    </div>
                                </motion.div>
                            ))}
                        </div>
                    </div>

                    {/* 3. PSOs Section (Program Specific Outcomes) */}
                    <div className="relative">
                        <div className="flex items-end justify-between mb-8 border-b border-slate-200 pb-4">
                            <h2 className="text-3xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                                <span className="bg-purple-600 text-white w-10 h-10 rounded-xl flex items-center justify-center shadow-lg shadow-purple-200">
                                    <Zap className="w-5 h-5" />
                                </span>
                                Program Specific Outcomes
                            </h2>
                            <Badge className="bg-purple-50 text-purple-700 hover:bg-purple-100 border-none px-3 py-1 uppercase tracking-wider text-[10px] font-black">
                                Technical Competency
                            </Badge>
                        </div>

                        <div className="grid md:grid-cols-2 gap-6">
                            {academicData.psos.map((pso, idx) => (
                                <motion.div
                                    key={pso.id}
                                    variants={itemVariants}
                                    className="group bg-white p-8 rounded-3xl border border-slate-100 shadow-sm hover:shadow-xl hover:border-purple-100 transition-all duration-300 relative overflow-hidden"
                                >
                                    <div className="absolute top-0 right-0 w-32 h-32 bg-gradient-to-bl from-purple-50 to-transparent rounded-bl-full opacity-50 group-hover:scale-110 transition-transform" />

                                    <div className="flex flex-col gap-4 relative z-10">
                                        <div className="w-min px-4 py-1.5 rounded-full bg-purple-50 text-purple-700 text-xs font-black uppercase tracking-wider border border-purple-100">
                                            {pso.id}
                                        </div>
                                        <p className="text-lg text-slate-700 font-medium leading-relaxed">
                                            {pso.statement}
                                        </p>
                                    </div>
                                </motion.div>
                            ))}
                        </div>
                    </div>

                    {/* 4. POs Section (Program Outcomes - Grid) */}
                    <div>
                        <div className="flex items-end justify-between mb-8 border-b border-slate-200 pb-4">
                            <h2 className="text-3xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                                <span className="bg-emerald-600 text-white w-10 h-10 rounded-xl flex items-center justify-center shadow-lg shadow-emerald-200">
                                    <Globe className="w-5 h-5" />
                                </span>
                                Program Outcomes
                            </h2>
                            <Badge className="bg-emerald-50 text-emerald-700 hover:bg-emerald-100 border-none px-3 py-1 uppercase tracking-wider text-[10px] font-black">
                                Washington Accord
                            </Badge>
                        </div>

                        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                            {PROGRAM_OUTCOMES.map((po, idx) => (
                                <motion.div
                                    key={po.id}
                                    variants={itemVariants}
                                    className="group bg-white p-6 rounded-2xl border border-slate-100 hover:border-emerald-200 hover:shadow-lg transition-all duration-300"
                                >
                                    <div className="flex justify-between items-start mb-3">
                                        <span className="text-xs font-black text-emerald-600 uppercase tracking-widest bg-emerald-50 px-2 py-1 rounded">PO{idx + 1}</span>
                                        <CheckCircle2 className="w-4 h-4 text-slate-300 group-hover:text-emerald-500 transition-colors" />
                                    </div>
                                    <h3 className="font-bold text-slate-900 text-sm mb-2">{po.name}</h3>
                                    <p className="text-xs text-slate-500 leading-relaxed font-medium group-hover:text-slate-700 transition-colors">
                                        {po.description}
                                    </p>
                                </motion.div>
                            ))}
                        </div>
                    </div>

                    {/* Footer / Mapping Info */}
                    <motion.div variants={itemVariants} className="pb-10">
                        <div className="p-8 bg-slate-900 rounded-[2rem] text-slate-300 flex flex-col md:flex-row items-center gap-8 border border-slate-800 text-center md:text-left relative overflow-hidden">
                            <div className="absolute top-0 right-0 w-64 h-64 bg-white/5 rounded-full blur-[80px]" />

                            <div className="relative z-10 p-4 bg-slate-800 rounded-2xl shrink-0">
                                <BookOpen className="w-8 h-8 text-blue-400" />
                            </div>
                            <div className="relative z-10">
                                <h4 className="text-xl font-black text-white mb-2">Curriculum Mapping & Compliance</h4>
                                <p className="text-sm opacity-70 leading-relaxed max-w-3xl mx-auto md:mx-0">
                                    The Program Specific Outcomes (PSOs) are comprehensively mapped to Program Outcomes (POs) to ensure
                                    alignment with global engineering standards. This matrix is reviewed annually by the
                                    Department Advisory Board (DAB) to maintain academic rigor.
                                </p>
                            </div>
                        </div>
                    </motion.div>

                </motion.div>
            </div>
        </div>
    );
}
