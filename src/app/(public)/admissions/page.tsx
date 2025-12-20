"use client";

import Link from "next/link";
import {
    GraduationCap,
    FileText,
    Calendar,
    CheckCircle2,
    ArrowRight,
    Phone,
    Mail,
    ChevronRight,
    Award,
    Users,
    Building2,
    Clock,
    Download,
    MapPin,
    Star
} from "lucide-react";

const programs = [
    {
        level: "Undergraduate",
        courses: [
            { name: "B.Tech Computer Science & Engineering", duration: "4 Years", seats: 180, code: "CSE" },
            { name: "B.Tech CSE (Data Science)", duration: "4 Years", seats: 60, code: "CSE-DS" },
            { name: "B.Tech CSE (AI & ML)", duration: "4 Years", seats: 60, code: "AI-ML" },
            { name: "B.Tech Information Technology", duration: "4 Years", seats: 120, code: "IT" },
            { name: "B.Tech Electronics & Communication", duration: "4 Years", seats: 120, code: "ECE" },
            { name: "B.Tech Civil Engineering", duration: "4 Years", seats: 60, code: "CIVIL" },
        ],
    },
    {
        level: "Postgraduate",
        courses: [
            { name: "MBA", duration: "2 Years", seats: 120, code: "MBA" },
            { name: "MCA", duration: "2 Years", seats: 60, code: "MCA" },
            { name: "M.Tech (CSE)", duration: "2 Years", seats: 24, code: "MTECH" },
        ],
    },
];

const admissionProcess = [
    { step: 1, title: "Online Application", description: "Fill the online application form with required details", icon: FileText },
    { step: 2, title: "Document Verification", description: "Submit required documents for verification", icon: CheckCircle2 },
    { step: 3, title: "Counseling", description: "Attend EAMCET/ICET counseling or management quota", icon: Users },
    { step: 4, title: "Fee Payment", description: "Pay admission fee and confirm your seat", icon: Award },
    { step: 5, title: "Enrollment", description: "Complete enrollment formalities and join NRIIT", icon: GraduationCap },
];

const highlights = [
    { label: "NAAC A+", value: "Accredited", icon: Award },
    { label: "NBA", value: "CSE | ECE | IT", icon: Star },
    { label: "Autonomous", value: "JNTUK Affiliated", icon: Building2 },
    { label: "100%", value: "Placement Assistance", icon: Users },
];

