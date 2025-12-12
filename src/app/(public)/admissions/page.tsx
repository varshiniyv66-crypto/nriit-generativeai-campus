"use client";

import Link from "next/link";
import { GraduationCap, FileText, Calendar, CheckCircle2, ArrowRight, Phone, Mail, HelpCircle } from "lucide-react";

const programs = [
    {
        level: "Undergraduate",
        courses: [
            { name: "B.Tech Computer Science & Engineering", duration: "4 Years", seats: 180 },
            { name: "B.Tech CSE (Data Science)", duration: "4 Years", seats: 60 },
            { name: "B.Tech CSE (AI & ML)", duration: "4 Years", seats: 60 },
            { name: "B.Tech Information Technology", duration: "4 Years", seats: 120 },
            { name: "B.Tech Electronics & Communication", duration: "4 Years", seats: 120 },
            { name: "B.Tech Civil Engineering", duration: "4 Years", seats: 60 },
        ],
    },
    {
        level: "Postgraduate",
        courses: [
            { name: "MBA", duration: "2 Years", seats: 120 },
            { name: "MCA", duration: "2 Years", seats: 60 },
            { name: "M.Tech (CSE)", duration: "2 Years", seats: 24 },
        ],
    },
];

const admissionProcess = [
    { step: 1, title: "Online Application", description: "Fill the online application form with required details" },
    { step: 2, title: "Document Verification", description: "Submit required documents for verification" },
    { step: 3, title: "Counseling", description: "Attend EAMCET/ICET counseling or management quota counseling" },
    { step: 4, title: "Fee Payment", description: "Pay admission fee and confirm your seat" },
    { step: 5, title: "Enrollment", description: "Complete enrollment formalities and join NRIIT" },
];

