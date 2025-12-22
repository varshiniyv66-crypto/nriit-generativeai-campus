"use client";

import { useState, useMemo } from "react";
import Link from "next/link";
import {
    Calendar,
    MapPin,
    Clock,
    Users,
    ArrowRight,
    Tag,
    Newspaper,
    PartyPopper,
    Filter,
    ChevronRight,
    ExternalLink,
    Building2,
    Search
} from "lucide-react";
import { DEPARTMENTS } from "@/lib/constants";

// ============================================
// Types
// ============================================
interface NewsItem {
    id: string;
    title: string;
    date: string;
    department: string;
    category: string;
    description: string;
    image?: string;
    link?: string;
    featured?: boolean;
}

interface EventItem {
    id: string;
    title: string;
    date: string;
    time: string;
    location: string;
    department: string;
    category: string;
    description: string;
    attendees: number;
    registrationLink?: string;
    featured?: boolean;
}

// ============================================
// Sample Data - News
// ============================================
const newsData: NewsItem[] = [
    {
        id: "n1",
        title: "NRIIT Secures NAAC 'A+' Grade Accreditation",
        date: "2023-12-15",
        department: "ALL",
        category: "Achievement",
        description: "NRI Institute of Technology has been awarded 'A+' grade by the National Assessment and Accreditation Council (NAAC), recognizing excellence in higher education.",
        featured: true,
    },
    {
        id: "n2",
        title: "Autonomous Status Conferred by UGC and JNTUK",
        date: "2023-08-10",
        department: "ALL",
        category: "Achievement",
        description: "NRIIT has been granted Autonomous Status by UGC and is permanently affiliated to JNTUK Kakinada, empowering academic flexibility and curriculum innovation.",
        featured: true,
    },
    {
        id: "n3",
        title: "NBA Accreditation for Major Engineering Departments",
        date: "2023-11-20",
        department: "CSE",
        category: "Achievement",
        description: "CSE, ECE, EEE, ME, and CE departments have been accredited by the National Board of Accreditation (NBA), certifying global education standards.",
        featured: true,
    },
    {
        id: "n4",
        title: "Principal Dr. Dola Sanjay S. Awarded Bheeshma Award",
        date: "2024-03-05",
        department: "ALL",
        category: "Achievement",
        description: "Principal Dr. Dola Sanjay S. was honored with the prestigious Bheeshma Award for his meaningful contribution to the field of education and research.",
    },
    {
        id: "n5",
        title: "Mechanical Engineering Receives Rs. 50 Lakhs AICTE Grant",
        date: "2023-09-15",
        department: "MECH",
        category: "Research",
        description: "The Mechanical Engineering department received a Rs. 50 Lakhs grant from AICTE for a renewable energy research project and modernization of labs.",
    },
    {
        id: "n6",
        title: "Civil Engineering Dept. Achieves 'A' Grade in Audit",
        date: "2023-10-25",
        department: "CIVIL",
        category: "Achievement",
        description: "The Civil Engineering department was recognized for its structural design consultancy and academic excellence in the recent audit.",
    },
    {
        id: "n7",
        title: "Campus Recruitment Drive: 95% Placement Record",
        date: "2024-04-10",
        department: "ALL",
        category: "Placement",
        description: "NRIIT achieved record-breaking placement statistics with 95% of eligible students securing positions in top MNCs with highest packages.",
    },
    {
        id: "n8",
        title: "Faculty Development Program on Industry 4.0",
        date: "2023-11-15",
        department: "ALL",
        category: "Training",
        description: "A week-long FDP on Industry 4.0 technologies was conducted with resource persons from leading industries to upskill faculty.",
    },
];

