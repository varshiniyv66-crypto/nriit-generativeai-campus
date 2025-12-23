"use client";

import { motion } from "framer-motion";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import {
    Award,
    BookOpen,
    GraduationCap,
    Mail,
    Phone,
    FileText,
    Users,
    Globe,
    Trophy,
    Star,
    Briefcase,
    CheckCircle2,
    Building2
} from "lucide-react";

const principalData = {
    name: "Dr. Dola Sanjay S",
    title: "Professor & Principal",
    department: "Electronics and Communication Engineering",
    email: "nriit.guntur@gmail.com",
    phone: "9701037149",
    photo: "/gallery/principal.jpeg",
    experience: "25+",
    publications: 62,
    patents: 3,
    phdScholars: { awarded: 3, ongoing: 6 },
    education: [
        { degree: "Post-Doctoral Research", field: "Data Mining", institution: "Christian Central University, Malawi" },
        { degree: "Ph.D", field: "EMI/EMC", institution: "JNTUA, Anantapur, AP", year: "2015" },
    ],
    awards: [
        { name: "Bheeshma Award", from: "Bharat Education Excellence Award", year: "2024" },
        { name: "Best Organizing Committee Member", from: "International Conference on Advanced Computing and Communication Technology", year: "2021" },
        { name: "Bharat Ratna Dr Abdul Kalam Gold Medal Award", from: "Education and Research, Global Economic Progress and Research Association, Tiruvannamalai", year: "2018" },
    ],
    researchInterests: ["RF/mm-wave/sub-mm", "EMI/EMC", "Microstrip Antennas", "Data Mining"],
    adminExperience: [
        "Principal",
        "In-Charge Principal",
        "Vice Principal",
        "AICTE (All India Council for Technical Education)",
        "LIC (Local Inspection Committee)",
        "FFC (Facts Finding Committee)",
        "NBA (National Board of Accreditation)",
        "NAAC (National Assessment and Accreditation Council)"
    ],
    editorialRoles: ["IRJ", "IJSER", "IJARIET", "JETIR", "IJACT"],
    conferences: ["ICETSTM-18", "ICMPET-2019", "ICSET-19", "ICCCEEE-2020", "ICEATE-2020", "ICACCT'21", "ICAST-2021", "ICASET-2021"],
    researchProjects: [
        { title: "Smart Access Control for Restricted Buildings Using Vehicle Number Plate Recognition System", sponsor: "The Institution of Engineers (India)", status: "Ongoing" },
        { title: "AI-Powered 5G/6G Antenna Design Symposium", sponsor: "SERB", status: "Completed" },
        { title: "Entrepreneurship Development Project", sponsor: "EDII", status: "Completed" },
        { title: "STTP - Short Term Training Program", sponsor: "AICTE", status: "Completed" },
    ],
    bookChapters: [
        "EMI-EMC Analysis",
        "Next Generation Computing Technologies on Computational Intelligence",
        "Implementation of Fitness Certificate in Professional Colleges",
        "Transient Analysis of SF6 Circuit Breaker Arc Conductance Using Python"
    ]
};

