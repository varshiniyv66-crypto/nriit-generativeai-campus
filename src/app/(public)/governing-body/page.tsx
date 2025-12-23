"use client";

import { motion } from "framer-motion";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import {
    Users,
    Award,
    GraduationCap,
    Building2,
    Star,
    Globe,
    Shield,
    Crown
} from "lucide-react";

const governingBody = [
    {
        name: "Dr. Mukkamala Appa Rao, MD",
        designation: "President",
        role: "Chairman",
        photo: "/gallery/chairman.png",
        organization: "MNK Education Society",
        description: "Nuclear radiology specialist in Flint Michigan city, USA. President of Michigan State Medical society with 15,000 membership.",
        color: "from-amber-500 to-orange-600"
    },
    {
        name: "Sri. Alapati Rajendra Prasad",
        designation: "Secretary & Correspondent",
        role: "Member",
        qualification: "B.Com, BL",
        photo: "/gallery/secratary%20and%20correspondent%20raja%20sir.jpg",
        organization: "MNK Education Society",
        description: "Ex-Minister of Technical Education. Member of Legislative Assembly from Tenali / Vemuru constituency for 4 terms.",
        color: "from-blue-500 to-indigo-600"
    },
    {
        name: "Dr. Butchaiah Kondragunta, MD",
        designation: "Director",
        role: "Member",
        photo: "/gallery/management1.jfif",
        organization: "NRIIT",
        description: "Specialist in Oncology in Petersburg, Virginia, USA. Specialized in Nuclear Medicine to cure all types of cancers.",
        color: "from-purple-500 to-violet-600"
    },
    {
        name: "Dr. Ravindra Alapati, MD",
        designation: "Director",
        role: "Member",
        photo: "/gallery/director%20ravandra%20garu.jpg",
        organization: "NRIIT",
        description: "Gastroenterologist in Anaheim, California. Keen on development of educational facilities in rural areas.",
        color: "from-emerald-500 to-teal-600"
    },
    {
        name: "Mr. K. Sarath",
        designation: "Chief Executive Director",
        role: "Member",
        photo: "/gallery/chief%20excecutive%20director%20%20sarath.jfif",
        organization: "NRIIT",
        description: "Dynamic leadership in educational administration, driving innovation and excellence at NRIIT.",
        color: "from-cyan-500 to-blue-600"
    },
    {
        name: "JNTU Kakinada Nominee",
        designation: "University Representative",
        role: "Member",
        photo: "",
        organization: "JNTUK",
        description: "Official nominee representing Jawaharlal Nehru Technological University, Kakinada.",
        color: "from-gray-500 to-slate-600"
    },
    {
        name: "State Government Nominee",
        designation: "Government Representative",
        role: "Member",
        photo: "",
        organization: "Govt. of Andhra Pradesh",
        description: "Official nominee from the State Government of Andhra Pradesh.",
        color: "from-gray-500 to-slate-600"
    },
    {
        name: "Dr. Dola Sanjay S",
        designation: "Professor & Principal",
        role: "Member Secretary",
        qualification: "Ph.D (EMI/EMC)",
        photo: "/gallery/principal.jpeg",
        organization: "NRIIT",
        description: "25+ years experience in academic administration. Post-doctoral researcher with 62+ publications and 3 patents.",
        color: "from-rose-500 to-pink-600",
        isSecretary: true
    }
];

