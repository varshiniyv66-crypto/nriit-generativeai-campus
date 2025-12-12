"use client";

import { useParams } from "next/navigation";
import Link from "next/link";
import {
    Home, Info, Target, FileText, Users, User, FlaskConical,
    BookOpen, Award, Calendar, GraduationCap, Briefcase,
    Heart, Image, Phone
} from "lucide-react";

const DEPARTMENTS: Record<string, {
    shortName: string;
    fullName: string;
}> = {
    'CSE': { shortName: 'CSE', fullName: 'Computer Science & Engineering' },
    'CSE-DS': { shortName: 'CSE-DS', fullName: 'CSE (Data Science)' },
    'CSE-AI': { shortName: 'CSE-AI', fullName: 'CSE (AI & ML)' },
    'IT': { shortName: 'IT', fullName: 'Information Technology' },
    'ECE': { shortName: 'ECE', fullName: 'Electronics & Communication' },
    'CIVIL': { shortName: 'CIVIL', fullName: 'Civil Engineering' },
    'MBA': { shortName: 'MBA', fullName: 'MBA' },
    'MCA': { shortName: 'MCA', fullName: 'MCA' },
    'BSH': { shortName: 'BSH', fullName: 'Basic Sciences & Humanities' },
};

const PAGE_SLUGS = [
    'home', 'about', 'vision-mission', 'peos-psos', 'hod', 'dean',
    'faculty', 'labs', 'research', 'achievements', 'events',
    'student-corner', 'crt', 'mentoring', 'gallery', 'contact'
];

const PAGE_TITLES: Record<string, string> = {
    'home': 'Home',
    'about': 'About Department',
    'vision-mission': 'Vision & Mission',
    'peos-psos': 'PEOs & PSOs',
    'hod': 'Head of Department',
    'dean': 'Dean',
    'faculty': 'Faculty',
    'labs': 'Laboratories',
    'research': 'Research',
    'achievements': 'Achievements',
    'events': 'Events',
    'student-corner': 'Student Corner',
    'crt': 'CRT & Placements',
    'mentoring': 'Mentoring',
    'gallery': 'Gallery',
    'contact': 'Contact Us',
};

const ICONS: Record<string, React.ComponentType<{ className?: string }>> = {
    'home': Home,
    'about': Info,
    'vision-mission': Target,
    'peos-psos': FileText,
    'hod': User,
    'dean': User,
    'faculty': Users,
    'labs': FlaskConical,
    'research': BookOpen,
    'achievements': Award,
    'events': Calendar,
    'student-corner': GraduationCap,
    'crt': Briefcase,
    'mentoring': Heart,
    'gallery': Image,
    'contact': Phone,
};

export default function DepartmentLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    const params = useParams();
    const deptParam = (params.dept as string || '').toUpperCase();
    const department = DEPARTMENTS[deptParam];

    if (!department) {
        return (
            <div className="min-h-screen bg-gray-50 flex items-center justify-center">
                <div className="text-center">
                    <h1 className="text-3xl font-bold text-gray-900 mb-4">Department Not Found</h1>
                    <Link href="/" className="text-blue-600 hover:underline">Return Home</Link>
                </div>
            </div>
        );
    }

    return (
        <div className={`min-h-screen bg-gray-50`}>
            {/* Department Header */}
            <header className="sticky top-0 z-40 w-full glass border-b border-white/20">
                <div className="container mx-auto px-4 h-16 flex items-center justify-between">
                    <div className="flex items-center gap-3">
                        <Link href="/" className="w-8 h-8 rounded-lg bg-gray-900 text-white flex items-center justify-center font-bold">
                            N
                        </Link>
                        <div className="h-6 w-px bg-gray-300 mx-2" />
                        <Link href={`/departments/${params.dept}`} className="font-bold text-lg text-gray-900 hover:text-blue-600 transition-colors">
                            {department.shortName}
                        </Link>
                    </div>

                    <nav className="hidden md:flex items-center gap-6 text-sm font-medium">
                        <Link href={`/departments/${params.dept}`} className="text-blue-600">
                            Department Home
                        </Link>
                        <Link href={`/departments/${params.dept}/faculty`} className="text-gray-600 hover:text-blue-600">
                            Faculty
                        </Link>
                        <Link href={`/departments/${params.dept}/labs`} className="text-gray-600 hover:text-blue-600">
                            Labs
                        </Link>
                        <Link href={`/departments/${params.dept}/contact`} className="text-gray-600 hover:text-blue-600">
                            Contact
                        </Link>
                    </nav>
                </div>
            </header>

            <div className="container mx-auto px-4 py-8">
                <div className="flex flex-col lg:flex-row gap-8">
                    {/* Sidebar Navigation */}
                    <aside className="w-full lg:w-64 flex-shrink-0">
                        <div className="sticky top-24 glass-card rounded-xl p-4 space-y-1">
                            <div className="px-4 py-2 mb-2">
                                <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wider">
                                    Menu
                                </h2>
                            </div>
                            {PAGE_SLUGS.map((slug) => {
                                const Icon = ICONS[slug];
                                const title = PAGE_TITLES[slug];
                                const href = slug === 'home'
                                    ? `/departments/${params.dept}`
                                    : `/departments/${params.dept}/${slug}`;

                                return (
                                    <Link
                                        key={slug}
                                        href={href}
                                        className="flex items-center gap-3 px-4 py-2.5 rounded-lg text-gray-700 hover:bg-blue-600 hover:text-white transition-all group"
                                    >
                                        <Icon className="w-4 h-4 text-gray-400 group-hover:text-white transition-colors" />
                                        <span className="font-medium">{title}</span>
                                    </Link>
                                );
                            })}
                        </div>
                    </aside>

                    {/* Main Content */}
                    <main className="flex-1 min-w-0">
                        {children}
                    </main>
                </div>
            </div>
        </div>
    );
}
