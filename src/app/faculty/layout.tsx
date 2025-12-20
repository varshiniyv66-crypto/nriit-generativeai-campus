"use client";

import Link from "next/link";
import {
    LayoutDashboard,
    UserCheck,
    FileText,
    BookOpen,
    Users,
    User,
    LogOut,
    Bell,
    GraduationCap
} from "lucide-react";
import { NAV_ROUTES } from "@/lib/constants";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { toast } from "sonner";
import { NotificationCenter } from "@/components/common/NotificationCenter";

export default function FacultyLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    const router = useRouter();
    const [user, setUser] = useState<any>(null);

    useEffect(() => {
        // Mock Session Check
        const storedUser = localStorage.getItem('nriit_user');
        if (!storedUser) {
            router.push('/login');
            return;
        }
        try {
            const parsedUser = JSON.parse(storedUser);
            // Optional: Check if role is faculty
            if (parsedUser.role !== 'faculty' && parsedUser.role !== 'admin') {
                // router.push('/login'); // strict check disabled for demo ease
            }
            setUser(parsedUser);
        } catch (e) {
            console.error("Invalid session");
            router.push('/login');
        }
    }, [router]);

    const handleLogout = () => {
        localStorage.removeItem('nriit_user');
        document.cookie = 'nriit_role=; Max-Age=0; path=/;';
        toast.success("Logged out successfully");
        router.push('/login');
    };

    if (!user) return <div className="min-h-screen bg-slate-950 flex items-center justify-center text-white">Loading...</div>;

    return (
        <div className="flex h-screen bg-[#0F172A] overflow-hidden relative font-sans selection:bg-purple-500 selection:text-white">
            {/* Aurora Background Effects */}
            <div className="absolute inset-0 pointer-events-none z-0">
                <div className="absolute top-[-20%] right-[-10%] w-[1000px] h-[1000px] bg-purple-500/10 rounded-full blur-[120px] animate-pulse-slow"></div>
                <div className="absolute bottom-[-20%] left-[-10%] w-[1000px] h-[1000px] bg-blue-500/10 rounded-full blur-[120px] animate-float-slow"></div>
            </div>

            {/* Sidebar - Desktop (Dark Glass) */}
            <aside className="w-64 bg-[#0F172A]/80 backdrop-blur-xl border-r border-white/10 hidden md:flex flex-col relative z-20">
                <div className="p-6 border-b border-white/10 flex items-center gap-3">
                    <div className="relative w-10 h-10 rounded-xl bg-gradient-to-br from-purple-600 to-blue-600 flex items-center justify-center text-white font-bold text-lg shadow-lg shadow-purple-500/20 group">
                        <GraduationCap className="w-6 h-6" />
                        <div className="absolute inset-0 bg-white/20 rounded-xl animate-pulse-slow"></div>
                    </div>
                    <div>
                        <span className="font-bold text-white text-lg tracking-tight block">Faculty Portal</span>
                        <span className="text-[10px] text-purple-400 uppercase tracking-widest font-semibold flex items-center gap-1">
                            Academic Suite
                        </span>
                    </div>
                </div>

                <div className="p-4">
                    <div className="flex items-center gap-3 p-3 rounded-xl bg-white/5 border border-white/10 mb-6 group hover:bg-white/10 transition-colors shadow-sm">
                        <div className="w-10 h-10 rounded-full bg-gradient-to-r from-purple-500 to-pink-500 flex items-center justify-center text-white font-bold text-sm shadow-md ring-2 ring-white/10 group-hover:ring-white/30 transition-all">
                            {user.first_name ? user.first_name[0] : "FS"}
                        </div>
                        <div className="flex-1 min-w-0">
                            <p className="text-sm font-bold text-white truncate">
                                {user.role === 'faculty' ? (user.name || "Faculty Name") : "Faculty Member (Preview)"}
                            </p>
                            <p className="text-xs text-slate-400 truncate font-medium">
                                {user.role === 'faculty' ? (user.employee_id || "Employee ID") : "Verified Faculty"}
                            </p>
                        </div>
                    </div>

                    <nav className="space-y-1">
                        {NAV_ROUTES.faculty.map((route) => {
                            const Icon = route.icon === 'LayoutDashboard' ? LayoutDashboard
                                : route.icon === 'UserCheck' ? UserCheck
                                    : route.icon === 'FileText' ? FileText
                                        : route.icon === 'GraduationCap' ? GraduationCap
                                            : route.icon === 'BookOpen' ? BookOpen
                                                : route.icon === 'Users' ? Users
                                                    : User;

                            return (
                                <Link
                                    key={route.href}
                                    href={route.href}
                                    className="flex items-center gap-3 px-3 py-2.5 text-slate-400 rounded-lg hover:bg-white/5 hover:text-white transition-all group relative overflow-hidden"
                                >
                                    <div className="absolute inset-0 bg-gradient-to-r from-purple-500/10 to-transparent translate-x-[-101%] group-hover:translate-x-0 transition-transform duration-300 rounded-lg" />
                                    <Icon className="w-4 h-4 text-slate-500 group-hover:text-purple-400 transition-colors relative z-10" />
                                    <span className="text-sm font-medium relative z-10">{route.label}</span>
                                </Link>
                            );
                        })}
                    </nav>
                </div>

                <div className="mt-auto p-4 border-t border-white/10">
                    <button
                        onClick={handleLogout}
                        className="flex items-center gap-3 px-3 py-2.5 w-full text-slate-400 rounded-lg hover:bg-red-500/10 hover:text-red-400 transition-colors"
                    >
                        <LogOut className="w-4 h-4" />
                        <span className="text-sm font-medium">Logout</span>
                    </button>
                    <p className="text-[10px] text-center text-slate-600 mt-4 uppercase tracking-widest">
                        NRIIT Flagship v4.0
                    </p>
                </div>
            </aside>

            {/* Main Content */}
            <main className="flex-1 flex flex-col min-w-0 overflow-hidden relative z-10">
                {/* Top Header */}
                <header className="h-20 bg-[#0F172A]/80 backdrop-blur-xl border-b border-white/10 flex items-center justify-between px-4 lg:px-8 sticky top-0 z-30">
                    <div>
                        <h1 className="text-2xl font-bold text-white animate-shimmer drop-shadow-sm">
                            Faculty Dashboard
                        </h1>
                        <p className="text-xs text-slate-400 font-medium tracking-wide">ACADEMIC STAFF PORTAL</p>
                    </div>

                    <div className="flex items-center gap-4">
                        <NotificationCenter role="faculty" />
                        <div className="h-8 w-px bg-white/10" />
                        <div className="hidden sm:flex flex-col items-end">
                            <span className="text-xs text-slate-400 uppercase tracking-wider">Current Term</span>
                            <span className="text-sm font-bold text-purple-400">Spring 2025</span>
                        </div>
                    </div>
                </header>

                <div className="flex-1 overflow-auto p-4 lg:p-8 scrollbar-hide">
                    {/* Content Container with slight fade in */}
                    <div className="max-w-7xl mx-auto w-full animate-fade-in-up">
                        {children}
                    </div>
                </div>
            </main>
        </div>
    );
}
