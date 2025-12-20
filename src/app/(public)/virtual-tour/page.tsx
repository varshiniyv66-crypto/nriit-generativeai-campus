"use client";

import { Play, MapPin, Building2, Trees, GraduationCap, ArrowRight } from "lucide-react";

export default function VirtualTourPage() {
    return (
        <div className="min-h-screen bg-slate-950 text-white selection:bg-[#D4AF37] selection:text-slate-900">

            {/* Hero Video Section */}
            <section className="relative h-[80vh] flex items-center justify-center overflow-hidden">
                {/* Background Video */}
                <video
                    autoPlay
                    muted
                    loop
                    playsInline
                    className="absolute inset-0 w-full h-full object-cover opacity-60"
                >
                    <source src="/videos/tour-main.mp4" type="video/mp4" />
                </video>
                <div className="absolute inset-0 bg-gradient-to-t from-slate-950 via-slate-950/50 to-transparent"></div>

                <div className="relative z-10 text-center space-y-6 max-w-4xl px-4 animate-fade-in-up">
                    <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[#D4AF37]/20 border border-[#D4AF37]/50 text-[#D4AF37] font-bold backdrop-blur-md">
                        <Play className="w-4 h-4 fill-current" />
                        <span>Live Campus Experience</span>
                    </div>
                    <h1 className="text-5xl md:text-7xl font-bold tracking-tight">
                        Explore Our <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-amber-200">World-Class Campus</span>
                    </h1>
                    <p className="text-xl text-slate-300 max-w-2xl mx-auto">
                        Take a digital walk through our state-of-the-art laboratories, lush green grounds, and advanced innovation hubs.
                    </p>
                </div>
            </section>

            {/* Highlights Grid */}
            <section className="py-20 px-4">
                <div className="container mx-auto">
                    <h2 className="text-3xl font-bold mb-12 flex items-center gap-3">
                        <MapPin className="text-[#D4AF37]" /> Campus Highlights
                    </h2>

                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                        {/* Highlight 1: Aerial View */}
                        <div className="group relative h-80 rounded-2xl overflow-hidden border border-slate-800 hover:border-[#D4AF37]/50 transition-all">
                            <video
                                autoPlay
                                muted
                                loop
                                className="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                            >
                                <source src="/videos/tour-highlights.mp4" type="video/mp4" />
                            </video>
                            <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-transparent to-transparent opacity-90"></div>
                            <div className="absolute bottom-0 left-0 p-6">
                                <h3 className="text-2xl font-bold mb-1">Aerial Drone View</h3>
                                <p className="text-slate-400 text-sm">A bird's eye view of our 100-acre campus.</p>
                            </div>
                        </div>

                        {/* Highlight 2: Labs (Unsplash) */}
                        <div className="group relative h-80 rounded-2xl overflow-hidden border border-slate-800 hover:border-[#D4AF37]/50 transition-all">
                            <div
                                className="absolute inset-0 bg-cover bg-center group-hover:scale-110 transition-transform duration-700"
                                style={{ backgroundImage: "url('https://images.unsplash.com/photo-1581093458791-9f302e6d8359?q=80&w=800')" }}
                            ></div>
                            <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-transparent to-transparent opacity-90"></div>
                            <div className="absolute bottom-0 left-0 p-6">
                                <h3 className="text-2xl font-bold mb-1">Innovation Labs</h3>
                                <p className="text-slate-400 text-sm">Advanced robotics and AI research centers.</p>
                            </div>
                        </div>

                        {/* Highlight 3: Library (Unsplash) */}
                        <div className="group relative h-80 rounded-2xl overflow-hidden border border-slate-800 hover:border-[#D4AF37]/50 transition-all">
                            <div
                                className="absolute inset-0 bg-cover bg-center group-hover:scale-110 transition-transform duration-700"
                                style={{ backgroundImage: "url('https://images.unsplash.com/photo-1521587760476-6c12a4b040da?q=80&w=800')" }}
                            ></div>
                            <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-transparent to-transparent opacity-90"></div>
                            <div className="absolute bottom-0 left-0 p-6">
                                <h3 className="text-2xl font-bold mb-1">Central Library</h3>
                                <p className="text-slate-400 text-sm">A vast collection of digital and physical resources.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
