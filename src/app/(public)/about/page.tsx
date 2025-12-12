"use client";

import { Building2, Users, GraduationCap, Award, Target, Eye, Heart, Star, CheckCircle2 } from "lucide-react";

import realData from "@/data/extracted_content.json";

const stats = [
    { label: "Years of Excellence", value: "15+", icon: Building2 }, // Established 2008
    { label: "Students", value: "2600+", icon: GraduationCap }, // From extracted data
    { label: "Faculty", value: "300+", icon: Users },
    { label: "Placements", value: "95%", icon: Award },
];

const achievements = [
    "NBA Accredited Programs",
    "NAAC Accredited Institution",
    "AICTE Approved",
    "Affiliated to JNTUK",
    "State-of-the-art Infrastructure",
    "Industry Partnerships with Fortune 500",
    "Research Centers of Excellence",
    "International Collaborations",
];

export default function AboutPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        About NRIIT
                    </span>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        Shaping Future <span className="text-yellow-300">Engineers</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto">
                        NRI Institute of Technology (NRIIT), established in 2008, is a premier engineering college in Guntur district, Andhra Pradesh.
                        Autonomous and accredited with NAAC A+ Grade.
                    </p>
                </div>
            </section>

            {/* History Section - Added from Real Data */}
            <section className="py-16 bg-white border-b border-gray-100">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6 text-center">Our History & Legacy</h2>
                        <div className="prose prose-lg mx-auto text-gray-600 leading-relaxed text-justify">
                            {realData.about.history.replace("HISTORY ", "")}
                        </div>
                    </div>
                </div>
            </section>

            {/* Stats Section */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                        {stats.map((stat) => (
                            <div
                                key={stat.label}
                                className="text-center p-6 rounded-2xl bg-gray-50 border border-gray-100 hover:shadow-lg transition-shadow"
                            >
                                <stat.icon className="w-10 h-10 text-blue-600 mx-auto mb-4" />
                                <div className="text-3xl md:text-4xl font-bold text-gray-900 mb-2">{stat.value}</div>
                                <div className="text-sm text-gray-600">{stat.label}</div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Vision & Mission */}
            <section className="py-20 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-2 gap-8">
                        {/* Vision */}
                        <div className="bg-white rounded-2xl p-8 shadow-sm border border-gray-100">
                            <div className="flex items-center gap-4 mb-6">
                                <div className="w-14 h-14 rounded-xl gradient-bg flex items-center justify-center">
                                    <Eye className="w-7 h-7 text-white" />
                                </div>
                                <h2 className="text-2xl font-bold text-gray-900">Our Vision</h2>
                            </div>
                            <p className="text-gray-600 leading-relaxed">
                                To be a globally recognized institution of excellence in technical education,
                                research, and innovation, producing industry-ready graduates who are ethical,
                                socially responsible, and capable of addressing contemporary challenges.
                            </p>
                        </div>

                        {/* Mission */}
                        <div className="bg-white rounded-2xl p-8 shadow-sm border border-gray-100">
                            <div className="flex items-center gap-4 mb-6">
                                <div className="w-14 h-14 rounded-xl bg-purple-600 flex items-center justify-center">
                                    <Target className="w-7 h-7 text-white" />
                                </div>
                                <h2 className="text-2xl font-bold text-gray-900">Our Mission</h2>
                            </div>
                            <ul className="text-gray-600 space-y-3">
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Provide quality education through innovative teaching methodologies
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Foster research culture and industry collaboration
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Develop holistic personality with ethical values
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            {/* Our Values */}
            <section className="py-20 bg-white">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="inline-block px-4 py-1.5 bg-blue-100 text-blue-700 rounded-full text-sm font-semibold mb-4">
                            Our Core Values
                        </span>
                        <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                            What We <span className="gradient-text">Stand For</span>
                        </h2>
                        <p className="text-gray-600">
                            Our values guide everything we do, from classroom teaching to industry partnerships.
                        </p>
                    </div>

                    <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
                        {[
                            { icon: Star, title: "Excellence", description: "Striving for the highest standards in education and research" },
                            { icon: Heart, title: "Integrity", description: "Upholding ethical practices in all our endeavors" },
                            { icon: Users, title: "Inclusivity", description: "Creating a diverse and welcoming environment for all" },
                            { icon: Target, title: "Innovation", description: "Embracing new ideas and technological advancements" },
                        ].map((value) => (
                            <div
                                key={value.title}
                                className="p-6 rounded-2xl bg-gray-50 border border-gray-100 hover:shadow-lg hover:border-blue-200 transition-all text-center group"
                            >
                                <div className="w-14 h-14 rounded-xl bg-blue-100 flex items-center justify-center mx-auto mb-4 group-hover:bg-blue-600 transition-colors">
                                    <value.icon className="w-7 h-7 text-blue-600 group-hover:text-white transition-colors" />
                                </div>
                                <h3 className="text-lg font-semibold text-gray-900 mb-2">{value.title}</h3>
                                <p className="text-sm text-gray-600">{value.description}</p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Achievements */}
            <section className="py-20 gradient-bg">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
                            Our Achievements
                        </h2>
                        <p className="text-white/80">
                            Recognized for excellence in education and innovation
                        </p>
                    </div>

                    <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4">
                        {achievements.map((achievement) => (
                            <div
                                key={achievement}
                                className="flex items-center gap-3 p-4 bg-white/10 backdrop-blur-sm rounded-xl border border-white/20"
                            >
                                <CheckCircle2 className="w-5 h-5 text-green-400 flex-shrink-0" />
                                <span className="text-white font-medium">{achievement}</span>
                            </div>
                        ))}
                    </div>
                </div>
            </section>
        </div>
    );
}
