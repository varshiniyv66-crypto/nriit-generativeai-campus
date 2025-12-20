"use client";

import Link from "next/link";
import { Briefcase, TrendingUp, Building2, Users, ArrowRight, CheckCircle2, Star, Award, GraduationCap, ChevronRight } from "lucide-react";

const placementStats = [
    { label: "Placement Rate", value: "95%", icon: TrendingUp, color: "from-emerald-500 to-teal-600" },
    { label: "Highest Package", value: "42 LPA", icon: Star, color: "from-[#D4AF37] to-[#F5A201]" },
    { label: "Average Package", value: "6.5 LPA", icon: Briefcase, color: "from-blue-500 to-indigo-600" },
    { label: "Recruiting Companies", value: "200+", icon: Building2, color: "from-violet-500 to-purple-600" },
];

const topRecruiters = [
    "TCS", "Infosys", "Wipro", "HCL", "Tech Mahindra", "Cognizant",
    "Capgemini", "Accenture", "IBM", "Amazon", "Microsoft", "Google",
    "Oracle", "SAP", "Deloitte", "KPMG", "PwC", "Ernst & Young",
    "L&T", "Bharat Electronics", "DRDO", "ISRO", "Zoho", "Freshworks"
];

const placementProcess = [
    { step: 1, title: "Pre-Placement Training", description: "Comprehensive training on aptitude, technical skills, and soft skills", icon: Award },
    { step: 2, title: "Resume Building", description: "Professional resume preparation and review sessions", icon: Users },
    { step: 3, title: "Mock Interviews", description: "Multiple rounds of mock interviews with industry experts", icon: Briefcase },
    { step: 4, title: "Company Registration", description: "Students register for campus drives based on eligibility", icon: Building2 },
    { step: 5, title: "Placement Drives", description: "On-campus and off-campus recruitment drives throughout the year", icon: GraduationCap },
];

