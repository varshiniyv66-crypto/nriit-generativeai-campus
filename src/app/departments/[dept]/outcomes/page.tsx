
"use client";

import { useParams } from "next/navigation";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { DEPARTMENT_ACADEMIC_DATA, PROGRAM_OUTCOMES } from "@/data/academic-outcomes";
import { Award, Target, CheckCircle2, Home, Globe, Zap, BookOpen, Sparkles, ArrowRight, GraduationCap, ClipboardCheck, BarChart3, ArrowUpRight } from "lucide-react";
import { motion } from "framer-motion";
import {
    BarChart,
    Bar,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    Legend,
    ResponsiveContainer,
    Cell
} from "recharts";
import { cn } from "@/lib/utils";

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

                    {/* 5. PO-PSO MAPPING MATRIX - New Section */}
                    {academicData.poPsoMapping && (
                        <motion.div variants={itemVariants}>
                            <div className="flex items-end justify-between mb-8 border-b border-slate-200 pb-4">
                                <h2 className="text-3xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                                    <span className="bg-orange-600 text-white w-10 h-10 rounded-xl flex items-center justify-center shadow-lg shadow-orange-200">
                                        <ClipboardCheck className="w-5 h-5" />
                                    </span>
                                    Curriculum Correlation Matrix
                                </h2>
                                <Badge className="bg-orange-50 text-orange-700 hover:bg-orange-100 border-none px-3 py-1 uppercase tracking-wider text-[10px] font-black">
                                    PO-PSO Mapping
                                </Badge>
                            </div>

                            <div className="overflow-x-auto bg-white rounded-3xl border border-slate-100 p-8 shadow-sm">
                                <table className="w-full text-center border-collapse" suppressHydrationWarning>
                                    <thead>
                                        <tr>
                                            <th className="p-4 text-xs font-black text-slate-400 uppercase tracking-widest text-left border-b border-slate-50">Outcomes</th>
                                            {PROGRAM_OUTCOMES.map(po => (
                                                <th key={po.id} className="p-4 text-xs font-black text-slate-900 uppercase border-b border-slate-50 min-w-[50px]">
                                                    {po.id}
                                                </th>
                                            ))}
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {Object.entries(academicData.poPsoMapping).map(([psoId, mappings]) => (
                                            <tr key={psoId} className="group hover:bg-slate-50 transition-colors">
                                                <td className="p-4 text-sm font-bold text-slate-900 text-left border-b border-slate-50 whitespace-nowrap">
                                                    {psoId}
                                                </td>
                                                {mappings.map((val, idx) => (
                                                    <td key={idx} className="p-4 border-b border-slate-50">
                                                        <div className={cn(
                                                            "w-8 h-8 rounded-lg flex items-center justify-center mx-auto text-xs font-black transition-all group-hover:scale-110",
                                                            val === 3 ? "bg-indigo-600 text-white shadow-lg shadow-indigo-200" :
                                                                val === 2 ? "bg-indigo-100 text-indigo-700" :
                                                                    val === 1 ? "bg-slate-100 text-slate-500 font-medium" :
                                                                        "text-slate-200 font-normal"
                                                        )}>
                                                            {val || '-'}
                                                        </div>
                                                    </td>
                                                ))}
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                                <div className="mt-8 flex flex-wrap gap-6 text-[10px] font-bold text-slate-400 uppercase tracking-widest border-t border-slate-50 pt-8 justify-center">
                                    <div className="flex items-center gap-2"><span className="w-3 h-3 rounded bg-indigo-600"></span> 3 - Substantial</div>
                                    <div className="flex items-center gap-2"><span className="w-3 h-3 rounded bg-indigo-100"></span> 2 - Moderate</div>
                                    <div className="flex items-center gap-2"><span className="w-3 h-3 rounded bg-slate-100"></span> 1 - Slight</div>
                                    <div className="flex items-center gap-2"><span className="w-3 h-3 rounded bg-transparent border border-slate-200"></span> - No Correlation</div>
                                </div>
                            </div>
                        </motion.div>
                    )}

                    {/* 6. ATTAINMENT LEVELS - New Section */}
                    {academicData.attainments && (
                        <motion.div variants={itemVariants}>
                            <div className="flex items-end justify-between mb-8 border-b border-slate-200 pb-4">
                                <h2 className="text-3xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                                    <span className="bg-blue-600 text-white w-10 h-10 rounded-xl flex items-center justify-center shadow-lg shadow-blue-200">
                                        <BarChart3 className="w-5 h-5" />
                                    </span>
                                    Target vs. Actual Attainment
                                </h2>
                                <Badge className="bg-blue-50 text-blue-700 hover:bg-blue-100 border-none px-3 py-1 uppercase tracking-wider text-[10px] font-black">
                                    Performance Metrics
                                </Badge>
                            </div>

                            <div className="bg-white p-4 sm:p-6 rounded-3xl border border-slate-100 shadow-sm relative overflow-hidden">
                                <div className="h-[300px] sm:h-[400px] w-full">
                                    <ResponsiveContainer width="100%" height="100%">
                                        <BarChart
                                            data={academicData.attainments.map((att, idx) => ({
                                                name: idx < 12 ? `PO${idx + 1}` : `PSO${idx - 11}`,
                                                Target: att.target,
                                                Actual: att.actual,
                                                level: att.actual >= att.target ? 'Met' : 'Gap'
                                            }))}
                                            margin={{ top: 20, right: 30, left: 20, bottom: 5 }}
                                        >
                                            <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#e2e8f0" />
                                            <XAxis dataKey="name" tick={{ fontSize: 10, fontWeight: 700 }} axisLine={false} tickLine={false} />
                                            <YAxis axisLine={false} tickLine={false} domain={[0, 3]} tick={{ fontSize: 10, fontWeight: 700 }} />
                                            <Tooltip
                                                cursor={{ fill: '#f8fafc' }}
                                                content={({ active, payload, label }) => {
                                                    if (active && payload && payload.length) {
                                                        return (
                                                            <div className="bg-slate-900 text-white p-3 rounded-xl shadow-xl border border-slate-700">
                                                                <p className="text-xs font-bold mb-2 text-slate-400 uppercase tracking-wider">{label}</p>
                                                                <div className="space-y-1">
                                                                    <div className="flex items-center gap-2 text-sm font-semibold">
                                                                        <div className="w-2 h-2 rounded-full bg-blue-500" />
                                                                        <span>Actual: {Number(payload[0].value).toFixed(2)}</span>
                                                                    </div>
                                                                    <div className="flex items-center gap-2 text-xs text-slate-400">
                                                                        <div className="w-2 h-2 rounded-full bg-slate-600" />
                                                                        <span>Target: {Number(payload[1].value).toFixed(2)}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        );
                                                    }
                                                    return null;
                                                }}
                                            />
                                            <Legend iconType="circle" wrapperStyle={{ fontSize: '12px', fontWeight: 600, paddingTop: '20px' }} />
                                            <Bar dataKey="Actual" radius={[6, 6, 0, 0]} barSize={20}>
                                                {academicData.attainments.map((entry, index) => (
                                                    <Cell key={`cell-${index}`} fill={entry.actual >= entry.target ? '#10b981' : '#3b82f6'} />
                                                ))}
                                            </Bar>
                                            <Bar dataKey="Target" fill="#e2e8f0" radius={[6, 6, 0, 0]} barSize={20} />
                                        </BarChart>
                                    </ResponsiveContainer>
                                </div>

                                {/* Summary Stats */}
                                <div className="mt-8 grid grid-cols-1 md:grid-cols-3 gap-4 border-t border-slate-100 pt-6">
                                    <div className="p-4 rounded-2xl bg-slate-50 border border-slate-100 flex items-center gap-4">
                                        <div className="p-3 bg-white rounded-xl shadow-sm text-blue-600">
                                            <Target className="w-5 h-5" />
                                        </div>
                                        <div>
                                            <p className="text-[10px] font-black text-slate-400 uppercase tracking-wider">Avg. Attainment</p>
                                            <p className="text-2xl font-black text-slate-900">
                                                {(academicData.attainments.reduce((acc, curr) => acc + curr.actual, 0) / academicData.attainments.length).toFixed(2)}
                                            </p>
                                        </div>
                                    </div>
                                    <div className="p-4 rounded-2xl bg-slate-50 border border-slate-100 flex items-center gap-4">
                                        <div className="p-3 bg-white rounded-xl shadow-sm text-emerald-600">
                                            <BarChart3 className="w-5 h-5" />
                                        </div>
                                        <div>
                                            <p className="text-[10px] font-black text-slate-400 uppercase tracking-wider">Attainment Level</p>
                                            <p className="text-2xl font-black text-slate-900">
                                                Level {(academicData.attainments.reduce((acc, curr) => acc + curr.actual, 0) / academicData.attainments.length) > 2.5 ? '3' : (academicData.attainments.reduce((acc, curr) => acc + curr.actual, 0) / academicData.attainments.length) > 1.5 ? '2' : '1'}
                                            </p>
                                        </div>
                                    </div>
                                    <div className="p-4 rounded-2xl bg-slate-50 border border-slate-100 flex items-center gap-4">
                                        <div className="p-3 bg-white rounded-xl shadow-sm text-amber-500">
                                            <Sparkles className="w-5 h-5" />
                                        </div>
                                        <div>
                                            <p className="text-[10px] font-black text-slate-400 uppercase tracking-wider">Success Rate</p>
                                            <p className="text-2xl font-black text-slate-900">
                                                {Math.round((academicData.attainments.filter(a => a.actual >= a.target).length / academicData.attainments.length) * 100)}%
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </motion.div>
                    )}

                    {/* Footer / Mapping Info & Compliance */}
                    <motion.div variants={itemVariants} className="pb-10">
                        <div className="p-8 bg-slate-900 rounded-[2rem] text-slate-300 flex flex-col md:flex-row items-center gap-8 border border-slate-800 text-center md:text-left relative overflow-hidden">
                            <div className="absolute top-0 right-0 w-64 h-64 bg-white/5 rounded-full blur-[80px]" />

                            <div className="relative z-10 p-4 bg-slate-800 rounded-2xl shrink-0">
                                <BookOpen className="w-8 h-8 text-blue-400" />
                            </div>
                            <div className="relative z-10 flex-1">
                                <h4 className="text-xl font-black text-white mb-2">Curriculum Mapping & Compliance</h4>
                                <p className="text-sm opacity-70 leading-relaxed max-w-3xl mx-auto md:mx-0">
                                    The Program Specific Outcomes (PSOs) are comprehensively mapped to Program Outcomes (POs) to ensure
                                    alignment with global engineering standards. This matrix is reviewed annually by the
                                    Department Advisory Board (DAB) to maintain academic rigor.
                                </p>
                            </div>

                            {academicData.dabReview && (
                                <div className="relative z-10 px-6 py-4 rounded-2xl bg-white/5 border border-white/10 shrink-0">
                                    <div className="text-[10px] font-black text-blue-400 uppercase tracking-[0.2em] mb-1">DAB Compliance</div>
                                    <div className="text-lg font-black text-white tracking-tight">{academicData.dabReview.frequency} Review</div>
                                    <div className="text-[9px] font-bold text-slate-500 uppercase mt-1">Last: {academicData.dabReview.lastReview}</div>
                                </div>
                            )}
                        </div>
                    </motion.div>

                </motion.div>
            </div>
        </div>
    );
}
