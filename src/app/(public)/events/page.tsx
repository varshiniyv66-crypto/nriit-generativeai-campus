"use client";

import Link from "next/link";
import { Calendar, MapPin, Clock, Users, ArrowRight, Tag } from "lucide-react";

const events = [
    {
        title: "TechFest 2025",
        date: "2025-02-15",
        time: "9:00 AM - 6:00 PM",
        location: "Main Auditorium",
        category: "Technical",
        description: "Annual technical festival featuring coding competitions, robotics, and hackathons.",
        attendees: 500,
    },
    {
        title: "Campus Placement Drive - TCS",
        date: "2025-01-20",
        time: "10:00 AM",
        location: "Seminar Hall",
        category: "Placement",
        description: "TCS campus recruitment drive for final year students.",
        attendees: 200,
    },
    {
        title: "Alumni Meet 2025",
        date: "2025-01-25",
        time: "3:00 PM - 8:00 PM",
        location: "Convention Hall",
        category: "Cultural",
        description: "Annual gathering of NRIIT alumni from all batches.",
        attendees: 300,
    },
    {
        title: "Workshop on Cloud Computing",
        date: "2025-01-18",
        time: "2:00 PM - 5:00 PM",
        location: "CSE Lab 3",
        category: "Workshop",
        description: "Hands-on workshop on AWS and cloud technologies.",
        attendees: 60,
    },
    {
        title: "Sports Day 2025",
        date: "2025-02-01",
        time: "8:00 AM - 5:00 PM",
        location: "Sports Ground",
        category: "Sports",
        description: "Annual sports championship with various athletic events.",
        attendees: 1000,
    },
    {
        title: "Guest Lecture - AI in Healthcare",
        date: "2025-01-22",
        time: "11:00 AM - 1:00 PM",
        location: "Main Auditorium",
        category: "Seminar",
        description: "Industry expert talk on applications of AI in healthcare.",
        attendees: 150,
    },
];

const categoryColors: Record<string, string> = {
    Technical: "bg-blue-100 text-blue-700",
    Placement: "bg-green-100 text-green-700",
    Cultural: "bg-purple-100 text-purple-700",
    Workshop: "bg-amber-100 text-amber-700",
    Sports: "bg-red-100 text-red-700",
    Seminar: "bg-cyan-100 text-cyan-700",
};

export default function EventsPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        What's Happening
                    </span>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        Events & <span className="text-yellow-300">Activities</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto">
                        Stay updated with the latest events, workshops, seminars, and activities at NRIIT.
                    </p>
                </div>
            </section>

            {/* Events Grid */}
            <section className="py-20 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {events.map((event, index) => (
                            <div
                                key={event.title}
                                className="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-lg transition-shadow group"
                            >
                                {/* Event Date Badge */}
                                <div className="relative h-32 gradient-bg overflow-hidden">
                                    <div className="absolute inset-0 hero-dots opacity-20" />
                                    <div className="absolute inset-0 flex items-center justify-center">
                                        <div className="text-center text-white">
                                            <div className="text-4xl font-bold">
                                                {new Date(event.date).getDate()}
                                            </div>
                                            <div className="text-sm uppercase">
                                                {new Date(event.date).toLocaleDateString('en-US', { month: 'short', year: 'numeric' })}
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div className="p-6">
                                    <div className="flex items-center gap-2 mb-3">
                                        <span className={`px-2 py-1 rounded-full text-xs font-medium ${categoryColors[event.category]}`}>
                                            {event.category}
                                        </span>
                                    </div>

                                    <h3 className="text-lg font-bold text-gray-900 mb-2 group-hover:text-blue-600 transition-colors">
                                        {event.title}
                                    </h3>
                                    <p className="text-gray-600 text-sm mb-4 line-clamp-2">
                                        {event.description}
                                    </p>

                                    <div className="space-y-2 text-sm text-gray-500">
                                        <div className="flex items-center gap-2">
                                            <Clock className="w-4 h-4" />
                                            {event.time}
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <MapPin className="w-4 h-4" />
                                            {event.location}
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <Users className="w-4 h-4" />
                                            {event.attendees}+ Expected
                                        </div>
                                    </div>
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
                        Want to Participate?
                    </h2>
                    <p className="text-white/80 mb-8 max-w-2xl mx-auto">
                        Join NRIIT and be part of our vibrant campus life.
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
        </div>
    );
}
