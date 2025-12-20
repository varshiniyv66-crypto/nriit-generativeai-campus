"use client";

import Link from "next/link";
import { Map, ChevronRight, Home, Building2, Users, GraduationCap, FileText, Phone, Award, Briefcase, Globe, Shield, MessageSquare, Newspaper, Zap } from "lucide-react";
import { DEPARTMENTS } from "@/lib/constants";

const sitemapSections = [
    {
        title: "Main Pages",
        icon: Home,
        links: [
            { href: "/", label: "Home" },
            { href: "/about", label: "About Us" },
            { href: "/admissions", label: "Admissions" },
            { href: "/programmes", label: "Academic Programmes" },
            { href: "/gallery", label: "Campus Gallery" },
            { href: "/news-events", label: "News & Events" },
            { href: "/contact", label: "Contact Us" },
            { href: "/enquire", label: "Enquire Now" },
            { href: "/virtual-tour", label: "Virtual Tour" },
        ],
    },
    {
        title: "Academics",
        icon: GraduationCap,
        links: [
            { href: "/departments", label: "All Departments" },
            ...Object.entries(DEPARTMENTS).map(([code, dept]) => ({
                href: `/departments/${code.toLowerCase()}`,
                label: dept.name
            }))
        ],
    },
    {
        title: "Admissions",
        icon: FileText,
        links: [
            { href: "/admissions", label: "Admissions Overview" },
            { href: "/apply", label: "Apply Online" },
            { href: "/admissions#eligibility", label: "Eligibility Criteria" },
            { href: "/admissions#documents", label: "Required Documents" },
            { href: "/admissions#fee-structure", label: "Fee Structure" },
        ],
    },
    {
        title: "Career & Research",
        icon: Briefcase,
        links: [
            { href: "/placements", label: "Placements Dashboard" },
            { href: "/placements#recruiters", label: "Our Recruiters" },
            { href: "/corporate", label: "Corporate Interactions" },
            { href: "/alumni", label: "Alumni Network" },
            { href: "/careers", label: "Join Our Team (Careers)" },
            { href: "/research", label: "Research & Development" },
            { href: "/research#publications", label: "Faculty Publications" },
        ],
    },
    {
        title: "Accreditation",
        icon: Award,
        links: [
            { href: "/accreditation", label: "Accreditation Overview" },
            { href: "/accreditation/naac", label: "NAAC A+ Recognition" },
            { href: "/accreditation/nirf", label: "NIRF Rankings" },
            { href: "/accreditation/nba", label: "NBA Accreditation" },
        ],
    },
    {
        title: "Portals",
        icon: Users,
        links: [
            { href: "/login", label: "Login" },
            { href: "/student/dashboard", label: "Student Portal" },
            { href: "/faculty/dashboard", label: "Faculty Portal" },
            { href: "/dean/dashboard", label: "Dean Portal" },
            { href: "/admin/dashboard", label: "Admin Portal" },
        ],
    },
    {
        title: "Legal & Support",
        icon: Shield,
        links: [
            { href: "/privacy", label: "Privacy Policy" },
            { href: "/terms", label: "Terms of Service" },
            { href: "/faq", label: "Frequently Asked Questions" },
            { href: "/grievance", label: "Grievance Redressal" },
        ],
    },
];

export default function SitemapPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 bg-slate-950" />
                <div className="absolute inset-0 bg-gradient-to-br from-blue-600/20 via-transparent to-indigo-600/20" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center">
                    <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-500/10 border border-blue-500/20 text-blue-400 text-sm font-medium mb-6">
                        <Map className="w-4 h-4" />
                        Navigation Hub
                    </div>
                    <h1 className="text-4xl md:text-5xl lg:text-7xl font-black text-white mb-6 tracking-tight">
                        Complete <span className="text-blue-500">Sitemap</span>
                    </h1>
                    <p className="text-xl text-slate-400 max-w-3xl mx-auto leading-relaxed">
                        A structured directory of all pages, portals, and resources across the NRIIT digital ecosystem.
                    </p>
                </div>
            </section>

            {/* Sitemap Grid */}
            <section className="py-24 bg-[#0B1120]">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-10">
                        {sitemapSections.map((section) => (
                            <div
                                key={section.title}
                                className="group bg-slate-900/50 backdrop-blur-sm rounded-3xl p-8 border border-slate-800 hover:border-blue-500/30 transition-all duration-500"
                            >
                                <div className="flex items-center gap-4 mb-8">
                                    <div className="p-3 bg-blue-500/10 rounded-2xl group-hover:bg-blue-500/20 transition-colors">
                                        <section.icon className="w-6 h-6 text-blue-500" />
                                    </div>
                                    <h2 className="text-xl font-bold text-white tracking-tight">
                                        {section.title}
                                    </h2>
                                </div>
                                <ul className="space-y-4">
                                    {section.links.map((link) => (
                                        <li key={link.href}>
                                            <Link
                                                href={link.href}
                                                className="flex items-center justify-between group/link"
                                            >
                                                <span className="text-slate-400 group-hover/link:text-white transition-colors">
                                                    {link.label}
                                                </span>
                                                <ChevronRight className="w-4 h-4 text-slate-700 group-hover/link:text-blue-500 group-hover/link:translate-x-1 transition-all" />
                                            </Link>
                                        </li>
                                    ))}
                                </ul>
                            </div>
                        ))}
                    </div>
                </div>
            </section>
        </div>
    );
}
