"use client";

import Link from "next/link";
import {
    GraduationCap,
    Users,
    Building2,
    Award,
    Menu,
    X,
    Phone,
    Mail,
    MapPin,
    Globe,
} from "lucide-react";
import { useState } from "react";

const navLinks = [
    { href: "/about", label: "About" },
    { href: "/departments", label: "Departments" },
    { href: "/admissions", label: "Admissions" },
    { href: "/placements", label: "Placements" },
    { href: "/research", label: "Research" },
    { href: "/contact", label: "Contact" },
];

export default function PublicLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

    return (
        <div className="min-h-screen flex flex-col">
            {/* Header/Navigation */}
            <header className="fixed top-0 left-0 right-0 z-50 glass border-b border-white/10 bg-white/80 backdrop-blur-lg">
                <div className="container mx-auto px-4">
                    <nav className="flex items-center justify-between h-16 lg:h-20">
                        {/* Logo */}
                        <Link href="/" className="flex items-center gap-3">
                            <div className="w-10 h-10 lg:w-12 lg:h-12 rounded-xl gradient-bg flex items-center justify-center text-white font-bold text-lg lg:text-xl">
                                N
                            </div>
                            <div className="hidden sm:block">
                                <h1 className="font-bold text-lg lg:text-xl text-gray-900">NRIIT</h1>
                                <p className="text-xs text-gray-600">Excellence in Education</p>
                            </div>
                        </Link>

                        {/* Desktop Navigation */}
                        <div className="hidden lg:flex items-center gap-8">
                            {navLinks.map((link) => (
                                <Link
                                    key={link.href}
                                    href={link.href}
                                    className="text-gray-700 hover:text-blue-700 font-medium transition-colors"
                                >
                                    {link.label}
                                </Link>
                            ))}
                        </div>

                        {/* CTA Buttons */}
                        <div className="flex items-center gap-3">
                            <Link
                                href="/login"
                                className="hidden sm:inline-flex px-4 py-2 text-sm font-medium text-gray-700 hover:text-blue-700 transition-colors"
                            >
                                Login
                            </Link>
                            <Link
                                href="/apply"
                                className="px-4 lg:px-6 py-2 lg:py-2.5 text-sm font-semibold text-white gradient-bg rounded-full hover:shadow-lg hover:shadow-blue-500/25 transition-all btn-glow"
                            >
                                Apply Now
                            </Link>
                            <button
                                className="lg:hidden p-2 text-gray-600"
                                onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
                            >
                                {mobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
                            </button>
                        </div>
                    </nav>

                    {/* Mobile Menu */}
                    {mobileMenuOpen && (
                        <div className="lg:hidden py-4 border-t border-gray-100">
                            <div className="flex flex-col gap-2">
                                {navLinks.map((link) => (
                                    <Link
                                        key={link.href}
                                        href={link.href}
                                        className="px-4 py-2 text-gray-700 hover:bg-blue-50 rounded-lg transition-colors"
                                        onClick={() => setMobileMenuOpen(false)}
                                    >
                                        {link.label}
                                    </Link>
                                ))}
                            </div>
                        </div>
                    )}
                </div>
            </header>

            {/* Main Content */}
            <main className="flex-1 pt-16 lg:pt-20">{children}</main>

            {/* Footer */}
            <footer className="bg-gray-900 text-gray-300">
                <div className="container mx-auto px-4 py-16">
                    <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-12">
                        {/* Brand */}
                        <div>
                            <Link href="/" className="flex items-center gap-3 mb-6">
                                <div className="w-12 h-12 rounded-xl gradient-bg flex items-center justify-center text-white font-bold text-xl">
                                    N
                                </div>
                                <div>
                                    <h3 className="font-bold text-xl text-white">NRIIT</h3>
                                    <p className="text-xs text-gray-400">Est. 2001</p>
                                </div>
                            </Link>
                            <p className="text-gray-400 text-sm mb-6">
                                NRI Institute of Technology is committed to providing quality technical
                                education and producing industry-ready professionals.
                            </p>
                            <div className="flex gap-4">
                                {['facebook', 'twitter', 'linkedin', 'youtube', 'instagram'].map((social) => (
                                    <a
                                        key={social}
                                        href={`https://${social}.com/nriit`}
                                        className="w-10 h-10 rounded-full bg-white/10 flex items-center justify-center hover:bg-white/20 transition-colors"
                                        target="_blank"
                                        rel="noopener noreferrer"
                                    >
                                        <Globe className="w-5 h-5" />
                                    </a>
                                ))}
                            </div>
                        </div>

                        {/* Quick Links */}
                        <div>
                            <h4 className="font-semibold text-white mb-6">Quick Links</h4>
                            <ul className="space-y-3">
                                {['About Us', 'Admissions', 'Departments', 'Placements', 'Research', 'Events'].map((link) => (
                                    <li key={link}>
                                        <Link href={`/${link.toLowerCase().replace(' ', '-')}`} className="hover:text-white transition-colors">
                                            {link}
                                        </Link>
                                    </li>
                                ))}
                            </ul>
                        </div>

                        {/* Departments */}
                        <div>
                            <h4 className="font-semibold text-white mb-6">Departments</h4>
                            <ul className="space-y-3">
                                {['CSE', 'CSE (Data Science)', 'CSE (AI & ML)', 'IT', 'ECE', 'Civil'].map((dept) => (
                                    <li key={dept}>
                                        <Link href={`/departments/${dept.toLowerCase().replace(/[^a-z]/g, '-')}`} className="hover:text-white transition-colors">
                                            {dept}
                                        </Link>
                                    </li>
                                ))}
                            </ul>
                        </div>

                        {/* Contact */}
                        <div>
                            <h4 className="font-semibold text-white mb-6">Contact Us</h4>
                            <ul className="space-y-4">
                                <li className="flex gap-3">
                                    <MapPin className="w-5 h-5 text-purple-400 flex-shrink-0 mt-0.5" />
                                    <span className="text-sm">
                                        Visadala, Guntur
                                    </span>
                                </li>
                                <li className="flex gap-3">
                                    <Phone className="w-5 h-5 text-purple-400 flex-shrink-0" />
                                    <span className="text-sm">0863 234 4300</span>
                                </li>
                                <li className="flex gap-3">
                                    <Mail className="w-5 h-5 text-purple-400 flex-shrink-0" />
                                    <span className="text-sm">nriit.guntur@gmail.com</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                    {/* Bottom Bar */}
                    <div className="border-t border-gray-800 mt-12 pt-8 flex flex-col md:flex-row items-center justify-between gap-4">
                        <p className="text-sm text-gray-500">
                            © {new Date().getFullYear()} NRI Institute of Technology. All rights reserved.
                        </p>
                        <div className="flex gap-6 text-sm">
                            <Link href="/privacy" className="hover:text-white transition-colors">Privacy Policy</Link>
                            <Link href="/terms" className="hover:text-white transition-colors">Terms of Service</Link>
                            <Link href="/sitemap" className="hover:text-white transition-colors">Sitemap</Link>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    );
}
