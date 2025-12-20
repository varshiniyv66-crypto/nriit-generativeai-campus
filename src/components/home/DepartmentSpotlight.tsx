"use client";

import { useState } from "react";
import Link from "next/link";
import { ArrowRight, Users } from "lucide-react";

// Premium Department Data with Flagship Colors
const departments = [
    {
        code: "CSE", name: "Computer Science", icon: "💻",
        accent: "hover:!border-blue-500 hover:shadow-2xl hover:shadow-blue-500/40",
        textAccent: "group-hover:text-blue-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-blue-600",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-blue-50",
        gradient: "from-blue-500 to-blue-600",
        students: 480,
        image: "/banners/cse.png" // Using local generated banners
    },
    {
        code: "CSE-DS", name: "Data Science", icon: "📊",
        accent: "hover:!border-purple-500 hover:shadow-2xl hover:shadow-purple-500/40",
        textAccent: "group-hover:text-purple-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-purple-600",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-purple-50",
        gradient: "from-purple-500 to-purple-600",
        students: 120,
        image: "/banners/cse.png"
    },
    {
        code: "CSE-AI", name: "AI & ML", icon: "🤖",
        accent: "hover:!border-pink-500 hover:shadow-2xl hover:shadow-pink-500/40",
        textAccent: "group-hover:text-pink-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-pink-600",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-pink-50",
        gradient: "from-pink-500 to-pink-600",
        students: 120,
        image: "/banners/cse.png"
    },
    {
        code: "IT", name: "Info Tech", icon: "🌐",
        accent: "hover:!border-emerald-500 hover:shadow-2xl hover:shadow-emerald-500/40",
        textAccent: "group-hover:text-emerald-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-emerald-600",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-emerald-50",
        gradient: "from-emerald-500 to-emerald-600",
        students: 240,
        image: "/banners/it.png"
    },
    {
        code: "ECE", name: "Electronics", icon: "📡",
        accent: "hover:!border-amber-500 hover:shadow-2xl hover:shadow-amber-500/40",
        textAccent: "group-hover:text-amber-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-amber-600",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-amber-50",
        gradient: "from-amber-500 to-amber-600",
        students: 360,
        image: "/banners/ece.png"
    },
    {
        code: "CIVIL", name: "Civil Engg", icon: "👷",
        accent: "hover:!border-red-500 hover:shadow-2xl hover:shadow-red-500/40",
        textAccent: "group-hover:text-red-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-red-600",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-red-50",
        gradient: "from-red-500 to-red-600",
        students: 120,
        image: "/banners/civil.png"
    },
    {
        code: "MBA", name: "Business Admin", icon: "📈",
        accent: "hover:!border-sky-500 hover:shadow-2xl hover:shadow-sky-500/40",
        textAccent: "group-hover:text-sky-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-sky-600",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-sky-50",
        gradient: "from-sky-500 to-sky-600",
        students: 120,
        image: "/banners/mba.png"
    },
    {
        code: "MCA", name: "Computer App", icon: "💻",
        accent: "hover:!border-indigo-500 hover:shadow-2xl hover:shadow-indigo-500/40",
        textAccent: "group-hover:text-indigo-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-indigo-600",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-indigo-50",
        gradient: "from-indigo-500 to-indigo-600",
        students: 120,
        image: "/banners/mca.png"
    },
    {
        code: "BSH", name: "Science & Humanities", icon: "⚛️",
        accent: "hover:!border-slate-500 hover:shadow-2xl hover:shadow-slate-500/40",
        textAccent: "group-hover:text-slate-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-slate-600",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-slate-50",
        gradient: "from-slate-500 to-slate-600",
        students: 120,
        image: "/banners/civil.png"
    },
    {
        code: "EVT", name: "EVT", icon: "⚡",
        accent: "hover:!border-yellow-500 hover:shadow-2xl hover:shadow-yellow-500/40",
        textAccent: "group-hover:text-yellow-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-yellow-500",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-yellow-50",
        gradient: "from-yellow-400 to-yellow-600",
        students: 120,
        image: "/banners/ece.png"
    },
    {
        code: "MTECH", name: "M.Tech Programs", icon: "🎓",
        accent: "hover:!border-orange-500 hover:shadow-2xl hover:shadow-orange-500/40",
        textAccent: "group-hover:text-orange-600",
        bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-orange-500",
        cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-orange-50",
        gradient: "from-orange-400 to-orange-600",
        students: 60,
        image: "/banners/cse.png"
    }
];

