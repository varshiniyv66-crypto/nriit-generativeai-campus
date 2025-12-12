import Link from "next/link";
import {
    LayoutDashboard,
    Building2,
    Users,
    GraduationCap,
    UserCheck,
    FileText,
    CreditCard,
    Heart,
    Briefcase,
    Award,
    Newspaper,
    Upload,
    Settings,
    LogOut,
    Bell
} from "lucide-react";
import { NAV_ROUTES } from "@/lib/constants";

export default function AdminLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    return (
        <div className="min-h-screen bg-gray-50 flex">
            {/* Sidebar - Desktop */}
            <aside className="hidden md:flex flex-col w-64 bg-gray-900 border-r border-gray-800 fixed inset-y-0 z-30 text-gray-300">
                <div className="h-16 flex items-center px-6 border-b border-gray-800">
                    <Link href="/" className="flex items-center gap-2">
                        <div className="w-8 h-8 rounded-lg bg-blue-600 text-white flex items-center justify-center font-bold">
                            N
                        </div>
                        <div className="flex flex-col">
                            <span className="font-bold text-white leading-none">Admin</span>
                            <span className="text-[10px] text-gray-500 uppercase tracking-wider mt-0.5">Control Panel</span>
                        </div>
                    </Link>
                </div>

                <div className="flex-1 overflow-y-auto py-4 scrollbar-thin scrollbar-thumb-gray-700">
                    <nav className="space-y-1 px-3">
                        <div className="px-3 mb-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">
                            Management
                        </div>
                        {NAV_ROUTES.admin.map((route) => {
                            const Icon = route.icon === 'LayoutDashboard' ? LayoutDashboard
                                : route.icon === 'Building2' ? Building2
                                    : route.icon === 'Users' ? Users
                                        : route.icon === 'GraduationCap' ? GraduationCap
                                            : route.icon === 'UserCheck' ? UserCheck
                                                : route.icon === 'FileText' ? FileText
                                                    : route.icon === 'CreditCard' ? CreditCard
                                                        : route.icon === 'Heart' ? Heart
                                                            : route.icon === 'Briefcase' ? Briefcase
                                                                : route.icon === 'Award' ? Award
                                                                    : route.icon === 'Newspaper' ? Newspaper
                                                                        : route.icon === 'Upload' ? Upload
                                                                            : Settings;

                            return (
                                <Link
                                    key={route.href}
                                    href={route.href}
                                    className="flex items-center gap-3 px-3 py-2.5 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition-colors group"
                                >
                                    <Icon className="w-5 h-5 text-gray-400 group-hover:text-blue-400 transition-colors" />
                                    <span className="font-medium">{route.label}</span>
                                </Link>
                            );
                        })}
                    </nav>
                </div>

                <div className="p-4 border-t border-gray-800 bg-gray-900">
                    <div className="flex items-center gap-3 mb-4 px-2">
                        <div className="w-10 h-10 rounded-full bg-blue-900/50 flex items-center justify-center text-blue-400 font-bold border border-blue-800">
                            AD
                        </div>
                        <div className="min-w-0">
                            <div className="text-sm font-medium text-white truncate">Administrator</div>
                            <div className="text-xs text-gray-500 truncate">Super Admin</div>
                        </div>
                    </div>
                    <button className="w-full flex items-center gap-2 px-3 py-2 rounded-lg text-red-400 hover:bg-red-900/20 text-sm font-medium transition-colors">
                        <LogOut className="w-4 h-4" />
                        Sign Out
                    </button>
                </div>
            </aside>

            {/* Main Content */}
            <div className="flex-1 md:ml-64 flex flex-col min-h-screen">
                {/* Mobile Header */}
                <header className="bg-white border-b border-gray-200 sticky top-0 z-20 md:hidden">
                    <div className="flex items-center justify-between px-4 h-16">
                        <Link href="/" className="font-bold text-gray-900">Admin Panel</Link>
                        <button className="p-2 text-gray-600">
                            <span className="sr-only">Menu</span>
                            <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
                        </button>
                    </div>
                </header>

                {/* Top Bar (Desktop) */}
                <header className="hidden md:flex items-center justify-between h-16 bg-white border-b border-gray-200 px-8 sticky top-0 z-20">
                    <h2 className="font-semibold text-gray-700">NRI Institute of Technology - Digital Platform</h2>
                    <div className="flex items-center gap-4">
                        <div className="flex items-center gap-2 px-3 py-1.5 bg-green-50 text-green-700 rounded-full text-xs font-medium border border-green-100">
                            <span className="relative flex h-2 w-2">
                                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-400 opacity-75"></span>
                                <span className="relative inline-flex rounded-full h-2 w-2 bg-green-500"></span>
                            </span>
                            System Operational
                        </div>
                        <button className="p-2 text-gray-400 hover:text-gray-600 relative">
                            <Bell className="w-5 h-5" />
                            <span className="absolute top-1.5 right-1.5 w-2 h-2 bg-red-500 rounded-full border border-white"></span>
                        </button>
                    </div>
                </header>

                <main className="p-4 md:p-8 flex-1">
                    {children}
                </main>
            </div>
        </div>
    );
}
