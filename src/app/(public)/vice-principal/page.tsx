"use client";

import { motion } from "framer-motion";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import {
    GraduationCap,
    Mail,
    Phone,
    Target,
    Users,
    BookOpen,
    Award,
    Building2,
    Quote,
    Lightbulb,
    Heart,
    Star
} from "lucide-react";

const vicePrincipalData = {
    name: "Prof. K. Srihari Rao",
    title: "Vice Principal",
    qualification: "M.E., Ph.D.",
    email: "hr.nriit@gmail.com",
    phone: "9246400540",
    photo: "/gallery/vice_principal.jpeg",
    message: `Welcome to NRI Institute of Technology (NRIIT), where academic excellence, innovation, and values-driven education go hand in hand.

Technical education plays a crucial role in nation building. At NRIIT, we provide a strong academic foundation supported by modern infrastructure, experienced faculty, and a research-oriented learning environment that nurtures higher-order thinking and practical skills.

We emphasize holistic development through academic, co-curricular, and extracurricular activities, instilling social responsibility, ethical values, and leadership qualities. Our goal is to shape not only competent engineers but also responsible citizens who contribute meaningfully to society.

I wish all students a fulfilling, enriching, and successful academic journey at NRIIT.

Best wishes for a bright future.`,
    highlights: [
        { icon: Target, label: "Academic Excellence", description: "Strong foundation with modern infrastructure" },
        { icon: Lightbulb, label: "Innovation", description: "Research-oriented learning environment" },
        { icon: Heart, label: "Values-Driven", description: "Ethics, social responsibility & leadership" },
        { icon: Users, label: "Holistic Development", description: "Academic, co-curricular & extracurricular" },
    ],
    roles: [
        "NBA Coordinator",
        "Academic Administration",
        "Quality Assurance",
        "Faculty Development",
        "Student Affairs"
    ]
};

