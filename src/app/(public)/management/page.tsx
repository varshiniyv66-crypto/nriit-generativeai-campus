"use client";

import { motion } from "framer-motion";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import {
    Building2,
    Award,
    Globe,
    GraduationCap,
    Heart,
    Users,
    Target,
    Star,
    Sparkles
} from "lucide-react";

const managementTeam = [
    {
        name: "Dr. Ravindra Alapati, MD",
        title: "Director",
        organization: "NRIIT",
        photo: "/gallery/director%20ravandra%20garu.jpg",
        color: "from-amber-500 to-orange-600",
        highlights: [
            "Gastroenterologist in Anaheim, California",
            "Keen on development of educational facilities in rural areas",
            "Competitive, hard worker blessed with wisdom",
            "Visiting Professor for several medical colleges in India and Abroad"
        ],
        icon: Star
    },
    {
        name: "Sri. Alapati Rajendra Prasad",
        title: "Secretary & Correspondent",
        qualification: "B.Com, BL",
        organization: "NRIIT",
        photo: "/gallery/secratary%20and%20correspondent%20raja%20sir.jpg",
        color: "from-blue-500 to-indigo-600",
        highlights: [
            "Ex-Minister of Technical Education",
            "Promoted technical education in A.P.",
            "Member of Legislative Assembly from Tenali / Vemuru constituency for 4 terms",
            "Being health conscious, conducts a majestic event 10K walk every year in Guntur"
        ],
        icon: Award
    },
    {
        name: "Mr. K. Sarath",
        title: "Chief Executive Director",
        organization: "NRIIT",
        photo: "/gallery/chief%20excecutive%20director%20%20sarath.jfif",
        color: "from-emerald-500 to-teal-600",
        highlights: [
            "Dynamic leadership in educational administration",
            "Driving innovation and excellence at NRIIT",
            "Committed to student success and institutional growth"
        ],
        icon: Target
    }
];

