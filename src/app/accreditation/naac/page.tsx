"use client";

import Link from "next/link";
import { Award, CheckCircle2, FileText, Calendar, ArrowRight, TrendingUp } from "lucide-react";

const naacCriteria = [
    { title: "Curricular Aspects", key: 1, score: 95 },
    { title: "Teaching-Learning and Evaluation", key: 2, score: 92 },
    { title: "Research, Innovations and Extension", key: 3, score: 88 },
    { title: "Infrastructure and Learning Resources", key: 4, score: 94 },
    { title: "Student Support and Progression", key: 5, score: 90 },
    { title: "Governance, Leadership and Management", key: 6, score: 93 },
    { title: "Institutional Values and Best Practices", key: 7, score: 91 },
];

export default function NAACPage() {
    return (
        <div className="min-h-screen bg-gray-50">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <div className="inline-flex items-center gap-2 px-4 py-2 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        <Award className="w-4 h-4 text-yellow-400" />
                        Accreditation
                    </div>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        NAAC <span className="text-yellow-300">Accreditation</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto">
                        National Assessment and Accreditation Council - Ensuring Quality in Higher Education
                    </p>
                </div>
            </section>

            {/* Status Banner */}
            <section className="py-8 bg-white border-b border-gray-100">
                <div className="container mx-auto px-4">
                    <div className="flex flex-wrap justify-center items-center gap-8">
                        <div className="text-center">
                            <div className="text-4xl font-bold text-green-600">A+</div>
                            <div className="text-sm text-gray-600">Grade</div>
                        </div>
                        <div className="w-px h-12 bg-gray-200 hidden md:block" />
                        <div className="text-center">
                            <div className="text-4xl font-bold text-blue-600">3.45</div>
                            <div className="text-sm text-gray-600">CGPA (out of 4.0)</div>
                        </div>
                        <div className="w-px h-12 bg-gray-200 hidden md:block" />
                        <div className="text-center">
                            <div className="text-4xl font-bold text-purple-600">2023</div>
                            <div className="text-sm text-gray-600">Accreditation Year</div>
                        </div>
                        <div className="w-px h-12 bg-gray-200 hidden md:block" />
                        <div className="text-center">
                            <div className="text-4xl font-bold text-amber-600">2028</div>
                            <div className="text-sm text-gray-600">Valid Until</div>
                        </div>
                    </div>
                </div>
            </section>

            {/* About NAAC */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto">
                        <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                            <Award className="w-7 h-7 text-blue-600" />
                            About NAAC Accreditation
                        </h2>
                        <p className="text-gray-600 mb-6">
                            The National Assessment and Accreditation Council (NAAC) is an autonomous body established
                            by the University Grants Commission (UGC) to assess and accredit institutions of higher education
                            in India. NAAC accreditation is a quality assurance process that evaluates institutions based on
                            seven key criteria.
                        </p>
                        <div className="grid md:grid-cols-2 gap-4">
                            <div className="bg-gray-50 rounded-xl p-4 flex items-start gap-3">
                                <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                <span className="text-gray-700">Quality assurance in higher education</span>
                            </div>
                            <div className="bg-gray-50 rounded-xl p-4 flex items-start gap-3">
                                <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                <span className="text-gray-700">Continuous improvement culture</span>
                            </div>
                            <div className="bg-gray-50 rounded-xl p-4 flex items-start gap-3">
                                <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                <span className="text-gray-700">Transparency and accountability</span>
                            </div>
                            <div className="bg-gray-50 rounded-xl p-4 flex items-start gap-3">
                                <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                <span className="text-gray-700">National benchmarking standards</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Criteria Performance */}
            <section className="py-16 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto">
                        <h2 className="text-2xl font-bold text-gray-900 mb-8 flex items-center gap-3">
                            <TrendingUp className="w-7 h-7 text-blue-600" />
                            Criteria-wise Performance
                        </h2>
                        <div className="space-y-4">
                            {naacCriteria.map((criteria) => (
                                <div
                                    key={criteria.key}
                                    className="bg-white rounded-xl p-6 shadow-sm border border-gray-100"
                                >
                                    <div className="flex items-center justify-between mb-2">
                                        <span className="font-medium text-gray-900">
                                            Criterion {criteria.key}: {criteria.title}
                                        </span>
                                        <span className="text-blue-600 font-bold">{criteria.score}%</span>
                                    </div>
                                    <div className="w-full bg-gray-200 rounded-full h-2">
                                        <div
                                            className="bg-blue-600 h-2 rounded-full transition-all duration-500"
                                            style={{ width: `${criteria.score}%` }}
                                        />
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>

            {/* Documents */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto">
                        <h2 className="text-2xl font-bold text-gray-900 mb-8 flex items-center gap-3">
                            <FileText className="w-7 h-7 text-blue-600" />
                            NAAC Documents
                        </h2>
                        <div className="grid md:grid-cols-2 gap-4">
                            {[
                                { title: "Self Study Report (SSR)", year: "2023" },
                                { title: "IQAC Reports", year: "2022-23" },
                                { title: "NAAC Certificate", year: "2023" },
                                { title: "Annual Quality Assurance Report", year: "2022-23" },
                                { title: "Student Satisfaction Survey", year: "2023" },
                                { title: "Best Practices Document", year: "2023" },
                            ].map((doc) => (
                                <div
                                    key={doc.title}
                                    className="flex items-center justify-between p-4 bg-gray-50 rounded-xl hover:bg-blue-50 transition-colors cursor-pointer group"
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
