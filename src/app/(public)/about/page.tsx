"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { Building2, Users, GraduationCap, Award, Target, Eye, Heart, Star, CheckCircle2, BookOpen, Sparkles } from "lucide-react";
import DepartmentSpotlight from "@/components/home/DepartmentSpotlight";
import realData from "@/data/extracted_content.json";

const stats = [
    { label: "Years of Excellence", value: "15+", icon: Building2 },
    { label: "Students", value: "2600+", icon: GraduationCap },
    { label: "Faculty", value: "300+", icon: Users },
    { label: "Placements", value: "95%", icon: Award },
];

const achievements = [
    "NAAC A+ Accredited Institution",
    "Autonomous Status Institution",
    "AICTE Approved",
    "Affiliated to JNTUK (Guntur)",
    "State-of-the-art Infrastructure",
    "Industry Partnerships with Fortune 500",
    "Research Centers of Excellence",
    "International Collaborations",
];

const values = [
    { icon: Star, title: "Excellence", color: "from-yellow-400 to-orange-500" },
    { icon: Heart, title: "Integrity", color: "from-rose-400 to-pink-500" },
    { icon: Users, title: "Inclusivity", color: "from-blue-400 to-indigo-500" },
    { icon: Target, title: "Innovation", color: "from-emerald-400 to-teal-500" },
];

// Gallery images for the animated marquees - ALL 31 IMAGES
const allGalleryImages = [
    // Gallery photos (24 PNG files)
    "/gallery/569031081_17884096032394797_7260677632664801698_n. - Copy.png",
    "/gallery/569067749_17884547403394797_8801774493399912125_n. - Copy - Copy.png",
    "/gallery/571396112_17884638273394797_4177157676786452408_n. - Copy - Copy.png",
    "/gallery/571396112_17884638273394797_4177157676786452408_n. - Copy.png",
    "/gallery/571396112_17884638273394797_4177157676786452408_n..png",
    "/gallery/571438824_17884096068394797_7726673159106898094_n. - Copy - Copy.png",
    "/gallery/571647730_17884733448394797_217842872340785337_n. - Copy - Copy.png",
    "/gallery/571656771_17884604793394797_8831772697411328282_n. (1) - Copy.png",
    "/gallery/571722750_17884096011394797_8998108365086871295_n (1).png",
    "/gallery/571722750_17884096011394797_8998108365086871295_n.png",
    "/gallery/571812568_17884733409394797_8475558754309514453_n. - Copy - Copy.png",
    "/gallery/571812568_17884733409394797_8475558754309514453_n. - Copy.png",
    "/gallery/571812568_17884733409394797_8475558754309514453_n..png",
    "/gallery/571812568_17884733409394797_8475558754309514453_n.png",
    "/gallery/571863107_17884733400394797_4154023143693683405_n..png",
    "/gallery/571863107_17884733400394797_4154023143693683405_n.png",
    "/gallery/571941530_17884638282394797_6523397916169445826_n.png",
    "/gallery/572082993_17884547502394797_4932840773585110892_n.png",
    "/gallery/573557495_17884638300394797_8009028679019464750_n. (1).png",
    "/gallery/573564126_17884547421394797_4917545577562699784_n. - Copy.png",
    "/gallery/573564126_17884547421394797_4917545577562699784_n.png",
    "/gallery/chairman.png",
    "/gallery/naac-aplus.png",
    "/gallery/nriit-autonomous.png",
    // Banner images (7 files)
    "/banners/cse.png",
    "/banners/ece.png",
    "/banners/it.png",
    "/banners/mba.png",
    "/banners/civil.png",
    "/banners/mca.png",
    "/banners/cse-alt.png",
    "/nriit-logo.png",
];

