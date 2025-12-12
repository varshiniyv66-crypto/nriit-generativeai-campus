"use client";

import Link from "next/link";
import { Briefcase, TrendingUp, Building2, Users, ArrowRight, CheckCircle2, Star } from "lucide-react";

const placementStats = [
    { label: "Placement Rate", value: "95%", icon: TrendingUp },
    { label: "Highest Package", value: "42 LPA", icon: Star },
    { label: "Average Package", value: "6.5 LPA", icon: Briefcase },
    { label: "Recruiting Companies", value: "200+", icon: Building2 },
];

const topRecruiters = [
    "TCS", "Infosys", "Wipro", "HCL", "Tech Mahindra", "Cognizant",
    "Capgemini", "Accenture", "IBM", "Amazon", "Microsoft", "Google",
    "Oracle", "SAP", "Deloitte", "KPMG", "PwC", "Ernst & Young",
    "L&T", "Bharat Electronics", "DRDO", "ISRO", "Zoho", "Freshworks"
];

const placementProcess = [
    { step: 1, title: "Pre-Placement Training", description: "Comprehensive training on aptitude, technical skills, and soft skills" },
    { step: 2, title: "Resume Building", description: "Professional resume preparation and review sessions" },
    { step: 3, title: "Mock Interviews", description: "Multiple rounds of mock interviews with industry experts" },
    { step: 4, title: "Company Registration", description: "Students register for campus drives based on eligibility" },
    { step: 5, title: "Placement Drives", description: "On-campus and off-campus recruitment drives throughout the year" },
];

export default function PlacementsPage() {
    return (
        <div className="min-h-screen">

            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        Career Opportunities
                    </span>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        Launch Your <span className="text-yellow-300">Career</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto mb-8">
                        Our dedicated Training & Placement Cell works tirelessly to connect students
                        with the best career opportunities in the industry.
                    </p>
                </div>
            </section>

            {/* Stats Section */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                        {placementStats.map((stat) => (
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

            {/* Top Recruiters */}
            <section className="py-20 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="inline-block px-4 py-1.5 bg-blue-100 text-blue-700 rounded-full text-sm font-semibold mb-4">
                            Our Recruiters
                        </span>
                        <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                            Top Companies <span className="gradient-text">Trust Us</span>
                        </h2>
                        <p className="text-gray-600">
                            Leading companies visit our campus every year to recruit our talented students.
                        </p>
                    </div>

                    <div className="grid grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4">
                        {topRecruiters.map((company) => (
                            <div
                                key={company}
                                className="p-4 bg-white rounded-xl border border-gray-100 text-center hover:shadow-lg hover:border-blue-200 transition-all"
                            >
                                <span className="font-semibold text-gray-700">{company}</span>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Placement Process */}
            <section className="py-20 bg-white">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="inline-block px-4 py-1.5 bg-purple-100 text-purple-700 rounded-full text-sm font-semibold mb-4">
                            How It Works
                        </span>
                        <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                            Placement <span className="gradient-text">Process</span>
                        </h2>
                        <p className="text-gray-600">
                            Our comprehensive placement preparation ensures every student is industry-ready.
                        </p>
                    </div>

                    <div className="max-w-4xl mx-auto">
                        <div className="space-y-6">
                            {placementProcess.map((item) => (
                                <div
                                    key={item.step}
                                    className="flex items-start gap-6 p-6 bg-gray-50 rounded-xl border border-gray-100 hover:shadow-md transition-shadow"
                                >
                                    <div className="flex-shrink-0 w-12 h-12 rounded-full gradient-bg flex items-center justify-center text-white font-bold text-lg">
                                        {item.step}
                                    </div>
                                    <div>
                                        <h3 className="font-semibold text-gray-900 text-lg mb-1">{item.title}</h3>
                                        <p className="text-gray-600">{item.description}</p>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>

            {/* CRT Section */}
            <section className="py-20 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-2 gap-8 items-center">
                        <div>
                            <span className="inline-block px-4 py-1.5 bg-green-100 text-green-700 rounded-full text-sm font-semibold mb-4">
                                Training Programs
                            </span>
                            <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
                                Campus Recruitment <span className="gradient-text">Training</span>
                            </h2>
                            <p className="text-gray-600 mb-6">
                                Our CRT program is designed to bridge the gap between academics and industry requirements,
                                ensuring our students are well-prepared for campus placements.
                            </p>
                            <ul className="space-y-3 text-gray-600 mb-8">
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Aptitude & Reasoning Training
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Technical Skills Development
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Communication & Soft Skills
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Group Discussion & Interview Preparation
                                </li>
                            </ul>
                        </div>
                        <div className="bg-white rounded-2xl p-8 shadow-lg border border-gray-100">
                            <h3 className="font-bold text-gray-900 text-xl mb-6 flex items-center gap-3">
                                <Users className="w-6 h-6 text-blue-600" />
                                Training & Placement Cell
                            </h3>
                            <div className="space-y-4">
                                <div className="p-4 bg-gray-50 rounded-xl">
                                    <div className="font-semibold text-gray-900">Dr. Training Head</div>
                                    <div className="text-sm text-gray-600">Director, T&P Cell</div>
                                </div>
                                <div className="p-4 bg-gray-50 rounded-xl">
                                    <div className="font-semibold text-gray-900">Email</div>
                                    <div className="text-sm text-blue-600">placements@nriit.ac.in</div>
                                </div>
                                <div className="p-4 bg-gray-50 rounded-xl">
                                    <div className="font-semibold text-gray-900">Phone</div>
                                    <div className="text-sm text-gray-600">0863 234 4300</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA */}
            <section className="py-16 gradient-bg">
                <div className="container mx-auto px-4 text-center">
                    <h2 className="text-2xl md:text-3xl font-bold text-white mb-4">
                        Ready to Start Your Career?
                    </h2>
                    <p className="text-white/80 mb-8 max-w-2xl mx-auto">
                        Join NRIIT and get access to world-class placement opportunities.
                    </p>
                    <Link
                        href="/apply"
                        className="inline-flex items-center gap-2 px-8 py-4 bg-white text-blue-700 rounded-full font-semibold hover:shadow-2xl transition-all"
                    >
                        Apply for Admission
                        <ArrowRight className="w-5 h-5" />
                    </Link>
                </div>
            </section>
        </div>
    );
}
