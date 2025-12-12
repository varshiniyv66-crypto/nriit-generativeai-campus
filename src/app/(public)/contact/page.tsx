"use client";

import { Phone, Mail, MapPin, Clock, Send, MessageSquare } from "lucide-react";
import { useState } from "react";

const departments = [
    { name: "General Enquiry", email: "nriit.guntur@gmail.com", phone: "0863 234 4300" },
    { name: "Admissions", email: "admissions@nriit.ac.in", phone: "0863 234 4300" },
    { name: "Placements", email: "placements@nriit.ac.in", phone: "0863 234 4300" },
    { name: "Examinations", email: "exams@nriit.ac.in", phone: "0863 234 4300" },
    { name: "Accounts", email: "accounts@nriit.ac.in", phone: "0863 234 4300" },
];

export default function ContactPage() {
    const [formData, setFormData] = useState({
        name: "",
        email: "",
        phone: "",
        subject: "",
        message: "",
    });

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        // Handle form submission
        alert("Thank you for your message! We will get back to you soon.");
        setFormData({ name: "", email: "", phone: "", subject: "", message: "" });
    };

    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        Get in Touch
                    </span>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        Contact <span className="text-yellow-300">Us</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto">
                        Have questions? We&apos;d love to hear from you. Reach out to us through any of the channels below.
                    </p>
                </div>
            </section>

            {/* Contact Info Cards */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-3 gap-6">
                        <div className="p-6 bg-gray-50 rounded-2xl border border-gray-100 text-center hover:shadow-lg transition-shadow">
                            <div className="w-14 h-14 rounded-xl gradient-bg flex items-center justify-center mx-auto mb-4">
                                <MapPin className="w-7 h-7 text-white" />
                            </div>
                            <h3 className="font-bold text-gray-900 text-lg mb-2">Visit Us</h3>
                            <p className="text-gray-600 text-sm">
                                Visadala, Guntur
                            </p>
                        </div>
                        <div className="p-6 bg-gray-50 rounded-2xl border border-gray-100 text-center hover:shadow-lg transition-shadow">
                            <div className="w-14 h-14 rounded-xl bg-green-600 flex items-center justify-center mx-auto mb-4">
                                <Phone className="w-7 h-7 text-white" />
                            </div>
                            <h3 className="font-bold text-gray-900 text-lg mb-2">Call Us</h3>
                            <p className="text-gray-600 text-sm">
                                0863 234 4300
                            </p>
                        </div>
                        <div className="p-6 bg-gray-50 rounded-2xl border border-gray-100 text-center hover:shadow-lg transition-shadow">
                            <div className="w-14 h-14 rounded-xl bg-purple-600 flex items-center justify-center mx-auto mb-4">
                                <Mail className="w-7 h-7 text-white" />
                            </div>
                            <h3 className="font-bold text-gray-900 text-lg mb-2">Email Us</h3>
                            <p className="text-gray-600 text-sm">
                                nriit.guntur@gmail.com
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* Contact Form & Map */}
            <section className="py-20 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="grid lg:grid-cols-2 gap-12">
                        {/* Contact Form */}
                        <div className="bg-white rounded-2xl p-8 shadow-sm border border-gray-100">
                            <div className="flex items-center gap-4 mb-8">
                                <div className="w-12 h-12 rounded-xl gradient-bg flex items-center justify-center">
                                    <MessageSquare className="w-6 h-6 text-white" />
                                </div>
                                <div>
                                    <h2 className="text-2xl font-bold text-gray-900">Send a Message</h2>
                                    <p className="text-gray-600 text-sm">We'll get back to you within 24 hours</p>
                                </div>
                            </div>

                            <form onSubmit={handleSubmit} className="space-y-6">
                                <div className="grid sm:grid-cols-2 gap-4">
                                    <div>
                                        <label className="block text-sm font-medium text-gray-700 mb-2">Name *</label>
                                        <input
                                            type="text"
                                            required
                                            value={formData.name}
                                            onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                                            placeholder="Your name"
                                        />
                                    </div>
                                    <div>
                                        <label className="block text-sm font-medium text-gray-700 mb-2">Email *</label>
                                        <input
                                            type="email"
                                            required
                                            value={formData.email}
                                            onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                                            placeholder="your@email.com"
                                        />
                                    </div>
                                </div>
                                <div className="grid sm:grid-cols-2 gap-4">
                                    <div>
                                        <label className="block text-sm font-medium text-gray-700 mb-2">Phone</label>
                                        <input
                                            type="tel"
                                            value={formData.phone}
                                            onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                                            placeholder="+91-1234567890"
                                        />
                                    </div>
                                    <div>
                                        <label className="block text-sm font-medium text-gray-700 mb-2">Subject *</label>
                                        <select
                                            required
                                            value={formData.subject}
                                            onChange={(e) => setFormData({ ...formData, subject: e.target.value })}
                                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                                        >
                                            <option value="">Select a subject</option>
                                            <option value="admission">Admission Enquiry</option>
                                            <option value="placement">Placement Enquiry</option>
                                            <option value="fee">Fee Related</option>
                                            <option value="general">General Enquiry</option>
                                            <option value="other">Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div>
                                    <label className="block text-sm font-medium text-gray-700 mb-2">Message *</label>
                                    <textarea
                                        required
                                        rows={5}
                                        value={formData.message}
                                        onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                                        className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all resize-none"
                                        placeholder="How can we help you?"
                                    />
                                </div>
                                <button
                                    type="submit"
                                    className="w-full flex items-center justify-center gap-2 px-6 py-4 gradient-bg text-white rounded-xl font-semibold hover:shadow-lg transition-all"
                                >
                                    <Send className="w-5 h-5" />
                                    Send Message
                                </button>
                            </form>
                        </div>

                        {/* Map & Departments */}
                        <div className="space-y-8">
                            {/* Map */}
                            <div className="bg-white rounded-2xl p-2 shadow-sm border border-gray-100 overflow-hidden">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3825.123456789!2d80.5!3d16.5!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2sNRI+Institute+of+Technology!5e0!3m2!1sen!2sin!4v1234567890"
                                    width="100%"
                                    height="300"
                                    style={{ border: 0, borderRadius: "0.75rem" }}
                                    allowFullScreen
                                    loading="lazy"
                                    referrerPolicy="no-referrer-when-downgrade"
                                />
                            </div>

                            {/* Department Contacts */}
                            <div className="bg-white rounded-2xl p-8 shadow-sm border border-gray-100">
                                <h3 className="font-bold text-gray-900 text-lg mb-6 flex items-center gap-3">
                                    <Clock className="w-5 h-5 text-blue-600" />
                                    Department Contacts
                                </h3>
                                <div className="space-y-4">
                                    {departments.map((dept) => (
                                        <div
                                            key={dept.name}
                                            className="p-4 bg-gray-50 rounded-xl hover:bg-blue-50 transition-colors"
                                        >
                                            <div className="font-medium text-gray-900 mb-1">{dept.name}</div>
                                            <div className="flex flex-col sm:flex-row sm:items-center gap-2 text-sm text-gray-600">
                                                <a href={`mailto:${dept.email}`} className="hover:text-blue-600 transition-colors">
                                                    {dept.email}
                                                </a>
                                                <span className="hidden sm:inline">•</span>
                                                <a href={`tel:${dept.phone}`} className="hover:text-blue-600 transition-colors">
                                                    {dept.phone}
                                                </a>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
