"use client";

import React from "react";
import {
    BarChart,
    Bar,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    Legend,
    ResponsiveContainer,
    LineChart,
    Line,
    RadarChart,
    PolarGrid,
    PolarAngleAxis,
    PolarRadiusAxis,
    Radar,
    AreaChart,
    Area
} from "recharts";
import {
    Award,
    TrendingUp,
    Users,
    BookOpen,
    Briefcase,
    CheckCircle,
    Star,
    Zap,
    ShieldCheck
} from "lucide-react";
import { DEPARTMENT_COMPARISON, PLACEMENT_TRENDS, NBA_CRITERIA } from "@/data/analytics";

const CustomTooltip = ({ active, payload, label }: any) => {
    if (active && payload && payload.length) {
        return (
            <div className="bg-slate-900 border border-slate-700 p-4 rounded-lg shadow-xl text-white">
                <p className="font-bold mb-2">{label}</p>
                {payload.map((entry: any, index: number) => (
                    <p key={index} style={{ color: entry.color }} className="text-sm">
                        {entry.name}: {entry.value}%
                    </p>
                ))}
            </div>
        );
    }
    return null;
};

export const DepartmentComparison = () => {
    return (
        <div className="space-y-12 py-8">

            {/* 1. HERO: 9 Gold Medals Section */}
            <div className="bg-gradient-to-r from-slate-900 via-slate-800 to-slate-900 p-8 rounded-3xl border border-amber-500/20 shadow-2xl relative overflow-hidden">
                <div className="absolute top-0 right-0 w-64 h-64 bg-amber-500/10 rounded-full blur-3xl -mr-16 -mt-16"></div>
                <div className="relative z-10">
                    <div className="text-center mb-10">
                        <h2 className="text-3xl md:text-5xl font-extrabold bg-clip-text text-transparent bg-gradient-to-r from-amber-300 via-yellow-500 to-amber-600 mb-4 drop-shadow-sm">
                            9 Gold Medals of Excellence
                        </h2>
                        <p className="text-slate-300 text-lg max-w-2xl mx-auto">
                            Our commitment to quality education is recognized across all 9 critical parameters of the National Board of Accreditation.
                        </p>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-3 gap-6">
                        {NBA_CRITERIA.map((criteria, idx) => (
                            <div
                                key={criteria.id}
                                className="group relative bg-slate-800/50 backdrop-blur-sm border border-slate-700 hover:border-amber-500/50 p-6 rounded-2xl transition-all duration-300 hover:shadow-[0_0_30px_rgba(245,158,11,0.15)] flex items-center space-x-4"
                            >
                                <div className="h-14 w-14 rounded-full bg-gradient-to-br from-amber-300 to-yellow-600 flex items-center justify-center shadow-lg group-hover:scale-110 transition-transform duration-300">
                                    <Award className="text-white h-7 w-7" />
                                </div>
                                <div>
                                    <h3 className="text-white font-bold text-lg leading-tight">{criteria.name}</h3>
                                    <div className="flex items-center space-x-2 mt-1">
                                        <span className="text-amber-400 font-bold">{criteria.score}/{criteria.maxScore}</span>
                                        <span className="text-xs text-slate-400 px-2 py-0.5 rounded-full bg-slate-700 border border-slate-600">
                                            Top Tier
                                        </span>
                                    </div>
                                </div>
                                <div className="absolute right-4 top-4 opacity-0 group-hover:opacity-100 transition-opacity">
                                    <Star className="text-amber-500 h-5 w-5 fill-amber-500 animate-pulse" />
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </div>

            {/* 2. DASHBOARD: Beautiful Comparison Charts */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">

                {/* Chart A: Placement Excellence */}
                <div className="bg-white dark:bg-slate-950 p-6 rounded-2xl border border-slate-200 dark:border-slate-800 shadow-xl">
                    <div className="flex items-center justify-between mb-6">
                        <div>
                            <h3 className="text-2xl font-bold dark:text-white flex items-center gap-2">
                                <TrendingUp className="text-emerald-500" />
                                Placement Success
                            </h3>
                            <p className="text-slate-500 dark:text-slate-400 text-sm">Placement percentage across departments (2024-25)</p>
                        </div>
                        <div className="text-emerald-600 font-bold bg-emerald-100 dark:bg-emerald-900/30 px-3 py-1 rounded-full text-sm">
                            +12% YoY
                        </div>
                    </div>
                    <div className="h-[300px] w-full">
                        <ResponsiveContainer width="100%" height="100%">
                            <BarChart data={DEPARTMENT_COMPARISON} margin={{ top: 10, right: 30, left: 0, bottom: 0 }}>
                                <defs>
                                    <linearGradient id="colorPlacement" x1="0" y1="0" x2="0" y2="1">
                                        <stop offset="5%" stopColor="#3b82f6" stopOpacity={0.8} />
                                        <stop offset="95%" stopColor="#3b82f6" stopOpacity={0} />
                                    </linearGradient>
                                </defs>
                                <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#334155" opacity={0.2} />
                                <XAxis dataKey="name" axisLine={false} tickLine={false} tick={{ fill: '#64748b' }} dy={10} />
                                <YAxis axisLine={false} tickLine={false} tick={{ fill: '#64748b' }} />
                                <Tooltip content={<CustomTooltip />} />
                                <Bar
                                    dataKey="placementPercentage"
                                    name="Placement %"
                                    fill="url(#colorPlacement)"
                                    radius={[8, 8, 0, 0]}
                                    animationDuration={1500}
                                >
                                    {DEPARTMENT_COMPARISON.map((entry, index) => (
                                        <cell key={`cell-${index}`} fill={entry.color} />
                                    ))}
                                </Bar>
                            </BarChart>
                        </ResponsiveContainer>
                    </div>
                </div>

                {/* Chart B: Multi-Year Trends */}
                <div className="bg-white dark:bg-slate-950 p-6 rounded-2xl border border-slate-200 dark:border-slate-800 shadow-xl">
                    <div className="flex items-center justify-between mb-6">
                        <div>
                            <h3 className="text-2xl font-bold dark:text-white flex items-center gap-2">
                                <Briefcase className="text-indigo-500" />
                                Growth Trajectory
                            </h3>
                            <p className="text-slate-500 dark:text-slate-400 text-sm">3-Year Placement Performance Trend</p>
                        </div>
                    </div>
                    <div className="h-[300px] w-full">
                        <ResponsiveContainer width="100%" height="100%">
                            <AreaChart data={PLACEMENT_TRENDS} margin={{ top: 10, right: 30, left: 0, bottom: 0 }}>
                                <defs>
                                    <linearGradient id="colorCSE" x1="0" y1="0" x2="0" y2="1">
                                        <stop offset="5%" stopColor="#3b82f6" stopOpacity={0.3} />
                                        <stop offset="95%" stopColor="#3b82f6" stopOpacity={0} />
                                    </linearGradient>
                                    <linearGradient id="colorIT" x1="0" y1="0" x2="0" y2="1">
                                        <stop offset="5%" stopColor="#8b5cf6" stopOpacity={0.3} />
                                        <stop offset="95%" stopColor="#8b5cf6" stopOpacity={0} />
                                    </linearGradient>
                                </defs>
                                <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#334155" opacity={0.2} />
                                <XAxis dataKey="year" axisLine={false} tickLine={false} tick={{ fill: '#64748b' }} dy={10} />
                                <YAxis axisLine={false} tickLine={false} tick={{ fill: '#64748b' }} />
                                <Tooltip content={<CustomTooltip />} />
                                <Area type="monotone" dataKey="CSE" stroke="#3b82f6" strokeWidth={3} fillOpacity={1} fill="url(#colorCSE)" />
                                <Area type="monotone" dataKey="IT" stroke="#8b5cf6" strokeWidth={3} fillOpacity={1} fill="url(#colorIT)" />
                                <Area type="monotone" dataKey="ECE" stroke="#f59e0b" strokeWidth={3} fillOpacity={0} fill="transparent" />
                            </AreaChart>
                        </ResponsiveContainer>
                    </div>
                </div>

            </div>

            {/* 3. Department Cards Comparison */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {DEPARTMENT_COMPARISON.map((dept) => (
                    <div key={dept.name} className="bg-white dark:bg-slate-900 rounded-2xl p-6 border border-slate-200 dark:border-slate-800 hover:shadow-2xl hover:border-slate-300 dark:hover:border-slate-600 transition-all duration-300 group">
                        <div className="flex justify-between items-start mb-4">
                            <div>
                                <h4 className="text-2xl font-bold text-slate-800 dark:text-white group-hover:text-amber-500 transition-colors">
                                    {dept.name}
                                </h4>
                                <p className="text-xs text-slate-500 uppercase tracking-wider">{dept.fullName}</p>
                            </div>
                            <div
                                className="h-10 w-10 rounded-full flex items-center justify-center text-white shadow-lg"
                                style={{ backgroundColor: dept.color }}
                            >
                                <Zap className="h-5 w-5" />
                            </div>
                        </div>

                        <div className="space-y-4">
                            <div className="flex justify-between items-center py-2 border-b border-slate-100 dark:border-slate-800">
                                <span className="text-slate-500 dark:text-slate-400 text-sm flex items-center gap-2"><Users className="h-4 w-4" /> Intake</span>
                                <span className="font-semibold dark:text-slate-200">{dept.intake}</span>
                            </div>
                            <div className="flex justify-between items-center py-2 border-b border-slate-100 dark:border-slate-800">
                                <span className="text-slate-500 dark:text-slate-400 text-sm flex items-center gap-2"><CheckCircle className="h-4 w-4" /> Placements</span>
                                <span className="font-bold text-green-600">{dept.placementPercentage}%</span>
                            </div>
                            <div className="flex justify-between items-center py-2 border-b border-slate-100 dark:border-slate-800">
                                <span className="text-slate-500 dark:text-slate-400 text-sm flex items-center gap-2"><BookOpen className="h-4 w-4" /> Research</span>
                                <span className="font-semibold dark:text-slate-200">{dept.researchPapers} Papers</span>
                            </div>
                            <div className="flex justify-between items-center py-2">
                                <span className="text-slate-500 dark:text-slate-400 text-sm flex items-center gap-2"><ShieldCheck className="h-4 w-4" /> Status</span>
                                <span className={`px-2 py-1 rounded text-xs font-bold ${dept.accreditationStatus === 'Accredited'
                                        ? 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-300'
                                        : 'bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-300'
                                    }`}>
                                    {dept.accreditationStatus}
                                </span>
                            </div>
                        </div>
                    </div>
                ))}
            </div>

        </div>
    );
};

export default DepartmentComparison;