export default function ManagementPage() {
    return (
        <div className="min-h-screen bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950">
            {/* Hero Section */}
            <div className="relative overflow-hidden">
                {/* Background Effects */}
                <div className="absolute inset-0 bg-[url('/grid-pattern.svg')] opacity-5" />
                <div className="absolute top-0 left-1/4 w-96 h-96 bg-amber-500/20 rounded-full blur-[120px]" />
                <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-blue-500/20 rounded-full blur-[120px]" />
                <div className="absolute top-1/2 right-0 w-64 h-64 bg-emerald-500/10 rounded-full blur-[100px]" />

                <div className="relative max-w-7xl mx-auto px-6 py-16 lg:py-24">
                    {/* Header */}
                    <motion.div
                        initial={{ opacity: 0, y: -30 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="text-center mb-16"
                    >
                        <div className="flex items-center justify-center gap-3 mb-6">
                            <Badge className="bg-amber-500/10 text-amber-400 border border-amber-500/30 px-4 py-2 text-sm">
                                <Sparkles className="w-4 h-4 mr-2" />
                                MNK Education Society • Est. 2007
                            </Badge>
                        </div>
                        <h1 className="text-5xl md:text-7xl font-black text-white mb-6 tracking-tight">
                            Our <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 via-orange-500 to-amber-400">Management</span>
                        </h1>
                        <p className="text-xl text-slate-400 max-w-3xl mx-auto leading-relaxed">
                            Visionary leaders committed to excellence in education, nurturing future leaders through innovation, integrity, and unwavering dedication.
                        </p>
                    </motion.div>

                    {/* Group Photo Section */}
                    <motion.div
                        initial={{ opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        transition={{ delay: 0.3 }}
                        className="relative mb-20"
                    >
                        <div className="absolute -inset-4 bg-gradient-to-r from-amber-400 via-blue-500 to-emerald-400 rounded-3xl opacity-30 blur-xl" />
                        <div className="relative aspect-[21/9] rounded-3xl overflow-hidden border-4 border-white/10 shadow-2xl">
                            <img
                                src="/gallery/total%20management.png"
                                alt="NRIIT Management Team"
                                className="w-full h-full object-cover"
                                onError={(e) => {
                                    e.currentTarget.style.display = 'none';
                                }}
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-slate-950 via-slate-950/20 to-transparent" />
                            <div className="absolute bottom-0 left-0 right-0 p-8 md:p-12">
                                <h2 className="text-3xl md:text-4xl font-black text-white mb-2">
                                    Leadership That Inspires
                                </h2>
                                <p className="text-lg text-slate-300">
                                    The distinguished management committee guiding NRIIT towards academic excellence
                                </p>
                            </div>
                        </div>
                    </motion.div>

                    {/* Vision Statement */}
                    <motion.div
                        initial={{ opacity: 0, y: 30 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                        className="text-center mb-20"
                    >
                        <Card className="bg-gradient-to-br from-slate-900/80 to-slate-800/50 border-slate-700/50 backdrop-blur-xl max-w-4xl mx-auto">
                            <CardContent className="p-8 md:p-12">
                                <div className="w-16 h-16 mx-auto mb-6 bg-gradient-to-br from-amber-500/20 to-orange-500/20 rounded-2xl flex items-center justify-center">
                                    <Globe className="w-8 h-8 text-amber-400" />
                                </div>
                                <h3 className="text-2xl font-bold text-white mb-4">Our Vision</h3>
                                <p className="text-lg text-slate-300 leading-relaxed italic">
                                    "To establish NRIIT as a center of excellence, producing world-class engineers and professionals who contribute to nation-building through innovation, ethical values, and commitment to society."
                                </p>
                            </CardContent>
                        </Card>
                    </motion.div>
                </div>
            </div>

            {/* Management Team Section */}
            <div className="max-w-7xl mx-auto px-6 pb-24">
                <motion.div
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    className="text-center mb-16"
                >
                    <h2 className="text-4xl font-black text-white mb-4">
                        <Users className="inline-block w-10 h-10 mr-3 text-blue-400" />
                        Meet Our Leaders
                    </h2>
                    <p className="text-slate-400 text-lg">Distinguished professionals driving NRIIT's mission forward</p>
                </motion.div>

                {/* Team Grid */}
                <div className="grid lg:grid-cols-3 gap-8">
                    {managementTeam.map((member, index) => (
                        <motion.div
                            key={index}
                            initial={{ opacity: 0, y: 50 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true }}
                            transition={{ delay: index * 0.15 }}
                        >
                            <Card className="bg-slate-900/50 border-slate-800 overflow-hidden group hover:border-slate-700 transition-all duration-500 h-full">
                                {/* Photo */}
                                <div className="relative aspect-[4/5] overflow-hidden">
                                    <div className={`absolute inset-0 bg-gradient-to-br ${member.color} opacity-20 group-hover:opacity-30 transition-opacity`} />
                                    <img
                                        src={member.photo}
                                        alt={member.name}
                                        className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-700"
                                        onError={(e) => {
                                            e.currentTarget.src = `https://ui-avatars.com/api/?name=${encodeURIComponent(member.name)}&background=1E4080&color=fff&size=512`;
                                        }}
                                    />
                                    <div className="absolute inset-0 bg-gradient-to-t from-slate-950 via-slate-950/50 to-transparent" />

                                    {/* Floating Badge */}
                                    <div className="absolute top-4 right-4">
                                        <div className={`w-12 h-12 rounded-xl bg-gradient-to-br ${member.color} flex items-center justify-center shadow-lg`}>
                                            <member.icon className="w-6 h-6 text-white" />
                                        </div>
                                    </div>

                                    {/* Name Overlay */}
                                    <div className="absolute bottom-0 left-0 right-0 p-6">
                                        <Badge className={`bg-gradient-to-r ${member.color} text-white border-0 mb-3 px-3 py-1`}>
                                            {member.title}
                                        </Badge>
                                        <h3 className="text-2xl font-black text-white mb-1">{member.name}</h3>
                                        {member.qualification && (
                                            <p className="text-sm text-slate-400">{member.qualification}</p>
                                        )}
                                    </div>
                                </div>

                                {/* Highlights */}
                                <CardContent className="p-6">
                                    <ul className="space-y-3">
                                        {member.highlights.map((highlight, i) => (
                                            <li key={i} className="flex items-start gap-3 text-sm text-slate-300">
                                                <div className={`w-1.5 h-1.5 rounded-full bg-gradient-to-r ${member.color} mt-2 flex-shrink-0`} />
                                                {highlight}
                                            </li>
                                        ))}
                                    </ul>
                                </CardContent>
                            </Card>
                        </motion.div>
                    ))}
                </div>

                {/* Message Section */}
                <motion.section
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    className="mt-20"
                >
                    <Card className="bg-gradient-to-br from-blue-500/10 to-indigo-500/5 border-blue-500/20 overflow-hidden">
                        <CardContent className="p-8 md:p-12">
                            <div className="grid lg:grid-cols-2 gap-12 items-center">
                                <div>
                                    <div className="flex items-center gap-3 mb-6">
                                        <div className="w-12 h-12 bg-blue-500/20 rounded-xl flex items-center justify-center">
                                            <Heart className="w-6 h-6 text-blue-400" />
                                        </div>
                                        <h3 className="text-2xl font-black text-white">Our Commitment</h3>
                                    </div>
                                    <p className="text-lg text-slate-300 leading-relaxed mb-6">
                                        The management of NRI Institute of Technology is committed to providing world-class education
                                        that combines technical excellence with ethical values. We believe in nurturing not just
                                        skilled engineers, but responsible citizens who will contribute meaningfully to society.
                                    </p>
                                    <p className="text-lg text-slate-300 leading-relaxed">
                                        Under the guidance of MNK Education Society, we continue to invest in modern infrastructure,
                                        experienced faculty, and innovative teaching methodologies to prepare our students for
                                        the challenges of tomorrow.
                                    </p>
                                </div>
                                <div className="grid grid-cols-2 gap-4">
                                    {[
                                        { icon: Building2, label: "Modern Infrastructure", value: "10+ Acres" },
                                        { icon: GraduationCap, label: "Programs Offered", value: "12+" },
                                        { icon: Users, label: "Students", value: "3200+" },
                                        { icon: Award, label: "Years of Excellence", value: "17+" }
                                    ].map((stat, i) => (
                                        <div key={i} className="bg-white/5 backdrop-blur-sm rounded-2xl p-6 text-center border border-white/10">
                                            <stat.icon className="w-8 h-8 text-blue-400 mx-auto mb-3" />
                                            <div className="text-2xl font-black text-white mb-1">{stat.value}</div>
                                            <div className="text-xs text-slate-400 uppercase tracking-wider">{stat.label}</div>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        </CardContent>
                    </Card>
                </motion.section>
            </div>
        </div>
    );
}