export default function PlacementsPage() {
    return (
        <>
            {/* Hero Section - Premium Dark Navy + Gold */}
            <section className="pt-32 pb-20 bg-gradient-to-br from-[#0F172A] via-[#1e293b] to-[#0F172A] relative overflow-hidden">
                <div className="absolute inset-0 bg-[url('/pattern.svg')] opacity-5" />
                <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-[#D4AF37]/10 rounded-full blur-[150px]" />
                <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-emerald-500/10 rounded-full blur-[150px]" />

                <div className="container mx-auto px-4 relative z-10">
                    <div className="max-w-4xl mx-auto text-center">
                        <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[#D4AF37]/20 border border-[#D4AF37]/30 text-[#D4AF37] text-sm font-bold tracking-wide mb-6">
                            <Briefcase className="w-4 h-4" />
                            Career Opportunities
                        </div>
                        <h1 className="text-4xl md:text-6xl font-black text-white mb-6 leading-tight">
                            A Powerhouse of <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#FFE082]">Global Careers</span>
                        </h1>
                        <p className="text-xl text-slate-300 mb-8 max-w-3xl mx-auto">
                            Our dedicated Training & Placement Cell works tirelessly to connect students with the best career opportunities in Fortune 500 companies.
                        </p>
                        <Link
                            href="/enquire"
                            className="inline-flex items-center gap-2 px-8 py-4 bg-[#D4AF37] hover:bg-[#FFE082] text-[#0F172A] rounded-2xl font-bold transition-all hover:scale-105 shadow-lg shadow-[#D4AF37]/30"
                        >
                            Get Placement Details
                            <ArrowRight className="w-5 h-5" />
                        </Link>
                    </div>
                </div>
            </section>

            {/* Stats Section - Floating Cards */}
            <section className="py-12 bg-white -mt-12 relative z-20">
                <div className="container mx-auto px-4">
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                        {placementStats.map((stat) => (
                            <div
                                key={stat.label}
                                className="group text-center p-8 rounded-3xl bg-white border-2 border-slate-100 hover:border-[#D4AF37] shadow-xl hover:shadow-2xl transition-all"
                            >
                                <div className={`w-16 h-16 rounded-2xl bg-gradient-to-br ${stat.color} flex items-center justify-center mx-auto mb-4 group-hover:scale-110 transition-transform`}>
                                    <stat.icon className="w-8 h-8 text-white" />
                                </div>
                                <div className="text-4xl md:text-5xl font-black text-[#0F172A] mb-2">{stat.value}</div>
                                <div className="text-sm text-slate-500 font-medium">{stat.label}</div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Top Recruiters - Premium Grid */}
            <section className="py-20 bg-slate-50">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="text-[#D4AF37] font-bold text-xs uppercase tracking-[0.2em] mb-3 block">Industry Partners</span>
                        <h2 className="text-4xl md:text-5xl font-black text-[#0F172A] mb-4">
                            Top Companies <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#F5A201]">Trust Us</span>
                        </h2>
                        <p className="text-slate-500">
                            Leading companies from Fortune 500 visit our campus annually to recruit our talented students.
                        </p>
                    </div>

                    <div className="grid grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4">
                        {topRecruiters.map((company, idx) => (
                            <div
                                key={company}
                                className="group p-5 bg-white rounded-2xl border-2 border-slate-100 text-center hover:border-[#D4AF37] hover:shadow-lg transition-all"
                            >
                                <span className="font-bold text-slate-700 group-hover:text-[#D4AF37] transition-colors">{company}</span>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Placement Process - Timeline */}
            <section className="py-20 bg-gradient-to-br from-[#0F172A] to-[#1e293b]">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="text-[#D4AF37] font-bold text-xs uppercase tracking-[0.2em] mb-3 block">How It Works</span>
                        <h2 className="text-4xl md:text-5xl font-black text-white mb-4">
                            Placement <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#FFE082]">Process</span>
                        </h2>
                        <p className="text-slate-400">
                            Our comprehensive placement preparation ensures every student is industry-ready.
                        </p>
                    </div>

                    <div className="max-w-4xl mx-auto">
                        <div className="space-y-6">
                            {placementProcess.map((item, idx) => (
                                <div
                                    key={item.step}
                                    className="group flex items-start gap-6 p-6 bg-white/5 backdrop-blur-sm rounded-2xl border border-white/10 hover:bg-white/10 transition-colors"
                                >
                                    <div className="flex-shrink-0 w-16 h-16 rounded-2xl bg-gradient-to-br from-[#D4AF37] to-[#F5A201] flex items-center justify-center group-hover:scale-110 transition-transform">
                                        <item.icon className="w-8 h-8 text-white" />
                                    </div>
                                    <div>
                                        <div className="text-[#D4AF37] text-sm font-bold mb-1">Step {item.step}</div>
                                        <h3 className="font-bold text-white text-xl mb-2">{item.title}</h3>
                                        <p className="text-slate-400">{item.description}</p>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>

            {/* CRT Section */}
            <section className="py-20 bg-white">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-2 gap-12 items-center">
                        <div>
                            <span className="text-[#D4AF37] font-bold text-xs uppercase tracking-[0.2em] mb-3 block">Training Programs</span>
                            <h2 className="text-4xl md:text-5xl font-black text-[#0F172A] mb-6">
                                Campus Recruitment <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#F5A201]">Training</span>
                            </h2>
                            <p className="text-slate-500 mb-8">
                                Our CRT program bridges the gap between academics and industry requirements, ensuring students are well-prepared for campus placements.
                            </p>
                            <ul className="space-y-4 mb-8">
                                {[
                                    "Aptitude & Reasoning Training",
                                    "Technical Skills Development",
                                    "Communication & Soft Skills",
                                    "Group Discussion & Interview Preparation"
                                ].map((item, idx) => (
                                    <li key={idx} className="flex items-center gap-3 text-slate-600">
                                        <div className="w-6 h-6 rounded-full bg-emerald-100 flex items-center justify-center">
                                            <CheckCircle2 className="w-4 h-4 text-emerald-600" />
                                        </div>
                                        {item}
                                    </li>
                                ))}
                            </ul>
                        </div>

                        <div className="bg-[#0F172A] rounded-3xl p-8 text-white">
                            <h3 className="font-bold text-xl mb-6 flex items-center gap-3">
                                <Users className="w-6 h-6 text-[#D4AF37]" />
                                Training & Placement Cell
                            </h3>
                            <div className="space-y-4">
                                <div className="p-4 bg-white/5 rounded-xl border border-white/10">
                                    <div className="font-bold text-white">T&P Cell Director</div>
                                    <div className="text-sm text-slate-400">Director, Training & Placement</div>
                                </div>
                                <div className="p-4 bg-white/5 rounded-xl border border-white/10">
                                    <div className="font-bold text-white mb-1">Email</div>
                                    <a href="mailto:placements@nriit.ac.in" className="text-[#D4AF37] hover:text-[#FFE082] transition-colors">
                                        placements@nriit.ac.in
                                    </a>
                                </div>
                                <div className="p-4 bg-white/5 rounded-xl border border-white/10">
                                    <div className="font-bold text-white mb-1">Phone</div>
                                    <a href="tel:08632344300" className="text-slate-300 hover:text-white transition-colors">
                                        0863 234 4300
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA */}
            <section className="py-16 bg-gradient-to-r from-[#013C58] to-[#00537A]">
                <div className="container mx-auto px-4 text-center">
                    <h2 className="text-3xl md:text-4xl font-black text-white mb-4">
                        Ready to Launch Your Career?
                    </h2>
                    <p className="text-slate-300 mb-8 max-w-2xl mx-auto">
                        Join NRIIT and get access to world-class placement opportunities with Fortune 500 companies.
                    </p>
                    <Link
                        href="/apply"
                        className="inline-flex items-center gap-2 px-8 py-4 bg-[#D4AF37] hover:bg-[#FFE082] text-[#0F172A] rounded-2xl font-bold transition-all hover:scale-105"
                    >
                        Apply for Admission
                        <ArrowRight className="w-5 h-5" />
                    </Link>
                </div>
            </section>
        </>
    );
}