export default function VicePrincipalPage() {
    return (
        <div className="min-h-screen bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950">
            {/* Hero Section */}
            <div className="relative overflow-hidden">
                {/* Background Effects */}
                <div className="absolute inset-0 bg-[url('/grid-pattern.svg')] opacity-5" />
                <div className="absolute top-0 left-1/4 w-96 h-96 bg-emerald-500/20 rounded-full blur-[120px]" />
                <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-blue-500/20 rounded-full blur-[120px]" />

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
                                <div className="absolute -inset-4 bg-gradient-to-r from-emerald-400 via-teal-500 to-emerald-400 rounded-3xl opacity-50 blur-lg animate-pulse" />
                                <div className="relative aspect-[3/4] rounded-3xl overflow-hidden border-4 border-white/10 shadow-2xl bg-slate-800">
                                    <img
                                        src={vicePrincipalData.photo}
                                        alt={vicePrincipalData.name}
                                        className="w-full h-full object-cover"
                                        onError={(e) => {
                                            e.currentTarget.src = `https://ui-avatars.com/api/?name=${encodeURIComponent(vicePrincipalData.name)}&background=059669&color=fff&size=512`;
                                        }}
                                    />
                                    <div className="absolute inset-0 bg-gradient-to-t from-slate-900/80 via-transparent to-transparent" />
                                </div>
                                {/* Floating Badge */}
                                <div className="absolute -bottom-4 left-1/2 -translate-x-1/2">
                                    <Badge className="bg-gradient-to-r from-emerald-500 to-teal-600 text-white px-6 py-2 text-sm font-bold shadow-lg border-2 border-white/20">
                                        <Award className="w-4 h-4 mr-2" />
                                        {vicePrincipalData.qualification}
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
                                <Badge className="bg-emerald-500/10 text-emerald-400 border border-emerald-500/30 px-4 py-1.5">
                                    <Building2 className="w-3 h-3 mr-2" />
                                    NRIIT
                                </Badge>
                                <Badge className="bg-blue-500/10 text-blue-400 border border-blue-500/30 px-4 py-1.5">
                                    <Star className="w-3 h-3 mr-2" />
                                    NBA Coordinator
                                </Badge>
                            </div>

                            <h1 className="text-4xl md:text-6xl font-black text-white mb-4 tracking-tight">
                                {vicePrincipalData.name}
                            </h1>
                            <p className="text-2xl text-emerald-400 font-bold mb-2">{vicePrincipalData.title}</p>
                            <p className="text-xl text-slate-400 mb-8">{vicePrincipalData.qualification}</p>

                            {/* Contact Buttons */}
                            <div className="flex flex-wrap items-center justify-center lg:justify-start gap-4">
                                <a
                                    href={`mailto:${vicePrincipalData.email}`}
                                    className="flex items-center gap-2 px-6 py-3 bg-gradient-to-r from-emerald-600 to-emerald-500 text-white rounded-xl font-bold hover:from-emerald-500 hover:to-emerald-400 transition-all shadow-lg"
                                >
                                    <Mail className="w-5 h-5" />
                                    {vicePrincipalData.email}
                                </a>
                                <a
                                    href={`tel:+91${vicePrincipalData.phone}`}
                                    className="flex items-center gap-2 px-6 py-3 bg-white/10 text-white rounded-xl font-bold hover:bg-white/20 transition-all border border-white/10"
                                >
                                    <Phone className="w-5 h-5" />
                                    +91 {vicePrincipalData.phone}
                                </a>
                            </div>
                        </motion.div>
                    </div>
                </div>
            </div>

            {/* Content Sections */}
            <div className="max-w-7xl mx-auto px-6 pb-24 space-y-12">

                {/* Message Section */}
                <motion.section
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    <Card className="bg-gradient-to-br from-emerald-500/10 to-teal-500/5 border-emerald-500/20 overflow-hidden">
                        <CardContent className="p-8 md:p-12">
                            <div className="flex items-start gap-6">
                                <div className="hidden md:block p-4 bg-emerald-500/20 rounded-2xl">
                                    <Quote className="w-10 h-10 text-emerald-400" />
                                </div>
                                <div className="flex-1">
                                    <h2 className="text-2xl font-black text-white mb-6 flex items-center gap-3">
                                        <Quote className="w-6 h-6 text-emerald-400 md:hidden" />
                                        Message from Vice Principal
                                    </h2>
                                    <div className="space-y-4 text-lg text-slate-300 leading-relaxed">
                                        {vicePrincipalData.message.split('\n\n').map((paragraph, i) => (
                                            <p key={i} className={i === vicePrincipalData.message.split('\n\n').length - 1 ? "text-emerald-400 font-semibold italic" : ""}>
                                                {paragraph}
                                            </p>
                                        ))}
                                    </div>
                                    <div className="mt-8 pt-6 border-t border-white/10">
                                        <p className="text-xl font-bold text-white">{vicePrincipalData.name}</p>
                                        <p className="text-emerald-400">{vicePrincipalData.title}, {vicePrincipalData.qualification}</p>
                                    </div>
                                </div>
                            </div>
                        </CardContent>
                    </Card>
                </motion.section>

                {/* Highlights Grid */}
                <motion.section
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    <h2 className="text-3xl font-black text-white mb-8 flex items-center gap-3">
                        <Star className="w-8 h-8 text-emerald-400" />
                        Our Core Values
                    </h2>
                    <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
                        {vicePrincipalData.highlights.map((highlight, i) => (
                            <motion.div
                                key={i}
                                initial={{ opacity: 0, y: 20 }}
                                whileInView={{ opacity: 1, y: 0 }}
                                viewport={{ once: true }}
                                transition={{ delay: i * 0.1 }}
                            >
                                <Card className="bg-slate-900/50 border-slate-800 hover:border-emerald-500/30 transition-all h-full group">
                                    <CardContent className="p-6 text-center">
                                        <div className="w-14 h-14 mx-auto mb-4 bg-gradient-to-br from-emerald-500/20 to-teal-500/20 rounded-2xl flex items-center justify-center group-hover:scale-110 transition-transform">
                                            <highlight.icon className="w-7 h-7 text-emerald-400" />
                                        </div>
                                        <h3 className="text-lg font-bold text-white mb-2">{highlight.label}</h3>
                                        <p className="text-sm text-slate-400">{highlight.description}</p>
                                    </CardContent>
                                </Card>
                            </motion.div>
                        ))}
                    </div>
                </motion.section>

                {/* Roles Section */}
                <motion.section
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    <h2 className="text-2xl font-black text-white mb-6 flex items-center gap-3">
                        <BookOpen className="w-7 h-7 text-blue-400" />
                        Administrative Roles
                    </h2>
                    <Card className="bg-slate-900/50 border-slate-800">
                        <CardContent className="p-6">
                            <div className="flex flex-wrap gap-3">
                                {vicePrincipalData.roles.map((role, i) => (
                                    <Badge key={i} className="bg-blue-500/20 text-blue-300 border-0 px-4 py-2 text-sm">
                                        {role}
                                    </Badge>
                                ))}
                            </div>
                        </CardContent>
                    </Card>
                </motion.section>
            </div>
        </div>
    );
}
