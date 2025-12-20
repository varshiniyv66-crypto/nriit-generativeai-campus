"use client";

import { Award, GraduationCap, Globe, Users, Briefcase, Heart, Star, Sparkles, ArrowRight, MapPin, Building2 } from "lucide-react";
import { motion } from "framer-motion";
import Link from "next/link";

const alumniSpotlights = [
    { name: "Rahul Sharma", batch: "2012-16", company: "Google", role: "Sr. Software Engineer", img: "https://i.pravatar.cc/150?u=rahul" },
    { name: "Priya Varma", batch: "2014-18", company: "Microsoft", role: "Product Manager", img: "https://i.pravatar.cc/150?u=priya" },
    { name: "Srinivas K.", batch: "2010-14", company: "Amazon", role: "Solutions Architect", img: "https://i.pravatar.cc/150?u=srini" },
    { name: "Ananya R.", batch: "2015-19", company: "Adobe", role: "UX Lead", img: "https://i.pravatar.cc/150?u=ananya" },
];

const stats = [
    { label: "Global Network", value: "15,000+", icon: Globe, color: "from-blue-500 to-indigo-600" },
    { label: "Top Fortune 500", value: "200+", icon: Award, color: "from-[#D4AF37] to-[#F5A201]" },
    { label: "Active Mentors", value: "500+", icon: Heart, color: "from-rose-500 to-pink-600" },
    { label: "Entrepreneurs", value: "50+", icon: Star, color: "from-violet-500 to-purple-600" },
];