export default function PrincipalPage() {
    return (
        <div className="min-h-screen bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950">
            {/* Hero Section */}
            <div className="relative overflow-hidden">
                {/* Background Effects */}
                <div className="absolute inset-0 bg-[url('/grid-pattern.svg')] opacity-5" />
                <div className="absolute top-0 left-1/4 w-96 h-96 bg-blue-500/20 rounded-full blur-[120px]" />
                <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-amber-500/20 rounded-full blur-[120px]" />

                <div className="relative max-w-7xl mx-auto px-6 py-16 lg:py-24">
                    <div className="grid lg:grid-cols-12 gap-12 items-center">
                        {/* Photo Section */}
                        <motion.div
                            initial={{ opacity: 0, x: -50 }}
                            animate={{ opacity: 1, x: 0 }}
                            transition={{ duration: 0.8 }}
                            className="lg:col-span-4"
                        >
                            <div className="relative">
                                <div className="absolute -inset-4 bg-gradient-to-r from-amber-400 via-orange-500 to-amber-400 rounded-3xl opacity-50 blur-lg animate-pulse" />
                                <div className="relative aspect-[3/4] rounded-3xl overflow-hidden border-4 border-white/10 shadow-2xl bg-slate-800">
                                    <img
                                        src={principalData.photo}
                                        alt={principalData.name}
                                        className="w-full h-full object-cover"
                                        onError={(e) => {
                                            e.currentTarget.src = `https://ui-avatars.com/api/?name=${encodeURIComponent(principalData.name)}&background=1E4080&color=fff&size=512`;
                                        }}
                                    />
                                    <div className="absolute inset-0 bg-gradient-to-t from-slate-900/80 via-transparent to-transparent" />
                                </div>
                                {/* Floating Badge */}
                                <div className="absolute -bottom-4 left-1/2 -translate-x-1/2">
                                    <Badge className="bg-gradient-to-r from-amber-500 to-orange-600 text-white px-6 py-2 text-sm font-bold shadow-lg border-2 border-white/20">
                                        <Award className="w-4 h-4 mr-2" />
                                        {principalData.experience} Years Experience
                                    </Badge>
                                </div>
                            </div>
                        </motion.div>

                        {/* Info Section */}
                        <motion.div
                            initial={{ opacity: 0, x: 50 }}
                            animate={{ opacity: 1, x: 0 }}
                            transition={{ duration: 0.8, delay: 0.2 }}
                            className="lg:col-span-8 text-center lg:text-left"
                        >
                            <div className="flex flex-wrap items-center justify-center lg:justify-start gap-3 mb-6">
                                <Badge className="bg-blue-500/10 text-blue-400 border border-blue-500/30 px-4 py-1.5">
                                    <Building2 className="w-3 h-3 mr-2" />
                                    NRIIT
                                </Badge>
                                <Badge className="bg-emerald-500/10 text-emerald-400 border border-emerald-500/30 px-4 py-1.5">
                                    <GraduationCap className="w-3 h-3 mr-2" />
                                    Ph.D (EMI/EMC)
                                </Badge>
                            </div>

                            <h1 className="text-4xl md:text-6xl font-black text-white mb-4 tracking-tight">
                                {principalData.name}
                            </h1>
                            <p className="text-2xl text-amber-400 font-bold mb-2">{principalData.title}</p>
                            <p className="text-xl text-slate-400 mb-8">Department of {principalData.department}</p>

                            <p className="text-lg text-slate-300 leading-relaxed mb-8 max-w-2xl">
                                An eminent Electronics and Communication Engineering Personality whose leadership has been instrumental in shaping the academic landscape at NRI Institute of Technology.
                            </p>

                            {/* Quick Stats */}
                            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                                {[
                                    { icon: FileText, value: principalData.publications, label: "Publications" },
                                    { icon: Star, value: principalData.patents, label: "Patents" },
                                    { icon: Trophy, value: principalData.awards.length, label: "Awards" },
                                    { icon: Users, value: `${principalData.phdScholars.awarded}+${principalData.phdScholars.ongoing}`, label: "PhD Scholars" },
                                ].map((stat, i) => (
                                    <motion.div
                                        key={i}
                                        initial={{ opacity: 0, y: 20 }}
                                        animate={{ opacity: 1, y: 0 }}
                                        transition={{ delay: 0.4 + i * 0.1 }}
                                        className="bg-white/5 backdrop-blur-sm rounded-2xl p-4 border border-white/10 text-center"
                                    >
                                        <stat.icon className="w-6 h-6 text-amber-400 mx-auto mb-2" />
                                        <div className="text-2xl font-black text-white">{stat.value}</div>
                                        <div className="text-xs text-slate-400 uppercase tracking-wider">{stat.label}</div>
                                    </motion.div>
                                ))}
                            </div>

                            {/* Contact Buttons */}
                            <div className="flex flex-wrap items-center justify-center lg:justify-start gap-4 mt-8">
                                <a
                                    href={`mailto:${principalData.email}`}
                                    className="flex items-center gap-2 px-6 py-3 bg-gradient-to-r from-blue-600 to-blue-500 text-white rounded-xl font-bold hover:from-blue-500 hover:to-blue-400 transition-all shadow-lg"
                                >
                                    <Mail className="w-5 h-5" />
                                    {principalData.email}
                                </a>
                                <a
                                    href={`tel:+91${principalData.phone}`}
                                    className="flex items-center gap-2 px-6 py-3 bg-white/10 text-white rounded-xl font-bold hover:bg-white/20 transition-all border border-white/10"
                                >
                                    <Phone className="w-5 h-5" />
                                    +91 {principalData.phone}
                                </a>
                            </div>
                        </motion.div>
                    </div>
                </div>
            </div>

            {/* Content Sections */}
            <div className="max-w-7xl mx-auto px-6 pb-24 space-y-12">

                {/* Awards Section */}
                <motion.section
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    <h2 className="text-3xl font-black text-white mb-8 flex items-center gap-3">
                        <Trophy className="w-8 h-8 text-amber-400" />
                        Awards & Recognitions
                    </h2>
                    <div className="grid md:grid-cols-3 gap-6">
                        {principalData.awards.map((award, i) => (
                            <Card key={i} className="bg-gradient-to-br from-amber-500/10 to-orange-500/5 border-amber-500/20 overflow-hidden group hover:border-amber-400/40 transition-colors">
                                <CardContent className="p-6">
                                    <div className="flex items-start gap-4">
                                        <div className="p-3 bg-amber-500/20 rounded-xl">
                                            <Award className="w-6 h-6 text-amber-400" />
                                        </div>
                                        <div>
                                            <Badge className="bg-amber-500/20 text-amber-300 border-0 mb-2">{award.year}</Badge>
                                            <h3 className="text-lg font-bold text-white mb-2">{award.name}</h3>
                                            <p className="text-sm text-slate-400">{award.from}</p>
                                        </div>
                                    </div>
                                </CardContent>
                            </Card>
                        ))}
                    </div>
                </motion.section>

                {/* Education & Experience */}
                <div className="grid lg:grid-cols-2 gap-8">
                    <motion.section
                        initial={{ opacity: 0, x: -30 }}
                        whileInView={{ opacity: 1, x: 0 }}
                        viewport={{ once: true }}
                    >
                        <h2 className="text-2xl font-black text-white mb-6 flex items-center gap-3">
                            <GraduationCap className="w-7 h-7 text-blue-400" />
                            Education
                        </h2>
                        <Card className="bg-slate-900/50 border-slate-800">
                            <CardContent className="p-6 space-y-4">
                                {principalData.education.map((edu, i) => (
                                    <div key={i} className="flex items-start gap-4 p-4 bg-white/5 rounded-xl">
                                        <div className="p-2 bg-blue-500/20 rounded-lg">
                                            <GraduationCap className="w-5 h-5 text-blue-400" />
                                        </div>
                                        <div>
                                            <h3 className="font-bold text-white">{edu.degree} - {edu.field}</h3>
                                            <p className="text-sm text-slate-400">{edu.institution}</p>
                                            {edu.year && <Badge className="mt-2 bg-blue-500/20 text-blue-300 border-0">{edu.year}</Badge>}
                                        </div>
                                    </div>
                                ))}
                            </CardContent>
                        </Card>
                    </motion.section>

                    <motion.section
                        initial={{ opacity: 0, x: 30 }}
                        whileInView={{ opacity: 1, x: 0 }}
                        viewport={{ once: true }}
                    >
                        <h2 className="text-2xl font-black text-white mb-6 flex items-center gap-3">
                            <Briefcase className="w-7 h-7 text-purple-400" />
                            Administrative Experience
                        </h2>
                        <Card className="bg-slate-900/50 border-slate-800">
                            <CardContent className="p-6">
                                <div className="flex flex-wrap gap-2">
                                    {principalData.adminExperience.map((exp, i) => (
                                        <Badge key={i} variant="outline" className="text-slate-300 border-slate-700 px-3 py-1.5">
                                            <CheckCircle2 className="w-3 h-3 mr-2 text-emerald-400" />
                                            {exp}
                                        </Badge>
                                    ))}
                                </div>
                            </CardContent>
                        </Card>
                    </motion.section>
                </div>

                {/* Research Projects */}
                <motion.section
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    <h2 className="text-3xl font-black text-white mb-8 flex items-center gap-3">
                        <BookOpen className="w-8 h-8 text-emerald-400" />
                        Research Projects
                    </h2>
                    <div className="grid md:grid-cols-2 gap-6">
                        {principalData.researchProjects.map((project, i) => (
                            <Card key={i} className="bg-slate-900/50 border-slate-800 hover:border-emerald-500/30 transition-colors">
                                <CardContent className="p-6">
                                    <div className="flex items-start justify-between mb-3">
                                        <Badge className={project.status === "Ongoing" ? "bg-emerald-500/20 text-emerald-400 border-0" : "bg-blue-500/20 text-blue-400 border-0"}>
                                            {project.status}
                                        </Badge>
                                        <Badge variant="outline" className="text-slate-400 border-slate-700">{project.sponsor}</Badge>
                                    </div>
                                    <h3 className="text-lg font-bold text-white">{project.title}</h3>
                                </CardContent>
                            </Card>
                        ))}
                    </div>
                </motion.section>

                {/* Research Interests & Editorial */}
                <div className="grid lg:grid-cols-2 gap-8">
                    <motion.section
                        initial={{ opacity: 0, y: 30 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                    >
                        <h2 className="text-2xl font-black text-white mb-6 flex items-center gap-3">
                            <Globe className="w-7 h-7 text-cyan-400" />
                            Research Interests
                        </h2>
                        <Card className="bg-slate-900/50 border-slate-800">
                            <CardContent className="p-6">
                                <div className="flex flex-wrap gap-3">
                                    {principalData.researchInterests.map((interest, i) => (
                                        <Badge key={i} className="bg-cyan-500/20 text-cyan-300 border-0 px-4 py-2 text-sm">
                                            {interest}
                                        </Badge>
                                    ))}
                                </div>
                            </CardContent>
                        </Card>
                    </motion.section>

                    <motion.section
                        initial={{ opacity: 0, y: 30 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                    >
                        <h2 className="text-2xl font-black text-white mb-6 flex items-center gap-3">
                            <FileText className="w-7 h-7 text-orange-400" />
                            Editorial Board & Reviewer
                        </h2>
                        <Card className="bg-slate-900/50 border-slate-800">
                            <CardContent className="p-6">
                                <div className="flex flex-wrap gap-3">
                                    {principalData.editorialRoles.map((journal, i) => (
                                        <Badge key={i} variant="outline" className="text-orange-300 border-orange-500/30 px-4 py-2">
                                            {journal}
                                        </Badge>
                                    ))}
                                </div>
                            </CardContent>
                        </Card>
                    </motion.section>
                </div>

                {/* Book Chapters */}
                <motion.section
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    <h2 className="text-2xl font-black text-white mb-6 flex items-center gap-3">
                        <BookOpen className="w-7 h-7 text-pink-400" />
                        Book Chapters Published
                    </h2>
                    <Card className="bg-slate-900/50 border-slate-800">
                        <CardContent className="p-6 grid md:grid-cols-2 gap-4">
                            {principalData.bookChapters.map((chapter, i) => (
                                <div key={i} className="flex items-center gap-3 p-4 bg-white/5 rounded-xl">
                                    <div className="p-2 bg-pink-500/20 rounded-lg">
                                        <BookOpen className="w-4 h-4 text-pink-400" />
                                    </div>
                                    <span className="text-slate-300 font-medium">{chapter}</span>
                                </div>
                            ))}
                        </CardContent>
                    </Card>
                </motion.section>
            </div>
        </div>
    );
}
