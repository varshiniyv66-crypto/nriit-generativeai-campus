"use client";

import React from "react";
import Link from "next/link";
import {
    FlaskConical,
    BookOpen,
    Award,
    Users,
    FileText,
    Lightbulb,
    Building2,
    ArrowLeft,
    ExternalLink,
    GraduationCap,
    TrendingUp,
    Cpu,
    Zap,
    Target
} from "lucide-react";


const rdCenters = [
    {
        department: "Computer Science & Engineering",
        name: "AI & Machine Learning Research Center",
        description: "Cutting-edge research in artificial intelligence, deep learning, computer vision, and natural language processing.",
        focus: ["Deep Learning", "Computer Vision", "NLP", "Data Science"],
        icon: Cpu,
        color: "from-blue-500 to-indigo-600"
    },
    {
        department: "Electronics & Communication Engineering",
        name: "VLSI & Embedded Systems Research Center",
        description: "Research in VLSI design, IoT, embedded systems, and signal processing technologies.",
        focus: ["VLSI Design", "IoT", "Embedded Systems", "Signal Processing"],
        icon: Zap,
        color: "from-emerald-500 to-teal-600"
    }
];

const recentPublications = [
    {
        title: "Deep Learning Techniques for Early Detection of Chronic Diseases Using Electronic Health Records",
        author: "Dr. Dola Sanjay S, Dr. Y V Raghava Rao",
        journal: "The Bioscan (Scopus)",
        year: "2025"
    },
    {
        title: "Modern Deep Learning Algorithms for Speech Recognition Reliability Evaluation",
        author: "Dr. K. Srihari Rao, Dr. Dola Sanjay S",
        journal: "ZKG International",
        year: "2023"
    },
    {
        title: "Power System Security in Competitive Market and Cost Recovery in Deregulated Power System",
        author: "Dr. J. Krishna Kishore",
        journal: "JNTU Hyderabad (Ph.D)",
        year: "2024"
    },
    {
        title: "Novel Design and Implementation of AES with LFSR Key for Improving Data Security",
        author: "Dr. K. Srihari Rao, Dr. B. Saidaiah",
        journal: "IJFMR",
        year: "2023"
    },
    {
        title: "Single-Crystal Perovskite Halide: Crystal Growth to Device Applications",
        author: "Mrs. Naga Jyothi Valeti et al.",
        journal: "Wiley Energy Technology",
        year: "2024"
    },
    {
        title: "Intelligent IoT Robotics for Image-Guided Cotton Crop Disease Prediction",
        author: "Dr. Y V Raghava Rao, Dr. Dola Sanjay S",
        journal: "Jay Kisan Logistics (Industry Project)",
        year: "2023"
    }
];

// Key Research Faculty with Publications
const keyResearchFaculty = [
    { name: "Dr. Y V Raghava Rao", designation: "Professor & Dean, CSE", publications: "25+", patents: 3, expertise: "AI/ML, Data Science" },
    { name: "Dr. K. Srihari Rao", designation: "Professor & Vice Principal, ECE", publications: "62", patents: 0, expertise: "VLSI, Signal Processing" },
    { name: "Dr. Dola Sanjay S", designation: "Principal & Professor, ECE", publications: "37+", patents: 8, expertise: "IoT, Embedded Systems" },
    { name: "Dr. B. Saidaiah", designation: "Professor, ECE", publications: "10+", patents: 0, expertise: "Power Systems, IoT" },
    { name: "Dr. C. Kalai Selvan", designation: "Professor, ECE", publications: "8+", patents: 0, expertise: "Image Processing, VLSI" },
    { name: "Dr. M. Ravi", designation: "Associate Professor, ECE", publications: "9+", patents: 0, expertise: "Machine Learning, IoT" }
];

