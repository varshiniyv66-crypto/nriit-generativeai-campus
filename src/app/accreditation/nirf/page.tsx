"use client";

import Link from "next/link";
import { Award, TrendingUp, Building2, Users, GraduationCap, FileText, ArrowRight, BarChart } from "lucide-react";

const nirfParameters = [
    { title: "Teaching, Learning & Resources (TLR)", weight: "30%", score: 72 },
    { title: "Research and Professional Practice (RP)", weight: "30%", score: 65 },
    { title: "Graduation Outcomes (GO)", weight: "20%", score: 78 },
    { title: "Outreach and Inclusivity (OI)", weight: "10%", score: 70 },
    { title: "Perception (PR)", weight: "10%", score: 68 },
];

const rankings = [
    { year: "2024", rank: "145", category: "Engineering" },
    { year: "2023", rank: "156", category: "Engineering" },
    { year: "2022", rank: "168", category: "Engineering" },
    { year: "2021", rank: "175", category: "Engineering" },
];

export default function NIRFPage() {
    return (
        <div className="min-h-screen bg-gray-50">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <div className="inline-flex items-center gap-2 px-4 py-2 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        <TrendingUp className="w-4 h-4 text-yellow-400" />
                        Rankings
                    </div>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        NIRF <span className="text-yellow-300">Rankings</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto">
                        National Institutional Ranking Framework - Ministry of Education, Government of India
                    </p>
                </div>
            </section>

            {/* Current Ranking */}
            <section className="py-8 bg-white border-b border-gray-100">
                <div className="container mx-auto px-4">
                    <div className="flex flex-wrap justify-center items-center gap-8">
                        <div className="text-center">
                            <div className="text-5xl font-bold gradient-text">#145</div>
                            <div className="text-sm text-gray-600">Overall Rank 2024</div>
                        </div>
                        <div className="w-px h-16 bg-gray-200 hidden md:block" />
                        <div className="text-center">
                            <div className="text-3xl font-bold text-green-600">+11</div>
                            <div className="text-sm text-gray-600">Improvement from 2023</div>
                        </div>
                        <div className="w-px h-16 bg-gray-200 hidden md:block" />
                        <div className="text-center">
                            <div className="text-3xl font-bold text-blue-600">Engineering</div>
                            <div className="text-sm text-gray-600">Category</div>
                        </div>
                        <div className="w-px h-16 bg-gray-200 hidden md:block" />
                        <div className="text-center">
                            <div className="text-3xl font-bold text-purple-600">Top 150</div>
                            <div className="text-sm text-gray-600">In India</div>
                        </div>
                    </div>
                </div>
            </section>

            {/* About NIRF */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto">
                        <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                            <Award className="w-7 h-7 text-blue-600" />
                            About NIRF
                        </h2>
                        <p className="text-gray-600 mb-6">
                            The National Institutional Ranking Framework (NIRF) was approved by the Ministry of Human
                            Resource Development (MHRD), Government of India in 2015. This framework outlines a methodology
                            to rank institutions across the country using several parameters grouped into five categories.
                        </p>
                        <div className="grid md:grid-cols-3 gap-4">
                            <div className="bg-blue-50 rounded-xl p-4 text-center">
                                <Building2 className="w-8 h-8 text-blue-600 mx-auto mb-2" />
                                <div className="font-semibold text-gray-900">5000+</div>
                                <div className="text-sm text-gray-600">Participating Institutions</div>
                            </div>
                            <div className="bg-green-50 rounded-xl p-4 text-center">
                                <BarChart className="w-8 h-8 text-green-600 mx-auto mb-2" />
                                <div className="font-semibold text-gray-900">5</div>
                                <div className="text-sm text-gray-600">Key Parameters</div>
                            </div>
                            <div className="bg-purple-50 rounded-xl p-4 text-center">
                                <GraduationCap className="w-8 h-8 text-purple-600 mx-auto mb-2" />
                                <div className="font-semibold text-gray-900">11</div>
                                <div className="text-sm text-gray-600">Categories</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Parameter Performance */}
            <section className="py-16 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto">
                        <h2 className="text-2xl font-bold text-gray-900 mb-8 flex items-center gap-3">
                            <TrendingUp className="w-7 h-7 text-blue-600" />
                            Parameter-wise Performance
                        </h2>
                        <div className="space-y-4">
                            {nirfParameters.map((param) => (
                                <div
                                    key={param.title}
                                    className="bg-white rounded-xl p-6 shadow-sm border border-gray-100"
                                >
                                    <div className="flex items-center justify-between mb-2">
                                        <div>
                                            <span className="font-medium text-gray-900">{param.title}</span>
                                            <span className="text-sm text-gray-500 ml-2">({param.weight})</span>
                                        </div>
                                        <span className="text-blue-600 font-bold">{param.score}/100</span>
                                    </div>
                                    <div className="w-full bg-gray-200 rounded-full h-2">
                                        <div
                                            className="bg-blue-600 h-2 rounded-full transition-all duration-500"
                                            style={{ width: `${param.score}%` }}
                                        />
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>

            {/* Historical Rankings */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto">
                        <h2 className="text-2xl font-bold text-gray-900 mb-8 flex items-center gap-3">
                            <BarChart className="w-7 h-7 text-blue-600" />
                            Historical Rankings
                        </h2>
                        <div className="grid sm:grid-cols-2 md:grid-cols-4 gap-4">
                            {rankings.map((ranking) => (
                                <div
                                    key={ranking.year}
                                    className="bg-gray-50 rounded-xl p-6 text-center hover:shadow-md transition-shadow"
                                >
                                    <div className="text-3xl font-bold gradient-text mb-2">#{ranking.rank}</div>
                                    <div className="text-lg font-semibold text-gray-900">{ranking.year}</div>
                                    <div className="text-sm text-gray-500">{ranking.category}</div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>

            {/* Documents */}
            <section className="py-16 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto">
                        <h2 className="text-2xl font-bold text-gray-900 mb-8 flex items-center gap-3">
                            <FileText className="w-7 h-7 text-blue-600" />
                            NIRF Documents
                        </h2>
                        <div className="grid md:grid-cols-2 gap-4">
                            {[
                                { title: "NIRF Data Submission 2024", year: "2024" },
                                { title: "NIRF Certificate 2024", year: "2024" },
                                { title: "NIRF Data Submission 2023", year: "2023" },
                                { title: "NIRF Certificate 2023", year: "2023" },
                            ].map((doc) => (
                                <div
                                    key={doc.title}
                                    className="flex items-center justify-between p-4 bg-white rounded-xl hover:bg-blue-50 transition-colors cursor-pointer group border border-gray-100"
                                >
                                    <div className="flex items-center gap-3">
                                        <FileText className="w-5 h-5 text-gray-400 group-hover:text-blue-600" />
                                        <div>
                                            <div className="font-medium text-gray-900">{doc.title}</div>
                                            <div className="text-sm text-gray-500">{doc.year}</div>
                                        </div>
                                    </div>
                                    <ArrowRight className="w-5 h-5 text-gray-400 group-hover:text-blue-600 group-hover:translate-x-1 transition-all" />
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