export default function AlumniPage() {
    return (
        <>
            {/* Hero Section - Premium Dark Navy + Gold */}
            <section className="pt-32 pb-20 bg-gradient-to-br from-[#0F172A] via-[#1e293b] to-[#0F172A] relative overflow-hidden">
                <div className="absolute inset-0 bg-[url('/pattern.svg')] opacity-5" />
                <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-[#D4AF37]/10 rounded-full blur-[150px]" />
                <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-blue-500/10 rounded-full blur-[150px]" />

                <div className="container mx-auto px-4 relative z-10">
                    <div className="grid lg:grid-cols-2 gap-16 items-center">
                        <motion.div
                            initial={{ opacity: 0, x: -30 }}
                            animate={{ opacity: 1, x: 0 }}
                            className="space-y-8"
                        >
                            <div>
                                <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[#D4AF37]/20 border border-[#D4AF37]/30 text-[#D4AF37] text-sm font-bold tracking-wide mb-6">
                                    <Users className="w-4 h-4" />
                                    Global Community
                                </div>
                                <h1 className="text-5xl md:text-6xl font-black text-white mb-6 leading-tight">
                                    NRIIT <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#FFE082]">Alumni</span> <br />
                                    Legacy Network
                                </h1>
                                <p className="text-xl text-slate-300 max-w-xl">
                                    Our graduates are our greatest pride. From Silicon Valley to Indian startups, the NRIIT legacy lives through thousands of leaders shaping the future.
                                </p>
                            </div>

                            <div className="flex flex-wrap gap-4">
                                <Link href="/enquire" className="px-8 py-4 rounded-2xl bg-[#D4AF37] hover:bg-[#FFE082] text-[#0F172A] font-bold shadow-lg shadow-[#D4AF37]/30 hover:scale-105 transition-all flex items-center gap-2">
                                    Join Network <ArrowRight className="w-5 h-5" />
                                </Link>
                                <button className="px-8 py-4 rounded-2xl bg-white/10 border border-white/20 text-white font-bold hover:bg-white/20 transition-all backdrop-blur-sm">
                                    Success Stories
                                </button>
                            </div>
                        </motion.div>

                        <motion.div
                            initial={{ opacity: 0, scale: 0.8 }}
                            animate={{ opacity: 1, scale: 1 }}
                            className="relative hidden lg:block"
                        >
                            <div className="grid grid-cols-2 gap-4">
                                {alumniSpotlights.map((alumnus, i) => (
                                    <div
                                        key={i}
                                        className={`p-6 rounded-3xl bg-white/10 backdrop-blur-sm border border-white/10 hover:border-[#D4AF37]/50 transition-all ${i % 2 !== 0 ? 'translate-y-12' : ''}`}
                                    >
                                        <div className="w-16 h-16 rounded-2xl overflow-hidden mb-4 ring-4 ring-[#D4AF37]/30">
                                            <img src={alumnus.img} alt={alumnus.name} className="w-full h-full object-cover" />
                                        </div>
                                        <h3 className="font-bold text-white">{alumnus.name}</h3>
                                        <p className="text-xs text-[#D4AF37] font-bold mb-3">{alumnus.batch}</p>
                                        <div className="flex items-center gap-2 text-[10px] font-black uppercase text-slate-400">
                                            <Briefcase className="w-3 h-3" /> {alumnus.company}
                                        </div>
                                        <p className="text-xs text-slate-500 mt-1">{alumnus.role}</p>
                                    </div>
                                ))}
                            </div>
                        </motion.div>
                    </div>
                </div>
            </section>

            {/* Stats Section */}
            <section className="py-12 bg-white -mt-8 relative z-20">
                <div className="container mx-auto px-4">
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                        {stats.map((stat, i) => (
                            <div key={i} className="group text-center p-8 rounded-3xl bg-white border-2 border-slate-100 hover:border-[#D4AF37] shadow-xl hover:shadow-2xl transition-all">
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

            {/* Engagement Section */}
            <section className="py-20 bg-slate-50">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto">
                        <div className="text-center mb-16">
                            <span className="text-[#D4AF37] font-bold text-xs uppercase tracking-[0.2em] mb-3 block">Give Back</span>
                            <h2 className="text-4xl md:text-5xl font-black text-[#0F172A] mb-4">
                                How to <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#F5A201]">Engage</span>
                            </h2>
                            <p className="text-slate-500">Stay connected and give back to the institution that shaped you.</p>
                        </div>

                        <div className="grid md:grid-cols-3 gap-8">
                            {[
                                { title: "Mentorship", desc: "Guide the next generation of NRIITians as a career mentor.", icon: GraduationCap },
                                { title: "Guest Lectures", desc: "Share your industry expertise through webinars and workshops.", icon: Sparkles },
                                { title: "Placements", desc: "Help our students find opportunities in your current organization.", icon: Briefcase },
                            ].map((way, i) => (
                                <div key={i} className="group p-8 rounded-3xl bg-white hover:shadow-2xl transition-all border-2 border-slate-100 hover:border-[#D4AF37]">
                                    <div className="w-14 h-14 rounded-2xl bg-gradient-to-br from-[#D4AF37] to-[#F5A201] flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                                        <way.icon className="w-7 h-7 text-white" />
                                    </div>
                                    <h3 className="text-xl font-bold text-[#0F172A] mb-3">{way.title}</h3>
                                    <p className="text-sm text-slate-500 leading-relaxed">{way.desc}</p>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA */}
            <section className="py-16 bg-gradient-to-r from-[#013C58] to-[#00537A]">
                <div className="container mx-auto px-4 text-center">
                    <h2 className="text-3xl md:text-4xl font-black text-white mb-4">
                        Reconnect with Your Alma Mater
                    </h2>
                    <p className="text-slate-300 mb-8 max-w-2xl mx-auto">
                        Join our thriving alumni network and be part of the NRIIT legacy.
                    </p>
                    <Link
                        href="/contact"
                        className="inline-flex items-center gap-2 px-8 py-4 bg-[#D4AF37] hover:bg-[#FFE082] text-[#0F172A] rounded-2xl font-bold transition-all hover:scale-105"
                    >
                        Connect With Us
                        <ArrowRight className="w-5 h-5" />
                    </Link>
                </div>
            </section>
        </>
    );
}
