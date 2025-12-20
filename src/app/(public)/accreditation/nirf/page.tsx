"use client";

import React from "react";
import {
    BarChart3,
    TrendingUp,
    Target,
    Award,
    ChevronRight,
    Globe,
    BookOpen,
    Users,
    Briefcase,
    Zap,
    Download
} from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import Link from "next/link";

const nirfParameters = [
    { name: "Teaching, Learning & Resources (TLR)", score: 88, weight: 100, icon: BookOpen, color: "text-blue-500", bg: "bg-blue-500/10" },
    { name: "Research and Professional Practice (RPC)", score: 72, weight: 100, icon: Zap, color: "text-purple-500", bg: "bg-purple-500/10" },
    { name: "Graduation Outcomes (GO)", score: 94, weight: 100, icon: TrendingUp, color: "text-emerald-500", bg: "bg-emerald-500/10" },
    { name: "Outreach and Inclusivity (OI)", score: 81, weight: 100, icon: Globe, color: "text-pink-500", bg: "bg-pink-500/10" },
    { name: "Perception (PR)", score: 79, weight: 100, icon: Target, color: "text-amber-500", bg: "bg-amber-500/10" },
];

export default function NIRFPage() {
    return (
        <div className="min-h-screen bg-[#F8FAFC]">
            {/* White & Blue High-Contrast Hero */}
            <section className="relative py-24 md:py-32 overflow-hidden bg-white border-b border-slate-200">
                <div className="absolute top-0 right-0 w-[800px] h-[800px] bg-blue-50 rounded-full blur-[120px] -mr-64 -mt-64" />
                <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-indigo-50 rounded-full blur-[80px] -ml-24 -mb-24" />

                <div className="relative container mx-auto px-4 text-center">
                    <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-slate-900 text-white text-xs font-black mb-8 uppercase tracking-[0.2em] shadow-xl">
                        <BarChart3 className="w-4 h-4" />
                        NIRF Ranking 2024
                    </div>

                    <h1 className="text-5xl md:text-7xl lg:text-8xl font-black text-slate-900 mb-8 tracking-tighter leading-tight">
                        Ranked Among the <br />
                        <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600">Nation's Best</span>
                    </h1>

                    <p className="text-xl md:text-2xl text-slate-500 max-w-4xl mx-auto leading-relaxed mb-12 font-medium">
                        The National Institutional Ranking Framework (NIRF) by the Ministry of Education, Govt. of India,
                        validates our commitment to becoming a top-tier engineering destination.
                    </p>

                    <div className="flex flex-wrap justify-center gap-4">
                        <Link href="/grievance" className="px-8 py-4 bg-slate-900 text-white font-bold rounded-2xl flex items-center gap-3 hover:bg-black transition-all shadow-2xl">
                            <Download className="w-5 h-5" /> Download NIRF 2024 Data
                        </Link>
                        <Link href="https://www.nirfindia.org/" target="_blank" className="px-8 py-4 bg-white text-slate-900 border-2 border-slate-200 font-bold rounded-2xl flex items-center gap-3 hover:bg-slate-50 transition-all">
                            Official Portal <ChevronRight className="w-5 h-5" />
                        </Link>
                    </div>
                </div>
            </section>

            {/* Parameter Cards */}
            <section className="py-24 relative z-10">
                <div className="container mx-auto px-4">
                    <div className="text-center mb-16">
                        <h2 className="text-3xl md:text-5xl font-black text-slate-900 mb-4 tracking-tight">Five Pillars of Assessment</h2>
                        <p className="text-slate-500 font-medium">Measuring every dimension of institutional performance.</p>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-6 mb-16">
                        {nirfParameters.map((param) => (
                            <Card key={param.name} className="group hover:border-blue-500/50 transition-all duration-500 border-2 border-slate-100 shadow-xl rounded-3xl overflow-hidden bg-white">
                                <CardHeader className="p-8 pb-4">
                                    <div className={`w-12 h-12 rounded-2xl ${param.bg} flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}>
                                        <param.icon className={`w-6 h-6 ${param.color}`} />
                                    </div>
                                    <div className="flex flex-col">
                                        <span className="text-3xl font-black text-slate-900">{param.score}</span>
                                        <span className="text-xs uppercase font-bold text-slate-400 tracking-wider">Parameter Score</span>
                                    </div>
                                </CardHeader>
                                <CardContent className="p-8 pt-4">
                                    <h3 className="text-sm font-bold text-slate-700 leading-tight">
                                        {param.name}
                                    </h3>
                                </CardContent>
                            </Card>
                        ))}
                    </div>

                    {/* Rankings Table */}
                    <div className="bg-white rounded-[3rem] border-2 border-slate-100 shadow-2xl overflow-hidden">
                        <div className="p-10 border-b border-slate-100 flex flex-col md:flex-row justify-between items-center gap-6">
                            <div className="flex items-center gap-4">
                                <div className="p-4 bg-amber-500 text-white rounded-3xl shadow-lg shadow-amber-500/30">
                                    <Award className="w-8 h-8" />
                                </div>
                                <div>
                                    <h3 className="text-2xl font-black text-slate-900">Historical Rankings</h3>
                                    <p className="text-slate-500 text-sm font-medium italic">Our journey towards the Top 100 Engineering Institutions</p>
                                </div>
                            </div>
                            <Badge className="bg-emerald-500 text-white border-none py-2 px-4 text-xs font-black uppercase tracking-widest">Growing Trend ↑</Badge>
                        </div>

                        <div className="p-10 overflow-x-auto">
                            <table className="w-full">
                                <thead>
                                    <tr className="border-b-2 border-slate-50">
                                        <th className="text-left py-4 text-slate-400 font-black text-xs uppercase tracking-widest">Academic Year</th>
                                        <th className="text-left py-4 text-slate-400 font-black text-xs uppercase tracking-widest">Engineering Rank Band</th>
                                        <th className="text-left py-4 text-slate-400 font-black text-xs uppercase tracking-widest">State-Level Performance</th>
                                        <th className="text-right py-4 text-slate-400 font-black text-xs uppercase tracking-widest">Status</th>
                                    </tr>
                                </thead>
                                <tbody className="divide-y divide-slate-50">
                                    {[
                                        { year: "2024-2025", rank: "Top 200", state: "Top 20 in AP", status: "Gold Rated" },
                                        { year: "2023-2024", rank: "201-250 Band", state: "Top 25 in AP", status: "Silver Rated" },
                                        { year: "2022-2023", rank: "Participated", state: "Emerging Top tier", status: "Qualified" },
                                    ].map((row) => (
                                        <tr key={row.year} className="group hover:bg-slate-50 transition-colors">
                                            <td className="py-6 font-black text-slate-900">{row.year}</td>
                                            <td className="py-6 font-bold text-blue-600">{row.rank}</td>
                                            <td className="py-6 text-slate-600 font-medium">{row.state}</td>
                                            <td className="py-6 text-right">
                                                <span className="px-3 py-1 bg-slate-100 rounded-full text-[10px] font-black uppercase tracking-tighter text-slate-500 group-hover:bg-slate-900 group-hover:text-white transition-all">
                                                    {row.status}
                                                </span>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>

            {/* Performance Visualization Section */}
            <section className="py-24 bg-slate-900 text-white relative overflow-hidden">
                <div className="absolute inset-0 bg-grid-white/[0.05]" />
                <div className="container mx-auto px-4 relative z-10">
                    <div className="grid lg:grid-cols-2 gap-20 items-center">
                        <div className="space-y-8">
                            <h2 className="text-5xl font-black tracking-tight">The NIRF Advantage</h2>
                            <p className="text-xl text-slate-400 font-medium leading-relaxed">
                                Our NIRF participation ensures absolute transparency in institutional performance. It maps us
                                against the finest IITs, NITs, and IIITs, pushing us to constantly innovate our teaching
                                and research methodology.
                            </p>
                            <div className="space-y-6">
                                <AdvantageItem title="Academic Transparency" desc="Full disclosure of student data and financial status." />
                                <AdvantageItem title="National Benchmark" desc="Real-time comparison with top institutions across India." />
                                <AdvantageItem title="Quality Assurance" desc="Rigorous cross-verification of faculty research and patents." />
                            </div>
                        </div>
                        <div className="bg-white/5 backdrop-blur-xl border border-white/10 rounded-[3rem] p-12 relative">
                            <div className="absolute -top-6 -right-6 p-6 bg-blue-600 rounded-3xl shadow-2xl rotate-12">
                                <TrendingUp className="w-10 h-10 text-white" />
                            </div>
                            <h3 className="text-2xl font-black mb-8 text-blue-400">Parameter Attainment</h3>
                            <div className="space-y-8">
                                <MetricBar label="Graduation Outcomes" value={94} color="bg-emerald-500" />
                                <MetricBar label="Teaching & Resources" value={88} color="bg-blue-500" />
                                <MetricBar label="Outreach/Inclusivity" value={81} color="bg-pink-500" />
                                <MetricBar label="Research Intensity" value={72} color="bg-purple-500" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}

function AdvantageItem({ title, desc }: any) {
    return (
        <div className="flex gap-4">
            <div className="w-6 h-6 rounded-full bg-blue-600 flex-shrink-0 flex items-center justify-center mt-1">
                <ChevronRight className="w-4 h-4 text-white" />
            </div>
            <div>
                <h4 className="font-bold text-white text-lg">{title}</h4>
                <p className="text-slate-400 text-sm">{desc}</p>
            </div>
        </div>
    );
}

function MetricBar({ label, value, color }: any) {
    return (
        <div className="space-y-2">
            <div className="flex justify-between text-xs font-black uppercase tracking-widest leading-none">
                <span>{label}</span>
                <span className="text-white">{value}%</span>
            </div>
            <Progress value={value} className="h-2 bg-white/10" indicatorClassName={color} />
        </div>
    );
}
