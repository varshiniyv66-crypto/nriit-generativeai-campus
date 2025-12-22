"use client";

import React from "react";
import {
    Award,
    CheckCircle2,
    ShieldCheck,
    Target,
    BookOpen,
    Users,
    TrendingUp,
    Zap,
    Star,
    ArrowRight,
    ChevronRight,
    Building
} from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import Link from "next/link";

// NBA CRITERIA - Real scores from SAR-CSE 2024-25 (Total: 952/1000)
const nbaCriteria = [
    {
        id: "C1",
        name: "Vision, Mission & PEOs",
        score: 60,
        max: 60,
        icon: Target,
        color: "text-amber-500",
        bg: "bg-amber-500/10",
        description: "Defining clear institutional goals and Program Educational Objectives aligned with global standards."
    },
    {
        id: "C2",
        name: "Program Curriculum & Teaching-Learning",
        score: 120,
        max: 120,
        icon: BookOpen,
        color: "text-blue-500",
        bg: "bg-blue-500/10",
        description: "Industry-aligned curriculum with emphasis on outcome-based education and practical learning."
    },
    {
        id: "C3",
        name: "Course Outcomes & Program Outcomes",
        score: 120,
        max: 120,
        icon: Zap,
        color: "text-purple-500",
        bg: "bg-purple-500/10",
        description: "Rigorous mapping of individual course success to program-level outcomes."
    },
    {
        id: "C4",
        name: "Students' Performance",
        score: 111.95,
        max: 150,
        icon: TrendingUp,
        color: "text-emerald-500",
        bg: "bg-emerald-500/10",
        description: "Graduation rates, academic excellence, and consistent performance in competitive exams."
    },
    {
        id: "C5",
        name: "Faculty Information & Contributions",
        score: 194.84,
        max: 200,
        icon: Users,
        color: "text-rose-500",
        bg: "bg-rose-500/10",
        description: "Distinguished faculty with research excellence, publications, and patents."
    },
    {
        id: "C6",
        name: "Facilities & Technical Support",
        score: 80,
        max: 80,
        icon: Building,
        color: "text-cyan-500",
        bg: "bg-cyan-500/10",
        description: "State-of-the-art laboratories, digital libraries, and modern campus infrastructure."
    },
    {
        id: "C7",
        name: "Continuous Improvement",
        score: 50,
        max: 50,
        icon: ShieldCheck,
        color: "text-indigo-500",
        bg: "bg-indigo-500/10",
        description: "Active feedback loops and periodic upgrades to meet evolving industry needs."
    },
    {
        id: "C8",
        name: "First Year Academics",
        score: 44.97,
        max: 50,
        icon: Award,
        color: "text-orange-500",
        bg: "bg-orange-500/10",
        description: "Solid foundation for freshmen through dedicated mentorship and core science immersion."
    },
    {
        id: "C9",
        name: "Student Support Systems",
        score: 50,
        max: 50,
        icon: CheckCircle2,
        color: "text-pink-500",
        bg: "bg-pink-500/10",
        description: "Comprehensive mentoring, career guidance, and anti-ragging support systems."
    },
    {
        id: "C10",
        name: "Governance & Financial Resources",
        score: 120,
        max: 120,
        icon: Building,
        color: "text-teal-500",
        bg: "bg-teal-500/10",
        description: "Strong institutional governance, financial stability, and resource allocation."
    },
];

