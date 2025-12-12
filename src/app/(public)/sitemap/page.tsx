"use client";

import Link from "next/link";
import { Map, ChevronRight, Home, Building2, Users, GraduationCap, FileText, Phone, Award, Briefcase } from "lucide-react";

const sitemapSections = [
    {
        title: "Main Pages",
        icon: Home,
        links: [
            { href: "/", label: "Home" },
            { href: "/about", label: "About Us" },
            { href: "/contact", label: "Contact Us" },
            { href: "/events", label: "Events" },
            { href: "/virtual-tour", label: "Virtual Tour" },
        ],
    },
    {
        title: "Academics",
        icon: GraduationCap,
        links: [
            { href: "/departments", label: "All Departments" },
            { href: "/departments/cse", label: "Computer Science & Engineering" },
            { href: "/departments/cse-ds", label: "CSE (Data Science)" },
            { href: "/departments/cse-ai", label: "CSE (AI & ML)" },
            { href: "/departments/it", label: "Information Technology" },
            { href: "/departments/ece", label: "Electronics & Communication" },
            { href: "/departments/civil", label: "Civil Engineering" },
            { href: "/departments/mba", label: "MBA" },
            { href: "/departments/mca", label: "MCA" },
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
        ],
    },
    {
        title: "Career & Research",
        icon: Briefcase,
        links: [
            { href: "/placements", label: "Placements" },
            { href: "/research", label: "Research" },
            { href: "/placements#recruiters", label: "Our Recruiters" },
            { href: "/placements#crt", label: "CRT Program" },
        ],
    },
    {
        title: "Accreditation",
        icon: Award,
        links: [
            { href: "/accreditation/nba", label: "NBA Accreditation" },
            { href: "/accreditation/naac", label: "NAAC Accreditation" },
            { href: "/accreditation/nirf", label: "NIRF Rankings" },
        ],
    },
    {
        title: "Portals",
        icon: Users,
        links: [
            { href: "/login", label: "Login" },
            { href: "/student/dashboard", label: "Student Portal" },
            { href: "/faculty/dashboard", label: "Faculty Portal" },
            { href: "/admin/dashboard", label: "Admin Portal" },
        ],
    },
    {
        title: "Legal",
        icon: FileText,
        links: [
            { href: "/privacy", label: "Privacy Policy" },
            { href: "/terms", label: "Terms of Service" },
        ],
    },
];

export default function SitemapPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-16 md:py-20 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <Map className="w-16 h-16 mx-auto mb-6 text-white/80" />
                    <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold mb-4">
                        Sitemap
                    </h1>
                    <p className="text-lg text-white/80 max-w-2xl mx-auto">
                        Explore all pages and sections of our website
                    </p>
                </div>
            </section>

            {/* Sitemap Grid */}
            <section className="py-16 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                        {sitemapSections.map((section) => (
                            <div
                                key={section.title}
                                className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100"
                            >
                                <h2 className="flex items-center gap-3 text-lg font-bold text-gray-900 mb-4">
                                    <section.icon className="w-5 h-5 text-blue-600" />
                                    {section.title}
                                </h2>
                                <ul className="space-y-2">
                                    {section.links.map((link) => (
                                        <li key={link.href}>
                                            <Link
                                                href={link.href}
                                                className="flex items-center gap-2 text-gray-600 hover:text-blue-600 transition-colors group"
                                            >
                                                <ChevronRight className="w-4 h-4 text-gray-400 group-hover:text-blue-600 group-hover:translate-x-1 transition-all" />
                                                {link.label}
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
