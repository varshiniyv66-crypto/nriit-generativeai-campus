"use client";

import Link from "next/link";
import { Play, Building2, FlaskConical, BookOpen, Users, Award, ArrowRight } from "lucide-react";

const tourSpots = [
    { title: "Main Campus", description: "Sprawling 25-acre campus with modern architecture", icon: Building2 },
    { title: "Laboratories", description: "State-of-the-art labs for all departments", icon: FlaskConical },
    { title: "Library", description: "Digital library with 50,000+ resources", icon: BookOpen },
    { title: "Sports Complex", description: "Multi-sport facilities and gymnasium", icon: Users },
    { title: "Seminar Halls", description: "Auditorium and conference facilities", icon: Award },
];

export default function VirtualTourPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        Explore NRIIT
                    </span>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        Virtual <span className="text-yellow-300">Tour</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto mb-8">
                        Experience our beautiful campus from anywhere in the world. Take a 360° tour of our facilities.
                    </p>

                    {/* Video Player Placeholder */}
                    <div className="max-w-4xl mx-auto">
                        <div className="relative aspect-video rounded-2xl overflow-hidden bg-gray-900/50 backdrop-blur-sm border border-white/20">
                            <div className="absolute inset-0 flex items-center justify-center">
                                <button className="w-20 h-20 rounded-full bg-white/20 backdrop-blur-sm border border-white/30 flex items-center justify-center hover:bg-white/30 transition-all group">
                                    <Play className="w-8 h-8 text-white group-hover:scale-110 transition-transform ml-1" />
                                </button>
                            </div>
                            <div className="absolute bottom-4 left-4 text-left">
                                <p className="text-white/80 text-sm">Campus Overview</p>
                                <p className="text-white/60 text-xs">Duration: 5:30</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Campus Highlights */}
            <section className="py-20 bg-white">
                <div className="container mx-auto px-4">
                    <div className="text-center max-w-3xl mx-auto mb-16">
                        <span className="inline-block px-4 py-1.5 bg-blue-100 text-blue-700 rounded-full text-sm font-semibold mb-4">
                            Campus Highlights
                        </span>
                        <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                            Explore Our <span className="gradient-text">Facilities</span>
                        </h2>
                        <p className="text-gray-600">
                            Take a closer look at our world-class infrastructure designed for holistic development.
                        </p>
                    </div>

                    <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
                        {tourSpots.map((spot) => (
                            <div
                                key={spot.title}
                                className="group relative aspect-[4/3] rounded-2xl overflow-hidden bg-gray-100 cursor-pointer"
                            >
                                <div className="absolute inset-0 gradient-bg opacity-80 group-hover:opacity-90 transition-opacity" />
                                <div className="absolute inset-0 flex flex-col items-center justify-center text-center p-6 text-white">
                                    <spot.icon className="w-12 h-12 mb-4 group-hover:scale-110 transition-transform" />
                                    <h3 className="text-xl font-bold mb-2">{spot.title}</h3>
                                    <p className="text-white/80 text-sm">{spot.description}</p>
                                    <button className="mt-4 flex items-center gap-2 px-4 py-2 bg-white/20 backdrop-blur-sm rounded-full text-sm font-medium border border-white/30 hover:bg-white/30 transition-all opacity-0 group-hover:opacity-100">
                                        <Play className="w-4 h-4" />
                                        View Tour
                                    </button>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* CTA */}
            <section className="py-16 gradient-bg">
                <div className="container mx-auto px-4 text-center">
                    <h2 className="text-2xl md:text-3xl font-bold text-white mb-4">
                        Want to Visit in Person?
                    </h2>
                    <p className="text-white/80 mb-8 max-w-2xl mx-auto">
                        Schedule a campus visit and experience NRIIT firsthand.
                    </p>
                    <Link
                        href="/contact"
                        className="inline-flex items-center gap-2 px-8 py-4 bg-white text-blue-700 rounded-full font-semibold hover:shadow-2xl transition-all"
                    >
                        Schedule a Visit
                        <ArrowRight className="w-5 h-5" />
                    </Link>
                </div>
            </section>
        </div>
    );
}
