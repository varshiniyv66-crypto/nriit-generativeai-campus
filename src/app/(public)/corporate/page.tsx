"use client";

import { Handshake, Building2, Users, Briefcase, Award, TrendingUp, ShieldCheck, Sparkles, ArrowRight } from "lucide-react";
import { motion } from "framer-motion";

const partners = [
    { name: "TCS", sector: "IT Services", type: "Platinum Partner" },
    { name: "Infosys", sector: "IT Services", type: "Training Partner" },
    { name: "Wipro", sector: "IT Services", type: "Resource Partner" },
    { name: "Cognizant", sector: "Consulting", type: "Hiring Partner" },
    { name: "Accenture", sector: "Technology", type: "Knowledge Partner" },
    { name: "Capgemini", sector: "Business Services", type: "Strategic Partner" },
];

export default function CorporatePage() {
    return (
        <div className="min-h-screen bg-white pt-32 pb-20">
            <div className="container mx-auto px-4">
                {/* Hero */}
                <div className="text-center max-w-4xl mx-auto mb-20">
                    <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-indigo-50 text-indigo-600 text-[10px] font-bold uppercase tracking-widest mb-4">
                        <Handshake className="w-3 h-3" /> Industry Integration
                    </div>
                    <h1 className="text-5xl md:text-6xl font-black text-slate-900 mb-6 tracking-tight leading-tight">
                        Building Bridges with <br />
                        <span className="text-transparent bg-clip-text bg-gradient-to-r from-indigo-600 to-blue-600">Global Industry</span>
                    </h1>
                    <p className="text-slate-600 text-lg leading-relaxed">
                        NRIIT actively collaborates with world-leading organizations to bridge the gap between academia and industry requirements.
                    </p>
                </div>

                {/* Collaboration Pillars */}
                <div className="grid md:grid-cols-3 gap-8 mb-24">
                    {[
                        { title: "MOU with Tech Giants", desc: "Strategic partnerships for curriculum design, faculty training, and student internships.", icon: ShieldCheck, color: "text-blue-600", bg: "bg-blue-50" },
                        { title: "Center of Excellence", desc: "Dedicated labs established by industry leaders like IBM, Cisco, and AWS on campus.", icon: Building2, color: "text-indigo-600", bg: "bg-indigo-50" },
                        { title: "Executive Education", desc: "Corporate training programs and workshops led by industry veterans for our students.", icon: Users, color: "text-purple-600", bg: "bg-purple-50" },
                    ].map((item, i) => (
                        <motion.div
                            key={i}
                            whileHover={{ y: -10 }}
                            className="p-10 rounded-[2.5rem] bg-white border border-slate-100 shadow-xl shadow-slate-200/50"
                        >
                            <div className={`w-14 h-14 rounded-2xl ${item.bg} ${item.color} flex items-center justify-center mb-8`}>
                                <item.icon className="w-7 h-7" />
                            </div>
                            <h3 className="text-xl font-bold text-slate-900 mb-4">{item.title}</h3>
                            <p className="text-slate-500 text-sm leading-relaxed">{item.desc}</p>
                        </motion.div>
                    ))}
                </div>

                {/* Partner Grid */}
                <div className="bg-slate-50 rounded-[3rem] p-12 md:p-20 relative overflow-hidden">
                    <div className="absolute top-0 right-0 w-64 h-64 bg-indigo-100 rounded-full blur-[100px] opacity-50" />

                    <div className="text-center mb-16 relative z-10">
                        <h2 className="text-3xl font-bold text-slate-900 mb-4">Our Corporate Partners</h2>
                        <p className="text-slate-500">Trusted by the best in the business for talent acquisition and research.</p>
                    </div>

                    <div className="grid grid-cols-2 lg:grid-cols-3 gap-6 relative z-10">
                        {partners.map((partner, i) => (
                            <div key={i} className="bg-white p-8 rounded-3xl border border-slate-200 hover:border-indigo-500 transition-colors group">
                                <div className="text-2xl font-black text-slate-300 group-hover:text-indigo-600 transition-colors mb-4">{partner.name}</div>
                                <div className="text-xs font-bold text-slate-400 uppercase tracking-widest">{partner.sector}</div>
                                <div className="mt-4 pt-4 border-t border-slate-100 flex items-center justify-between">
                                    <span className="text-[10px] font-bold text-slate-500">{partner.type}</span>
                                    <ArrowRight className="w-3 h-3 text-indigo-500" />
                                </div>
                            </div>
                        ))}
                    </div>
                </div>

                {/* Call to action */}
                <div className="mt-24 text-center">
                    <h2 className="text-2xl font-bold text-slate-900 mb-6">Interested in collaborating with us?</h2>
                    <button className="px-10 py-4 rounded-full bg-slate-900 text-white font-bold hover:bg-indigo-600 transition-all shadow-xl hover:shadow-indigo-200">
                        Partner with NRIIT
                    </button>
                </div>
            </div>
        </div>
    );
}
