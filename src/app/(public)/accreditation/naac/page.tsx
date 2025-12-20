"use client";

import React from "react";
import {
    Award,
    ShieldCheck,
    TrendingUp,
    Star,
    CheckCircle2,
    Search,
    Download,
    FileText,
    PieChart,
    ExternalLink,
    ArrowRight,
    Zap
} from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import Link from "next/link";

const naacCriteria = [
    { id: 1, name: "Curricular Aspects", weightage: 100, score: 98, icon: PieChart },
    { id: 2, name: "Teaching-Learning & Evaluation", weightage: 350, score: 342, icon: Star },
    { id: 3, name: "Research, Innovations & Extension", weightage: 120, score: 115, icon: TrendingUp },
    { id: 4, name: "Infrastructure & Learning Resources", weightage: 100, score: 99, icon: Search },
    { id: 5, name: "Student Support & Progression", weightage: 130, score: 125, icon: ShieldCheck },
    { id: 6, name: "Governance, Leadership & Management", weightage: 100, score: 96, icon: Award },
    { id: 7, name: "Institutional Values & Best Practices", weightage: 100, score: 100, icon: CheckCircle2 },
];

export default function NAACPage() {
    return (
        <div className="min-h-screen bg-[#020617]">
            {/* Dark Premium Hero */}
            <section className="relative py-28 md:py-40 overflow-hidden border-b border-white/5">
                <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,rgba(56,189,248,0.1),transparent)]" />
                <div className="absolute inset-0 bg-grid-white/[0.02]" />

                <div className="relative container mx-auto px-4 text-center">
                    <div className="inline-flex items-center gap-3 px-6 py-2 rounded-full bg-blue-500/10 border border-blue-500/20 text-blue-400 text-sm font-black mb-10 uppercase tracking-widest animate-fade-in-down">
                        <Award className="w-5 h-5" />
                        NAAC A+ Grade (Cycle 2)
                    </div>

                    <h1 className="text-6xl md:text-8xl lg:text-9xl font-black text-white mb-10 tracking-tighter leading-none">
                        Peak <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 via-indigo-400 to-purple-400">Institutional</span><br />
                        Excellence
                    </h1>

                    <p className="text-xl md:text-3xl text-slate-400 max-w-4xl mx-auto leading-relaxed mb-16 font-light">
                        NRIIT has been awarded the coveted <span className="text-white font-bold">A+ Grade</span> by the National Assessment and Accreditation Council, securing our position among India's elite academic institutions.
                    </p>

                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4 md:gap-8 max-w-4xl mx-auto">
                        <KPICard label="Cumulative Score" value="3.51" sub="Out of 4.00" />
                        <KPICard label="Current Cycle" value="Cycle 2" sub="Re-accredited 2024" />
                        <KPICard label="Grade Level" value="A+" sub="Highest Distinction" />
                        <KPICard label="Institutional Type" value="Autonomous" sub="Approved by UGC" />
                    </div>
                </div>
            </section>

            {/* Criteria Breakdown */}
            <section className="py-24 relative">
                <div className="container mx-auto px-4">
                    <div className="flex flex-col md:flex-row justify-between items-end mb-16 gap-6">
                        <div className="max-w-2xl">
                            <h2 className="text-4xl md:text-6xl font-black text-white mb-6">Quality Metrics Breakdown</h2>
                            <p className="text-slate-400 text-lg leading-relaxed">
                                Our assessment spans across seven critical parameters, ensuring a holistic 360-degree excellence in education, culture, and governance.
                            </p>
                        </div>
                        <Link href="/grievance" className="group px-8 py-4 rounded-2xl bg-white/5 border border-white/10 text-white font-bold flex items-center gap-3 hover:bg-white/10 transition-all shadow-lg hover:border-blue-500/30">
                            IQAC Documentation <Download className="w-5 h-5 group-hover:translate-y-1 transition-transform" />
                        </Link>
                    </div>

                    <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">
                        {/* Interactive Criteria List */}
                        <div className="space-y-4">
                            {naacCriteria.map((item) => (
                                <div key={item.id} className="group p-6 rounded-[2rem] bg-slate-900/50 border border-slate-800 hover:border-blue-500/20 hover:bg-indigo-950/20 transition-all duration-500">
                                    <div className="flex items-center gap-6">
                                        <div className="w-16 h-16 rounded-2xl bg-slate-800 flex items-center justify-center group-hover:bg-blue-600 transition-colors">
                                            <item.icon className="w-8 h-8 text-blue-400 group-hover:text-white" />
                                        </div>
                                        <div className="flex-1">
                                            <div className="flex justify-between items-end mb-2">
                                                <h3 className="text-xl font-black text-white">{item.name}</h3>
                                                <div className="text-right">
                                                    <span className="text-2xl font-black text-blue-400">{item.score}</span>
                                                    <span className="text-slate-500 text-sm"> / {item.weightage}</span>
                                                </div>
                                            </div>
                                            <Progress
                                                value={(item.score / item.weightage) * 100}
                                                className="h-2 bg-slate-800"
                                                indicatorClassName="bg-blue-600"
                                            />
                                        </div>
                                    </div>
                                </div>
                            ))}
                        </div>

                        {/* Summary Card */}
                        <Card className="rounded-[3rem] bg-gradient-to-br from-indigo-900/20 via-slate-900/40 to-blue-900/20 border-white/5 backdrop-blur-2xl p-10 md:p-16 h-full flex flex-col justify-center text-center sticky top-24">
                            <div className="relative inline-block mb-10">
                                <div className="absolute inset-0 bg-blue-500/20 blur-[60px] rounded-full" />
                                <div className="relative w-48 h-48 md:w-64 md:h-64 rounded-full border-[10px] border-blue-500/20 border-t-blue-500 flex flex-col items-center justify-center animate-pulse-slow mx-auto">
                                    <span className="text-7xl md:text-8xl font-black text-white italic">A+</span>
                                    <span className="text-blue-400 font-bold uppercase tracking-widest text-sm mt-2">NAAC Rating</span>
                                </div>
                            </div>

                            <h2 className="text-3xl md:text-5xl font-black text-white mb-6">Diamond Tier Status</h2>
                            <p className="text-slate-400 text-lg leading-relaxed mb-10 max-w-md mx-auto">
                                With a cumulative score that places us in the top 5% of Indian institutions, NRIIT continues to redefine higher education.
                            </p>

                            <div className="flex flex-col gap-4">
                                <Link href="https://www.naac.gov.in/" target="_blank" className="flex items-center justify-center gap-2 text-blue-400 font-bold hover:underline">
                                    Verify on NAAC Portal <ExternalLink className="w-4 h-4" />
                                </Link>
                            </div>
                        </Card>
                    </div>
                </div>
            </section>

            {/* Quick Links */}
            <section className="py-24 border-t border-white/5">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-3 gap-8">
                        <Link href="/grievance" className="group p-8 rounded-3xl bg-slate-900 border border-slate-800 hover:bg-slate-800 transition-all">
                            <FileText className="w-10 h-10 text-emerald-500 mb-6" />
                            <h3 className="text-2xl font-black text-white mb-2">AQAR Reports</h3>
                            <p className="text-slate-500 mb-6">Access our annual quality assurance reports.</p>
                            <ArrowRight className="w-6 h-6 text-slate-700 group-hover:text-emerald-500 group-hover:translate-x-2 transition-all" />
                        </Link>
                        <Link href="/iqac" className="group p-8 rounded-3xl bg-slate-900 border border-slate-800 hover:bg-slate-800 transition-all">
                            <ShieldCheck className="w-10 h-10 text-indigo-500 mb-6" />
                            <h3 className="text-2xl font-black text-white mb-2">IQAC Cell</h3>
                            <p className="text-slate-500 mb-6">Internal Quality Assurance Cell governance.</p>
                            <ArrowRight className="w-6 h-6 text-slate-700 group-hover:text-indigo-500 group-hover:translate-x-2 transition-all" />
                        </Link>
                        <Link href="/accreditation/nba" className="group p-8 rounded-3xl bg-slate-900 border border-slate-800 hover:bg-slate-800 transition-all">
                            <Zap className="w-10 h-10 text-amber-500 mb-6" />
                            <h3 className="text-2xl font-black text-white mb-2">NBA Excellence</h3>
                            <p className="text-slate-500 mb-6">Specific program-tier accreditations.</p>
                            <ArrowRight className="w-6 h-6 text-slate-700 group-hover:text-amber-500 group-hover:translate-x-2 transition-all" />
                        </Link>
                    </div>
                </div>
            </section>
        </div>
    );
}

function KPICard({ label, value, sub }: any) {
    return (
        <div className="p-6 rounded-3xl bg-white/5 border border-white/10 text-center hover:bg-white/10 transition-colors">
            <span className="text-xs uppercase text-slate-500 block mb-1 font-bold tracking-widest leading-none">{label}</span>
            <span className="text-2xl md:text-3xl font-black text-white block mb-1">{value}</span>
            <span className="text-[10px] text-blue-400 uppercase font-black tracking-tighter">{sub}</span>
        </div>
    );
}