export default function AdmissionsPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        Admissions 2025-26
                    </span>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        Start Your <span className="text-yellow-300">Journey</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto mb-8">
                        Join NRIIT and become part of a legacy of excellence. Applications are now open for the upcoming academic session.
                    </p>
                    <Link
                        href="/apply"
                        className="inline-flex items-center gap-2 px-8 py-4 bg-white text-blue-700 rounded-full font-semibold hover:shadow-2xl transition-all"
                    >
                        Apply Now
                        <ArrowRight className="w-5 h-5" />
                    </Link>
                </div>
            </section>

            {/* Programs Offered */}
            <section className="py-20 bg-white">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="inline-block px-4 py-1.5 bg-blue-100 text-blue-700 rounded-full text-sm font-semibold mb-4">
                            Programs Offered
                        </span>
                        <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                            Choose Your <span className="gradient-text">Path</span>
                        </h2>
                        <p className="text-gray-600">
                            We offer a wide range of undergraduate and postgraduate programs in engineering and management.
                        </p>
                    </div>

                    <div className="space-y-12">
                        {programs.map((category) => (
                            <div key={category.level}>
                                <h3 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                                    <GraduationCap className="w-7 h-7 text-blue-600" />
                                    {category.level} Programs
                                </h3>
                                <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
                                    {category.courses.map((course) => (
                                        <div
                                            key={course.name}
                                            className="p-6 rounded-xl bg-gray-50 border border-gray-100 hover:shadow-lg hover:border-blue-200 transition-all"
                                        >
                                            <h4 className="font-semibold text-gray-900 mb-3">{course.name}</h4>
                                            <div className="flex items-center justify-between text-sm text-gray-600">
                                                <span className="flex items-center gap-1">
                                                    <Calendar className="w-4 h-4" />
                                                    {course.duration}
                                                </span>
                                                <span className="px-2 py-1 bg-blue-100 text-blue-700 rounded-full text-xs font-medium">
                                                    {course.seats} Seats
                                                </span>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Admission Process */}
            <section className="py-20 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="inline-block px-4 py-1.5 bg-purple-100 text-purple-700 rounded-full text-sm font-semibold mb-4">
                            How to Apply
                        </span>
                        <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                            Admission <span className="gradient-text">Process</span>
                        </h2>
                        <p className="text-gray-600">
                            Follow these simple steps to secure your admission at NRIIT.
                        </p>
                    </div>

                    <div className="max-w-4xl mx-auto">
                        <div className="space-y-6">
                            {admissionProcess.map((item, index) => (
                                <div
                                    key={item.step}
                                    className="flex items-start gap-6 p-6 bg-white rounded-xl border border-gray-100 shadow-sm hover:shadow-md transition-shadow"
                                >
                                    <div className="flex-shrink-0 w-12 h-12 rounded-full gradient-bg flex items-center justify-center text-white font-bold text-lg">
                                        {item.step}
                                    </div>
                                    <div>
                                        <h3 className="font-semibold text-gray-900 text-lg mb-1">{item.title}</h3>
                                        <p className="text-gray-600">{item.description}</p>
                                    </div>
                                    {index < admissionProcess.length - 1 && (
                                        <div className="hidden md:block absolute left-10 mt-12 w-0.5 h-6 bg-gray-200" />
                                    )}
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>

            {/* Eligibility & Documents */}
            <section className="py-20 bg-white">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-2 gap-8">
                        {/* Eligibility */}
                        <div className="bg-gray-50 rounded-2xl p-8 border border-gray-100">
                            <div className="flex items-center gap-4 mb-6">
                                <div className="w-14 h-14 rounded-xl gradient-bg flex items-center justify-center">
                                    <CheckCircle2 className="w-7 h-7 text-white" />
                                </div>
                                <h2 className="text-2xl font-bold text-gray-900">Eligibility Criteria</h2>
                            </div>
                            <ul className="space-y-4 text-gray-600">
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Pass in 10+2 with Physics, Chemistry, and Mathematics
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Minimum 45% aggregate (40% for reserved categories)
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Valid EAMCET/JEE Main rank for B.Tech
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    ICET/GATE rank for MBA/MCA/M.Tech
                                </li>
                            </ul>
                        </div>

                        {/* Documents */}
                        <div className="bg-gray-50 rounded-2xl p-8 border border-gray-100">
                            <div className="flex items-center gap-4 mb-6">
                                <div className="w-14 h-14 rounded-xl bg-purple-600 flex items-center justify-center">
                                    <FileText className="w-7 h-7 text-white" />
                                </div>
                                <h2 className="text-2xl font-bold text-gray-900">Required Documents</h2>
                            </div>
                            <ul className="space-y-4 text-gray-600">
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    SSC & Intermediate Marks Memos
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Transfer Certificate (TC)
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Migration Certificate (if applicable)
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    EAMCET/JEE/ICET Rank Card
                                </li>
                                <li className="flex items-start gap-3">
                                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                    Aadhar Card & Passport Size Photos
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            {/* Contact CTA */}
            <section className="py-16 gradient-bg">
                <div className="container mx-auto px-4">
                    <div className="flex flex-col md:flex-row items-center justify-between gap-8">
                        <div className="text-center md:text-left">
                            <h2 className="text-2xl md:text-3xl font-bold text-white mb-2">
                                Have Questions?
                            </h2>
                            <p className="text-white/80">
                                Our admissions team is here to help you.
                            </p>
                        </div>
                        <div className="flex flex-col sm:flex-row items-center gap-4">
                            <a
                                href="tel:08632344300"
                                className="flex items-center gap-2 px-6 py-3 bg-white/10 backdrop-blur-sm border border-white/30 text-white rounded-full font-medium hover:bg-white/20 transition-all"
                            >
                                <Phone className="w-5 h-5" />
                                0863 234 4300
                            </a>
                            <a
                                href="mailto:admissions@nriit.ac.in"
                                className="flex items-center gap-2 px-6 py-3 bg-white text-blue-700 rounded-full font-semibold hover:shadow-xl transition-all"
                            >
                                <Mail className="w-5 h-5" />
                                Email Us
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
