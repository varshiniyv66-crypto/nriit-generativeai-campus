"use client";

import { useState } from "react";
import { Send, MapPin, Phone, Mail, Clock, MessageSquare, User, GraduationCap, ChevronRight, Sparkles } from "lucide-react";
import { motion } from "framer-motion";
import { toast } from "sonner";

export default function EnquirePage() {
    const [isSubmitting, setIsSubmitting] = useState(false);

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        setIsSubmitting(true);
        setTimeout(() => {
            setIsSubmitting(false);
            toast.success("Enquiry sent successfully! Our team will contact you soon.");
            (e.target as HTMLFormElement).reset();
        }, 1500);
    };

    return (
        <div className="min-h-screen bg-slate-50 pt-32 pb-20">
            <div className="container mx-auto px-4">
                <div className="grid lg:grid-cols-2 gap-12 items-start max-w-6xl mx-auto">

                    {/* Left Side: Info */}
                    <motion.div
                        initial={{ opacity: 0, x: -20 }}
                        animate={{ opacity: 1, x: 0 }}
                        className="space-y-8"
                    >
                        <div>
                            <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-blue-100 text-blue-600 text-[10px] font-bold uppercase tracking-widest mb-4">
                                <Sparkles className="w-3 h-3" /> Admissions 2024-25
                            </div>
                            <h1 className="text-5xl font-black text-slate-900 mb-6 tracking-tight leading-tight">
                                Reach Out to <br />
                                <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600">Your Future</span>
                            </h1>
                            <p className="text-slate-600 text-lg leading-relaxed">
                                Whether you're a prospective student, parent, or partner, we're here to answer your questions and help you take the next step towards excellence.
                            </p>
                        </div>

                        <div className="grid sm:grid-cols-2 gap-4">
                            {[
                                { icon: Phone, label: "Admission Helpline", value: "+91 88855 52793" },
                                { icon: Mail, label: "Email Us", value: "nriit.guntur@gmail.com" },
                                { icon: MapPin, label: "Campus Address", value: "Visadala, Guntur, AP" },
                                { icon: Clock, label: "Working Hours", value: "9:00 AM - 5:00 PM" }
                            ].map((item, i) => (
                                <div key={i} className="p-4 rounded-2xl bg-white border border-slate-200 shadow-sm hover:shadow-md transition-shadow">
                                    <div className="w-10 h-10 rounded-xl bg-blue-50 flex items-center justify-center text-blue-600 mb-3">
                                        <item.icon className="w-5 h-5" />
                                    </div>
                                    <div className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-1">{item.label}</div>
                                    <div className="text-sm font-bold text-slate-900">{item.value}</div>
                                </div>
                            ))}
                        </div>

                        {/* Map Preview or additional info card */}
                        <div className="p-8 rounded-3xl bg-gradient-to-br from-blue-600 to-indigo-700 text-white relative overflow-hidden shadow-2xl">
                            <div className="absolute top-0 right-0 w-32 h-32 bg-white/10 rounded-bl-full" />
                            <h3 className="text-2xl font-bold mb-4">Visit Our Campus</h3>
                            <p className="text-blue-100 mb-6 opacity-90 text-sm">Experience the world-class infrastructure, meet our faculty, and breathe in the vibrant academic atmosphere firsthand.</p>
                            <button className="flex items-center gap-2 font-bold hover:gap-4 transition-all">
                                Get Directions <ChevronRight className="w-4 h-4" />
                            </button>
                        </div>
                    </motion.div>

                    {/* Right Side: The Form */}
                    <motion.div
                        initial={{ opacity: 0, x: 20 }}
                        animate={{ opacity: 1, x: 0 }}
                        className="bg-white rounded-3xl shadow-2xl border border-slate-200/50 p-8 md:p-10"
                    >
                        <h2 className="text-2xl font-bold text-slate-900 mb-8 flex items-center gap-3">
                            <div className="w-10 h-10 rounded-xl bg-blue-600 flex items-center justify-center text-white shadow-lg shadow-blue-200">
                                <MessageSquare className="w-5 h-5" />
                            </div>
                            Send an Enquiry
                        </h2>

                        <form onSubmit={handleSubmit} className="space-y-6">
                            <div className="grid md:grid-cols-2 gap-6">
                                <div className="space-y-2">
                                    <label className="text-xs font-bold text-slate-500 uppercase tracking-widest pl-1">Full Name</label>
                                    <div className="relative">
                                        <User className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                                        <input
                                            type="text"
                                            required
                                            placeholder="John Doe"
                                            className="w-full pl-12 pr-4 py-3.5 rounded-xl bg-slate-50 border border-slate-200 focus:bg-white focus:border-blue-500 focus:ring-4 focus:ring-blue-500/10 outline-none transition-all placeholder:text-slate-400"
                                        />
                                    </div>
                                </div>
                                <div className="space-y-2">
                                    <label className="text-xs font-bold text-slate-500 uppercase tracking-widest pl-1">Email Address</label>
                                    <div className="relative">
                                        <Mail className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                                        <input
                                            type="email"
                                            required
                                            placeholder="john@example.com"
                                            className="w-full pl-12 pr-4 py-3.5 rounded-xl bg-slate-50 border border-slate-200 focus:bg-white focus:border-blue-500 focus:ring-4 focus:ring-blue-500/10 outline-none transition-all placeholder:text-slate-400"
                                        />
                                    </div>
                                </div>
                            </div>

                            <div className="grid md:grid-cols-2 gap-6">
                                <div className="space-y-2">
                                    <label className="text-xs font-bold text-slate-500 uppercase tracking-widest pl-1">Phone Number</label>
                                    <div className="relative">
                                        <Phone className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                                        <input
                                            type="tel"
                                            required
                                            placeholder="+91 00000 00000"
                                            className="w-full pl-12 pr-4 py-3.5 rounded-xl bg-slate-50 border border-slate-200 focus:bg-white focus:border-blue-500 focus:ring-4 focus:ring-blue-500/10 outline-none transition-all placeholder:text-slate-400"
                                        />
                                    </div>
                                </div>
                                <div className="space-y-2">
                                    <label className="text-xs font-bold text-slate-500 uppercase tracking-widest pl-1">Interested In</label>
                                    <div className="relative">
                                        <GraduationCap className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                                        <select
                                            className="w-full pl-12 pr-4 py-3.5 rounded-xl bg-slate-50 border border-slate-200 focus:bg-white focus:border-blue-500 focus:ring-4 focus:ring-blue-500/10 outline-none transition-all appearance-none text-slate-700"
                                        >
                                            <option>B.Tech Admissions</option>
                                            <option>M.Tech Admissions</option>
                                            <option>MBA/MCA Programs</option>
                                            <option>Campus Visit Request</option>
                                            <option>Other Query</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div className="space-y-2">
                                <label className="text-xs font-bold text-slate-500 uppercase tracking-widest pl-1">Your Message</label>
                                <textarea
                                    rows={4}
                                    required
                                    placeholder="Enter your query here..."
                                    className="w-full p-4 rounded-xl bg-slate-50 border border-slate-200 focus:bg-white focus:border-blue-500 focus:ring-4 focus:ring-blue-500/10 outline-none transition-all placeholder:text-slate-400"
                                />
                            </div>

                            <button
                                type="submit"
                                disabled={isSubmitting}
                                className="w-full py-4 rounded-xl bg-gradient-to-r from-blue-600 to-indigo-600 text-white font-bold text-lg shadow-lg shadow-blue-200 hover:shadow-2xl hover:shadow-blue-300 hover:-translate-y-1 transition-all flex items-center justify-center gap-3 disabled:opacity-50 disabled:translate-y-0"
                            >
                                {isSubmitting ? "Sending..." : (
                                    <>
                                        Submit Enquiry <Send className="w-5 h-5" />
                                    </>
                                )}
                            </button>

                            <p className="text-center text-[10px] text-slate-400 font-medium">
                                By submitting this form, you agree to being contacted by our admissions team.
                            </p>
                        </form>
                    </motion.div>
                </div>
            </div>
        </div>
    );
}