export default function GoverningBodyPage() {
    return (
        <div className="min-h-screen bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950">
            {/* Hero Section */}
            <div className="relative overflow-hidden">
                {/* Background Effects */}
                <div className="absolute inset-0 bg-[url('/grid-pattern.svg')] opacity-5" />
                <div className="absolute top-0 left-1/4 w-96 h-96 bg-blue-500/20 rounded-full blur-[120px]" />
                <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-amber-500/20 rounded-full blur-[120px]" />

                <div className="relative max-w-7xl mx-auto px-6 py-16 lg:py-24">
                    {/* Header */}
                    <motion.div
                        initial={{ opacity: 0, y: -30 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="text-center mb-16"
                    >
                        <div className="flex items-center justify-center gap-3 mb-6">
                            <Badge className="bg-blue-500/10 text-blue-400 border border-blue-500/30 px-4 py-2 text-sm">
                                <Shield className="w-4 h-4 mr-2" />
                                Statutory Body
                            </Badge>
                            <Badge className="bg-amber-500/10 text-amber-400 border border-amber-500/30 px-4 py-2 text-sm">
                                AICTE Approved
                            </Badge>
                        </div>
                        <h1 className="text-5xl md:text-7xl font-black text-white mb-6 tracking-tight">
                            Governing <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 via-cyan-500 to-blue-400">Body</span>
                        </h1>
                        <p className="text-xl text-slate-400 max-w-3xl mx-auto leading-relaxed">
                            The apex decision-making body that provides strategic direction and ensures governance excellence at NRI Institute of Technology.
                        </p>
                    </motion.div>

                    {/* Stats Row */}
                    <motion.div
                        initial={{ opacity: 0, y: 30 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.2 }}
                        className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-16 max-w-4xl mx-auto"
                    >
                        {[
                            { icon: Users, value: "8", label: "Members" },
                            { icon: Globe, value: "3", label: "NRIs" },
                            { icon: GraduationCap, value: "5", label: "Doctors" },
                            { icon: Building2, value: "2008", label: "Established" }
                        ].map((stat, i) => (
                            <div key={i} className="bg-white/5 backdrop-blur-sm rounded-2xl p-6 text-center border border-white/10">
                                <stat.icon className="w-8 h-8 text-blue-400 mx-auto mb-3" />
                                <div className="text-3xl font-black text-white">{stat.value}</div>
                                <div className="text-xs text-slate-400 uppercase tracking-wider">{stat.label}</div>
                            </div>
                        ))}
                    </motion.div>
                </div>
            </div>

            {/* Governing Body Members */}
            <div className="max-w-7xl mx-auto px-6 pb-24">
                <motion.div
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    className="text-center mb-12"
                >
                    <h2 className="text-3xl font-black text-white mb-4 flex items-center justify-center gap-3">
                        <Crown className="w-8 h-8 text-amber-400" />
                        Members of Governing Body
                    </h2>
                    <p className="text-slate-400">Distinguished leaders guiding NRIIT's vision and mission</p>
                </motion.div>

                {/* Members Grid */}
                <div className="grid md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                    {governingBody.map((member, index) => (
                        <motion.div
                            key={index}
                            initial={{ opacity: 0, y: 30 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true }}
                            transition={{ delay: index * 0.08 }}
                        >
                            <Card className={`bg-slate-900/50 border-slate-800 overflow-hidden group hover:border-slate-700 transition-all duration-500 h-full ${member.isSecretary ? 'ring-2 ring-rose-500/50' : ''}`}>
                                {/* Photo */}
                                <div className="relative aspect-square overflow-hidden">
                                    <div className={`absolute inset-0 bg-gradient-to-br ${member.color} opacity-20 group-hover:opacity-30 transition-opacity`} />
                                    {member.photo ? (
                                        <img
                                            src={member.photo}
                                            alt={member.name}
                                            className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-700"
                                            onError={(e) => {
                                                e.currentTarget.src = `https://ui-avatars.com/api/?name=${encodeURIComponent(member.name)}&background=1E4080&color=fff&size=400`;
                                            }}
                                        />
                                    ) : (
                                        <div className="w-full h-full flex items-center justify-center bg-slate-800">
                                            <div className="text-5xl font-black text-slate-600">
                                                {member.name.split(' ').map(n => n[0]).join('').slice(0, 2)}
                                            </div>
                                        </div>
                                    )}
                                    <div className="absolute inset-0 bg-gradient-to-t from-slate-950 via-slate-950/30 to-transparent" />

                                    {/* Role Badge */}
                                    <div className="absolute top-3 right-3">
                                        <Badge className={`${member.isSecretary ? 'bg-rose-500' : member.role === 'Chairman' ? 'bg-amber-500' : 'bg-slate-700'} text-white border-0`}>
                                            {member.role}
                                        </Badge>
                                    </div>

                                    {/* Name Overlay */}
                                    <div className="absolute bottom-0 left-0 right-0 p-4">
                                        <h3 className="text-lg font-bold text-white leading-tight">{member.name}</h3>
                                        {member.qualification && (
                                            <p className="text-xs text-slate-400">{member.qualification}</p>
                                        )}
                                    </div>
                                </div>

                                {/* Info */}
                                <CardContent className="p-4">
                                    <Badge className={`bg-gradient-to-r ${member.color} text-white border-0 mb-2 text-xs`}>
                                        {member.designation}
                                    </Badge>
                                    <p className="text-xs text-slate-500 mb-2">{member.organization}</p>
                                    <p className="text-sm text-slate-400 line-clamp-2">{member.description}</p>
                                </CardContent>
                            </Card>
                        </motion.div>
                    ))}
                </div>

                {/* Responsibilities Section */}
                <motion.section
                    initial={{ opacity: 0, y: 30 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    className="mt-20"
                >
                    <Card className="bg-gradient-to-br from-blue-500/10 to-indigo-500/5 border-blue-500/20 overflow-hidden">
                        <CardContent className="p-8 md:p-12">
                            <div className="grid lg:grid-cols-2 gap-12">
                                <div>
                                    <div className="flex items-center gap-3 mb-6">
                                        <div className="w-12 h-12 bg-blue-500/20 rounded-xl flex items-center justify-center">
                                            <Shield className="w-6 h-6 text-blue-400" />
                                        </div>
                                        <h3 className="text-2xl font-black text-white">Functions & Responsibilities</h3>
                                    </div>
                                    <ul className="space-y-3 text-slate-300">
                                        {[
                                            "Policy formulation and strategic planning",
                                            "Approval of annual budget and financial oversight",
                                            "Academic program development and approval",
                                            "Infrastructure development decisions",
                                            "Faculty recruitment and welfare policies",
                                            "Ensuring compliance with regulatory bodies",
                                            "Quality assurance and accreditation matters"
                                        ].map((item, i) => (
                                            <li key={i} className="flex items-start gap-3">
                                                <div className="w-1.5 h-1.5 rounded-full bg-blue-400 mt-2" />
                                                {item}
                                            </li>
                                        ))}
                                    </ul>
                                </div>
                                <div className="space-y-6">
                                    <Card className="bg-white/5 border-white/10">
                                        <CardContent className="p-6">
                                            <div className="flex items-center gap-3 mb-4">
                                                <Award className="w-6 h-6 text-amber-400" />
                                                <h4 className="text-lg font-bold text-white">Accreditations</h4>
                                            </div>
                                            <div className="flex flex-wrap gap-2">
                                                {["NAAC A+", "AICTE", "JNTUK", "Autonomous"].map((acc, i) => (
                                                    <Badge key={i} variant="outline" className="text-amber-300 border-amber-500/30">
                                                        {acc}
                                                    </Badge>
                                                ))}
                                            </div>
                                        </CardContent>
                                    </Card>
                                    <Card className="bg-white/5 border-white/10">
                                        <CardContent className="p-6">
                                            <div className="flex items-center gap-3 mb-4">
                                                <Star className="w-6 h-6 text-emerald-400" />
                                                <h4 className="text-lg font-bold text-white">Meetings</h4>
                                            </div>
                                            <p className="text-slate-400 text-sm">
                                                The Governing Body meets at least twice a year to review institutional progress and take policy decisions.
                                            </p>
                                        </CardContent>
                                    </Card>
                                </div>
                            </div>
                        </CardContent>
                    </Card>
                </motion.section>
            </div>
        </div>
    );
}
