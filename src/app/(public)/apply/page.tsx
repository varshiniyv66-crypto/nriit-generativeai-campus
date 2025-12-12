"use client";

import { useState } from "react";
import Link from "next/link";
import { User, Mail, Phone, GraduationCap, FileText, ArrowRight, CheckCircle2 } from "lucide-react";

const programs = [
    "B.Tech Computer Science & Engineering",
    "B.Tech CSE (Data Science)",
    "B.Tech CSE (AI & ML)",
    "B.Tech Information Technology",
    "B.Tech Electronics & Communication",
    "B.Tech Civil Engineering",
    "MBA",
    "MCA",
    "M.Tech (CSE)",
];

export default function ApplyPage() {
    const [step, setStep] = useState(1);
    const [formData, setFormData] = useState({
        firstName: "",
        lastName: "",
        email: "",
        phone: "",
        dob: "",
        gender: "",
        program: "",
        category: "",
        qualification: "",
        percentage: "",
        entranceExam: "",
        rank: "",
    });

    const nextStep = () => setStep((prev) => Math.min(prev + 1, 3));
    const prevStep = () => setStep((prev) => Math.max(prev - 1, 1));

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        alert("Application submitted successfully! You will receive a confirmation email shortly.");
    };

    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-16 md:py-20 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        Admissions 2025-26
                    </span>
                    <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold mb-4">
                        Apply <span className="text-yellow-300">Online</span>
                    </h1>
                    <p className="text-lg text-white/80 max-w-2xl mx-auto">
                        Start your journey at NRIIT. Fill out the application form below.
                    </p>
                </div>
            </section>

            {/* Progress Steps */}
            <section className="py-8 bg-white border-b border-gray-100">
                <div className="container mx-auto px-4">
                    <div className="flex justify-center items-center gap-4 md:gap-8">
                        {[1, 2, 3].map((s) => (
                            <div key={s} className="flex items-center gap-2 md:gap-4">
                                <div
                                    className={`w-10 h-10 rounded-full flex items-center justify-center font-semibold ${step >= s
                                            ? "gradient-bg text-white"
                                            : "bg-gray-100 text-gray-400"
                                        }`}
                                >
                                    {step > s ? <CheckCircle2 className="w-5 h-5" /> : s}
                                </div>
                                <span className={`hidden md:block text-sm font-medium ${step >= s ? "text-gray-900" : "text-gray-400"}`}>
                                    {s === 1 ? "Personal Info" : s === 2 ? "Academic Details" : "Review & Submit"}
                                </span>
                                {s < 3 && <div className={`w-8 md:w-16 h-0.5 ${step > s ? "bg-blue-600" : "bg-gray-200"}`} />}
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Form */}
            <section className="py-12 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="max-w-3xl mx-auto">
                        <form onSubmit={handleSubmit}>
                            <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-8">
                                {/* Step 1: Personal Information */}
                                {step === 1 && (
                                    <div className="space-y-6">
                                        <h2 className="text-xl font-bold text-gray-900 flex items-center gap-3">
                                            <User className="w-6 h-6 text-blue-600" />
                                            Personal Information
                                        </h2>

                                        <div className="grid md:grid-cols-2 gap-4">
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">First Name *</label>
                                                <input
                                                    type="text"
                                                    required
                                                    value={formData.firstName}
                                                    onChange={(e) => setFormData({ ...formData, firstName: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                    placeholder="John"
                                                />
                                            </div>
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Last Name *</label>
                                                <input
                                                    type="text"
                                                    required
                                                    value={formData.lastName}
                                                    onChange={(e) => setFormData({ ...formData, lastName: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                    placeholder="Doe"
                                                />
                                            </div>
                                        </div>

                                        <div className="grid md:grid-cols-2 gap-4">
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Email *</label>
                                                <input
                                                    type="email"
                                                    required
                                                    value={formData.email}
                                                    onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                    placeholder="john@example.com"
                                                />
                                            </div>
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Phone *</label>
                                                <input
                                                    type="tel"
                                                    required
                                                    value={formData.phone}
                                                    onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                    placeholder="+91-1234567890"
                                                />
                                            </div>
                                        </div>

                                        <div className="grid md:grid-cols-2 gap-4">
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Date of Birth *</label>
                                                <input
                                                    type="date"
                                                    required
                                                    value={formData.dob}
                                                    onChange={(e) => setFormData({ ...formData, dob: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                />
                                            </div>
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Gender *</label>
                                                <select
                                                    required
                                                    value={formData.gender}
                                                    onChange={(e) => setFormData({ ...formData, gender: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                >
                                                    <option value="">Select Gender</option>
                                                    <option value="male">Male</option>
                                                    <option value="female">Female</option>
                                                    <option value="other">Other</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                )}

                                {/* Step 2: Academic Details */}
                                {step === 2 && (
                                    <div className="space-y-6">
                                        <h2 className="text-xl font-bold text-gray-900 flex items-center gap-3">
                                            <GraduationCap className="w-6 h-6 text-blue-600" />
                                            Academic Details
                                        </h2>

                                        <div>
                                            <label className="block text-sm font-medium text-gray-700 mb-2">Program Applying For *</label>
                                            <select
                                                required
                                                value={formData.program}
                                                onChange={(e) => setFormData({ ...formData, program: e.target.value })}
                                                className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                            >
                                                <option value="">Select Program</option>
                                                {programs.map((prog) => (
                                                    <option key={prog} value={prog}>{prog}</option>
                                                ))}
                                            </select>
                                        </div>

                                        <div className="grid md:grid-cols-2 gap-4">
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Category *</label>
                                                <select
                                                    required
                                                    value={formData.category}
                                                    onChange={(e) => setFormData({ ...formData, category: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                >
                                                    <option value="">Select Category</option>
                                                    <option value="general">General</option>
                                                    <option value="obc">OBC</option>
                                                    <option value="sc">SC</option>
                                                    <option value="st">ST</option>
                                                    <option value="ews">EWS</option>
                                                </select>
                                            </div>
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Highest Qualification *</label>
                                                <select
                                                    required
                                                    value={formData.qualification}
                                                    onChange={(e) => setFormData({ ...formData, qualification: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                >
                                                    <option value="">Select</option>
                                                    <option value="intermediate">Intermediate (12th)</option>
                                                    <option value="degree">Degree / B.Tech</option>
                                                    <option value="diploma">Diploma</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div className="grid md:grid-cols-2 gap-4">
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Percentage / CGPA *</label>
                                                <input
                                                    type="text"
                                                    required
                                                    value={formData.percentage}
                                                    onChange={(e) => setFormData({ ...formData, percentage: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                    placeholder="85% or 8.5 CGPA"
                                                />
                                            </div>
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Entrance Exam</label>
                                                <select
                                                    value={formData.entranceExam}
                                                    onChange={(e) => setFormData({ ...formData, entranceExam: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                >
                                                    <option value="">Select</option>
                                                    <option value="eamcet">AP EAMCET</option>
                                                    <option value="jee">JEE Main</option>
                                                    <option value="icet">AP ICET</option>
                                                    <option value="gate">GATE</option>
                                                    <option value="none">Management Quota</option>
                                                </select>
                                            </div>
                                        </div>

                                        {formData.entranceExam && formData.entranceExam !== "none" && (
                                            <div>
                                                <label className="block text-sm font-medium text-gray-700 mb-2">Rank</label>
                                                <input
                                                    type="text"
                                                    value={formData.rank}
                                                    onChange={(e) => setFormData({ ...formData, rank: e.target.value })}
                                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                                    placeholder="Enter your rank"
                                                />
                                            </div>
                                        )}
                                    </div>
                                )}

                                {/* Step 3: Review & Submit */}
                                {step === 3 && (
                                    <div className="space-y-6">
                                        <h2 className="text-xl font-bold text-gray-900 flex items-center gap-3">
                                            <FileText className="w-6 h-6 text-blue-600" />
                                            Review & Submit
                                        </h2>

                                        <div className="bg-gray-50 rounded-xl p-6 space-y-4">
                                            <h3 className="font-semibold text-gray-900">Personal Information</h3>
                                            <div className="grid md:grid-cols-2 gap-4 text-sm">
                                                <div><span className="text-gray-500">Name:</span> {formData.firstName} {formData.lastName}</div>
                                                <div><span className="text-gray-500">Email:</span> {formData.email}</div>
                                                <div><span className="text-gray-500">Phone:</span> {formData.phone}</div>
                                                <div><span className="text-gray-500">Date of Birth:</span> {formData.dob}</div>
                                                <div><span className="text-gray-500">Gender:</span> {formData.gender}</div>
                                            </div>
                                        </div>

                                        <div className="bg-gray-50 rounded-xl p-6 space-y-4">
                                            <h3 className="font-semibold text-gray-900">Academic Details</h3>
                                            <div className="grid md:grid-cols-2 gap-4 text-sm">
                                                <div><span className="text-gray-500">Program:</span> {formData.program}</div>
                                                <div><span className="text-gray-500">Category:</span> {formData.category}</div>
                                                <div><span className="text-gray-500">Qualification:</span> {formData.qualification}</div>
                                                <div><span className="text-gray-500">Percentage:</span> {formData.percentage}</div>
                                                {formData.entranceExam && <div><span className="text-gray-500">Entrance Exam:</span> {formData.entranceExam}</div>}
                                                {formData.rank && <div><span className="text-gray-500">Rank:</span> {formData.rank}</div>}
                                            </div>
                                        </div>

                                        <div className="p-4 bg-yellow-50 rounded-xl border border-yellow-100">
                                            <p className="text-sm text-yellow-800">
                                                <strong>Note:</strong> Please review all the information carefully before submitting.
                                                You will receive a confirmation email with further instructions.
                                            </p>
                                        </div>
                                    </div>
                                )}

                                {/* Navigation Buttons */}
                                <div className="mt-8 flex justify-between">
                                    {step > 1 ? (
                                        <button
                                            type="button"
                                            onClick={prevStep}
                                            className="px-6 py-3 border border-gray-200 text-gray-700 rounded-xl font-medium hover:bg-gray-50 transition-all"
                                        >
                                            Previous
                                        </button>
                                    ) : (
                                        <div />
                                    )}

                                    {step < 3 ? (
                                        <button
                                            type="button"
                                            onClick={nextStep}
                                            className="px-6 py-3 gradient-bg text-white rounded-xl font-medium hover:shadow-lg transition-all flex items-center gap-2"
                                        >
                                            Next
                                            <ArrowRight className="w-4 h-4" />
                                        </button>
                                    ) : (
                                        <button
                                            type="submit"
                                            className="px-8 py-3 gradient-bg text-white rounded-xl font-medium hover:shadow-lg transition-all flex items-center gap-2"
                                        >
                                            Submit Application
                                            <ArrowRight className="w-4 h-4" />
                                        </button>
                                    )}
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
    );
}
