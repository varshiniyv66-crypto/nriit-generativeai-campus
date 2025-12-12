"use client";

import Link from "next/link";
import { Shield, Lock, Eye, FileText, AlertCircle, Mail } from "lucide-react";

export default function PrivacyPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-16 md:py-20 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <Shield className="w-16 h-16 mx-auto mb-6 text-white/80" />
                    <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold mb-4">
                        Privacy Policy
                    </h1>
                    <p className="text-lg text-white/80 max-w-2xl mx-auto">
                        Last updated: December 2024
                    </p>
                </div>
            </section>

            {/* Content */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="max-w-4xl mx-auto prose prose-lg">
                        <div className="bg-blue-50 border border-blue-100 rounded-xl p-6 mb-8">
                            <p className="text-blue-800 text-sm m-0">
                                This privacy policy describes how NRI Institute of Technology ("NRIIT", "we", "us", or "our")
                                collects, uses, and protects your personal information.
                            </p>
                        </div>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900">
                            <Eye className="w-6 h-6 text-blue-600" />
                            Information We Collect
                        </h2>
                        <p className="text-gray-600">
                            We collect information you provide directly to us, including:
                        </p>
                        <ul className="text-gray-600 space-y-2">
                            <li>Personal identification information (name, email, phone number, date of birth)</li>
                            <li>Academic records and qualifications</li>
                            <li>Financial information for fee payments</li>
                            <li>Photos and identification documents</li>
                            <li>Usage data and analytics when you use our website</li>
                        </ul>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <FileText className="w-6 h-6 text-blue-600" />
                            How We Use Your Information
                        </h2>
                        <p className="text-gray-600">
                            We use the information we collect to:
                        </p>
                        <ul className="text-gray-600 space-y-2">
                            <li>Process admissions and enrollment</li>
                            <li>Maintain academic records and provide educational services</li>
                            <li>Process fee payments and financial transactions</li>
                            <li>Communicate important updates and notifications</li>
                            <li>Improve our services and website functionality</li>
                            <li>Comply with legal obligations and regulatory requirements</li>
                        </ul>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <Lock className="w-6 h-6 text-blue-600" />
                            Data Security
                        </h2>
                        <p className="text-gray-600">
                            We implement appropriate technical and organizational measures to protect your personal
                            information against unauthorized access, alteration, disclosure, or destruction. This includes:
                        </p>
                        <ul className="text-gray-600 space-y-2">
                            <li>Encryption of data in transit and at rest</li>
                            <li>Regular security audits and assessments</li>
                            <li>Access controls and authentication mechanisms</li>
                            <li>Staff training on data protection</li>
                        </ul>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <Shield className="w-6 h-6 text-blue-600" />
                            Your Rights
                        </h2>
                        <p className="text-gray-600">
                            You have the right to:
                        </p>
                        <ul className="text-gray-600 space-y-2">
                            <li>Access and receive a copy of your personal data</li>
                            <li>Request correction of inaccurate information</li>
                            <li>Request deletion of your data (subject to legal requirements)</li>
                            <li>Opt-out of marketing communications</li>
                            <li>Lodge a complaint with relevant authorities</li>
                        </ul>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <Mail className="w-6 h-6 text-blue-600" />
                            Contact Us
                        </h2>
                        <p className="text-gray-600">
                            If you have any questions about this privacy policy, please contact us at:
                        </p>
                        <div className="bg-gray-50 rounded-xl p-6 mt-4">
                            <p className="text-gray-700 m-0">
                                <strong>Data Protection Officer</strong><br />
                                NRI Institute of Technology<br />
                                Visadala, Guntur<br />
                                Email: nriit.guntur@gmail.com<br />
                                Phone: 0863 234 4300
                            </p>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