// ============================================
// Sample Data - Events
// ============================================
const eventsData: EventItem[] = [
    {
        id: "e1",
        title: "TechFest 2025 - Annual Technical Festival",
        date: "2025-02-15",
        time: "9:00 AM - 6:00 PM",
        location: "Main Auditorium & Campus Grounds",
        department: "ALL",
        category: "Technical",
        description: "The biggest annual technical festival featuring coding competitions, robotics, hackathons, tech talks, and exhibitions from 20+ departments.",
        attendees: 2000,
        registrationLink: "/apply",
        featured: true,
    },
    {
        id: "e2",
        title: "Campus Placement Drive - TCS",
        date: "2025-01-20",
        time: "10:00 AM - 5:00 PM",
        location: "Seminar Hall Complex",
        department: "ALL",
        category: "Placement",
        description: "TCS campus recruitment drive for final year B.Tech and MCA students. Multiple roles available in development, testing, and support.",
        attendees: 300,
        featured: true,
    },
    {
        id: "e3",
        title: "Alumni Meet 2025",
        date: "2025-01-25",
        time: "3:00 PM - 8:00 PM",
        location: "Convention Hall",
        department: "ALL",
        category: "Cultural",
        description: "Annual gathering of NRIIT alumni from all batches. Network with successful professionals and share experiences.",
        attendees: 500,
    },
    {
        id: "e4",
        title: "AWS Cloud Computing Workshop",
        date: "2025-01-18",
        time: "2:00 PM - 5:00 PM",
        location: "CSE Lab 3",
        department: "CSE",
        category: "Workshop",
        description: "Hands-on workshop on Amazon Web Services covering EC2, S3, Lambda, and cloud architecture best practices.",
        attendees: 80,
    },
    {
        id: "e5",
        title: "Sports Day 2025",
        date: "2025-02-01",
        time: "8:00 AM - 5:00 PM",
        location: "Sports Ground",
        department: "ALL",
        category: "Sports",
        description: "Annual sports championship with cricket, football, athletics, indoor games, and inter-departmental competitions.",
        attendees: 1500,
    },
    {
        id: "e6",
        title: "Guest Lecture: AI in Healthcare by Dr. Rajesh Kumar",
        date: "2025-01-22",
        time: "11:00 AM - 1:00 PM",
        location: "Main Auditorium",
        department: "CSE",
        category: "Seminar",
        description: "Distinguished lecture by Dr. Rajesh Kumar, Chief AI Scientist at Apollo Hospitals, on transformative applications of AI in healthcare.",
        attendees: 200,
    },
    {
        id: "e7",
        title: "Entrepreneurship Summit 2025",
        date: "2025-02-10",
        time: "9:00 AM - 6:00 PM",
        location: "Conference Hall",
        department: "MBA",
        category: "Conference",
        description: "Annual startup summit featuring pitch competitions, investor meets, and keynotes from successful entrepreneurs.",
        attendees: 400,
    },
    {
        id: "e8",
        title: "IoT Workshop - Smart Home Automation",
        date: "2025-01-28",
        time: "10:00 AM - 4:00 PM",
        location: "ECE Innovation Lab",
        department: "ECE",
        category: "Workshop",
        description: "Build your own smart home automation system using Arduino, sensors, and IoT protocols.",
        attendees: 60,
    },
    {
        id: "e9",
        title: "Infosys Pre-Placement Talk",
        date: "2025-01-15",
        time: "2:00 PM - 4:00 PM",
        location: "Seminar Hall A",
        department: "ALL",
        category: "Placement",
        description: "Pre-placement presentation by Infosys for upcoming campus recruitment drive.",
        attendees: 250,
    },
];

// ============================================
// Category Colors
// ============================================
const newsCategoryColors: Record<string, string> = {
    Achievement: "bg-gradient-to-r from-amber-500 to-orange-500 text-white",
    Research: "bg-gradient-to-r from-purple-500 to-violet-500 text-white",
    Placement: "bg-gradient-to-r from-emerald-500 to-green-500 text-white",
    Partnership: "bg-gradient-to-r from-blue-500 to-cyan-500 text-white",
    Event: "bg-gradient-to-r from-pink-500 to-rose-500 text-white",
    Training: "bg-gradient-to-r from-indigo-500 to-blue-500 text-white",
};

