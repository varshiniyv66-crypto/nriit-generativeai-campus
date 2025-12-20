"use client";

import { Phone, Mail, MapPin, Clock, Send, MessageSquare, Building2, Users, ArrowRight } from "lucide-react";
import { useState } from "react";
import Link from "next/link";

const departments = [
    { name: "General Enquiry", email: "nriit.guntur@gmail.com", phone: "0863 234 4300" },
    { name: "Admissions", email: "admissions@nriit.ac.in", phone: "0863 234 4300" },
    { name: "Placements", email: "placements@nriit.ac.in", phone: "0863 234 4300" },
    { name: "Examinations", email: "exams@nriit.ac.in", phone: "0863 234 4300" },
    { name: "Accounts", email: "accounts@nriit.ac.in", phone: "0863 234 4300" },
];

const quickContacts = [
    { icon: MapPin, label: "Campus Address", value: "Visadala, Guntur - 522438", color: "from-blue-500 to-indigo-600" },
    { icon: Phone, label: "Main Office", value: "0863 234 4300", color: "from-emerald-500 to-teal-600" },
    { icon: Mail, label: "Email Us", value: "nriit.guntur@gmail.com", color: "from-[#D4AF37] to-[#F5A201]" },
    { icon: Clock, label: "Office Hours", value: "Mon-Sat: 9AM - 5PM", color: "from-violet-500 to-purple-600" },
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
        alert("Thank you for your message! We will get back to you soon.");
        setFormData({ name: "", email: "", phone: "", subject: "", message: "" });
    };

    return (
        <>
            {/* Hero Section - Premium Dark Navy + Gold */}
            <section className="pt-32 pb-16 bg-gradient-to-br from-[#0F172A] via-[#1e293b] to-[#0F172A] relative overflow-hidden">
                <div className="absolute inset-0 bg-[url('/pattern.svg')] opacity-5" />
                <div className="absolute top-0 right-0 w-96 h-96 bg-[#D4AF37]/10 rounded-full blur-[150px]" />
                <div className="absolute bottom-0 left-0 w-96 h-96 bg-blue-500/10 rounded-full blur-[150px]" />

                <div className="container mx-auto px-4 relative z-10">
                    <div className="max-w-3xl">
                        <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[#D4AF37]/20 border border-[#D4AF37]/30 text-[#D4AF37] text-sm font-bold tracking-wide mb-6">
                            <MessageSquare className="w-4 h-4" />
                            Get in Touch
                        </div>
                        <h1 className="text-4xl md:text-6xl font-black text-white mb-6">
                            Contact <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#FFE082]">Us</span>
                        </h1>
                        <p className="text-xl text-slate-300">
                            Have questions? We'd love to hear from you. Reach out to us through any of the channels below.
                        </p>
                    </div>
                </div>
            </section>

            {/* Quick Contact Cards */}
            <section className="py-12 bg-white -mt-8 relative z-20">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-4 gap-6">
                        {quickContacts.map((item, idx) => (
                            <div key={idx} className="group p-6 bg-white rounded-2xl border-2 border-slate-100 hover:border-[#D4AF37] shadow-lg hover:shadow-xl transition-all text-center">
                                <div className={`w-16 h-16 rounded-2xl bg-gradient-to-br ${item.color} flex items-center justify-center mx-auto mb-4 group-hover:scale-110 transition-transform`}>
                                    <item.icon className="w-8 h-8 text-white" />
                                </div>
                                <h3 className="font-bold text-[#0F172A] mb-1">{item.label}</h3>
                                <p className="text-slate-500 text-sm">{item.value}</p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Contact Form & Map */}
            <section className="py-20 bg-slate-50">
                <div className="container mx-auto px-4">
                    <div className="grid lg:grid-cols-2 gap-12">
                        {/* Contact Form */}
                        <div className="bg-white rounded-3xl p-8 shadow-xl border border-slate-100">
                            <div className="flex items-center gap-4 mb-8">
                                <div className="w-14 h-14 rounded-2xl bg-gradient-to-br from-[#D4AF37] to-[#F5A201] flex items-center justify-center">
                                    <Send className="w-7 h-7 text-white" />
                                </div>
                                <div>
                                    <h2 className="text-2xl font-black text-[#0F172A]">Send a Message</h2>
                                    <p className="text-slate-500 text-sm">We'll respond within 24 hours</p>
                                </div>
                            </div>

                            <form onSubmit={handleSubmit} className="space-y-6">
                                <div className="grid sm:grid-cols-2 gap-4">
                                    <div>
                                        <label className="block text-sm font-bold text-[#0F172A] mb-2">Name *</label>
                                        <input
                                            type="text"
                                            required
                                            value={formData.name}
                                            onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                                            className="w-full px-4 py-3 rounded-xl border-2 border-slate-200 focus:border-[#D4AF37] focus:ring-0 transition-colors text-[#0F172A]"
                                            placeholder="Your name"
                                        />
                                    </div>
                                    <div>
                                        <label className="block text-sm font-bold text-[#0F172A] mb-2">Email *</label>
                                        <input
                                            type="email"
                                            required
                                            value={formData.email}
                                            onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                                            className="w-full px-4 py-3 rounded-xl border-2 border-slate-200 focus:border-[#D4AF37] focus:ring-0 transition-colors text-[#0F172A]"
                                            placeholder="your@email.com"
                                        />
                                    </div>
                                </div>
                                <div className="grid sm:grid-cols-2 gap-4">
                                    <div>
                                        <label className="block text-sm font-bold text-[#0F172A] mb-2">Phone</label>
                                        <input
                                            type="tel"
                                            value={formData.phone}
                                            onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                                            className="w-full px-4 py-3 rounded-xl border-2 border-slate-200 focus:border-[#D4AF37] focus:ring-0 transition-colors text-[#0F172A]"
                                            placeholder="+91-1234567890"
                                        />
                                    </div>
                                    <div>
                                        <label className="block text-sm font-bold text-[#0F172A] mb-2">Subject *</label>
                                        <select
                                            required
                                            value={formData.subject}
                                            onChange={(e) => setFormData({ ...formData, subject: e.target.value })}
                                            className="w-full px-4 py-3 rounded-xl border-2 border-slate-200 focus:border-[#D4AF37] focus:ring-0 transition-colors text-[#0F172A]"
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
                                    <label className="block text-sm font-bold text-[#0F172A] mb-2">Message *</label>
                                    <textarea
                                        required
                                        rows={5}
                                        value={formData.message}
                                        onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                                        className="w-full px-4 py-3 rounded-xl border-2 border-slate-200 focus:border-[#D4AF37] focus:ring-0 transition-colors resize-none text-[#0F172A]"
                                        placeholder="How can we help you?"
                                    />
                                </div>
                                <button
                                    type="submit"
                                    className="w-full flex items-center justify-center gap-2 px-6 py-4 bg-gradient-to-r from-[#D4AF37] to-[#F5A201] text-[#0F172A] rounded-xl font-bold hover:shadow-lg transition-all hover:scale-[1.02]"
                                >
                                    <Send className="w-5 h-5" />
                                    Send Message
                                </button>
                            </form>
                        </div>

                        {/* Map & Departments */}
                        <div className="space-y-8">
                            {/* Map */}
                            <div className="bg-white rounded-3xl p-2 shadow-xl border border-slate-100 overflow-hidden">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3825.8!2d80.4!3d16.3!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2sNRI+Institute+of+Technology!5e0!3m2!1sen!2sin!4v1234567890"
                                    width="100%"
                                    height="300"
                                    style={{ border: 0, borderRadius: "1rem" }}
                                    allowFullScreen
                                    loading="lazy"
                                    referrerPolicy="no-referrer-when-downgrade"
                                />
                            </div>

                            {/* Department Contacts */}
                            <div className="bg-[#0F172A] rounded-3xl p-8">
                                <h3 className="font-bold text-white text-xl mb-6 flex items-center gap-3">
                                    <Building2 className="w-6 h-6 text-[#D4AF37]" />
                                    Department Contacts
                                </h3>
                                <div className="space-y-4">
                                    {departments.map((dept) => (
                                        <div
                                            key={dept.name}
                                            className="p-4 bg-white/5 rounded-xl hover:bg-white/10 transition-colors border border-white/10"
                                        >
                                            <div className="font-bold text-white mb-2">{dept.name}</div>
                                            <div className="flex flex-col sm:flex-row sm:items-center gap-2 text-sm">
                                                <a href={`mailto:${dept.email}`} className="text-[#D4AF37] hover:text-[#FFE082] transition-colors">
                                                    {dept.email}
                                                </a>
                                                <span className="hidden sm:inline text-slate-600">•</span>
                                                <a href={`tel:${dept.phone}`} className="text-slate-400 hover:text-white transition-colors">
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

            {/* CTA Strip */}
            <section className="py-16 bg-gradient-to-r from-[#013C58] to-[#00537A]">
                <div className="container mx-auto px-4 text-center">
                    <h2 className="text-3xl md:text-4xl font-black text-white mb-4">Ready to Join NRIIT?</h2>
                    <p className="text-slate-300 mb-8 max-w-2xl mx-auto">
                        Take the first step towards a brilliant career. Apply now for admissions 2025-26.
                    </p>
                    <Link
                        href="/admissions"
                        className="inline-flex items-center gap-2 px-8 py-4 bg-[#D4AF37] hover:bg-[#FFE082] text-[#0F172A] rounded-2xl font-bold transition-all hover:scale-105"
                    >
                        Explore Admissions
                        <ArrowRight className="w-5 h-5" />
                    </Link>
                </div>
            </section>
        </>
    );
}
