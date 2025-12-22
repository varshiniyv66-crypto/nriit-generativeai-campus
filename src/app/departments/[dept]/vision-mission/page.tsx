"use client";

import { useParams } from "next/navigation";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { departments as staticDepartments } from "@/data/departments";
import { DEPARTMENT_ACADEMIC_DATA } from "@/data/academic-outcomes";
import { Target, Lightbulb, Home, CheckCircle2, Star } from "lucide-react";
import { motion } from "framer-motion";

export default function VisionMission() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const staticInfo = staticDepartments[deptCode.toLowerCase()];
    const academicData = DEPARTMENT_ACADEMIC_DATA[deptCode];

    return (
        <div className="space-y-10 pb-20">
            {/* Back Navigation */}
            <motion.div
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                className="mb-4"
            >
                <a
                    href="/"
                    className="inline-flex items-center text-[#1E4080] hover:text-[#2563EB] font-semibold transition-all group"
                >
                    <Home className="w-5 h-5 mr-2 group-hover:scale-110 transition-transform" />
                    Back to Main Home
                </a>
            </motion.div>

            {/* Strategic Header */}
            <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                className="relative overflow-hidden bg-gradient-to-br from-[#1E4080] via-[#2563EB] to-[#3B82F6] text-white p-12 rounded-[2rem] shadow-2xl border border-white/10"
            >
                <div className="absolute top-0 right-0 w-80 h-80 bg-white/5 rounded-full -translate-y-1/2 translate-x-1/2 blur-[80px]" />
                <div className="absolute bottom-0 left-0 w-64 h-64 bg-[#E5A818]/10 rounded-full translate-y-1/2 -translate-x-1/2 blur-[60px]" />

                <div className="relative z-10">
                    <div className="flex items-center gap-3 mb-4">
                        <Badge className="bg-[#E5A818] text-[#1E4080] hover:bg-[#E5A818] px-4 py-1.5 text-sm font-black uppercase tracking-widest">
                            Strategic Direction
                        </Badge>
                        <Badge variant="outline" className="text-white border-white/30 backdrop-blur-md px-4 py-1.5 text-sm font-bold">
                            NAAC A+ Accredited
                        </Badge>
                    </div>

                    <h1 className="text-5xl md:text-6xl font-black mb-3 tracking-tight">
                        Vision & Mission
                    </h1>
                    <p className="text-xl text-blue-100 font-light max-w-2xl leading-relaxed">
                        Defining our commitment to academic excellence and future-ready engineering.
                    </p>
                </div>
            </motion.div>

            <div className="grid lg:grid-cols-2 gap-8">
                {/* Vision Card */}
                <motion.div
                    initial={{ opacity: 0, scale: 0.95 }}
                    animate={{ opacity: 1, scale: 1 }}
                    transition={{ delay: 0.1 }}
                >
                    <Card className="h-full border-none shadow-2xl bg-white rounded-[2rem] overflow-hidden group">
                        <div className="h-3 bg-gradient-to-r from-blue-600 to-cyan-400" />
                        <CardHeader className="p-10">
                            <CardTitle className="flex items-center gap-4 text-3xl font-black text-[#1E4080]">
                                <div className="p-3 bg-blue-50 rounded-2xl group-hover:rotate-12 transition-transform">
                                    <Target className="w-10 h-10 text-blue-600" />
                                </div>
                                Our Vision
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="px-10 pb-12">
                            <div className="relative p-10 bg-gradient-to-br from-blue-50 to-white rounded-[2rem] border border-blue-100">
                                <span className="absolute -top-10 -left-4 text-[10rem] text-blue-100/50 font-serif pointer-events-none opacity-50">&ldquo;</span>
                                <p className="text-3xl text-gray-800 leading-tight font-black italic relative z-10 tracking-tight">
                                    {academicData?.vision || staticInfo?.vision || 'To be a premier department creating globally competent professionals...'}
                                </p>
                                <span className="absolute -bottom-24 -right-4 text-[10rem] text-blue-100/50 font-serif pointer-events-none opacity-50">&rdquo;</span>
                            </div>
                        </CardContent>
                    </Card>
                </motion.div>

                {/* Mission Card */}
                <motion.div
                    initial={{ opacity: 0, scale: 0.95 }}
                    animate={{ opacity: 1, scale: 1 }}
                    transition={{ delay: 0.2 }}
                >
                    <Card className="h-full border-none shadow-2xl bg-white rounded-[2rem] overflow-hidden group">
                        <div className="h-3 bg-gradient-to-r from-green-600 to-emerald-400" />
                        <CardHeader className="p-10">
                            <CardTitle className="flex items-center gap-4 text-3xl font-black text-[#1E4080]">
                                <div className="p-3 bg-green-50 rounded-2xl group-hover:rotate-12 transition-transform">
                                    <Lightbulb className="w-10 h-10 text-green-600" />
                                </div>
                                Our Mission
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="px-10 pb-12">
                            <div className="space-y-6">
                                {(academicData?.mission || staticInfo?.mission || []).map((mission: string, idx: number) => (
                                    <div key={idx} className="flex gap-6 p-6 bg-gradient-to-r from-green-50 to-white rounded-2xl border border-green-100 hover:shadow-lg transition-transform hover:-translate-y-1">
                                        <div className="flex-shrink-0 w-12 h-12 rounded-2xl bg-green-600 text-white flex items-center justify-center font-black text-xl shadow-lg shadow-green-200">
                                            M{idx + 1}
                                        </div>
                                        <p className="text-gray-800 text-xl leading-relaxed font-semibold">
                                            {mission}
                                        </p>
                                    </div>
                                ))}
                            </div>
                        </CardContent>
                    </Card>
                </motion.div>
            </div>

            {/* Alignment Section */}
            <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.3 }}
            >
                <Card className="border-none shadow-2xl bg-[#1E4080] text-white rounded-[2rem] p-12 relative overflow-hidden">
                    <div className="absolute top-0 right-0 w-64 h-64 bg-white/5 rounded-full blur-[60px]" />
                    <div className="flex flex-col md:flex-row items-center gap-10 relative z-10">
                        <div className="flex-shrink-0 p-8 bg-white/10 rounded-[2rem] backdrop-blur-xl border border-white/20">
                            <Star className="w-16 h-16 text-[#E5A818]" />
                        </div>
                        <div className="flex-1">
                            <h2 className="text-3xl font-black mb-4">Institutional Alignment</h2>
                            <p className="text-xl text-blue-100 font-light leading-relaxed">
                                Our strategic roadmap is meticulously aligned with NRIIT's core philosophy of creating
                                ethical, socially responsible, and technologically advanced engineers for the global stage.
                                We are committed to achieving **Diamond Flagship** results through our dedicated efforts.
                            </p>
                        </div>
                    </div>
                </Card>
            </motion.div>
        </div>
    );
}
