"use client";

import { useParams } from "next/navigation";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { departments as staticDepartments } from "@/data/departments";
import { BookOpen, Calendar, Users, Award, Home, GraduationCap, Building2, CheckCircle2 } from "lucide-react";
import { motion } from "framer-motion";

const DEPARTMENTS: Record<string, { name: string; fullName: string; established: number }> = {
    CSE: { name: "Computer Science & Engineering", fullName: "Department of Computer Science and Engineering", established: 2001 },
    IT: { name: "Information Technology", fullName: "Department of Information Technology", established: 2001 },
    ECE: { name: "Electronics & Communication", fullName: "Department of Electronics and Communication Engineering", established: 2001 },
    CIVIL: { name: "Civil Engineering", fullName: "Department of Civil Engineering", established: 2008 },
    EEE: { name: "Electrical & Electronics", fullName: "Department of Electrical & Electronics Engineering", established: 2008 },
    MECH: { name: "Mechanical Engineering", fullName: "Department of Mechanical Engineering", established: 2008 },
    "CSE-DS": { name: "CSE (Data Science)", fullName: "Department of CSE (Data Science)", established: 2020 },
    "CSE-AI": { name: "CSE (AI & ML)", fullName: "Department of CSE (AI & Machine Learning)", established: 2021 },
    EVT: { name: "Electronics & VLSI", fullName: "Department of Electronics & VLSI Technology", established: 2024 },
    MBA: { name: "Business Administration", fullName: "Department of MBA", established: 2009 },
    MCA: { name: "Computer Applications", fullName: "Department of MCA", established: 2005 },
};