export default function AdmissionsPage() {
    return (
        <>
            {/* Hero Section - Premium Dark Navy + Gold */}
            <section className="pt-32 pb-20 bg-gradient-to-br from-[#0F172A] via-[#1e293b] to-[#0F172A] relative overflow-hidden">
                <div className="absolute inset-0 bg-[url('/pattern.svg')] opacity-5" />
                <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-[#D4AF37]/10 rounded-full blur-[150px]" />
                <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-blue-500/10 rounded-full blur-[150px]" />

                <div className="container mx-auto px-4 relative z-10">
                    <div className="grid lg:grid-cols-2 gap-12 items-center">
                        <div>
                            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[#D4AF37]/20 border border-[#D4AF37]/30 text-[#D4AF37] text-sm font-bold tracking-wide mb-6">
                                <GraduationCap className="w-4 h-4" />
                                Admissions Open 2025-26
                            </div>
                            <h1 className="text-4xl md:text-6xl font-black text-white mb-6 leading-tight">
                                Start Your <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#FFE082]">Journey</span> at NRIIT
                            </h1>
                            <p className="text-xl text-slate-300 mb-8">
                                Join India's premier autonomous institution. NAAC A+ Accredited, NBA certified programs, and 100% placement assistance.
                            </p>
                            <div className="flex flex-wrap gap-4 mb-12">
                                <Link
                                    href="/apply"
                                    className="inline-flex items-center gap-2 px-8 py-4 bg-[#D4AF37] hover:bg-[#FFE082] text-[#0F172A] rounded-2xl font-bold transition-all hover:scale-105 shadow-lg shadow-[#D4AF37]/30"
                                >
                                    Apply Now
                                    <ArrowRight className="w-5 h-5" />
                                </Link>
                                <Link
                                    href="/enquire"
                                    className="inline-flex items-center gap-2 px-8 py-4 bg-white/10 hover:bg-white/20 text-white rounded-2xl font-bold backdrop-blur-sm border border-white/20 transition-all"
                                >
                                    <Phone className="w-5 h-5" />
                                    Enquire Now
                                </Link>
                            </div>

                            {/* Highlights */}
                            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                                {highlights.map((item, idx) => (
                                    <div key={idx} className="bg-white/5 backdrop-blur-sm border border-white/10 rounded-2xl p-4 text-center hover:bg-white/10 transition-all">
                                        <item.icon className="w-6 h-6 text-[#D4AF37] mx-auto mb-2" />
                                        <div className="text-white font-bold">{item.label}</div>
                                        <div className="text-slate-400 text-xs">{item.value}</div>
                                    </div>
                                ))}
                            </div>
                        </div>

                        {/* Right Side - Campus Image Card */}
                        <div className="relative hidden lg:block">
                            <div className="relative rounded-3xl overflow-hidden border-4 border-white/10 shadow-2xl">
                                <img
                                    src="/banners/global-stage.png"
                                    alt="NRIIT Campus"
                                    className="w-full h-[500px] object-cover"
                                />
                                <div className="absolute inset-0 bg-gradient-to-t from-[#0F172A] via-transparent to-transparent" />
                                <div className="absolute bottom-0 left-0 right-0 p-8">
                                    <div className="flex items-center justify-between">
                                        <div>
                                            <h3 className="text-2xl font-bold text-white mb-1">Visadala Campus</h3>
                                            <p className="text-[#D4AF37] flex items-center gap-2">
                                                <MapPin className="w-4 h-4" />
                                                Guntur, Andhra Pradesh
                                            </p>
                                        </div>
                                        <div className="bg-[#D4AF37] text-[#0F172A] px-4 py-2 rounded-xl font-bold text-sm">
                                            25+ Acres
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/* Floating Badge */}
                            <div className="absolute -top-4 -right-4 bg-[#D4AF37] text-[#0F172A] px-6 py-3 rounded-2xl font-bold shadow-xl">
                                <div className="text-xs uppercase tracking-wider">Ranking</div>
                                <div className="text-xl font-black">NAAC A+</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Programs Offered - Premium Cards */}
            <section className="py-20 bg-white">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="text-[#D4AF37] font-bold text-xs uppercase tracking-[0.2em] mb-3 block">Academic Programs</span>
                        <h2 className="text-4xl md:text-5xl font-black text-[#0F172A] mb-4">
                            Choose Your <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#F5A201]">Path</span>
                        </h2>
                        <p className="text-slate-500">
                            World-class undergraduate and postgraduate programs in engineering, technology, and management.
                        </p>
                    </div>

                    <div className="space-y-16">
                        {programs.map((category) => (
                            <div key={category.level}>
                                <div className="flex items-center gap-3 mb-8">
                                    <div className="w-12 h-12 rounded-2xl bg-gradient-to-br from-[#D4AF37] to-[#F5A201] flex items-center justify-center">
                                        <GraduationCap className="w-6 h-6 text-white" />
                                    </div>
                                    <div>
                                        <h3 className="text-2xl font-bold text-[#0F172A]">{category.level} Programs</h3>
                                        <p className="text-slate-400 text-sm">{category.courses.length} Programs Available</p>
                                    </div>
                                </div>
                                <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                                    {category.courses.map((course) => (
                                        <Link
                                            key={course.name}
                                            href={`/departments/${course.code.toLowerCase()}`}
                                            className="group p-6 rounded-2xl bg-slate-50 border-2 border-slate-100 hover:border-[#D4AF37] transition-all hover:shadow-xl"
                                        >
                                            <div className="flex justify-between items-start mb-4">
                                                <span className="px-3 py-1 bg-[#D4AF37]/10 text-[#D4AF37] rounded-lg text-xs font-bold">
                                                    {course.code}
                                                </span>
                                                <ChevronRight className="w-5 h-5 text-slate-300 group-hover:text-[#D4AF37] group-hover:translate-x-1 transition-all" />
                                            </div>
                                            <h4 className="font-bold text-[#0F172A] mb-3 group-hover:text-[#D4AF37] transition-colors">{course.name}</h4>
                                            <div className="flex items-center justify-between text-sm">
                                                <span className="flex items-center gap-2 text-slate-500">
                                                    <Clock className="w-4 h-4" />
                                                    {course.duration}
                                                </span>
                                                <span className="px-3 py-1 bg-emerald-100 text-emerald-700 rounded-full text-xs font-bold">
                                                    {course.seats} Seats
                                                </span>
                                            </div>
                                        </Link>
                                    ))}
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Admission Process - Timeline */}
            <section className="py-20 bg-gradient-to-br from-[#0F172A] to-[#1e293b]">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="text-[#D4AF37] font-bold text-xs uppercase tracking-[0.2em] mb-3 block">How to Apply</span>
                        <h2 className="text-4xl md:text-5xl font-black text-white mb-4">
                            Admission <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#FFE082]">Process</span>
                        </h2>
                        <p className="text-slate-400">
                            Simple 5-step process to become part of the NRIIT family.
                        </p>
                    </div>

                    <div className="grid md:grid-cols-5 gap-6">
                        {admissionProcess.map((item, idx) => (
                            <div key={item.step} className="relative">
                                <div className="bg-white/5 backdrop-blur-sm border border-white/10 rounded-2xl p-6 text-center hover:bg-white/10 transition-all group">
                                    <div className="w-16 h-16 rounded-2xl bg-gradient-to-br from-[#D4AF37] to-[#F5A201] flex items-center justify-center mx-auto mb-4 group-hover:scale-110 transition-transform">
                                        <item.icon className="w-8 h-8 text-white" />
                                    </div>
                                    <div className="text-[#D4AF37] text-sm font-bold mb-2">Step {item.step}</div>
                                    <h3 className="text-white font-bold mb-2">{item.title}</h3>
                                    <p className="text-slate-400 text-sm">{item.description}</p>
                                </div>
                                {idx < admissionProcess.length - 1 && (
                                    <div className="hidden md:block absolute top-1/2 -right-3 transform -translate-y-1/2">
                                        <ChevronRight className="w-6 h-6 text-[#D4AF37]" />
                                    </div>
                                )}
                            </div>
                        ))}
                    </div>

                    <div className="text-center mt-12">
                        <Link
                            href="/apply"
                            className="inline-flex items-center gap-2 px-10 py-5 bg-[#D4AF37] hover:bg-[#FFE082] text-[#0F172A] rounded-2xl font-bold text-lg transition-all hover:scale-105 shadow-lg shadow-[#D4AF37]/30"
                        >
                            Start Application
                            <ArrowRight className="w-6 h-6" />
                        </Link>
                    </div>
                </div>
            </section>

            {/* Contact CTA */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="bg-gradient-to-r from-[#013C58] to-[#00537A] rounded-3xl p-8 md:p-12 flex flex-col md:flex-row items-center justify-between gap-8">
                        <div className="text-white">
                            <h3 className="text-3xl font-black mb-2">Need Help with Admissions?</h3>
                            <p className="text-slate-300">Our admissions team is here to guide you through the process.</p>
                        </div>
                        <div className="flex flex-wrap gap-4">
                            <a href="tel:08632344300" className="flex items-center gap-2 px-6 py-3 bg-white text-[#013C58] rounded-xl font-bold hover:shadow-xl transition-all">
                                <Phone className="w-5 h-5" />
                                0863 234 4300
                            </a>
                            <a href="mailto:admissions@nriit.ac.in" className="flex items-center gap-2 px-6 py-3 bg-white/10 text-white rounded-xl font-bold backdrop-blur-sm border border-white/20 hover:bg-white/20 transition-all">
                                <Mail className="w-5 h-5" />
                                admissions@nriit.ac.in
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </>
    );
}
