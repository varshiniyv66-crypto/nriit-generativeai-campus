
"use client";

import { useParams } from "next/navigation";
import { departments as staticDepartments } from "@/data/departments";
import { Users, Heart, Target, Home, ShieldCheck } from "lucide-react";
import { motion } from "framer-motion";

export default function MentoringPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const deptInfo = staticDepartments[deptCode.toLowerCase()];

    const containerVariants = {
        hidden: { opacity: 0 },
        visible: { opacity: 1, transition: { staggerChildren: 0.2 } }
    };

    const itemVariants = {
        hidden: { opacity: 0, y: 20 },
        visible: { opacity: 1, y: 0 }
    };

    return (
        <div className="min-h-screen bg-[#FDFCF8] text-slate-900 font-sans pb-20 selection:bg-rose-100">
            {/* 1. HERO SECTION: Warm & Caring (Rose/White Theme) */}
            <div className="relative pt-24 pb-20 px-6 overflow-hidden">
                {/* Luminous Background Mesh */}
                <div className="absolute top-[-20%] left-[-10%] w-[800px] h-[800px] bg-gradient-to-r from-rose-50/40 via-orange-50/20 to-transparent rounded-full blur-[100px] opacity-60 pointer-events-none" />

                <div className="container mx-auto relative z-10 text-center">
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="inline-flex items-center gap-2 mb-6"
                    >
                        <div className="px-4 py-1.5 bg-white/80 backdrop-blur-md rounded-full border border-slate-200 shadow-sm text-slate-500 font-bold tracking-widest uppercase text-[10px] flex items-center gap-2">
                            Student Support
                        </div>
                        <span className="w-1 h-1 bg-slate-300 rounded-full" />
                        <span className="text-xs font-bold text-rose-600 uppercase tracking-widest">Guidance & Growth</span>
                    </motion.div>

                    <motion.h1
                        initial={{ opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        className="text-5xl md:text-7xl font-black text-slate-900 tracking-tighter mb-6"
                    >
                        Student <span className="text-transparent bg-clip-text bg-gradient-to-r from-rose-500 to-orange-500">Mentoring</span>
                    </motion.h1>

                    <motion.p
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: 0.2 }}
                        className="text-xl text-slate-500 max-w-2xl mx-auto font-medium leading-relaxed"
                    >
                        A robust support system ensuring every student has a guide, a guardian, and a goals-partner throughout their 4-year journey.
                    </motion.p>
                </div>
            </div>

            {/* 2. MENTORING PROCESS FLOW */}
            <div className="container mx-auto px-6 max-w-6xl">
                <motion.div
                    variants={containerVariants}
                    initial="hidden"
                    animate="visible"
                    className="grid md:grid-cols-3 gap-8 relative"
                >
                    {/* Connecting Line (Desktop) */}
                    <div className="hidden md:block absolute top-12 left-0 w-full h-0.5 bg-slate-100 -z-10" />

                    {[
                        {
                            step: "01",
                            title: "Allocation",
                            desc: "Every student is assigned a dedicated faculty mentor upon joining.",
                            icon: Users,
                            color: "blue"
                        },
                        {
                            step: "02",
                            title: "Regular Interaction",
                            desc: "Weekly meetings to discuss academic progress and personal well-being.",
                            icon: Heart,
                            color: "rose"
                        },
                        {
                            step: "03",
                            title: "Holistic Growth",
                            desc: "Guidance for placements, higher studies, and career planning.",
                            icon: Target,
                            color: "emerald"
                        }
                    ].map((item, i) => (
                        <motion.div
                            key={i}
                            variants={itemVariants}
                            className="bg-white p-10 rounded-[2.5rem] border border-slate-100 shadow-[0_10px_40px_-10px_rgba(0,0,0,0.05)] text-center relative overflow-hidden group hover:-translate-y-2 transition-transform duration-500"
                        >
                            <div className={`absolute top-0 w-full h-2 bg-${item.color}-500 left-0 opacity-0 group-hover:opacity-100 transition-opacity`} />

                            <div className="w-16 h-16 bg-slate-50 rounded-2xl flex items-center justify-center mx-auto mb-6 text-slate-400 font-black text-xl border border-slate-100 group-hover:bg-slate-900 group-hover:text-white transition-colors">
                                {item.step}
                            </div>

                            <h3 className="text-2xl font-bold text-slate-900 mb-4">{item.title}</h3>
                            <p className="text-slate-500 font-medium leading-relaxed">
                                {item.desc}
                            </p>
                        </motion.div>
                    ))}
                </motion.div>

                {/* 3. KEY METRIC */}
                <div className="mt-20 bg-slate-900 rounded-[3rem] p-12 text-center text-white relative overflow-hidden">
                    <div className="absolute top-0 right-0 w-64 h-64 bg-rose-500/20 rounded-full blur-[80px]" />
                    <div className="relative z-10 flex flex-col items-center">
                        <ShieldCheck className="w-12 h-12 text-rose-400 mb-6" />
                        <h2 className="text-4xl md:text-5xl font-black mb-4">1:20 Mentor-Mentee Ratio</h2>
                        <p className="text-slate-400 max-w-xl text-lg">
                            We strictly maintain an optimal ratio to ensure personalized attention for every single student at NRIIT.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    );
}