// Fisher-Yates shuffle algorithm
function shuffleArray<T>(array: T[]): T[] {
    const shuffled = [...array];
    for (let i = shuffled.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    return shuffled;
}

export default function AboutPage() {
    // Randomly shuffle images on component mount
    const [leftImages, setLeftImages] = useState(allGalleryImages);
    const [rightImages, setRightImages] = useState(allGalleryImages);

    useEffect(() => {
        setLeftImages(shuffleArray(allGalleryImages));
        setRightImages(shuffleArray(allGalleryImages));
    }, []);

    return (
        <>
            {/* ═══════════════════════════════════════════════════════════════ */}
            {/* HERO SECTION - With Animated Side Frames */}
            {/* ═══════════════════════════════════════════════════════════════ */}
            <section className="relative py-12 md:py-16 overflow-hidden bg-gradient-to-b from-slate-50 to-white">
                <div className="container mx-auto px-4">
                    <div className="grid lg:grid-cols-[280px_1fr_280px] gap-8 items-center min-h-[500px]">

                        {/* LEFT FRAME - Vertical Scroll (Top to Bottom) */}
                        <div className="hidden lg:block relative h-[500px] rounded-2xl overflow-hidden bg-[#0F172A] shadow-2xl">
                            <div className="absolute inset-0 bg-gradient-to-b from-[#0F172A] via-transparent to-[#0F172A] z-10 pointer-events-none" />

                            {/* Scrolling Container - Top to Bottom */}
                            <div className="animate-scroll-down space-y-6 p-4">
                                {[...leftImages, ...leftImages, ...leftImages].map((img, i) => (
                                    <div key={i} className="rounded-xl overflow-hidden shadow-lg border border-white/10 hover:border-[#D4AF37]/50 transition-all group">
                                        <img
                                            src={encodeURI(img)}
                                            alt={`Gallery ${i + 1}`}
                                            className="w-full h-48 object-cover group-hover:scale-110 transition-transform duration-700"
                                            onError={(e) => {
                                                e.currentTarget.src = "https://placehold.co/280x180/1E3A8A/D4AF37?text=NRIIT";
                                            }}
                                        />
                                    </div>
                                ))}
                            </div>
                        </div>

                        {/* CENTER CONTENT */}
                        <div className="text-center z-10 py-8">
                            <div className="inline-flex items-center gap-2 px-5 py-2 rounded-full bg-gradient-to-r from-[#D4AF37]/20 to-[#D4AF37]/10 border border-[#D4AF37]/30 mb-8 animate-fade-in">
                                <Sparkles className="w-4 h-4 text-[#D4AF37]" />
                                <span className="text-sm font-bold text-[#D4AF37] uppercase tracking-widest">Legacy of Excellence</span>
                            </div>

                            <h1 className="text-5xl md:text-6xl lg:text-7xl font-black mb-8 text-slate-900 tracking-tight animate-fade-in-up leading-tight">
                                Shaping Future <br />
                                <span className="bg-clip-text text-transparent bg-gradient-to-r from-[#D4AF37] via-[#F5C84C] to-[#D4AF37]">
                                    Tech Leaders
                                </span>
                            </h1>

                            <p className="text-lg md:text-xl text-slate-600 max-w-2xl mx-auto leading-relaxed animate-fade-in-up delay-100">
                                NRI Institute of Technology (NRIIT), established in 2008, is a premier autonomous engineering college in Andhra Pradesh.
                            </p>
                            <p className="mt-4 text-[#D4AF37] font-bold text-lg animate-fade-in-up delay-200">
                                NAAC A+ Accredited • JNTUK Permanent Affiliation
                            </p>
                        </div>

                        {/* RIGHT FRAME - Vertical Scroll (Bottom to Top) */}
                        <div className="hidden lg:block relative h-[500px] rounded-2xl overflow-hidden bg-[#0F172A] shadow-2xl">
                            <div className="absolute inset-0 bg-gradient-to-b from-[#0F172A] via-transparent to-[#0F172A] z-10 pointer-events-none" />

                            {/* Scrolling Container - Bottom to Top */}
                            <div className="animate-scroll-up space-y-6 p-4">
                                {[...rightImages, ...rightImages, ...rightImages].map((img, i) => (
                                    <div key={i} className="rounded-xl overflow-hidden shadow-lg border border-white/10 hover:border-[#D4AF37]/50 transition-all group">
                                        <img
                                            src={img}
                                            alt={`Gallery ${i + 1}`}
                                            className="w-full h-48 object-cover group-hover:scale-110 transition-transform duration-700"
                                            onError={(e) => {
                                                e.currentTarget.src = "https://placehold.co/280x180/1E3A8A/D4AF37?text=NRIIT";
                                            }}
                                        />
                                    </div>
                                ))}
                            </div>
                        </div>

                    </div>
                </div>

                {/* CSS Animations */}
                <style jsx>{`
                    @keyframes scrollDown {
                        0% { transform: translateY(-50%); }
                        100% { transform: translateY(0%); }
                    }
                    @keyframes scrollUp {
                        0% { transform: translateY(0%); }
                        100% { transform: translateY(-50%); }
                    }
                    .animate-scroll-down {
                        animation: scrollDown 20s linear infinite;
                    }
                    .animate-scroll-up {
                        animation: scrollUp 20s linear infinite;
                    }
                `}</style>
            </section>

            {/* ═══════════════════════════════════════════════════════════════ */}
            {/* STATS ROW - Premium Diamond Cards */}
            {/* ═══════════════════════════════════════════════════════════════ */}
            <section className="py-16 bg-white relative z-10">
                <div className="container mx-auto px-4">
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                        {stats.map((stat, idx) => (
                            <div
                                key={stat.label}
                                className="text-center p-8 rounded-3xl bg-gradient-to-br from-white to-slate-50 border border-slate-200/80 hover:border-[#D4AF37]/50 transition-all group hover:-translate-y-2 hover:shadow-2xl hover:shadow-[#D4AF37]/10 duration-500"
                                style={{ animationDelay: `${idx * 100}ms` }}
                            >
                                <div className="w-16 h-16 mx-auto mb-6 rounded-2xl bg-gradient-to-br from-[#D4AF37] to-[#B4941F] flex items-center justify-center group-hover:scale-110 group-hover:rotate-6 transition-all duration-500 shadow-lg shadow-[#D4AF37]/20">
                                    <stat.icon className="w-8 h-8 text-white" />
                                </div>
                                <div className="text-4xl md:text-5xl font-black text-slate-900 mb-2 group-hover:text-[#D4AF37] transition-colors">{stat.value}</div>
                                <div className="text-xs font-bold text-slate-500 uppercase tracking-[0.15em]">{stat.label}</div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* ═══════════════════════════════════════════════════════════════ */}
            {/* MAIN CONTENT: 2-Column Layout (Spotlight + Sidebar) */}
            {/* ═══════════════════════════════════════════════════════════════ */}
            <section className="py-20 bg-slate-50 relative overflow-hidden">
                {/* Background Decor */}
                <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-blue-100/30 rounded-full blur-[120px] -translate-y-1/2 translate-x-1/2" />
                <div className="absolute bottom-0 left-0 w-[600px] h-[600px] bg-[#D4AF37]/5 rounded-full blur-[120px] translate-y-1/2 -translate-x-1/2" />

                <div className="container mx-auto px-4 relative z-10">
                    {/* Section Header */}
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="inline-block px-4 py-1.5 rounded-full border border-blue-200 bg-blue-50 text-blue-600 text-[10px] font-bold uppercase tracking-widest mb-4">
                            Academic Excellence
                        </span>
                        <h2 className="text-4xl md:text-5xl font-black text-slate-900 mb-4">
                            Schools of <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600">Innovation</span>
                        </h2>
                        <p className="text-slate-600 text-lg">
                            Explore our 11+ cutting-edge departments designed to foster research, innovation, and global leadership.
                        </p>
                    </div>

                    {/* 2-COLUMN GRID: Spotlight (Left) + Sidebar (Right) */}
                    <div className="grid lg:grid-cols-[1fr_380px] gap-8 items-start">

                        {/* LEFT: Department Spotlight */}
                        <div className="order-2 lg:order-1">
                            <DepartmentSpotlight />
                        </div>

                        {/* RIGHT: Premium Sidebar */}
                        <div className="order-1 lg:order-2 space-y-6 lg:sticky lg:top-24">

                            {/* History & Legacy Card */}
                            <div className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-lg hover:shadow-xl transition-all group overflow-hidden relative">
                                <div className="absolute top-0 right-0 w-24 h-24 bg-gradient-to-bl from-[#D4AF37]/10 to-transparent rounded-bl-full" />

                                <div className="flex items-center gap-4 mb-5 relative z-10">
                                    <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-[#D4AF37] to-[#B4941F] flex items-center justify-center shadow-lg shadow-[#D4AF37]/20 group-hover:scale-110 transition-transform">
                                        <BookOpen className="w-6 h-6 text-white" />
                                    </div>
                                    <h3 className="text-xl font-bold text-slate-900">Our History & Legacy</h3>
                                </div>

                                <p className="text-slate-600 text-sm leading-relaxed relative z-10">
                                    {realData.about.history.replace("HISTORY ", "").substring(0, 500)}...
                                </p>

                                <Link href="/about" className="mt-4 text-[#D4AF37] font-bold text-sm hover:underline flex items-center gap-1">
                                    Read Full History <span>→</span>
                                </Link>
                            </div>

                            {/* Vision Card */}
                            <div className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-lg hover:shadow-xl transition-all group overflow-hidden relative">
                                <div className="absolute top-0 right-0 w-24 h-24 bg-gradient-to-bl from-blue-500/10 to-transparent rounded-bl-full" />

                                <div className="flex items-center gap-4 mb-5 relative z-10">
                                    <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center shadow-lg shadow-blue-500/20 group-hover:scale-110 transition-transform">
                                        <Eye className="w-6 h-6 text-white" />
                                    </div>
                                    <h3 className="text-xl font-bold text-slate-900">Our Vision</h3>
                                </div>

                                <p className="text-slate-600 text-sm leading-relaxed relative z-10">
                                    To become reputed institution of Engineering & Management programs, Producing competitive, ethical & socially responsible professionals.
                                </p>
                            </div>

                            {/* Mission Card */}
                            <div className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-lg hover:shadow-xl transition-all group overflow-hidden relative">
                                <div className="absolute top-0 right-0 w-24 h-24 bg-gradient-to-bl from-purple-500/10 to-transparent rounded-bl-full" />

                                <div className="flex items-center gap-4 mb-5 relative z-10">
                                    <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-purple-500 to-pink-600 flex items-center justify-center shadow-lg shadow-purple-500/20 group-hover:scale-110 transition-transform">
                                        <Target className="w-6 h-6 text-white" />
                                    </div>
                                    <h3 className="text-xl font-bold text-slate-900">Our Mission</h3>
                                </div>

                                <ul className="text-slate-600 text-sm space-y-3 relative z-10">
                                    {[
                                        "Provide quality education through best teaching and learning practices of committed staff.",
                                        "Establish a continuous interaction, participation and collaboration with industry to provide solutions.",
                                        "Provide the facilities that motivate/encourage faculty and students in research and development activities.",
                                        "Develop human values, professional ethics and interpersonal skills amongst the individuals."
                                    ].map((item, i) => (
                                        <li key={i} className="flex items-start gap-2">
                                            <CheckCircle2 className="w-4 h-4 text-purple-500 mt-1 shrink-0" />
                                            <span>{item}</span>
                                        </li>
                                    ))}
                                </ul>
                            </div>

                            {/* What We Stand For - Compact */}
                            <div className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-lg">
                                <h3 className="text-lg font-bold text-slate-900 mb-4">What We Stand For</h3>
                                <div className="grid grid-cols-2 gap-3">
                                    {values.map((value, idx) => (
                                        <div key={idx} className="flex items-center gap-3 p-3 rounded-xl bg-slate-50 hover:bg-slate-100 transition-colors group">
                                            <div className={`w-10 h-10 rounded-lg bg-gradient-to-br ${value.color} flex items-center justify-center shadow-sm group-hover:scale-110 transition-transform`}>
                                                <value.icon className="w-5 h-5 text-white" />
                                            </div>
                                            <span className="text-sm font-semibold text-slate-700">{value.title}</span>
                                        </div>
                                    ))}
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>

            {/* ═══════════════════════════════════════════════════════════════ */}
            {/* GLOBAL RECOGNITION - Achievement Badges */}
            {/* ═══════════════════════════════════════════════════════════════ */}
            <section className="py-20 bg-white border-t border-slate-100">
                <div className="container mx-auto px-4">
                    <div className="text-center mb-12">
                        <h2 className="text-3xl font-bold text-slate-900 mb-3">Global Recognition</h2>
                        <div className="h-1 w-24 bg-gradient-to-r from-transparent via-[#D4AF37] to-transparent mx-auto rounded-full" />
                    </div>

                    <div className="flex flex-wrap justify-center gap-4">
                        {achievements.map((achievement) => (
                            <div
                                key={achievement}
                                className="flex items-center gap-3 px-6 py-3 bg-slate-50 hover:bg-white rounded-full border border-slate-200 hover:border-[#D4AF37]/50 hover:shadow-lg hover:shadow-[#D4AF37]/10 transition-all group cursor-default"
                            >
                                <div className="w-2.5 h-2.5 rounded-full bg-[#D4AF37] group-hover:animate-pulse shadow-sm shadow-[#D4AF37]/50" />
                                <span className="text-slate-700 font-medium group-hover:text-slate-900 transition-colors">{achievement}</span>
                            </div>
                        ))}
                    </div>
                </div>
            </section>
        </>
    );
}