const rdStats = [
    { value: "178+", label: "Journal Publications (2022-25)", color: "text-amber-400" },
    { value: "8+", label: "Patents Filed/Published", color: "text-amber-400" },
    { value: "15+", label: "Ph.D. Faculty", color: "text-amber-400" },
    { value: "₹32L+", label: "Research Grants (3 Years)", color: "text-amber-400" }
];

const fundingAgencies = [
    "Institution of Engineers (India)", "PMKVY (Govt of India)", "AICTE", "Jay Kisan Logistics", "APPSC", "NRI Educational Society"
];

export default function ResearchPage() {
    return (
        <>

            {/* Hero Section */}
            <section className="pt-32 pb-16 bg-gradient-to-br from-[#0F172A] via-[#1e293b] to-[#0F172A] relative overflow-hidden">
                <div className="absolute inset-0 bg-[url('/pattern.svg')] opacity-5" />
                <div className="absolute top-0 right-0 w-96 h-96 bg-blue-500/20 rounded-full blur-[100px]" />
                <div className="absolute bottom-0 left-0 w-96 h-96 bg-emerald-500/20 rounded-full blur-[100px]" />

                <div className="container mx-auto px-4 relative z-10">
                    <Link href="/" className="inline-flex items-center gap-2 text-slate-400 hover:text-white transition-colors mb-8 font-medium">
                        <ArrowLeft className="w-4 h-4" />
                        Back to Home
                    </Link>

                    <div className="max-w-3xl">
                        <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-500/20 border border-blue-500/30 text-blue-300 text-sm font-bold tracking-wide mb-6">
                            <FlaskConical className="w-4 h-4" />
                            Innovation & Excellence
                        </div>
                        <h1 className="text-4xl md:text-6xl font-black text-white mb-6">
                            Research & <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-cyan-400">Development</span>
                        </h1>
                        <p className="text-xl text-slate-300">
                            Driving innovation through dedicated research facilities, industry partnerships, and a robust culture of scientific inquiry.
                        </p>
                    </div>
                </div>
            </section>

            {/* R&D Statistics Bar */}
            <section className="bg-blue-600 py-8">
                <div className="container mx-auto px-4">
                    <div className="flex flex-col md:flex-row items-center justify-between gap-6">
                        <h2 className="text-2xl font-black text-white">R&D Statistics</h2>
                        <div className="flex flex-wrap gap-8 md:gap-16">
                            {rdStats.map((stat, idx) => (
                                <div key={idx} className="text-center">
                                    <div className={`text-4xl font-black ${stat.color}`}>{stat.value}</div>
                                    <div className="text-sm text-blue-100">{stat.label}</div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>

            {/* R&D Centers */}
            <section className="py-16">
                <div className="container mx-auto px-4">
                    <div className="flex items-center gap-4 mb-8">
                        <div className="w-12 h-12 rounded-2xl bg-gradient-to-br from-violet-500 to-purple-600 flex items-center justify-center">
                            <Building2 className="w-6 h-6 text-white" />
                        </div>
                        <div>
                            <h2 className="text-3xl font-black text-[#0F172A]">R&D Centers</h2>
                            <p className="text-slate-500">Facilitated in Two Departments</p>
                        </div>
                    </div>

                    <div className="grid md:grid-cols-2 gap-8">
                        {rdCenters.map((center, idx) => (
                            <div
                                key={idx}
                                className="bg-white p-8 rounded-3xl border border-slate-100 shadow-lg hover:shadow-2xl transition-all group"
                            >
                                <div className="flex items-start gap-4 mb-6">
                                    <div className={`w-16 h-16 rounded-2xl bg-gradient-to-br ${center.color} flex items-center justify-center group-hover:scale-110 transition-transform`}>
                                        <center.icon className="w-8 h-8 text-white" />
                                    </div>
                                    <div>
                                        <span className="text-sm font-bold text-slate-400 uppercase tracking-wider">{center.department}</span>
                                        <h3 className="text-xl font-black text-[#0F172A]">{center.name}</h3>
                                    </div>
                                </div>
                                <p className="text-slate-600 mb-6">{center.description}</p>
                                <div className="flex flex-wrap gap-2">
                                    {center.focus.map((item, i) => (
                                        <span key={i} className="px-3 py-1 bg-slate-100 text-slate-600 rounded-full text-sm font-medium">
                                            {item}
                                        </span>
                                    ))}
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Recent Publications */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="grid lg:grid-cols-3 gap-8">
                        {/* Publications List */}
                        <div className="lg:col-span-2">
                            <div className="flex items-center gap-4 mb-8">
                                <div className="w-1 h-12 bg-blue-500 rounded-full" />
                                <h2 className="text-3xl font-black text-blue-600">Recent Publications</h2>
                            </div>

                            <div className="space-y-4">
                                {recentPublications.map((pub, idx) => (
                                    <div
                                        key={idx}
                                        className="p-6 border-l-4 border-blue-500 bg-slate-50 hover:bg-blue-50 transition-colors rounded-r-xl"
                                    >
                                        <h3 className="text-lg font-bold text-[#0F172A] mb-2">{pub.title}</h3>
                                        <p className="text-slate-500 text-sm">
                                            {pub.author} | <span className="text-blue-600 font-medium">{pub.journal}</span> | {pub.year}
                                        </p>
                                    </div>
                                ))}
                            </div>
                        </div>

                        {/* R&D Stats Card */}
                        <div>
                            <div className="bg-blue-600 p-8 rounded-3xl text-white sticky top-32">
                                <h3 className="text-2xl font-bold mb-8">R&D Statistics</h3>
                                <div className="space-y-6">
                                    <div>
                                        <div className="text-5xl font-black text-amber-400">178+</div>
                                        <div className="text-blue-100">Journal Publications (2022-25)</div>
                                    </div>
                                    <div>
                                        <div className="text-5xl font-black text-amber-400">8+</div>
                                        <div className="text-blue-100">Patents Filed/Published</div>
                                    </div>
                                    <div>
                                        <div className="text-5xl font-black text-amber-400">15+</div>
                                        <div className="text-blue-100">Ph.D. Faculty</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Key Research Faculty */}
            <section className="py-16 bg-gradient-to-br from-slate-50 to-blue-50">
                <div className="container mx-auto px-4">
                    <div className="flex items-center gap-4 mb-8">
                        <div className="w-12 h-12 rounded-2xl bg-gradient-to-br from-indigo-500 to-purple-600 flex items-center justify-center">
                            <GraduationCap className="w-6 h-6 text-white" />
                        </div>
                        <div>
                            <h2 className="text-3xl font-black text-[#0F172A]">Key Research Faculty</h2>
                            <p className="text-slate-500">Leading researchers driving innovation</p>
                        </div>
                    </div>

                    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {keyResearchFaculty.map((faculty, idx) => (
                            <div
                                key={idx}
                                className="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-lg transition-all"
                            >
                                <div className="flex items-center gap-4 mb-4">
                                    <div className="w-12 h-12 rounded-full bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center text-white font-bold text-lg">
                                        {faculty.name.split(' ').map(n => n[0]).slice(0, 2).join('')}
                                    </div>
                                    <div>
                                        <h3 className="font-bold text-[#0F172A]">{faculty.name}</h3>
                                        <p className="text-sm text-slate-500">{faculty.designation}</p>
                                    </div>
                                </div>
                                <div className="flex flex-wrap gap-2 mb-3">
                                    <span className="px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-sm font-medium">
                                        {faculty.publications} Publications
                                    </span>
                                    {faculty.patents > 0 && (
                                        <span className="px-3 py-1 bg-amber-100 text-amber-700 rounded-full text-sm font-medium">
                                            {faculty.patents} Patents
                                        </span>
                                    )}
                                </div>
                                <p className="text-slate-600 text-sm">
                                    <span className="font-medium">Expertise:</span> {faculty.expertise}
                                </p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Research Areas */}
            <section className="py-16 bg-gradient-to-br from-[#F8F7FF] to-[#FFF8F0]">
                <div className="container mx-auto px-4">
                    <div className="text-center mb-12">
                        <h2 className="text-3xl font-black text-[#0F172A] mb-4">Focus Areas of Research</h2>
                        <p className="text-slate-500 max-w-2xl mx-auto">
                            Our research spans across cutting-edge technologies and emerging domains
                        </p>
                    </div>

                    <div className="grid md:grid-cols-4 gap-6">
                        {[
                            { icon: Cpu, title: "Artificial Intelligence", color: "from-blue-500 to-indigo-600" },
                            { icon: Zap, title: "IoT & Embedded Systems", color: "from-emerald-500 to-teal-600" },
                            { icon: Target, title: "Machine Learning", color: "from-violet-500 to-purple-600" },
                            { icon: Lightbulb, title: "Data Science", color: "from-amber-500 to-orange-600" },
                            { icon: FlaskConical, title: "VLSI Design", color: "from-pink-500 to-rose-600" },
                            { icon: BookOpen, title: "Signal Processing", color: "from-cyan-500 to-blue-600" },
                            { icon: Award, title: "Cloud Computing", color: "from-lime-500 to-green-600" },
                            { icon: TrendingUp, title: "Blockchain", color: "from-red-500 to-orange-600" }
                        ].map((area, idx) => (
                            <div
                                key={idx}
                                className="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-lg transition-all text-center group"
                            >
                                <div className={`w-14 h-14 mx-auto rounded-2xl bg-gradient-to-br ${area.color} flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}>
                                    <area.icon className="w-7 h-7 text-white" />
                                </div>
                                <h3 className="font-bold text-[#0F172A]">{area.title}</h3>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Funding Agencies */}
            <section className="py-16 bg-[#0F172A]">
                <div className="container mx-auto px-4 text-center">
                    <h2 className="text-3xl font-black text-white mb-4">Funding & Collaboration Partners</h2>
                    <p className="text-slate-400 mb-8">We collaborate with leading research and funding organizations</p>
                    <div className="flex flex-wrap justify-center gap-6">
                        {fundingAgencies.map((agency, idx) => (
                            <div
                                key={idx}
                                className="px-8 py-4 bg-white/10 backdrop-blur-sm border border-white/20 rounded-xl text-white font-bold hover:bg-white/20 transition-colors"
                            >
                                {agency}
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Research Policy */}
            <section className="py-16">
                <div className="container mx-auto px-4">
                    <div className="bg-gradient-to-r from-blue-600 to-indigo-700 p-10 rounded-3xl text-white">
                        <div className="grid md:grid-cols-2 gap-8 items-center">
                            <div>
                                <h2 className="text-3xl font-black mb-4">Research Policy</h2>
                                <p className="text-blue-100 mb-6">
                                    Research helps to create new avenues in knowledge, promotes critical thinking and innovation,
                                    and enhances the teaching and learning experience. Our Research Policy facilitates
                                    interdisciplinary dialogue and research across disciplines.
                                </p>
                                <Link
                                    href="/disclosures"
                                    className="inline-flex items-center gap-2 bg-white text-blue-600 px-6 py-3 rounded-xl font-bold hover:bg-blue-50 transition-colors"
                                >
                                    View Full Policy <ExternalLink className="w-4 h-4" />
                                </Link>
                            </div>
                            <div className="grid grid-cols-2 gap-4">
                                {[
                                    "Quality Research",
                                    "Ethics & Integrity",
                                    "Plagiarism Free",
                                    "Industry Linkages"
                                ].map((item, idx) => (
                                    <div key={idx} className="bg-white/10 p-4 rounded-xl text-center">
                                        <span className="font-bold">{item}</span>
                                    </div>
                                ))}
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </>
    );
}
