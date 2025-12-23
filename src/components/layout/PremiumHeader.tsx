"use client";

import { useState } from "react";
import Link from "next/link";
import Image from "next/image";
import { Search, Menu, ChevronDown, Monitor, Cpu, Radio, Lightbulb, Building, Briefcase, GraduationCap, Cog, Zap, Leaf, BookOpen, Sun, Moon, Users, Phone, Crown } from "lucide-react";
import { useTheme } from "next-themes";
import { useEffect } from "react";

// All 11 Departments with icons and colors
const departments = [
    { code: "CSE", name: "Computer Science & Engineering", icon: Monitor, color: "from-blue-500 to-indigo-600", shortName: "CSE" },
    { code: "IT", name: "Information Technology", icon: Cpu, color: "from-cyan-500 to-blue-500", shortName: "IT" },
    { code: "ECE", name: "Electronics & Communication", icon: Radio, color: "from-orange-500 to-red-500", shortName: "ECE" },
    { code: "EVT", name: "Electric Vehicles Technology", icon: Zap, color: "from-yellow-500 to-orange-500", shortName: "EVT" },
    { code: "MTECH", name: "Master of Technology", icon: Cog, color: "from-gray-500 to-slate-600", shortName: "M.Tech" },
    { code: "CIVIL", name: "Civil Engineering", icon: Building, color: "from-amber-500 to-yellow-600", shortName: "CIVIL" },
    { code: "CSE-AI", name: "CSE (AI & ML)", icon: Lightbulb, color: "from-purple-500 to-pink-500", shortName: "AI/ML" },
    { code: "CSE-DS", name: "CSE (Data Science)", icon: Monitor, color: "from-emerald-500 to-teal-500", shortName: "DS" },
    { code: "MBA", name: "Master of Business Administration", icon: Briefcase, color: "from-rose-500 to-pink-600", shortName: "MBA" },
    { code: "MCA", name: "Master of Computer Applications", icon: GraduationCap, color: "from-violet-500 to-purple-600", shortName: "MCA" },
    { code: "BSH", name: "Basic Sciences & Humanities", icon: BookOpen, color: "from-green-500 to-emerald-600", shortName: "BSH" },
];

