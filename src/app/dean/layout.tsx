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
    GraduationCap,
    Building2,
    BarChart,
    Award,
    Settings,
    TrendingUp
} from "lucide-react";
import { NAV_ROUTES } from "@/lib/constants";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { toast } from "sonner";
import { NotificationCenter } from "@/components/common/NotificationCenter";

export default function DeanLayout({
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
            // Optional: Check if role is dean/admin
            if (parsedUser.role !== 'dean' && parsedUser.role !== 'admin') {
                // router.push('/login');
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

    const routes = NAV_ROUTES.dean || [
        { href: '/dean/dashboard', label: 'Dashboard', icon: 'LayoutDashboard' },
        { href: '/dean/faculty', label: 'Faculty', icon: 'Users' },
        { href: '/dean/students', label: 'Students', icon: 'GraduationCap' },
        { href: '/dean/reports', label: 'Reports', icon: 'BarChart' },
    ];

    return (
        <div className="flex h-screen bg-slate-950">
            {/* Sidebar - Desktop */}
            <aside className="w-64 bg-slate-900 border-r border-slate-800 hidden md:flex flex-col">
                <div className="p-6 border-b border-slate-800 flex items-center gap-3">
                    <div className="w-8 h-8 bg-indigo-600 rounded-lg flex items-center justify-center">
                        <Building2 className="w-5 h-5 text-white" />
                    </div>
                    <span className="font-bold text-white text-lg tracking-tight">Dean Portal</span>
                </div>

                <div className="p-4">
                    <div className="flex items-center gap-3 p-3 rounded-xl bg-slate-800/50 border border-slate-700/50 mb-6">
                        <div className="w-10 h-10 rounded-full bg-gradient-to-br from-indigo-500 to-purple-600 flex items-center justify-center text-white font-bold text-sm">
                            {user.initials || "AD"}
                        </div>
                        <div className="flex-1 min-w-0">
                            <p className="text-sm font-medium text-white truncate">
                                {(user.role === 'dean' || user.role === 'admin') ? (user.name || "Administrator") : "Administrator (Preview)"}
                            </p>
                            <p className="text-xs text-slate-400 truncate">Dean's Office</p>
                        </div>
                    </div>

                    <nav className="space-y-1">
                        {routes.map((route) => {
                            // Robust Icon Mapping
                            let Icon = LayoutDashboard;
                            if (route.icon === 'Users') Icon = Users;
                            if (route.icon === 'GraduationCap') Icon = GraduationCap;
                            if (route.icon === 'BarChart') Icon = BarChart;
                            if (route.icon === 'FileText') Icon = FileText;
                            if (route.icon === 'BookOpen') Icon = BookOpen;
                            if (route.icon === 'Award') Icon = Award;
                            if (route.icon === 'Settings') Icon = Settings;
                            if (route.icon === 'UserCheck') Icon = UserCheck;
                            if (route.icon === 'TrendingUp') Icon = TrendingUp;

                            return (
                                <Link
                                    key={route.href}
                                    href={route.href}
                                    className="flex items-center gap-3 px-3 py-2.5 text-slate-300 rounded-lg hover:bg-white/5 hover:text-white transition-colors group"
                                >
                                    <Icon className="w-4 h-4 text-slate-400 group-hover:text-indigo-400 transition-colors" />
                                    <span className="text-sm font-medium">{route.label}</span>
                                </Link>
                            );
                        })}
                    </nav>
                </div>

                <div className="mt-auto p-4 border-t border-slate-800">
                    <button
                        onClick={handleLogout}
                        className="flex items-center gap-3 px-3 py-2.5 w-full text-slate-300 rounded-lg hover:bg-red-500/10 hover:text-red-400 transition-colors"
                    >
                        <LogOut className="w-4 h-4" />
                        <span className="text-sm font-medium">Logout</span>
                    </button>
                    <p className="text-xs text-center text-slate-500 mt-4">
                        v2.4.0 • NRIIT Campus
                    </p>
                </div>
            </aside>

            {/* Main Content */}
            <main className="flex-1 flex flex-col min-w-0 overflow-hidden">
                {/* Top Header */}
                <header className="h-16 bg-slate-900 border-b border-slate-800 flex items-center justify-between px-4 lg:px-8">
                    <h1 className="text-xl font-semibold text-white">Dean Dashboard</h1>

                    <div className="flex items-center gap-4">
                        <NotificationCenter role="dean" />
                        <div className="h-8 w-px bg-slate-800" />
                        <span className="text-sm text-slate-400 hidden sm:block">Spring 2024</span>
                    </div>
                </header>

                <div className="flex-1 overflow-auto p-4 lg:p-8 bg-black/20">
                    <div className="max-w-7xl mx-auto w-full">
                        {children}
                    </div>
                </div>
            </main>
        </div>
    );
}
