"use client";

import { useParams } from 'next/navigation';
import { motion } from 'framer-motion';
import {
    FileText, BookOpen, Award, TrendingUp,
    ExternalLink, Calendar, User, Star,
    Sparkles, Globe2, Lightbulb, Target
} from 'lucide-react';
import { departments } from '@/data/departments';
import { researchData } from '@/data/research-data';

// --- Year-wise Publication Data ---
const publicationDataYearwise: Record<string, Record<string, { papers: number; patents: number; funding: string; conferences: number }>> = {
    cse: {
        '2024-25': { papers: 12, patents: 1, funding: '₹15.2L', conferences: 8 },
        '2023-24': { papers: 10, patents: 1, funding: '₹12.1L', conferences: 6 },
        '2022-23': { papers: 7, patents: 0, funding: '₹6.5L', conferences: 5 },
        '2021-22': { papers: 4, patents: 0, funding: '₹3.5L', conferences: 3 }
    },
    ece: {
        '2024-25': { papers: 15, patents: 1, funding: '₹8.5L', conferences: 10 },
        '2023-24': { papers: 14, patents: 1, funding: '₹5.3L', conferences: 8 },
        '2022-23': { papers: 10, patents: 1, funding: '₹3.0L', conferences: 6 },
        '2021-22': { papers: 6, patents: 0, funding: '₹1.5L', conferences: 4 }
    },
    it: {
        '2024-25': { papers: 9, patents: 1, funding: '₹2.5L', conferences: 5 },
        '2023-24': { papers: 8, patents: 0, funding: '₹1.7L', conferences: 4 },
        '2022-23': { papers: 5, patents: 0, funding: '₹0.7L', conferences: 3 },
        '2021-22': { papers: 3, patents: 0, funding: '₹0.3L', conferences: 2 }
    }
};

// Academic years for filtering
const ACADEMIC_YEARS = ['2024-25', '2023-24', '2022-23', '2021-22'] as const;
type AcademicYear = typeof ACADEMIC_YEARS[number];

