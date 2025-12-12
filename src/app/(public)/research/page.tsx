"use client";
import Link from "next/link";
import { FlaskConical, BookOpen, Users, Award, FileText, TrendingUp, ArrowRight, CheckCircle2 } from "lucide-react";

const researchAreas = [
    {
        title: "Artificial Intelligence & Machine Learning",
        description: "Research on deep learning, NLP, computer vision, and intelligent systems",
        papers: 45,
    },
    {
        title: "Data Science & Big Data Analytics",
        description: "Research on data mining, predictive analytics, and cloud computing",
        papers: 32,
    },
    {
        title: "Internet of Things (IoT)",
        description: "Smart systems, embedded computing, and sensor networks",
        papers: 28,
    },
    {
        title: "Cybersecurity",
        description: "Network security, cryptography, and ethical hacking research",
        papers: 22,
    },
    {
        title: "Renewable Energy",
        description: "Solar energy systems, smart grids, and sustainable technologies",
        papers: 18,
    },
    {
        title: "VLSI & Embedded Systems",
        description: "Circuit design, FPGA implementations, and hardware optimization",
        papers: 25,
    },
];

const researchStats = [
    { label: "Research Papers", value: "500+", icon: FileText },
    { label: "Patents Filed", value: "25+", icon: Award },
    { label: "Funded Projects", value: "₹5 Cr+", icon: TrendingUp },
    { label: "Research Scholars", value: "50+", icon: Users },
];

export default function ResearchPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        Research & Innovation
                    </span>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        Pioneering <span className="text-yellow-300">Research</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto">
                        At NRIIT, we foster a culture of research and innovation, contributing to the
                        advancement of knowledge across various domains.
                    </p>
                </div>
            </section>

            {/* Stats Section */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                        {researchStats.map((stat) => (
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

            {/* Research Areas */}
            <section className="py-20 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="inline-block px-4 py-1.5 bg-blue-100 text-blue-700 rounded-full text-sm font-semibold mb-4">
                            Focus Areas
                        </span>
                        <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                            Research <span className="gradient-text">Domains</span>
                        </h2>
                        <p className="text-gray-600">
                            Our faculty and students are actively engaged in cutting-edge research across multiple disciplines.
                        </p>
                    </div>

                    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {researchAreas.map((area) => (
                            <div
                                key={area.title}
                                className="p-6 bg-white rounded-2xl border border-gray-100 hover:shadow-lg hover:border-blue-200 transition-all group"
                            >
                                <FlaskConical className="w-10 h-10 text-blue-600 mb-4 group-hover:scale-110 transition-transform" />
                                <h3 className="font-bold text-gray-900 text-lg mb-2">{area.title}</h3>
                                <p className="text-gray-600 text-sm mb-4">{area.description}</p>
                                <div className="flex items-center gap-2 text-sm">
                                    <FileText className="w-4 h-4 text-green-600" />
                                    <span className="text-gray-600">{area.papers} Publications</span>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Research Facilities */}
            <section className="py-20 bg-white">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-2 gap-8 items-center">
                        <div>
                            <span className="inline-block px-4 py-1.5 bg-purple-100 text-purple-700 rounded-full text-sm font-semibold mb-4">
                                Infrastructure
                            </span>
                            <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
                                Research <span className="gradient-text">Facilities</span>
                            </h2>
                            <p className="text-gray-600 mb-6">
                                We provide state-of-the-art facilities and resources to support innovative research activities.
                            </p>
                            <ul className="space-y-3 text-gray-600">
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Advanced Computing Labs with GPU Clusters
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    IoT & Embedded Systems Research Center
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Digital Library with IEEE, Springer, and Science Direct Access
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Collaborative Research Spaces
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Innovation & Incubation Center
                                </li>
                            </ul>
                        </div>
                        <div className="grid grid-cols-2 gap-4">
                            <div className="p-6 bg-gray-50 rounded-2xl border border-gray-100 text-center">
                                <BookOpen className="w-10 h-10 text-blue-600 mx-auto mb-3" />
                                <div className="font-bold text-gray-900 text-xl mb-1">Digital Library</div>
                                <div className="text-sm text-gray-600">50,000+ E-Books</div>
                            </div>
                            <div className="p-6 bg-gray-50 rounded-2xl border border-gray-100 text-center">
                                <FlaskConical className="w-10 h-10 text-purple-600 mx-auto mb-3" />
                                <div className="font-bold text-gray-900 text-xl mb-1">Research Labs</div>
                                <div className="text-sm text-gray-600">15+ Specialized Labs</div>
                            </div>
                            <div className="p-6 bg-gray-50 rounded-2xl border border-gray-100 text-center">
                                <Users className="w-10 h-10 text-green-600 mx-auto mb-3" />
                                <div className="font-bold text-gray-900 text-xl mb-1">PhD Guides</div>
                                <div className="text-sm text-gray-600">25+ Faculty</div>
                            </div>
                            <div className="p-6 bg-gray-50 rounded-2xl border border-gray-100 text-center">
                                <Award className="w-10 h-10 text-amber-600 mx-auto mb-3" />
                                <div className="font-bold text-gray-900 text-xl mb-1">Certifications</div>
                                <div className="text-sm text-gray-600">DSIR Recognized</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Publications */}
            <section className="py-20 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="inline-block px-4 py-1.5 bg-green-100 text-green-700 rounded-full text-sm font-semibold mb-4">
                            Publications
                        </span>
                        <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                            Recent <span className="gradient-text">Publications</span>
                        </h2>
                        <p className="text-gray-600">
                            Our research is published in leading international journals and conferences.
                        </p>
                    </div>

                    <div className="max-w-4xl mx-auto space-y-4">
                        {[1, 2, 3, 4].map((i) => (
                            <div
                                key={i}
                                className="p-6 bg-white rounded-xl border border-gray-100 hover:shadow-lg transition-shadow"
                            >
                                <h3 className="font-semibold text-gray-900 mb-2">
                                    Research Paper Title {i}: A Novel Approach to Machine Learning
                                </h3>
                                <p className="text-sm text-gray-600 mb-3">
                                    Authors: Dr. Faculty Name, Dr. Faculty Name | Published in IEEE Conference 2024
                                </p>
                                <div className="flex items-center gap-4 text-sm">
                                    <span className="px-2 py-1 bg-blue-100 text-blue-700 rounded-full text-xs font-medium">
                                        AI/ML
                                    </span>
                                    <span className="text-gray-500">Cited: {10 + i * 5} times</span>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* CTA */}
            <section className="py-16 gradient-bg">
                <div className="container mx-auto px-4 text-center">
                    <h2 className="text-2xl md:text-3xl font-bold text-white mb-4">
                        Interested in Research Collaboration?
                    </h2>
                    <p className="text-white/80 mb-8 max-w-2xl mx-auto">
                        We welcome collaborations with industry and academia for research projects.
                    </p>
                    <Link
                        href="/contact"
                        className="inline-flex items-center gap-2 px-8 py-4 bg-white text-blue-700 rounded-full font-semibold hover:shadow-2xl transition-all"
                    >
                        Contact Research Cell
                        <ArrowRight className="w-5 h-5" />
                    </Link>
                </div>
            </section>
        </div>
    );
}
