"use client";

import Link from "next/link";
import { FileText, CheckCircle2, AlertCircle, Scale, Mail } from "lucide-react";

export default function TermsPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-16 md:py-20 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <Scale className="w-16 h-16 mx-auto mb-6 text-white/80" />
                    <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold mb-4">
                        Terms of Service
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
                        <div className="bg-yellow-50 border border-yellow-100 rounded-xl p-6 mb-8">
                            <p className="text-yellow-800 text-sm m-0">
                                By accessing and using the NRI Institute of Technology website and services,
                                you agree to be bound by these terms and conditions.
                            </p>
                        </div>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900">
                            <FileText className="w-6 h-6 text-blue-600" />
                            Acceptance of Terms
                        </h2>
                        <p className="text-gray-600">
                            By accessing or using our website and services, you agree to comply with and be bound by
                            these Terms of Service. If you do not agree to these terms, please do not use our services.
                        </p>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <CheckCircle2 className="w-6 h-6 text-blue-600" />
                            Use of Services
                        </h2>
                        <p className="text-gray-600">
                            You agree to use our services only for lawful purposes and in accordance with these terms. You agree not to:
                        </p>
                        <ul className="text-gray-600 space-y-2">
                            <li>Use the services in any way that violates applicable laws or regulations</li>
                            <li>Attempt to gain unauthorized access to any part of the services</li>
                            <li>Interfere with or disrupt the integrity or performance of the services</li>
                            <li>Share your login credentials with others</li>
                            <li>Submit false or misleading information</li>
                        </ul>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <AlertCircle className="w-6 h-6 text-blue-600" />
                            Student Responsibilities
                        </h2>
                        <p className="text-gray-600">
                            As a student, you are responsible for:
                        </p>
                        <ul className="text-gray-600 space-y-2">
                            <li>Maintaining accurate and up-to-date personal information</li>
                            <li>Attending classes and maintaining required attendance percentage</li>
                            <li>Paying fees on time as per the fee schedule</li>
                            <li>Following the institution's code of conduct</li>
                            <li>Protecting your login credentials and account security</li>
                        </ul>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <Scale className="w-6 h-6 text-blue-600" />
                            Intellectual Property
                        </h2>
                        <p className="text-gray-600">
                            All content on this website, including text, graphics, logos, images, and software,
                            is the property of NRI Institute of Technology and is protected by intellectual property laws.
                            You may not reproduce, distribute, or create derivative works without our written consent.
                        </p>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <AlertCircle className="w-6 h-6 text-blue-600" />
                            Limitation of Liability
                        </h2>
                        <p className="text-gray-600">
                            NRIIT shall not be liable for any indirect, incidental, special, consequential, or punitive damages
                            arising out of or relating to your use of the services. Our total liability shall not exceed the
                            amount paid by you for the services in the preceding twelve months.
                        </p>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <FileText className="w-6 h-6 text-blue-600" />
                            Modifications
                        </h2>
                        <p className="text-gray-600">
                            We reserve the right to modify these terms at any time. We will notify users of significant changes
                            through the website or email. Your continued use of the services after such modifications constitutes
                            acceptance of the updated terms.
                        </p>

                        <h2 className="flex items-center gap-3 text-xl font-bold text-gray-900 mt-8">
                            <Mail className="w-6 h-6 text-blue-600" />
                            Contact
                        </h2>
                        <p className="text-gray-600">
                            For questions about these terms, please contact:
                        </p>
                        <div className="bg-gray-50 rounded-xl p-6 mt-4">
                            <p className="text-gray-700 m-0">
                                <strong>Legal Department</strong><br />
                                NRI Institute of Technology<br />
                                Email: legal@nriit.ac.in<br />
                                Phone: 0863 234 4300
                            </p>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