export default function PublicationsPage() {
    const params = useParams();
    const deptCode = params.dept as string;
    const deptData = departments[deptCode];
    const research = researchData[deptCode] || researchData.cse;
    const yearwiseData = publicationDataYearwise[deptCode] || publicationDataYearwise.cse;

    // Calculate totals
    const totalPapers = Object.values(yearwiseData).reduce((sum, y) => sum + y.papers, 0);
    const totalPatents = Object.values(yearwiseData).reduce((sum, y) => sum + y.patents, 0);
    const totalConferences = Object.values(yearwiseData).reduce((sum, y) => sum + y.conferences, 0);

    if (!deptData) {
        return (
            <div className="min-h-screen flex items-center justify-center bg-slate-900">
                <p className="text-white text-xl">Department not found</p>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900">
            {/* Hero Section */}
            <section className="relative py-16 px-6 overflow-hidden">
                <div className="absolute inset-0 bg-gradient-to-r from-blue-600/20 to-purple-600/20" />
                <div className="absolute top-0 right-0 w-96 h-96 bg-blue-500/10 rounded-full blur-3xl" />

                <div className="relative max-w-7xl mx-auto text-center">
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-gradient-to-r from-amber-500/20 to-orange-500/20 border border-amber-500/30 mb-6"
                    >
                        <Sparkles className="w-4 h-4 text-amber-400" />
                        <span className="text-amber-300 text-sm font-medium">RESEARCH EXCELLENCE</span>
                    </motion.div>

                    <motion.h1
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.1 }}
                        className="text-4xl md:text-5xl font-bold text-white mb-4"
                    >
                        {deptCode.toUpperCase()} <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-purple-400">Publications</span>
                    </motion.h1>

                    <motion.p
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.2 }}
                        className="text-slate-300 text-lg max-w-2xl mx-auto"
                    >
                        Research Impact & Academic Contributions
                    </motion.p>
                </div>
            </section>

            {/* Stats Overview */}
            <section className="px-6 pb-12">
                <div className="max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-4">
                    {[
                        { icon: FileText, label: 'Total Papers', value: totalPapers, color: 'from-blue-500 to-cyan-500', bg: 'bg-blue-500/20' },
                        { icon: Lightbulb, label: 'Patents', value: totalPatents, color: 'from-amber-500 to-orange-500', bg: 'bg-amber-500/20' },
                        { icon: Globe2, label: 'Conferences', value: totalConferences, color: 'from-purple-500 to-pink-500', bg: 'bg-purple-500/20' },
                        { icon: TrendingUp, label: 'Research Focus', value: research.focusAreas.length, color: 'from-emerald-500 to-teal-500', bg: 'bg-emerald-500/20' }
                    ].map((stat, index) => (
                        <motion.div
                            key={stat.label}
                            initial={{ opacity: 0, y: 20 }}
                            animate={{ opacity: 1, y: 0 }}
                            transition={{ delay: 0.1 * index }}
                            className="relative p-6 rounded-2xl bg-white/5 backdrop-blur-xl border border-white/10 overflow-hidden group hover:border-white/20 transition-all"
                        >
                            <div className={`absolute inset-0 bg-gradient-to-br ${stat.color} opacity-0 group-hover:opacity-10 transition-opacity`} />
                            <div className={`w-12 h-12 rounded-xl ${stat.bg} flex items-center justify-center mb-4`}>
                                <stat.icon className={`w-6 h-6 text-transparent bg-clip-text bg-gradient-to-r ${stat.color}`} style={{ color: `var(--tw-gradient-stops)` }} />
                            </div>
                            <p className="text-3xl font-bold text-white mb-1">{stat.value}</p>
                            <p className="text-slate-400 text-sm">{stat.label}</p>
                        </motion.div>
                    ))}
                </div>
            </section>

            {/* Year-wise Breakdown */}
            <section className="px-6 pb-12">
                <div className="max-w-7xl mx-auto">
                    <h2 className="text-2xl font-bold text-white mb-6 flex items-center gap-3">
                        <Calendar className="w-6 h-6 text-blue-400" />
                        Year-wise Research Output
                    </h2>

                    <div className="grid md:grid-cols-4 gap-4">
                        {ACADEMIC_YEARS.map((year, index) => {
                            const data = yearwiseData[year];
                            return (
                                <motion.div
                                    key={year}
                                    initial={{ opacity: 0, scale: 0.95 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{ delay: 0.1 * index }}
                                    className="p-6 rounded-2xl bg-gradient-to-br from-slate-800/80 to-slate-900/80 border border-slate-700/50 hover:border-blue-500/30 transition-all"
                                >
                                    <div className="flex items-center justify-between mb-4">
                                        <span className="text-lg font-semibold text-blue-400">{year}</span>
                                        <span className="px-2 py-1 text-xs rounded-full bg-blue-500/20 text-blue-300">
                                            {data.papers} Papers
                                        </span>
                                    </div>

                                    <div className="space-y-3">
                                        <div className="flex justify-between text-sm">
                                            <span className="text-slate-400">Patents</span>
                                            <span className="text-white font-medium">{data.patents}</span>
                                        </div>
                                        <div className="flex justify-between text-sm">
                                            <span className="text-slate-400">Conferences</span>
                                            <span className="text-white font-medium">{data.conferences}</span>
                                        </div>
                                        <div className="flex justify-between text-sm">
                                            <span className="text-slate-400">Funding</span>
                                            <span className="text-emerald-400 font-medium">{data.funding}</span>
                                        </div>
                                    </div>

                                    {/* Progress bar */}
                                    <div className="mt-4 h-2 rounded-full bg-slate-700 overflow-hidden">
                                        <div
                                            className="h-full rounded-full bg-gradient-to-r from-blue-500 to-purple-500"
                                            style={{ width: `${(data.papers / 15) * 100}%` }}
                                        />
                                    </div>
                                </motion.div>
                            );
                        })}
                    </div>
                </div>
            </section>

            {/* Featured Publications */}
            <section className="px-6 pb-12">
                <div className="max-w-7xl mx-auto">
                    <h2 className="text-2xl font-bold text-white mb-6 flex items-center gap-3">
                        <Star className="w-6 h-6 text-amber-400" />
                        Featured Publications
                    </h2>

                    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {research.publications.map((pub, index) => (
                            <motion.div
                                key={index}
                                initial={{ opacity: 0, y: 20 }}
                                animate={{ opacity: 1, y: 0 }}
                                transition={{ delay: 0.1 * index }}
                                className="p-6 rounded-2xl bg-gradient-to-br from-white/5 to-white/[0.02] border border-white/10 hover:border-blue-500/30 transition-all group"
                            >
                                <div className="flex items-start justify-between mb-4">
                                    <div className="w-10 h-10 rounded-lg bg-gradient-to-br from-blue-500/20 to-purple-500/20 flex items-center justify-center">
                                        <BookOpen className="w-5 h-5 text-blue-400" />
                                    </div>
                                    <span className="px-2 py-1 text-xs rounded-full bg-emerald-500/20 text-emerald-300">
                                        {pub.year}
                                    </span>
                                </div>

                                <h3 className="text-white font-semibold mb-2 line-clamp-2 group-hover:text-blue-300 transition-colors">
                                    {pub.title}
                                </h3>

                                <p className="text-slate-400 text-sm mb-2 flex items-center gap-2">
                                    <User className="w-4 h-4" />
                                    {pub.author}
                                </p>

                                <p className="text-slate-500 text-xs italic">
                                    {pub.journal}
                                </p>
                            </motion.div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Research Focus Areas */}
            <section className="px-6 pb-12">
                <div className="max-w-7xl mx-auto">
                    <h2 className="text-2xl font-bold text-white mb-6 flex items-center gap-3">
                        <Target className="w-6 h-6 text-purple-400" />
                        Research Focus Areas
                    </h2>

                    <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-4">
                        {research.focusAreas.map((area, index) => (
                            <motion.div
                                key={index}
                                initial={{ opacity: 0, x: -20 }}
                                animate={{ opacity: 1, x: 0 }}
                                transition={{ delay: 0.1 * index }}
                                className="p-4 rounded-xl bg-gradient-to-r from-purple-500/10 to-blue-500/10 border border-purple-500/20 hover:border-purple-500/40 transition-all"
                            >
                                <div className="flex items-center gap-3">
                                    <div className="w-8 h-8 rounded-lg bg-purple-500/20 flex items-center justify-center">
                                        <Sparkles className="w-4 h-4 text-purple-400" />
                                    </div>
                                    <span className="text-white text-sm font-medium">{area}</span>
                                </div>
                            </motion.div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Research Funding Stats */}
            <section className="px-6 pb-16">
                <div className="max-w-7xl mx-auto">
                    <div className="p-8 rounded-3xl bg-gradient-to-r from-blue-600/20 via-purple-600/20 to-pink-600/20 border border-white/10">
                        <div className="grid md:grid-cols-4 gap-8 text-center">
                            {research.stats.map((stat, index) => (
                                <motion.div
                                    key={index}
                                    initial={{ opacity: 0, y: 20 }}
                                    animate={{ opacity: 1, y: 0 }}
                                    transition={{ delay: 0.1 * index }}
                                >
                                    <p className="text-3xl font-bold text-white mb-2">{stat.value}</p>
                                    <p className="text-slate-400 text-sm">{stat.label}</p>
                                </motion.div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
