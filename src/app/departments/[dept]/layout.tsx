"use client";

import { useState } from "react";
import { useParams, usePathname } from "next/navigation";
import Link from "next/link";
import { motion, AnimatePresence } from "framer-motion";
import {
    Home, BookOpen, Target, Award, User, Users, FlaskConical,
    BrainCircuit, Trophy, Calendar, GraduationCap, Briefcase,
    Heart, ImageIcon, Phone, Menu, X, ChevronRight, Sparkles, FileText,
    ShieldCheck, CheckCircle2
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";

const NAVIGATION_ITEMS = [
    { icon: Home, label: "Home", href: "" },
    { icon: BookOpen, label: "About Department", href: "/about" },
    { icon: Award, label: "Dean's Message", href: "/dean" },
    { icon: User, label: "HOD's Message", href: "/hod" },
    { icon: Target, label: "Vision & Mission", href: "/vision-mission" },
    { icon: Award, label: "PEOs & PSOs", href: "/outcomes" },
    { icon: Users, label: "Faculty", href: "/faculty" },
    { icon: FlaskConical, label: "Laboratories", href: "/labs" },
    { icon: BrainCircuit, label: "Research", href: "/research" },
    { icon: Trophy, label: "Achievements", href: "/achievements" },
    { icon: Calendar, label: "Events", href: "/events" },
    { icon: Briefcase, label: "CRT & Placements", href: "/placements" },
    { icon: Heart, label: "Mentoring", href: "/mentoring" },
    { icon: ImageIcon, label: "Gallery", href: "/gallery" },
    { icon: Phone, label: "Contact Us", href: "/contact" },
];

// Department display names
const DEPT_NAMES: Record<string, string> = {
    'CSE': 'Computer Science',
    'IT': 'Information Technology',
    'ECE': 'Electronics & Communication',
    'EEE': 'Electrical Engineering',
    'MECH': 'Mechanical Engineering',
    'CIVIL': 'Civil Engineering',
    'MCA': 'Computer Applications',
    'MBA': 'Business Administration',
    'BSH': 'Basic Sciences & Humanities',
};

export default function DepartmentLayout({ children }: { children: React.ReactNode }) {
    const params = useParams();
    const pathname = usePathname();
    const deptCode = (params.dept as string || '').toUpperCase();
    const deptName = DEPT_NAMES[deptCode] || deptCode;
    const [sidebarOpen, setSidebarOpen] = useState(false);

    const basePath = `/departments/${params.dept}`;
    const isActive = (href: string) => {
        if (href === "") return pathname === basePath;
        return pathname === `${basePath}${href}`;
    };

    return (
        <div className="min-h-screen bg-[#FAFAFA]">
            {/* Mobile Menu Button */}
            <motion.div
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                className="fixed top-20 left-4 z-50 lg:hidden"
            >
                <Button
                    variant="outline"
                    size="icon"
                    className="bg-white/80 backdrop-blur-xl shadow-lg border-white/50 rounded-xl hover:scale-105 transition-transform"
                    onClick={() => setSidebarOpen(!sidebarOpen)}
                >
                    {sidebarOpen ? <X className="h-5 w-5 text-slate-700" /> : <Menu className="h-5 w-5 text-slate-700" />}
                </Button>
            </motion.div>

            {/* Sidebar - Floating Glass Design */}
            <aside
                className={cn(
                    "fixed left-0 top-16 h-[calc(100vh-4rem)] w-72 z-40 transition-transform duration-300 ease-out",
                    sidebarOpen ? "translate-x-0" : "-translate-x-full lg:translate-x-0"
                )}
            >
                {/* Glass Container */}
                <div className="m-3 h-[calc(100%-1.5rem)] bg-white/70 backdrop-blur-2xl rounded-3xl shadow-2xl border border-white/50 overflow-hidden flex flex-col">

                    {/* International Standard Quick Navigation */}
                    <div className="px-4 pt-4 pb-2 space-y-2">
                        {/* Main Website Home */}
                        <Link
                            href="/"
                            className="group flex items-center gap-2 w-full py-2.5 px-4 bg-gradient-to-r from-slate-800 to-slate-900 hover:from-slate-700 hover:to-slate-800 text-white text-sm font-medium rounded-xl shadow-md hover:shadow-lg transition-all duration-200"
                        >
                            <Home className="w-4 h-4" />
                            <span>🏠 Main Home</span>
                            <ChevronRight className="w-3 h-3 ml-auto opacity-60 group-hover:opacity-100 group-hover:translate-x-0.5 transition-all" />
                        </Link>

                        {/* Department Home */}
                        <Link
                            href={basePath}
                            className="group flex items-center gap-2 w-full py-2.5 px-4 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-500 hover:to-indigo-500 text-white text-sm font-medium rounded-xl shadow-md hover:shadow-lg transition-all duration-200"
                        >
                            <Sparkles className="w-4 h-4" />
                            <span>📚 {deptCode} Home</span>
                            <ChevronRight className="w-3 h-3 ml-auto opacity-60 group-hover:opacity-100 group-hover:translate-x-0.5 transition-all" />
                        </Link>
                    </div>

                    {/* Department Header */}
                    <div className="p-5 border-b border-t border-slate-200/50">
                        <div className="flex items-center gap-3">
                            <div className="w-12 h-12 rounded-2xl bg-gradient-to-br from-[#1E4080] via-[#2563EB] to-[#7C3AED] flex items-center justify-center shadow-lg shadow-blue-500/30">
                                <Sparkles className="w-6 h-6 text-white" />
                            </div>
                            <div>
                                <h2 className="text-lg font-bold text-slate-900 tracking-tight">{deptCode}</h2>
                                <p className="text-xs text-slate-500 font-medium">{deptName}</p>
                            </div>
                        </div>
                    </div>

                    {/* Navigation */}
                    <nav className="flex-1 overflow-y-auto p-3 scrollbar-thin scrollbar-thumb-slate-300/50 scrollbar-track-transparent">
                        <ul className="space-y-1">
                            {NAVIGATION_ITEMS.map((item, index) => {
                                const Icon = item.icon;
                                const href = `${basePath}${item.href}`;
                                const active = isActive(item.href);

                                return (
                                    <motion.li
                                        key={item.href}
                                        initial={{ opacity: 0, x: -20 }}
                                        animate={{ opacity: 1, x: 0 }}
                                        transition={{ delay: index * 0.03 }}
                                    >
                                        <Link
                                            href={href}
                                            onClick={() => setSidebarOpen(false)}
                                            className={cn(
                                                "flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium transition-all duration-200 group relative overflow-hidden",
                                                active
                                                    ? "bg-gradient-to-r from-[#1E4080] to-[#2563EB] text-white shadow-lg shadow-blue-500/30"
                                                    : "text-slate-600 hover:bg-slate-100/80 hover:text-slate-900"
                                            )}
                                        >
                                            {/* Active Glow Effect */}
                                            {active && (
                                                <motion.div
                                                    layoutId="activeGlow"
                                                    className="absolute inset-0 bg-gradient-to-r from-[#1E4080] to-[#2563EB] rounded-xl -z-10"
                                                    transition={{ type: "spring", bounce: 0.25, duration: 0.5 }}
                                                />
                                            )}

                                            <div className={cn(
                                                "w-8 h-8 rounded-lg flex items-center justify-center transition-colors",
                                                active
                                                    ? "bg-white/20"
                                                    : "bg-slate-200/50 group-hover:bg-slate-200"
                                            )}>
                                                <Icon className={cn("w-4 h-4", active ? "text-white" : "text-slate-500 group-hover:text-slate-700")} />
                                            </div>

                                            <span className="flex-1 truncate">{item.label}</span>

                                            {active && (
                                                <motion.div
                                                    initial={{ scale: 0 }}
                                                    animate={{ scale: 1 }}
                                                    className="w-2 h-2 rounded-full bg-white shadow-lg shadow-white/50"
                                                />
                                            )}
                                        </Link>
                                    </motion.li>
                                );
                            })}
                        </ul>

                        {/* Verified Registry Badge - Shown when on Faculty Page */}
                        {pathname.endsWith('/faculty') && (
                            <motion.div
                                initial={{ opacity: 0, scale: 0.9 }}
                                animate={{ opacity: 1, scale: 1 }}
                                className="mt-6 p-4 rounded-2xl bg-gradient-to-br from-emerald-50 to-green-50 border border-emerald-100 shadow-sm"
                            >
                                <div className="flex items-center gap-2 mb-2">
                                    <div className="p-1 rounded bg-emerald-500">
                                        <ShieldCheck className="w-3.5 h-3.5 text-white" />
                                    </div>
                                    <span className="text-[10px] font-black text-emerald-800 uppercase tracking-tighter">Verified Registry</span>
                                </div>
                                <p className="text-[11px] font-bold text-emerald-700 leading-tight">
                                    Official Faculty Registry for {deptCode} Department
                                </p>
                                <div className="mt-2 flex items-center gap-1.5 text-[9px] font-black text-emerald-600/70 border-t border-emerald-100/50 pt-2 uppercase">
                                    <CheckCircle2 className="w-3 h-3" />
                                    <span>Verified Data from Excel</span>
                                </div>
                            </motion.div>
                        )}
                    </nav>

                    {/* Footer Branding */}
                    <div className="p-4 border-t border-slate-200/50">
                        <div className="flex items-center gap-2 text-xs text-slate-400">
                            <div className="w-6 h-6 rounded-lg bg-gradient-to-br from-amber-400 to-orange-500 flex items-center justify-center">
                                <span className="text-white font-bold text-[10px]">NRI</span>
                            </div>
                            <span className="font-medium">NRIIT Campus Portal</span>
                        </div>
                    </div>
                </div>
            </aside>

            {/* Main Content */}
            <main className="lg:ml-72 min-h-screen">
                {children}
            </main>

            {/* Overlay for mobile */}
            <AnimatePresence>
                {sidebarOpen && (
                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="fixed inset-0 bg-slate-900/30 backdrop-blur-sm z-30 lg:hidden"
                        onClick={() => setSidebarOpen(false)}
                    />
                )}
            </AnimatePresence>
        </div>
    );
}