export default function NBAPage() {
    return (
        <div className="min-h-screen bg-[#0B1120]">
            {/* Hero Section */}
            <section className="relative py-24 md:py-32 overflow-hidden border-b border-slate-800">
                <div className="absolute inset-0 bg-gradient-to-br from-blue-900/40 via-transparent to-indigo-900/40" />
                <div className="absolute inset-0 hero-dots opacity-30" />

                <div className="relative container mx-auto px-4 text-center">
                    <div className="flex flex-wrap justify-center gap-4 mb-8">
                        <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-500/10 border border-blue-500/20 text-blue-400 text-sm font-black uppercase tracking-widest">
                            <ShieldCheck className="w-4 h-4" />
                            NAAC A+ Institutional Grade
                        </div>
                        <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-amber-500/10 border border-amber-500/20 text-amber-500 text-sm font-black uppercase tracking-widest">
                            <Star className="w-4 h-4 fill-amber-500" />
                            NBA Program Accreditation
                        </div>
                    </div>

                    <h1 className="text-5xl md:text-7xl lg:text-8xl font-black text-white mb-8 tracking-tighter leading-tight">
                        Benchmarking <br />
                        <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-200 via-indigo-400 to-purple-600">Departmental Quality</span>
                    </h1>

                    <p className="text-xl md:text-2xl text-slate-400 max-w-4xl mx-auto leading-relaxed mb-12">
                        Beyond our <span className="text-white font-bold">NAAC A+ Institutional Grade</span>, individual departments at NRIIT are vetted by the NBA to ensure international curricula and outcome-based excellence.
                    </p>

                    <div className="flex flex-wrap justify-center gap-6">
                        <div className="px-8 py-4 bg-white rounded-2xl text-slate-900 font-bold flex items-center gap-3 shadow-2xl hover:scale-105 transition-all">
                            <span className="text-3xl">952</span>
                            <div className="text-left leading-none">
                                <span className="text-xs uppercase text-slate-500 block">Total Score</span>
                                <span className="text-sm font-black">Out of 1000</span>
                            </div>
                        </div>
                        <div className="px-8 py-4 bg-blue-600 rounded-2xl text-white font-bold flex items-center gap-3 shadow-2xl hover:scale-105 transition-all">
                            <span className="text-3xl">Tier-I</span>
                            <div className="text-left leading-none">
                                <span className="text-xs uppercase text-blue-200 block">Status</span>
                                <span className="text-sm font-black">Highly Accredited</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Criteria Grid */}
            <section className="py-24 relative">
                <div className="container mx-auto px-4">
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                        {nbaCriteria.map((item) => (
                            <Card key={item.id} className="group bg-slate-900/50 backdrop-blur-xl border-slate-800 hover:border-amber-500/30 transition-all duration-500 rounded-3xl overflow-hidden shadow-2xl">
                                <CardHeader className="pb-4">
                                    <div className={`w-14 h-14 rounded-2xl ${item.bg} flex items-center justify-center mb-6 group-hover:scale-110 transition-transform`}>
                                        <item.icon className={`w-7 h-7 ${item.color}`} />
                                    </div>
                                    <div className="flex justify-between items-start">
                                        <div>
                                            <Badge variant="outline" className="text-slate-500 border-slate-700 mb-2 font-mono">{item.id}</Badge>
                                            <CardTitle className="text-2xl font-black text-white">{item.name}</CardTitle>
                                        </div>
                                        <div className="text-right">
                                            <span className="text-3xl font-black text-white">{item.score}</span>
                                            <span className="text-slate-500 text-sm block">/ {item.max}</span>
                                        </div>
                                    </div>
                                </CardHeader>
                                <CardContent className="space-y-6">
                                    <p className="text-slate-400 leading-relaxed font-medium">
                                        {item.description}
                                    </p>
                                    <div className="space-y-2">
                                        <div className="flex justify-between text-xs font-bold uppercase tracking-widest">
                                            <span className="text-slate-500">Benchmark Attainment</span>
                                            <span className={item.color}>{Math.round((item.score / item.max) * 100)}%</span>
                                        </div>
                                        <Progress
                                            value={(item.score / item.max) * 100}
                                            className="h-2 bg-slate-800"
                                            indicatorClassName={`bg-gradient-to-r ${item.color.replace('text', 'from')} to-white/20`}
                                        />
                                    </div>
                                </CardContent>
                            </Card>
                        ))}
                    </div>
                </div>
            </section>

            {/* Global Recognition CTA */}
            <section className="py-24 bg-gradient-to-b from-transparent to-slate-900/50">
                <div className="container mx-auto px-4">
                    <div className="bg-gradient-to-br from-blue-600 to-indigo-700 rounded-[3rem] p-12 md:p-20 relative overflow-hidden shadow-[0_40px_100px_rgba(37,99,235,0.3)]">
                        <div className="absolute top-0 right-0 w-96 h-96 bg-white/10 rounded-full blur-3xl -mr-48 -mt-48" />

                        <div className="relative z-10 grid lg:grid-cols-2 gap-12 items-center">
                            <div className="space-y-8">
                                <div className="h-16 w-16 bg-white/20 backdrop-blur-md rounded-2xl flex items-center justify-center">
                                    <Globe className="w-8 h-8 text-white" />
                                </div>
                                <h2 className="text-4xl md:text-5xl font-black text-white tracking-tight">
                                    Washington Accord Readiness
                                </h2>
                                <p className="text-xl text-blue-100 font-medium leading-relaxed">
                                    Our NBA accreditation makes your degree globally recognized. NRIIT graduates are
                                    equivalent to engineering graduates from USA, UK, Australia, and 20+ other
                                    Washington Accord signatory nations.
                                </p>
                                <div className="flex flex-wrap gap-4">
                                    <Badge className="bg-white/10 text-white border-white/20 px-4 py-2 text-sm font-bold">Global Mobility</Badge>
                                    <Badge className="bg-white/10 text-white border-white/20 px-4 py-2 text-sm font-bold">Higher Packages</Badge>
                                    <Badge className="bg-white/10 text-white border-white/20 px-4 py-2 text-sm font-bold">Direct Professional Eligibility</Badge>
                                </div>
                            </div>

                            <Card className="bg-white/5 border-white/10 backdrop-blur-sm shadow-2xl rounded-3xl h-full border-none">
                                <CardHeader>
                                    <CardTitle className="text-white text-2xl font-black flex items-center gap-3">
                                        <ChevronRight className="w-6 h-6 text-amber-400" />
                                        Department Status
                                    </CardTitle>
                                </CardHeader>
                                <CardContent className="space-y-4">
                                    {[
                                        { name: "Computer Science & Engineering", status: "Program Accredited" },
                                        { name: "Electronics & Communication Eng.", status: "Program Accredited" },
                                        { name: "Information Technology", status: "Applying First Time" },
                                        { name: "CSE (Data Science)", status: "Applying First Time" },
                                        { name: "CSE (AI & ML)", status: "New Program" },
                                    ].map((dept, i) => (
                                        <div key={i} className="flex items-center justify-between p-4 bg-white/5 rounded-2xl border border-white/5 group hover:bg-white/10 transition-colors">
                                            <span className="text-blue-50 font-bold">{dept.name}</span>
                                            <div className="flex items-center gap-2 text-emerald-400 text-xs font-black uppercase tracking-tighter">
                                                <CheckCircle2 className="w-3 h-3 text-emerald-400" />
                                                {dept.status}
                                            </div>
                                        </div>
                                    ))}
                                </CardContent>
                            </Card>
                        </div>
                    </div>
                </div>
            </section>

            {/* Footer Navigation */}
            <section className="py-20 border-t border-slate-800">
                <div className="container mx-auto px-4 text-center">
                    <p className="text-slate-500 font-bold uppercase tracking-[0.3em] mb-12">Next Discovery</p>
                    <div className="grid md:grid-cols-3 gap-8 max-w-5xl mx-auto">
                        <DiscoveryCard
                            title="NAAC A+"
                            desc="India's highest institutional score"
                            href="/accreditation/naac"
                            icon={ShieldCheck}
                        />
                        <DiscoveryCard
                            title="NIRF 2024"
                            desc="Top rankings in national bracket"
                            href="/accreditation/nirf"
                            icon={TrendingUp}
                        />
                        <DiscoveryCard
                            title="IQAC"
                            desc="Internal Quality Assurance Cell"
                            href="/iqac"
                            icon={Zap}
                        />
                    </div>
                </div>
            </section>
        </div>
    );
}

function DiscoveryCard({ title, desc, href, icon: Icon }: any) {
    return (
        <Link href={href} className="group p-8 rounded-3xl bg-slate-900 border border-slate-800 hover:border-blue-500/30 transition-all hover:bg-slate-800/50 text-left">
            <Icon className="w-10 h-10 text-blue-500 mb-6 group-hover:scale-110 transition-transform" />
            <h3 className="text-xl font-black text-white mb-2">{title}</h3>
            <p className="text-slate-500 text-sm font-medium">{desc}</p>
            <div className="mt-6 flex items-center gap-2 text-blue-500 font-black text-xs uppercase tracking-widest opacity-0 group-hover:opacity-100 transition-opacity">
                Explore <ArrowRight className="w-4 h-4" />
            </div>
        </Link>
    );
}

function Globe({ className }: any) {
    return (
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className={className}><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
    );
}
