"use client";

import { Briefcase, GraduationCap, Users, Heart, Star, Sparkles, MapPin, Clock, ArrowRight, Search, Building2 } from "lucide-react";
import { motion } from "framer-motion";

const openings = [
    { title: "Professor - Artificial Intelligence", dept: "CSE", type: "Full-Time", location: "On-Campus" },
    { title: "Assistant Professor - VLSI Design", dept: "ECE", type: "Full-Time", location: "On-Campus" },
    { title: "Placement Coordinator", dept: "Administration", type: "Full-Time", location: "On-Campus" },
    { title: "Research Assistant", dept: "R&D Cell", type: "Contract", location: "Flexible" },
];

export default function CareersPage() {
    return (
        <div className="min-h-screen bg-slate-50 pt-32 pb-20">
            <div className="container mx-auto px-4">
                {/* Hero */}
                <div className="max-w-4xl mx-auto text-center mb-20">
                    <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-50 text-emerald-600 text-[10px] font-bold uppercase tracking-widest mb-4">
                        <Users className="w-3 h-3" /> Join Our Team
                    </div>
                    <h1 className="text-6xl font-black text-slate-900 mb-6 tracking-tight">
                        Grow Your <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-600 to-teal-600">Academic Career</span>
                    </h1>
                    <p className="text-slate-600 text-lg leading-relaxed">
                        Be part of a dynamic, forward-thinking institution where innovation meets tradition. We are looking for passionate educators and professionals to shape the leaders of tomorrow.
                    </p>
                </div>

                {/* Culture Cards */}
                <div className="grid md:grid-cols-3 gap-8 mb-32">
                    {[
                        { title: "Intellectual Growth", desc: "Access to global journals, research grants, and international conference funding.", icon: GraduationCap, color: "text-blue-600" },
                        { title: "Work-Life Balance", desc: "Supportive environment with family-friendly policies and a sprawling green campus.", icon: Heart, color: "text-rose-600" },
                        { title: "Innovation First", desc: "Freedom to implement new teaching methodologies and lead departmental projects.", icon: Sparkles, color: "text-amber-600" },
                    ].map((card, i) => (
                        <div key={i} className="bg-white p-10 rounded-[2.5rem] border border-slate-200 shadow-xl shadow-slate-200/50 group hover:-translate-y-2 transition-all">
                            <div className={`w-14 h-14 rounded-2xl bg-white flex items-center justify-center mb-8 shadow-inner border border-slate-100 ${card.color}`}>
                                <card.icon className="w-7 h-7" />
                            </div>
                            <h3 className="text-xl font-bold text-slate-900 mb-4">{card.title}</h3>
                            <p className="text-slate-500 text-sm leading-relaxed">{card.desc}</p>
                        </div>
                    ))}
                </div>

                {/* Job Openings */}
                <div className="max-w-5xl mx-auto bg-white rounded-[3rem] p-8 md:p-16 border border-slate-200 shadow-2xl relative overflow-hidden">
                    <div className="absolute top-0 left-0 w-full h-2 bg-gradient-to-r from-emerald-500 to-teal-500" />

                    <div className="flex flex-col md:flex-row justify-between items-end mb-12 gap-6">
                        <div>
                            <h2 className="text-3xl font-bold text-slate-900 mb-2">Current Openings</h2>
                            <p className="text-slate-500">Explore opportunities to make an impact.</p>
                        </div>
                        <div className="flex bg-slate-50 rounded-2xl p-2 border border-slate-200 w-full md:w-auto">
                            <Search className="w-5 h-5 text-slate-400 m-2" />
                            <input type="text" placeholder="Search departments..." className="bg-transparent outline-none text-sm w-full md:w-64" />
                        </div>
                    </div>

                    <div className="space-y-4">
                        {openings.map((job, i) => (
                            <div key={i} className="p-6 rounded-2xl border border-slate-100 hover:border-emerald-500 hover:bg-emerald-50/30 transition-all flex flex-col md:flex-row justify-between items-center gap-6 group">
                                <div className="flex items-start gap-5">
                                    <div className="w-12 h-12 rounded-xl bg-slate-50 flex items-center justify-center text-slate-400 group-hover:bg-emerald-100 group-hover:text-emerald-600 transition-colors">
                                        <Building2 className="w-6 h-6" />
                                    </div>
                                    <div>
                                        <h3 className="font-bold text-slate-900 mb-1 group-hover:text-emerald-700 transition-colors">{job.title}</h3>
                                        <div className="flex items-center gap-4 text-xs font-bold text-slate-400">
                                            <span className="flex items-center gap-1 uppercase tracking-wider"><Briefcase className="w-3 h-3" /> {job.dept}</span>
                                            <span className="flex items-center gap-1 uppercase tracking-wider"><MapPin className="w-3 h-3" /> {job.location}</span>
                                            <span className="flex items-center gap-1 uppercase tracking-wider"><Clock className="w-3 h-3" /> {job.type}</span>
                                        </div>
                                    </div>
                                </div>
                                <button className="px-6 py-3 rounded-xl bg-slate-900 text-white font-bold text-sm hover:bg-emerald-600 transition-all flex items-center gap-2">
                                    Apply Now <ArrowRight className="w-4 h-4" />
                                </button>
                            </div>
                        ))}
                    </div>

                    <div className="mt-12 p-8 rounded-2xl bg-slate-50 border border-slate-100 text-center">
                        <p className="text-slate-600 text-sm">Don't see a role that fits? Send your CV to <span className="font-bold text-slate-900">hr@nriit.ac.in</span> and we'll keep you in mind for future openings.</p>
                    </div>
                </div>
            </div>
        </div>
    );
}