export default function PremiumHeader() {
    const [isDeptOpen, setIsDeptOpen] = useState(false);
    const { theme, setTheme } = useTheme();
    const [mounted, setMounted] = useState(false);
    const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

    useEffect(() => {
        setMounted(true);
    }, []);

    return (
        <header className="fixed top-0 left-0 right-0 z-50 transition-all duration-300 font-sans">
            {/* 1. TOP BAR - DARK NAVY */}
            <div className="bg-[#0B1120] text-gray-300 text-[13px] font-medium border-b border-white/10 hidden lg:block">
                <div className="container mx-auto px-4 h-10 flex items-center justify-between">
                    <div className="flex items-center gap-6">
                        {/* ABOUT US DROPDOWN */}
                        <div
                            className="relative group"
                            onMouseEnter={() => setIsAboutOpen && setIsAboutOpen(true)}
                            onMouseLeave={() => setIsAboutOpen && setIsAboutOpen(false)}
                        >
                            <Link href="/about" className="hover:text-[#FFD700] text-[#FFD700] transition-colors flex items-center gap-1 font-bold">
                                About Us <ChevronDown className="w-3 h-3 group-hover:rotate-180 transition-transform" />
                            </Link>
                            {/* Dropdown */}
                            <div className="absolute top-full left-0 pt-2 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
                                <div className="bg-slate-900 border border-white/10 rounded-xl shadow-2xl p-3 min-w-[220px]">
                                    <Link href="/principal" className="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-amber-500/10 transition-colors group/item">
                                        <Crown className="w-4 h-4 text-amber-400" />
                                        <div>
                                            <div className="text-white font-semibold group-hover/item:text-amber-400 transition-colors">Principal</div>
                                            <div className="text-[11px] text-slate-500">Dr. Dola Sanjay S</div>
                                        </div>
                                    </Link>
                                    <Link href="/vice-principal" className="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-emerald-500/10 transition-colors group/item">
                                        <Users className="w-4 h-4 text-emerald-400" />
                                        <div>
                                            <div className="text-white font-semibold group-hover/item:text-emerald-400 transition-colors">Vice Principal</div>
                                            <div className="text-[11px] text-slate-500">Prof. K. Srihari Rao</div>
                                        </div>
                                    </Link>
                                    <div className="h-px bg-white/10 my-2" />
                                    <Link href="/management" className="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-blue-500/10 transition-colors group/item">
                                        <Briefcase className="w-4 h-4 text-blue-400" />
                                        <div>
                                            <div className="text-white font-semibold group-hover/item:text-blue-400 transition-colors">Management</div>
                                            <div className="text-[11px] text-slate-500">MNK Education Society</div>
                                        </div>
                                    </Link>
                                    <Link href="/governing-body" className="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-purple-500/10 transition-colors group/item">
                                        <Building className="w-4 h-4 text-purple-400" />
                                        <div>
                                            <div className="text-white font-semibold group-hover/item:text-purple-400 transition-colors">Governing Body</div>
                                            <div className="text-[11px] text-slate-500">Statutory Body</div>
                                        </div>
                                    </Link>
                                    <div className="h-px bg-white/10 my-2" />
                                    <Link href="/about" className="flex items-center gap-3 px-4 py-2 rounded-lg hover:bg-white/5 transition-colors">
                                        <span className="text-[11px] text-slate-400 hover:text-white">View Full About Page →</span>
                                    </Link>
                                </div>
                            </div>
                        </div>
                        <Link href="/disclosures" className="hover:text-white transition-colors flex items-center gap-1">Disclosures <ChevronDown className="w-3 h-3" /></Link>
                        <Link href="/corporate" className="hover:text-white transition-colors">Corporate Interactions</Link>
                        <Link href="/careers" className="hover:text-white transition-colors">Careers</Link>
                        <Link href="/academics" className="hover:text-[#4CAF50] text-[#4CAF50] font-bold transition-colors">Academics</Link>
                        <Link href="/research" className="hover:text-[#00BFFF] text-[#00BFFF] font-bold transition-colors">🔬 Research</Link>
                    </div>
                    <div className="flex items-center gap-6">
                        <Link href="/login?role=student" className="hover:text-[#FFD700] transition-colors">Student Login</Link>
                        <Link href="/login?role=faculty" className="hover:text-[#FFD700] transition-colors">Faculty Login</Link>
                        <Link href="/login?role=dean" className="hover:text-[#FFD700] transition-colors text-[#FFD700] font-bold">Dean Portal</Link>
                        <div className="w-px h-4 bg-white/20 mx-2"></div>
                        <Link href="/enquire" className="hover:text-white transition-colors">Enquire Now</Link>
                        <Link href="/alumni" className="hover:text-white transition-colors">Alumni</Link>
                        <button
                            onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
                            className="hover:text-[#FFD700] transition-colors"
                            title="Toggle Theme"
                        >
                            {mounted && theme === 'dark' ? (
                                <Sun className="w-4 h-4 text-yellow-400" />
                            ) : (
                                <Moon className="w-4 h-4" />
                            )}
                        </button>
                        <button className="hover:text-[#FFD700] transition-colors">
                            <Search className="w-4 h-4" />
                        </button>
                    </div>
                </div>
            </div>

            {/* 2. MAIN NAVIGATION - WHITE */}
            <div className="bg-white/90 backdrop-blur-xl border-b border-slate-200 shadow-sm">
                <div className="container mx-auto px-4 h-[80px] flex items-center justify-between">

                    {/* Official NRIIT Logo with Premium Hover Effect */}
                    <Link href="/" className="flex items-center gap-3 group">
                        <div className="relative transition-all duration-300 ease-out group-hover:scale-110 group-hover:drop-shadow-[0_0_15px_rgba(255,215,0,0.6)]">
                            <Image
                                src="/nriit-logo.png"
                                alt="NRI Institute of Technology - A Powerhouse of Technology"
                                width={60}
                                height={60}
                                className="object-contain transition-transform duration-300"
                                priority
                            />
                        </div>
                        <div className="flex flex-col">
                            <h1 className="font-extrabold text-2xl text-[#013C58] tracking-tight leading-none group-hover:text-[#00537A] transition-colors duration-300">NRIIT</h1>
                            <span className="text-[10px] uppercase tracking-[0.1em] text-[#F5A201] font-bold group-hover:text-[#FFD700] transition-colors duration-300 whitespace-nowrap">NAAC A+ • AUTONOMOUS</span>
                        </div>
                    </Link>

                    {/* Main Menu Links */}
                    <nav className="hidden lg:flex items-center gap-8 text-[15px] font-semibold text-slate-700">

                        {/* DEPARTMENTS MEGA MENU */}
                        <div
                            className="relative"
                            onMouseEnter={() => setIsDeptOpen(true)}
                            onMouseLeave={() => setIsDeptOpen(false)}
                        >
                            <button className="flex items-center gap-1 hover:text-[#D4AF37] transition-colors text-[#D4AF37] font-bold">
                                Departments <ChevronDown className={`w-4 h-4 transition-transform duration-300 ${isDeptOpen ? 'rotate-180' : ''}`} />
                            </button>

                            {/* MEGA DROPDOWN */}
                            <div className={`absolute top-full left-1/2 -translate-x-1/2 pt-4 transition-all duration-300 ${isDeptOpen ? 'opacity-100 visible translate-y-0' : 'opacity-0 invisible -translate-y-2'}`}>
                                <div className="bg-white rounded-2xl shadow-2xl border border-slate-200 p-6 w-[800px] relative overflow-hidden">
                                    {/* Decorative gradient */}
                                    <div className="absolute top-0 left-0 right-0 h-1 bg-gradient-to-r from-[#D4AF37] via-blue-500 to-[#D4AF37]"></div>

                                    {/* Header */}
                                    <div className="flex items-center justify-between mb-6 pb-4 border-b border-slate-100">
                                        <div>
                                            <h3 className="text-lg font-bold text-slate-900">Schools & Departments</h3>
                                            <p className="text-sm text-slate-500">11 Cutting-edge Programs</p>
                                        </div>
                                        <div className="flex items-center gap-2 px-3 py-1 rounded-full bg-gradient-to-r from-[#D4AF37]/10 to-[#D4AF37]/20 border border-[#D4AF37]/30">
                                            <span className="text-xs font-bold text-[#D4AF37]">NAAC A+ | AUTONOMOUS</span>
                                        </div>
                                    </div>

                                    {/* Departments Grid */}
                                    <div className="grid grid-cols-3 gap-3">
                                        {departments.map((dept) => (
                                            <Link
                                                key={dept.code}
                                                href={`/departments/${dept.code.toLowerCase()}`}
                                                className="group flex items-center gap-3 p-3 rounded-xl hover:bg-slate-50 transition-all duration-200 border border-transparent hover:border-slate-200 hover:shadow-md"
                                            >
                                                <div className={`w-10 h-10 rounded-lg bg-gradient-to-br ${dept.color} flex items-center justify-center shadow-sm group-hover:scale-110 group-hover:shadow-lg transition-all duration-300`}>
                                                    <dept.icon className="w-5 h-5 text-white" />
                                                </div>
                                                <div className="flex-1 min-w-0">
                                                    <div className="text-sm font-bold text-slate-900 group-hover:text-[#D4AF37] transition-colors truncate">
                                                        {dept.shortName}
                                                    </div>
                                                    <div className="text-[11px] text-slate-500 truncate">
                                                        {dept.name}
                                                    </div>
                                                </div>
                                            </Link>
                                        ))}
                                    </div>

                                    {/* Footer */}
                                    <div className="mt-6 pt-4 border-t border-slate-100 flex items-center justify-between">
                                        <Link href="/programmes" className="text-sm text-[#D4AF37] font-semibold hover:underline flex items-center gap-1">
                                            View All Programs →
                                        </Link>
                                        <div className="flex gap-4 text-xs text-slate-500">
                                            <span>🎓 B.Tech</span>
                                            <span>📚 M.Tech</span>
                                            <span>💼 MBA</span>
                                            <span>💻 MCA</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <Link href="/admissions" className="hover:text-[#D4AF37] transition-colors flex items-center gap-1 text-[#0F172A]">Admissions <ChevronDown className="w-3 h-3" /></Link>
                        <Link href="/faqs" className="hover:text-[#D4AF37] transition-colors">General FAQs</Link>
                        <Link href="/gallery" className="hover:text-[#D4AF37] transition-colors">Gallery</Link>
                        <Link href="/contact" className="hover:text-[#D4AF37] transition-colors flex items-center gap-1">Contact Us <ChevronDown className="w-3 h-3" /></Link>
                    </nav>

                    {/* Mobile Menu Button */}
                    <button
                        className="lg:hidden p-2 text-slate-800 dark:text-white"
                        onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
                    >
                        {isMobileMenuOpen ? <ChevronDown className="w-6 h-6 rotate-180" /> : <Menu className="w-6 h-6" />}
                    </button>
                </div>
            </div>

            {/* 3. MOBILE MENU OVERLAY */}
            <div className={`lg:hidden fixed inset-0 z-40 bg-white dark:bg-slate-950 transform transition-transform duration-300 ease-in-out ${isMobileMenuOpen ? 'translate-x-0' : 'translate-x-full'} pt-[130px]`}>
                <div className="h-full overflow-y-auto px-6 pb-20">
                    <div className="flex flex-col gap-6">
                        {/* Mobile Academy Links */}
                        <div className="space-y-4 border-b border-slate-100 dark:border-slate-800 pb-6">
                            <Link href="/about" className="block text-lg font-bold text-slate-800 dark:text-white" onClick={() => setIsMobileMenuOpen(false)}>About Us</Link>
                            <Link href="/principal" className="flex items-center gap-2 text-lg font-bold text-[#D4AF37]" onClick={() => setIsMobileMenuOpen(false)}><Crown className="w-4 h-4" /> Principal</Link>
                            <Link href="/vice-principal" className="flex items-center gap-2 text-lg font-bold text-[#10B981]" onClick={() => setIsMobileMenuOpen(false)}>Vice Principal</Link>
                            <Link href="/management" className="block text-lg font-bold text-slate-800 dark:text-white" onClick={() => setIsMobileMenuOpen(false)}>Management</Link>
                            <Link href="/academics" className="block text-lg font-bold text-slate-800 dark:text-white" onClick={() => setIsMobileMenuOpen(false)}>Academics</Link>
                            <Link href="/admissions" className="block text-lg font-bold text-[#D4AF37]" onClick={() => setIsMobileMenuOpen(false)}>Admissions 2025</Link>
                        </div>

                        {/* Mobile Departments */}
                        <div>
                            <h3 className="text-sm font-bold text-slate-400 uppercase tracking-wider mb-4">Departments</h3>
                            <div className="grid grid-cols-2 gap-3">
                                {departments.map((dept) => (
                                    <Link
                                        key={dept.code}
                                        href={`/departments/${dept.code.toLowerCase()}`}
                                        className="flex items-center gap-2 p-2 rounded-lg bg-slate-50 dark:bg-slate-900 border border-slate-100 dark:border-slate-800"
                                        onClick={() => setIsMobileMenuOpen(false)}
                                    >
                                        <div className={`w-8 h-8 rounded bg-gradient-to-br ${dept.color} flex items-center justify-center`}>
                                            <dept.icon className="w-4 h-4 text-white" />
                                        </div>
                                        <span className="text-xs font-bold text-slate-700 dark:text-slate-300">{dept.shortName}</span>
                                    </Link>
                                ))}
                            </div>
                        </div>

                        {/* Mobile Quick Links */}
                        <div className="space-y-4 border-t border-slate-100 dark:border-slate-800 pt-6">
                            <Link href="/login?role=student" className="flex items-center gap-2 text-slate-600 dark:text-slate-400 font-medium" onClick={() => setIsMobileMenuOpen(false)}>
                                <Users className="w-4 h-4" /> Student Login
                            </Link>
                            <Link href="/login?role=faculty" className="flex items-center gap-2 text-slate-600 dark:text-slate-400 font-medium" onClick={() => setIsMobileMenuOpen(false)}>
                                <Briefcase className="w-4 h-4" /> Faculty Login
                            </Link>
                            <Link href="/contact" className="flex items-center gap-2 text-slate-600 dark:text-slate-400 font-medium" onClick={() => setIsMobileMenuOpen(false)}>
                                <Phone className="w-4 h-4" /> Contact Us
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    );
}