export default function DepartmentSpotlight() {
    const [activeBranch, setActiveBranch] = useState(0);

    return (
        <div className="w-full bg-slate-50/50 backdrop-blur-xl border border-white/20 rounded-[2rem] shadow-2xl overflow-hidden grid grid-cols-1 lg:grid-cols-[250px_1fr_250px] min-h-[700px]">

            {/* LEFT MENU */}
            <div className="bg-white/40 border-r border-white/20 flex flex-col backdrop-blur-md">
                <div className="p-6 border-b border-white/10">
                    <h3 className="text-slate-500 text-xs font-bold uppercase tracking-[0.2em]">Engineering</h3>
                </div>
                <div className="flex-1 overflow-y-auto p-4 space-y-2 custom-scrollbar">
                    {departments.slice(0, 5).map((dept, index) => (
                        <button
                            key={dept.code}
                            onClick={() => setActiveBranch(index)}
                            className={`w-full text-left p-4 rounded-xl font-semibold text-sm transition-all duration-300 flex items-center gap-3 group relative overflow-hidden ${activeBranch === index
                                ? "bg-gradient-to-r from-[#D4AF37] to-[#B4941F] text-white shadow-lg shadow-[#D4AF37]/20 scale-105"
                                : "bg-white hover:bg-slate-50 text-slate-600 hover:text-slate-900 hover:shadow-md"
                                }`}
                        >
                            <span className={`text-xl transition-transform duration-300 ${activeBranch === index ? 'scale-110' : 'group-hover:scale-110'}`}>{dept.icon}</span>
                            <div className="flex flex-col z-10">
                                <span className="text-sm font-bold tracking-tight">{dept.name}</span>
                                <span className={`text-[10px] font-medium uppercase tracking-wider ${activeBranch === index ? 'text-white/80' : 'text-slate-400'}`}>{dept.code}</span>
                            </div>
                        </button>
                    ))}
                </div>
            </div>

            {/* CENTER CONTENT */}
            <div className="p-8 lg:p-12 relative flex flex-col justify-center bg-white/60 backdrop-blur-sm">
                <div className="absolute inset-0 bg-[url('/grid-pattern.svg')] opacity-[0.03] pointer-events-none" />

                <div className="space-y-8 animate-fade-in relative z-10" key={activeBranch}>
                    <div>
                        <span className="px-3 py-1 rounded-full border border-slate-200 bg-white/50 text-[10px] font-bold uppercase tracking-widest text-slate-500 mb-4 inline-block shadow-sm">
                            Featured Department
                        </span>
                        <h2 className="text-4xl lg:text-5xl font-black text-slate-800 leading-tight tracking-tight">
                            School of <span className={`text-transparent bg-clip-text bg-gradient-to-r ${departments[activeBranch].gradient}`}>
                                {departments[activeBranch].name}
                            </span>
                        </h2>
                    </div>

                    <div className="flex items-center gap-6 text-xs font-bold text-slate-500 uppercase tracking-widest">
                        <span className="flex items-center gap-2">
                            <span className="w-2 h-2 rounded-full bg-[#D4AF37]"></span>
                            Code: {departments[activeBranch].code}
                        </span>
                        <span className="w-px h-4 bg-slate-300"></span>
                        <span className="flex items-center gap-2">
                            <Users className="w-3 h-3" />
                            {departments[activeBranch].students}+ Scholars
                        </span>
                    </div>

                    <p className="text-slate-600 text-lg leading-relaxed max-w-2xl">
                        Join the elite league of {departments[activeBranch].name} professionals.
                        Our curriculum is designed to foster innovation, research, and industry-ready skills with world-class infrastructure.
                    </p>

                    {/* Dynamic Visual - Bigger Image */}
                    <div className="relative h-64 lg:h-80 rounded-3xl overflow-hidden shadow-2xl bg-slate-900 group ring-4 ring-white ring-offset-4 ring-offset-slate-50">
                        <div
                            className="absolute inset-0 bg-cover bg-center transition-transform duration-[10s] ease-out group-hover:scale-110"
                            style={{ backgroundImage: `url(${departments[activeBranch].image})` }}
                        ></div>
                        <div className={`absolute inset-0 opacity-80 bg-gradient-to-r ${departments[activeBranch].gradient} mix-blend-multiply transition-opacity duration-500 group-hover:opacity-60`}></div>

                        <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-80" />

                        {/* Floating Icon */}
                        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
                            <div className="w-24 h-24 rounded-3xl bg-white/10 backdrop-blur-md border border-white/20 flex items-center justify-center shadow-2xl group-hover:scale-110 transition-transform duration-500">
                                <span className="text-5xl drop-shadow-lg">{departments[activeBranch].icon}</span>
                            </div>
                        </div>

                        {/* Glass Details Badge */}
                        <div className="absolute bottom-6 left-6 right-6 flex justify-between items-end">
                            <div className="bg-black/40 backdrop-blur-xl px-5 py-3 rounded-2xl border border-white/10 shadow-lg">
                                <div className="font-bold text-white text-base">Advanced Laboratories</div>
                                <div className="text-xs text-white/70">Industry Standard Equipment</div>
                            </div>

                            <div className={`w-12 h-12 rounded-full flex items-center justify-center text-white bg-gradient-to-r ${departments[activeBranch].gradient} shadow-lg shadow-black/20 group-hover:scale-110 transition-transform`}>
                                <ArrowRight className="w-5 h-5" />
                            </div>
                        </div>
                    </div>
                </div>

                <div className="flex gap-4 mt-auto pt-8 border-t border-slate-200/60">
                    <Link href={`/departments/${departments[activeBranch].code.toLowerCase()}`} className="flex-1 px-8 py-4 bg-[#0F172A] text-white font-bold rounded-2xl shadow-xl shadow-slate-900/20 hover:bg-slate-800 hover:scale-[1.02] active:scale-[0.98] transition-all flex items-center justify-center gap-3 text-sm tracking-wide">
                        EXPLORE DEPARTMENT <ArrowRight className="w-4 h-4" />
                    </Link>
                    <button className="flex-none px-8 py-4 border-2 border-[#D4AF37] text-[#D4AF37] font-bold rounded-2xl hover:bg-[#D4AF37] hover:text-white hover:scale-[1.02] active:scale-[0.98] transition-all text-sm tracking-wide shadow-lg shadow-[#D4AF37]/10 uppercase">
                        Apply Now
                    </button>
                </div>
            </div>

            {/* RIGHT MENU */}
            <div className="bg-slate-50/50 border-l border-white/20 flex flex-col backdrop-blur-md">
                <div className="p-6 border-b border-white/10">
                    <h3 className="text-slate-500 text-xs font-bold uppercase tracking-[0.2em]">More Schools</h3>
                </div>
                <div className="flex-1 overflow-y-auto p-4 space-y-2 custom-scrollbar">
                    {departments.slice(5, 11).map((dept, index) => (
                        <button
                            key={dept.code}
                            onClick={() => setActiveBranch(index + 5)}
                            className={`w-full text-left p-4 rounded-xl font-semibold text-sm transition-all duration-300 flex items-center gap-3 group border border-transparent ${activeBranch === index + 5
                                ? "bg-white border-slate-200 text-[#D4AF37] shadow-lg border-l-4 border-l-[#D4AF37]"
                                : "hover:bg-white hover:border-slate-100 text-slate-600 hover:text-slate-900"
                                }`}
                        >
                            <div className="w-8 h-8 rounded-lg bg-slate-100 flex items-center justify-center text-lg shadow-sm group-hover:scale-110 transition-transform">{dept.icon}</div>
                            <div className="flex flex-col">
                                <span className="text-xs font-bold">{dept.name}</span>
                                <span className="text-[9px] font-medium uppercase tracking-wider text-slate-400">{dept.code}</span>
                            </div>
                        </button>
                    ))}
                </div>
            </div>
        </div>
    );
}
