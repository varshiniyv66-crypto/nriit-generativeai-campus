
"use client";

import { useState } from "react";

import { useParams } from "next/navigation";
import { departments as staticDepartments } from "@/data/departments";
import { Mail, Phone, MapPin, Send, Home } from "lucide-react";
import { motion } from "framer-motion";

export default function ContactPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const deptInfo = staticDepartments[deptCode.toLowerCase()];

    // Placeholder data from SARs typically found in cover pages
    const contactInfo = {
        hodEmail: `hod${deptCode.toLowerCase()}@nriit.edu.in`,
        officePhone: "0866-2469666",
        location: "Block-A, NRI Institute of Technology, Visadala"
    };

    const [isSubmitted, setIsSubmitted] = useState(false);

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        // Simulate API call
        setTimeout(() => {
            setIsSubmitted(true);
        }, 1000);
    };

    return (
        <div className="min-h-screen bg-[#FDFCF8] text-slate-900 font-sans pb-20 selection:bg-cyan-100">
            {/* 1. HERO SECTION: Stunning Light Theme */}
            <div className="relative pt-24 pb-20 px-6 overflow-hidden">
                {/* Luminous Background Mesh */}
                <div className="absolute top-[-20%] right-[-10%] w-[800px] h-[800px] bg-gradient-to-b from-cyan-100/40 via-sky-50/20 to-transparent rounded-full blur-[120px] opacity-60 pointer-events-none" />
                <div className="absolute top-[20%] left-[-10%] w-[600px] h-[600px] bg-gradient-to-r from-blue-50/50 to-indigo-50/30 rounded-full blur-[100px] opacity-50 pointer-events-none" />

                <div className="container mx-auto relative z-10 text-center">
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="inline-flex items-center gap-2 mb-6"
                    >
                        <div className="px-4 py-1.5 bg-white/80 backdrop-blur-md rounded-full border border-slate-200 shadow-sm text-slate-500 font-bold tracking-widest uppercase text-[10px] flex items-center gap-2">
                            Departmental Hub
                        </div>
                        <span className="w-1 h-1 bg-slate-300 rounded-full" />
                        <span className="text-xs font-bold text-cyan-600 uppercase tracking-widest">Connect with {deptCode}</span>
                    </motion.div>

                    <motion.h1
                        initial={{ opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        className="text-5xl md:text-7xl font-black text-slate-900 tracking-tighter mb-6"
                    >
                        Get in <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-500 to-blue-600">Touch</span>
                    </motion.h1>

                    <motion.p
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: 0.2 }}
                        className="text-lg md:text-xl text-slate-500 max-w-2xl mx-auto font-medium leading-relaxed"
                    >
                        We'd love to hear from you. Reach out for admissions, research collaborations, or general inquiries.
                    </motion.p>
                </div>
            </div>

            {/* 2. CONTACT CARDS */}
            <div className="container mx-auto px-6 max-w-5xl">
                <div className="grid md:grid-cols-2 gap-12">
                    {/* Info Card */}
                    <motion.div
                        initial={{ opacity: 0, x: -30 }}
                        animate={{ opacity: 1, x: 0 }}
                        className="bg-slate-900 rounded-[2.5rem] p-10 text-white relative overflow-hidden flex flex-col justify-between shadow-2xl shadow-slate-200"
                    >
                        <div className="absolute top-0 right-0 w-64 h-64 bg-cyan-500/20 rounded-full blur-[80px]" />
                        <div className="absolute bottom-0 left-0 w-48 h-48 bg-blue-500/20 rounded-full blur-[60px]" />

                        <div className="relative z-10">
                            <h3 className="text-3xl font-black mb-8 tracking-tight">Department Office</h3>

                            <div className="space-y-8">
                                <div className="flex items-start gap-5 group">
                                    <div className="w-12 h-12 rounded-2xl bg-white/10 flex items-center justify-center shrink-0 group-hover:bg-cyan-500 group-hover:text-white transition-colors duration-300">
                                        <Mail className="w-6 h-6 text-cyan-300 group-hover:text-white" />
                                    </div>
                                    <div>
                                        <p className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-1">Email</p>
                                        <p className="text-lg font-bold font-mono tracking-wide">{contactInfo.hodEmail}</p>
                                    </div>
                                </div>
                                <div className="flex items-start gap-5 group">
                                    <div className="w-12 h-12 rounded-2xl bg-white/10 flex items-center justify-center shrink-0 group-hover:bg-cyan-500 group-hover:text-white transition-colors duration-300">
                                        <Phone className="w-6 h-6 text-cyan-300 group-hover:text-white" />
                                    </div>
                                    <div>
                                        <p className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-1">Phone</p>
                                        <p className="text-lg font-bold font-mono tracking-wide">{contactInfo.officePhone}</p>
                                    </div>
                                </div>
                                <div className="flex items-start gap-5 group">
                                    <div className="w-12 h-12 rounded-2xl bg-white/10 flex items-center justify-center shrink-0 group-hover:bg-cyan-500 group-hover:text-white transition-colors duration-300">
                                        <MapPin className="w-6 h-6 text-cyan-300 group-hover:text-white" />
                                    </div>
                                    <div>
                                        <p className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-1">Location</p>
                                        <p className="text-lg font-medium leading-relaxed max-w-xs text-slate-200">{contactInfo.location}</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="mt-12 pt-8 border-t border-white/10 relative z-10">
                            <div className="flex items-center gap-2 text-sm text-slate-400 font-medium">
                                <div className="w-2 h-2 bg-green-500 rounded-full animate-pulse" />
                                Open: Monday - Saturday, 9:00 AM - 4:00 PM
                            </div>
                        </div>
                    </motion.div>

                    {/* Simple Form */}
                    <motion.div
                        initial={{ opacity: 0, x: 30 }}
                        animate={{ opacity: 1, x: 0 }}
                        className="bg-white rounded-[2.5rem] p-10 border border-slate-100 shadow-xl relative overflow-hidden"
                    >
                        {isSubmitted ? (
                            <div className="absolute inset-0 bg-white z-20 flex flex-col items-center justify-center text-center p-8 animate-in fade-in zoom-in duration-300">
                                <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mb-6">
                                    <Send className="w-10 h-10 text-green-600 -ml-1 mt-1" />
                                </div>
                                <h3 className="text-2xl font-black text-slate-900 mb-2">Message Sent!</h3>
                                <p className="text-slate-500 mb-8 max-w-xs">Thank you for reaching out. We have received your message and will get back to you shortly.</p>
                                <button
                                    onClick={() => setIsSubmitted(false)}
                                    className="px-8 py-3 bg-slate-100 text-slate-900 font-bold rounded-xl hover:bg-slate-200 transition-colors"
                                >
                                    Send Another
                                </button>
                            </div>
                        ) : null}

                        <h3 className="text-2xl font-black text-slate-900 mb-8 flex items-center gap-3">
                            Send a Message <span className="text-xs font-bold px-3 py-1 bg-slate-100 rounded-full text-slate-500">Fast Response</span>
                        </h3>

                        <form onSubmit={handleSubmit} className="space-y-5 relative z-10">
                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <label className="block text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Your Name</label>
                                    <input required type="text" className="w-full bg-slate-50 border border-slate-200 rounded-xl p-3.5 font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-cyan-500/20 focus:border-cyan-500 transition-all placeholder:text-slate-300" placeholder="John Doe" />
                                </div>
                                <div>
                                    <label className="block text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Phone Number</label>
                                    <input required type="tel" className="w-full bg-slate-50 border border-slate-200 rounded-xl p-3.5 font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-cyan-500/20 focus:border-cyan-500 transition-all placeholder:text-slate-300" placeholder="+91 98765 43210" />
                                </div>
                            </div>

                            <div>
                                <label className="block text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Email Address</label>
                                <input required type="email" className="w-full bg-slate-50 border border-slate-200 rounded-xl p-3.5 font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-cyan-500/20 focus:border-cyan-500 transition-all placeholder:text-slate-300" placeholder="john@example.com" />
                            </div>

                            <div>
                                <label className="block text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Subject</label>
                                <select className="w-full bg-slate-50 border border-slate-200 rounded-xl p-3.5 font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-cyan-500/20 focus:border-cyan-500 transition-all">
                                    <option>Admission Inquiry</option>
                                    <option>Research Collaboration</option>
                                    <option>Student Support</option>
                                    <option>General Query</option>
                                </select>
                            </div>

                            <div>
                                <label className="block text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Message</label>
                                <textarea required className="w-full bg-slate-50 border border-slate-200 rounded-xl p-4 font-medium text-slate-700 h-32 resize-none focus:outline-none focus:ring-2 focus:ring-cyan-500/20 focus:border-cyan-500 transition-all placeholder:text-slate-300" placeholder="How can we help you?"></textarea>
                            </div>

                            <button type="submit" className="w-full bg-slate-900 text-white rounded-xl py-4 font-bold hover:bg-cyan-600 transition-all shadow-lg hover:shadow-cyan-500/25 flex items-center justify-center gap-2 group active:scale-95">
                                Send Message <Send className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                            </button>
                        </form>
                    </motion.div>
                </div>
            </div>
        </div>
    );
}