const eventCategoryColors: Record<string, string> = {
    Technical: "bg-blue-100 text-blue-700 border border-blue-200",
    Placement: "bg-emerald-100 text-emerald-700 border border-emerald-200",
    Cultural: "bg-purple-100 text-purple-700 border border-purple-200",
    Workshop: "bg-amber-100 text-amber-700 border border-amber-200",
    Sports: "bg-red-100 text-red-700 border border-red-200",
    Seminar: "bg-cyan-100 text-cyan-700 border border-cyan-200",
    Conference: "bg-indigo-100 text-indigo-700 border border-indigo-200",
};

// ============================================
// Main Component
// ============================================
export default function NewsEventsPage() {
    const [activeTab, setActiveTab] = useState<"news" | "events">("news");
    const [selectedDepartment, setSelectedDepartment] = useState<string>("ALL");
    const [selectedDate, setSelectedDate] = useState<string>("");
    const [searchQuery, setSearchQuery] = useState<string>("");

    // Department options for filter
    const departmentOptions = [
        { value: "ALL", label: "All Departments" },
        ...Object.entries(DEPARTMENTS).map(([code, dept]) => ({
            value: code,
            label: dept.name,
        })),
    ];

    // Filtered News
    const filteredNews = useMemo(() => {
        return newsData.filter((item) => {
            const matchesDept = selectedDepartment === "ALL" || item.department === selectedDepartment || item.department === "ALL";
            const matchesDate = !selectedDate || item.date === selectedDate;
            const matchesSearch = !searchQuery ||
                item.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
                item.description.toLowerCase().includes(searchQuery.toLowerCase());
            return matchesDept && matchesDate && matchesSearch;
        });
    }, [selectedDepartment, selectedDate, searchQuery]);

    // Filtered Events
    const filteredEvents = useMemo(() => {
        return eventsData.filter((item) => {
            const matchesDept = selectedDepartment === "ALL" || item.department === selectedDepartment || item.department === "ALL";
            const matchesDate = !selectedDate || item.date === selectedDate;
            const matchesSearch = !searchQuery ||
                item.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
                item.description.toLowerCase().includes(searchQuery.toLowerCase());
            return matchesDept && matchesDate && matchesSearch;
        });
    }, [selectedDepartment, selectedDate, searchQuery]);

    const formatDate = (dateStr: string) => {
        const date = new Date(dateStr);
        return {
            day: date.getDate(),
            month: date.toLocaleDateString('en-US', { month: 'short' }),
            year: date.getFullYear(),
            full: date.toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }),
        };
    };

    return (
        <div className="min-h-screen bg-gray-50">
            {/* Hero Section */}
            <section className="relative py-16 md:py-24 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-95" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                {/* Floating Elements */}
                <div className="absolute top-20 left-10 w-20 h-20 bg-white/10 rounded-full blur-xl" />
                <div className="absolute bottom-10 right-20 w-32 h-32 bg-yellow-400/20 rounded-full blur-2xl" />


                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-flex items-center gap-2 px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        <Newspaper className="w-4 h-4" />
                        Stay Updated
                    </span>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        News <span className="text-yellow-300">&</span> Events
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto">
                        Stay informed about the latest happenings, achievements, and upcoming events at NRI Institute of Technology.
                    </p>
                </div>
            </section>

            {/* Main Content */}
            <section className="py-12">
                <div className="container mx-auto px-4">
                    {/* Tab Navigation */}
                    <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-6 mb-10">
                        {/* Tabs */}
                        <div className="flex gap-2 bg-white rounded-xl p-1.5 shadow-lg border border-gray-100 w-fit">
                            <button
                                onClick={() => setActiveTab("news")}
                                className={`flex items-center gap-2 px-6 py-3 rounded-lg font-semibold transition-all duration-300 ${activeTab === "news"
                                    ? "bg-gradient-to-r from-orange-500 to-red-500 text-white shadow-lg"
                                    : "text-gray-600 hover:bg-gray-100"
                                    }`}
                            >
                                <Newspaper className="w-5 h-5" />
                                News
                            </button>
                            <button
                                onClick={() => setActiveTab("events")}
                                className={`flex items-center gap-2 px-6 py-3 rounded-lg font-semibold transition-all duration-300 ${activeTab === "events"
                                    ? "bg-gradient-to-r from-orange-500 to-red-500 text-white shadow-lg"
                                    : "text-gray-600 hover:bg-gray-100"
                                    }`}
                            >
                                <PartyPopper className="w-5 h-5" />
                                Events
                            </button>
                        </div>

                        {/* Filters */}
                        <div className="flex flex-col sm:flex-row gap-4">
                            {/* Search */}
                            <div className="relative">
                                <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                                <input
                                    type="text"
                                    placeholder="Search..."
                                    value={searchQuery}
                                    onChange={(e) => setSearchQuery(e.target.value)}
                                    className="pl-10 pr-4 py-3 bg-white border border-gray-200 rounded-xl shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent w-full sm:w-52"
                                />
                            </div>

                            {/* Department Filter */}
                            <div className="relative">
                                <Building2 className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                                <select
                                    value={selectedDepartment}
                                    onChange={(e) => setSelectedDepartment(e.target.value)}
                                    className="pl-10 pr-10 py-3 bg-white border border-gray-200 rounded-xl shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent appearance-none cursor-pointer w-full sm:w-56"
                                >
                                    {departmentOptions.map((opt) => (
                                        <option key={opt.value} value={opt.value}>
                                            {opt.label}
                                        </option>
                                    ))}
                                </select>
                                <ChevronRight className="absolute right-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400 rotate-90" />
                            </div>

                            {/* Date Filter */}
                            <div className="relative">
                                <Calendar className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                                <input
                                    type="date"
                                    value={selectedDate}
                                    onChange={(e) => setSelectedDate(e.target.value)}
                                    className="pl-10 pr-4 py-3 bg-white border border-gray-200 rounded-xl shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent w-full sm:w-44 cursor-pointer"
                                />
                            </div>

                            {/* Clear Filters */}
                            {(selectedDepartment !== "ALL" || selectedDate || searchQuery) && (
                                <button
                                    onClick={() => {
                                        setSelectedDepartment("ALL");
                                        setSelectedDate("");
                                        setSearchQuery("");
                                    }}
                                    className="px-4 py-3 bg-gray-100 text-gray-600 rounded-xl hover:bg-gray-200 transition-colors font-medium"
                                >
                                    Clear
                                </button>
                            )}
                        </div>
                    </div>

                    {/* Results Count */}
                    <div className="mb-6 text-gray-600">
                        Showing <span className="font-semibold text-gray-900">
                            {activeTab === "news" ? filteredNews.length : filteredEvents.length}
                        </span> {activeTab === "news" ? "news articles" : "events"}
                    </div>

                    {/* Content Grid */}
                    {activeTab === "news" ? (
                        /* News Grid */
                        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                            {filteredNews.length === 0 ? (
                                <div className="col-span-full py-16 text-center">
                                    <Newspaper className="w-16 h-16 text-gray-300 mx-auto mb-4" />
                                    <h3 className="text-xl font-semibold text-gray-500">No news found</h3>
                                    <p className="text-gray-400 mt-2">Try adjusting your filters</p>
                                </div>
                            ) : (
                                filteredNews.map((news, index) => {
                                    const date = formatDate(news.date);
                                    return (
                                        <article
                                            key={news.id}
                                            className={`bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-xl transition-all duration-300 group ${news.featured ? "ring-2 ring-orange-200" : ""
                                                }`}
                                        >
                                            {/* News Header */}
                                            <div className="relative h-40 bg-gradient-to-br from-gray-800 to-gray-900 overflow-hidden">
                                                <div className="absolute inset-0 opacity-30">
                                                    <div className="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PHBhdHRlcm4gaWQ9ImdyaWQiIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHBhdGggZD0iTSAwIDEwIEwgNDAgMTAgTSAxMCAwIEwgMTAgNDAgTSAwIDIwIEwgNDAgMjAgTSAyMCAwIEwgMjAgNDAgTSAwIDMwIEwgNDAgMzAgTSAzMCAwIEwgMzAgNDAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iI2ZmZiIgc3Ryb2tlLW9wYWNpdHk9IjAuMSIgc3Ryb2tlLXdpZHRoPSIxIi8+PC9wYXR0ZXJuPjwvZGVmcz48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSJ1cmwoI2dyaWQpIi8+PC9zdmc+')] bg-repeat" />
                                                </div>

                                                {/* Featured Badge */}
                                                {news.featured && (
                                                    <span className="absolute top-4 right-4 px-3 py-1 bg-yellow-400 text-yellow-900 text-xs font-bold rounded-full uppercase tracking-wide">
                                                        Featured
                                                    </span>
                                                )}

                                                {/* Date Badge */}
                                                <div className="absolute bottom-4 left-4 bg-white rounded-lg p-2 shadow-lg text-center min-w-[60px]">
                                                    <div className="text-2xl font-bold text-gray-900">{date.day}</div>
                                                    <div className="text-xs text-gray-500 uppercase">{date.month}</div>
                                                </div>

                                                {/* Category */}
                                                <div className="absolute top-4 left-4">
                                                    <span className={`px-3 py-1 rounded-full text-xs font-semibold ${newsCategoryColors[news.category] || "bg-gray-500 text-white"}`}>
                                                        {news.category}
                                                    </span>
                                                </div>
                                            </div>

                                            {/* News Content */}
                                            <div className="p-6">
                                                <div className="flex items-center gap-2 mb-3 text-sm text-gray-500">
                                                    <Building2 className="w-4 h-4" />
                                                    <span>{news.department === "ALL" ? "All Departments" : DEPARTMENTS[news.department as keyof typeof DEPARTMENTS]?.name || news.department}</span>
                                                </div>

                                                <h3 className="text-lg font-bold text-gray-900 mb-3 group-hover:text-orange-600 transition-colors line-clamp-2">
                                                    {news.title}
                                                </h3>

                                                <p className="text-gray-600 text-sm mb-4 line-clamp-3">
                                                    {news.description}
                                                </p>

                                                <button className="inline-flex items-center gap-2 text-orange-600 font-semibold hover:text-orange-700 transition-colors text-sm group/btn">
                                                    Read More
                                                    <ArrowRight className="w-4 h-4 group-hover/btn:translate-x-1 transition-transform" />
                                                </button>
                                            </div>
                                        </article>
                                    );
                                })
                            )}
                        </div>
                    ) : (
                        /* Events Grid */
                        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                            {filteredEvents.length === 0 ? (
                                <div className="col-span-full py-16 text-center">
                                    <PartyPopper className="w-16 h-16 text-gray-300 mx-auto mb-4" />
                                    <h3 className="text-xl font-semibold text-gray-500">No events found</h3>
                                    <p className="text-gray-400 mt-2">Try adjusting your filters</p>
                                </div>
                            ) : (
                                filteredEvents.map((event, index) => {
                                    const date = formatDate(event.date);
                                    const isUpcoming = new Date(event.date) >= new Date();

                                    return (
                                        <article
                                            key={event.id}
                                            className={`bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-xl transition-all duration-300 group ${event.featured ? "ring-2 ring-orange-200" : ""
                                                }`}
                                        >
                                            {/* Event Header with Date */}
                                            <div className="relative h-36 gradient-bg overflow-hidden">
                                                <div className="absolute inset-0 hero-dots opacity-20" />

                                                {/* Featured Badge */}
                                                {event.featured && (
                                                    <span className="absolute top-4 right-4 px-3 py-1 bg-yellow-400 text-yellow-900 text-xs font-bold rounded-full uppercase tracking-wide">
                                                        Featured
                                                    </span>
                                                )}

                                                {/* Upcoming/Past Badge */}
                                                <span className={`absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold ${isUpcoming
                                                    ? "bg-green-400 text-green-900"
                                                    : "bg-gray-400 text-gray-900"
                                                    }`}>
                                                    {isUpcoming ? "Upcoming" : "Completed"}
                                                </span>

                                                {/* Date Display */}
                                                <div className="absolute inset-0 flex items-center justify-center">
                                                    <div className="text-center text-white">
                                                        <div className="text-5xl font-bold">{date.day}</div>
                                                        <div className="text-sm uppercase tracking-wider opacity-80">
                                                            {date.month} {date.year}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            {/* Event Content */}
                                            <div className="p-6">
                                                <div className="flex items-center gap-2 mb-3">
                                                    <span className={`px-2.5 py-1 rounded-lg text-xs font-medium ${eventCategoryColors[event.category] || "bg-gray-100 text-gray-700"}`}>
                                                        {event.category}
                                                    </span>
                                                </div>

                                                <h3 className="text-lg font-bold text-gray-900 mb-3 group-hover:text-orange-600 transition-colors line-clamp-2">
                                                    {event.title}
                                                </h3>

                                                <p className="text-gray-600 text-sm mb-4 line-clamp-2">
                                                    {event.description}
                                                </p>

                                                {/* Event Meta */}
                                                <div className="space-y-2 mb-4">
                                                    <div className="flex items-center gap-2 text-sm text-gray-500">
                                                        <Clock className="w-4 h-4 text-orange-500" />
                                                        <span>{event.time}</span>
                                                    </div>
                                                    <div className="flex items-center gap-2 text-sm text-gray-500">
                                                        <MapPin className="w-4 h-4 text-orange-500" />
                                                        <span>{event.location}</span>
                                                    </div>
                                                    <div className="flex items-center gap-2 text-sm text-gray-500">
                                                        <Users className="w-4 h-4 text-orange-500" />
                                                        <span>{event.attendees}+ Expected</span>
                                                    </div>
                                                </div>

                                                {/* Register Button */}
                                                {isUpcoming && event.registrationLink && (
                                                    <Link
                                                        href={event.registrationLink}
                                                        className="inline-flex items-center gap-2 w-full justify-center px-4 py-2.5 bg-gradient-to-r from-orange-500 to-red-500 text-white font-semibold rounded-xl hover:shadow-lg transition-all"
                                                    >
                                                        Register Now
                                                        <ExternalLink className="w-4 h-4" />
                                                    </Link>
                                                )}
                                            </div>
                                        </article>
                                    );
                                })
                            )}
                        </div>
                    )}
                </div>
            </section>

            {/* Newsletter/Subscribe CTA */}
            <section className="py-16 bg-gradient-to-br from-orange-500 via-red-500 to-pink-500 relative overflow-hidden">
                <div className="absolute inset-0 hero-dots opacity-20" />
                <div className="absolute top-10 left-10 w-40 h-40 bg-white/10 rounded-full blur-3xl" />
                <div className="absolute bottom-10 right-10 w-60 h-60 bg-yellow-400/20 rounded-full blur-3xl" />

                <div className="relative container mx-auto px-4 text-center">
                    <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
                        Never Miss an Update
                    </h2>
                    <p className="text-white/80 mb-8 max-w-2xl mx-auto">
                        Subscribe to our newsletter and stay informed about the latest news, events, and opportunities at NRIIT.
                    </p>

                    <form className="flex flex-col sm:flex-row gap-4 max-w-md mx-auto">
                        <input
                            type="email"
                            placeholder="Enter your email"
                            className="flex-1 px-6 py-4 rounded-full bg-white/95 backdrop-blur-sm text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-4 focus:ring-white/30 shadow-lg"
                        />
                        <button
                            type="submit"
                            className="px-8 py-4 bg-gray-900 text-white rounded-full font-semibold hover:bg-gray-800 transition-colors shadow-lg flex items-center gap-2 justify-center"
                        >
                            Subscribe
                            <ArrowRight className="w-5 h-5" />
                        </button>
                    </form>
                </div>
            </section>
        </div>
    );
}
