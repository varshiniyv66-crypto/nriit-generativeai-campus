"use client";

import Link from "next/link";
import { ChevronRight, Users, Award, Building2, ShieldCheck } from "lucide-react";

const departments = [
    { code: "CSE", name: "Computer Science & Engineering", icon: "💻", color: "from-blue-600 to-blue-800", students: 360, established: 2008 },
    { code: "CSE-DS", name: "CSE (Data Science)", icon: "📊", color: "from-purple-600 to-purple-800", students: 180, established: 2020 },
    { code: "CSE-AI", name: "CSE (AI & ML)", icon: "🤖", color: "from-pink-600 to-pink-800", students: 120, established: 2020 },
    { code: "IT", name: "Information Technology", icon: "🌐", color: "from-green-600 to-green-800", students: 120, established: 2008 },
    { code: "ECE", name: "Electronics & Communication", icon: "📡", color: "from-amber-600 to-amber-800", students: 180, established: 2008 },
    { code: "EVT", name: "Electronics & VLSI Technology", icon: "⚡", color: "from-yellow-600 to-yellow-800", students: 60, established: 2020 },
    { code: "CIVIL", name: "Civil Engineering", icon: "🏗️", color: "from-red-600 to-red-800", students: 30, established: 2008 },
    { code: "MBA", name: "Master of Business Administration", icon: "📈", color: "from-cyan-600 to-cyan-800", students: 120, established: 2009 },
    { code: "MCA", name: "Master of Computer Applications", icon: "🎓", color: "from-violet-600 to-violet-800", students: 180, established: 2005 },
    { code: "BSH", name: "Basic Sciences & Humanities", icon: "📚", color: "from-slate-600 to-slate-800", students: 0, established: 2008 },
];

export default function DepartmentsListPage() {
    return (
        <div className="min-h-screen pb-20">
            {/* Hero Section - Light Mode */}
            <section className="relative py-24 md:py-32 overflow-hidden">
                {/* Cinematic Bg */}
                <div className="absolute inset-0 pointer-events-none">
                    <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-[#D4AF37]/10 rounded-full blur-[120px] animate-pulse-slow" />
                    <div className="absolute bottom-0 left-0 w-[600px] h-[600px] bg-[#0EA5E9]/10 rounded-full blur-[120px] animate-float-slow" />
                </div>

                <div className="relative container mx-auto px-4 text-center z-10">
                    <span className="inline-block px-4 py-1.5 glass-premium rounded-full text-xs font-bold uppercase tracking-widest text-[#D4AF37] mb-6 animate-fade-in shadow-sm">
                        Academic Excellence
                    </span>
                    <h1 className="text-5xl md:text-7xl font-bold mb-6 text-slate-900 tracking-tight animate-fade-in-up">
                        9 Centers of <span className="bg-clip-text text-transparent bg-gradient-to-r from-[#D4AF37] via-[#B4941F] to-[#D4AF37] animate-shimmer bg-size-200">Innovation</span>
                    </h1>
                    <p className="text-lg md:text-xl text-slate-600 max-w-3xl mx-auto leading-relaxed animate-fade-in-up delay-100">
                        Explore our diverse range of undergraduate and postgraduate programs
                        designed to prepare you for a global career.
                    </p>
                </div>
            </section>

            {/* Stats */}
            <section className="py-12 relative z-10">
                <div className="container mx-auto px-4">
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                        {[
                            { label: "Departments", value: "9", icon: Building2 },
                            { label: "Students", value: "5000+", icon: Users },
                            { label: "Faculty", value: "300+", icon: Users },
                            { label: "NAAC Grade", value: "A+", icon: Award },
                            { label: "Status", value: "Autonomous", icon: ShieldCheck }
                        ].map((stat, idx) => (
                            <div
                                key={stat.label}
                                className="glass-premium p-6 rounded-2xl text-center border shadow-sm border-slate-200/50"
                                style={{ animationDelay: `${idx * 100}ms` }}
                            >
                                <div className="text-3xl md:text-4xl font-bold text-slate-900 mb-2">{stat.value}</div>
                                <div className="text-xs font-semibold text-[#D4AF37] uppercase tracking-widest flex items-center justify-center gap-2">
                                    <stat.icon className="w-4 h-4" /> {stat.label}
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Departments Grid */}
            <section className="py-12 md:py-20 relative">
                <div className="container mx-auto px-4">
                    <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
                        {departments.map((dept, idx) => (
                            <Link
                                key={dept.code}
                                href={`/departments/${dept.code.toLowerCase()}`}
                                className="card-diamond group relative overflow-hidden rounded-3xl p-1 transition-all duration-500 hover:-translate-y-2 bg-white"
                                style={{ animationDelay: `${idx * 100}ms` }}
                            >
                                <div className={`absolute inset-0 bg-gradient-to-br ${dept.color} opacity-0 group-hover:opacity-5 transition-opacity duration-500 z-0`} />

                                <div className="relative z-10 p-6 md:p-8 h-full flex flex-col">
                                    <div className="flex items-start justify-between mb-6">
                                        <span className="text-5xl group-hover:scale-110 transition-transform duration-500 filter drop-shadow-sm">{dept.icon}</span>
                                        <div className="w-10 h-10 rounded-full bg-slate-50 flex items-center justify-center group-hover:bg-[#D4AF37] transition-colors duration-500 border border-slate-100">
                                            <ChevronRight className="w-5 h-5 text-slate-400 group-hover:text-white transition-colors" />
                                        </div>
                                    </div>

                                    <h3 className="text-2xl font-bold text-slate-900 mb-2 group-hover:text-[#D4AF37] transition-colors">
                                        {dept.name}
                                    </h3>

                                    <div className="mt-auto pt-6 border-t border-slate-100 flex items-center justify-between text-sm">
                                        <span className="text-slate-500 group-hover:text-slate-900 transition-colors">
                                            {dept.students > 0 ? `${dept.students}+ Scholars` : 'Foundation'}
                                        </span>
                                        <span className="text-[#D4AF37] font-mono text-xs">Est. {dept.established}</span>
                                    </div>
                                </div>
                            </Link>
                        ))}
                    </div>
                </div>
            </section>
        </div>
    );
}