export default function AboutDepartment() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const deptInfo = DEPARTMENTS[deptCode];
    const staticInfo = staticDepartments[deptCode.toLowerCase()];

    if (!deptInfo) {
        return <div className="text-center py-24 text-gray-500 font-medium">Department context initialization...</div>;
    }

    return (
        <div className="space-y-10 pb-20">
            {/* Back Navigation */}
            <motion.div
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                className="mb-6"
            >
                <a
                    href="/"
                    className="inline-flex items-center text-[#1E4080] hover:text-[#2563EB] font-semibold transition-all group"
                >
                    <Home className="w-5 h-5 mr-2 group-hover:scale-110 transition-transform" />
                    Back to Main Home
                </a>
            </motion.div>

            {/* Diamond Header */}
            <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                className="relative overflow-hidden bg-gradient-to-br from-[#1E4080] via-[#2D5AB3] to-[#3B82F6] text-white p-12 rounded-[2rem] shadow-2xl border border-white/10"
            >
                <div className="absolute top-0 right-0 w-96 h-96 bg-white/5 rounded-full -translate-y-1/2 translate-x-1/2 blur-[100px]" />
                <div className="absolute bottom-0 left-0 w-64 h-64 bg-[#E5A818]/10 rounded-full translate-y-1/2 -translate-x-1/2 blur-[80px]" />

                <div className="relative z-10">
                    <div className="flex items-center gap-3 mb-6">
                        <Badge className="bg-[#E5A818] text-[#1E4080] hover:bg-[#E5A818] px-4 py-2 text-sm font-black tracking-widest uppercase">
                            Excellence in Engineering
                        </Badge>
                        <Badge variant="outline" className="text-white border-white/30 backdrop-blur-md px-4 py-2 text-sm font-bold">
                            NAAC A+ Accredited
                        </Badge>
                    </div>

                    <h1 className="text-5xl md:text-6xl font-black mb-4 tracking-tight leading-tight">
                        {deptInfo.fullName}
                    </h1>
                    <p className="text-2xl text-blue-100 font-light max-w-2xl leading-relaxed">
                        Nurturing innovative minds and pioneering research since {deptInfo.established}.
                    </p>
                </div>
            </motion.div>

            {/* High-Fidelity Stats Grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                {[
                    { label: "Established", value: deptInfo.established, icon: Calendar, color: "blue" },
                    { label: "Total Students", value: `${staticInfo?.intake || 120}+`, icon: Users, color: "green" },
                    { label: "Programs", value: "UG & PG", icon: GraduationCap, color: "purple" },
                    { label: "Accreditation", value: "NAAC A+", icon: Award, color: "yellow" }
                ].map((stat, i) => (
                    <motion.div
                        key={i}
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.1 * i }}
                    >
                        <Card className="hover:shadow-xl transition-all duration-300 border-none bg-white/80 backdrop-blur-sm shadow-md h-full">
                            <CardContent className="p-6 flex flex-col items-center text-center">
                                <div className={`p-4 rounded-2xl bg-${stat.color}-50 mb-4 group-hover:scale-110 transition-transform`}>
                                    <stat.icon className={`w-8 h-8 text-${stat.color}-600`} />
                                </div>
                                <p className="text-sm font-bold text-gray-500 uppercase tracking-widest mb-1">{stat.label}</p>
                                <p className={`text-3xl font-black text-${stat.color}-700`}>{stat.value}</p>
                            </CardContent>
                        </Card>
                    </motion.div>
                ))}
            </div>

            {/* Department Narrative Section */}
            <div className="grid lg:grid-cols-3 gap-8">
                <Card className="lg:col-span-2 border-none shadow-xl bg-white rounded-[2rem] overflow-hidden">
                    <CardHeader className="bg-gradient-to-r from-gray-50 to-white border-b border-gray-100 p-8">
                        <CardTitle className="text-3xl font-black text-[#1E4080] flex items-center gap-3">
                            <Building2 className="w-8 h-8" />
                            Department Overview
                        </CardTitle>
                    </CardHeader>
                    <CardContent className="p-8">
                        <p className="text-xl text-gray-700 leading-relaxed font-light mb-8">
                            {staticInfo?.about || `The ${deptInfo.fullName} at NRI Institute of Technology stands as a beacon of academic brilliance. For over two decades, we have been committed to creating a transformative environment where students evolve into industry-ready leaders.`}
                        </p>

                        <div className="grid md:grid-cols-2 gap-6">
                            <div className="space-y-4">
                                <h3 className="text-xl font-bold text-[#1E4080] mb-4 uppercase tracking-tighter">Academic Pillars</h3>
                                {[
                                    "Innovation-Driven Learning",
                                    "State-of-the-Art Labs",
                                    "Industry Immersion",
                                    "Research Excellence"
                                ].map((pill, i) => (
                                    <div key={i} className="flex items-center gap-3 p-4 bg-blue-50/50 rounded-xl border border-blue-100">
                                        <CheckCircle2 className="w-5 h-5 text-blue-600" />
                                        <span className="font-semibold text-gray-800">{pill}</span>
                                    </div>
                                ))}
                            </div>
                            <div className="bg-gradient-to-br from-[#1E4080] to-blue-900 rounded-[2rem] p-8 text-white flex flex-col justify-center">
                                <h3 className="text-2xl font-black mb-2">Our Alumni</h3>
                                <p className="text-blue-100 font-light mb-6">Placed in Fortune 500 companies globally.</p>
                                <div className="flex -space-x-3">
                                    {[1, 2, 3, 4].map(n => (
                                        <div key={n} className="w-12 h-12 rounded-full border-2 border-blue-900 bg-blue-400 flex items-center justify-center font-bold text-xs ring-2 ring-white/10">
                                            HR
                                        </div>
                                    ))}
                                    <div className="w-12 h-12 rounded-full border-2 border-blue-900 bg-[#E5A818] flex items-center justify-center font-bold text-xs text-[#1E4080]">
                                        +5K
                                    </div>
                                </div>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <div className="space-y-6">
                    <Card className="border-none shadow-xl bg-[#1E4080] text-white rounded-[2rem] p-8">
                        <h3 className="text-2xl font-black mb-4">Admissions</h3>
                        <p className="text-blue-100 font-light mb-6 leading-relaxed">
                            Join one of the most prestigious departments at NRIIT. Intake: {staticInfo?.intake || 180} students per year.
                        </p>
                        <button className="w-full py-4 bg-[#E5A818] text-[#1E4080] font-black rounded-xl hover:bg-white transition-all transform hover:scale-105">
                            APPLY NOW
                        </button>
                    </Card>

                    <Card className="border-none shadow-xl bg-white rounded-[2rem] p-8">
                        <h3 className="text-2xl font-black text-[#1E4080] mb-4">Recognitions</h3>
                        <div className="space-y-4">
                            <div className="flex items-center gap-4">
                                <div className="w-12 h-12 rounded-lg bg-yellow-50 flex items-center justify-center font-bold text-yellow-600">JNTU</div>
                                <p className="text-sm font-bold text-gray-700">Permanent Affiliation</p>
                            </div>
                            <div className="flex items-center gap-4">
                                <div className="w-12 h-12 rounded-lg bg-blue-50 flex items-center justify-center font-bold text-blue-600">A+</div>
                                <p className="text-sm font-bold text-gray-700">NAAC Accreditation</p>
                            </div>
                        </div>
                    </Card>
                </div>
            </div>
        </div>
    );
}
