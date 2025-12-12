"use client";

import Link from "next/link";
import { ChevronRight, Users, Award, Building2 } from "lucide-react";

const departments = [
    { code: "CSE", name: "Computer Science & Engineering", icon: "💻", color: "from-blue-600 to-blue-800", students: 480, established: 2001 },
    { code: "CSE-DS", name: "CSE (Data Science)", icon: "📊", color: "from-purple-600 to-purple-800", students: 120, established: 2020 },
    { code: "CSE-AI", name: "CSE (AI & ML)", icon: "🤖", color: "from-pink-600 to-pink-800", students: 120, established: 2020 },
    { code: "IT", name: "Information Technology", icon: "🌐", color: "from-green-600 to-green-800", students: 240, established: 2001 },
    { code: "ECE", name: "Electronics & Communication", icon: "📡", color: "from-amber-600 to-amber-800", students: 360, established: 2001 },
    { code: "CIVIL", name: "Civil Engineering", icon: "🏗️", color: "from-red-600 to-red-800", students: 120, established: 2008 },
    { code: "MBA", name: "Master of Business Administration", icon: "📈", color: "from-cyan-600 to-cyan-800", students: 120, established: 2009 },
    { code: "MCA", name: "Master of Computer Applications", icon: "🎓", color: "from-violet-600 to-violet-800", students: 60, established: 2005 },
    { code: "BSH", name: "Basic Sciences & Humanities", icon: "📚", color: "from-slate-600 to-slate-800", students: 0, established: 2001 },
];

export default function DepartmentsListPage() {
    return (
        <div className="min-h-screen">
            {/* Hero Section */}
            <section className="relative py-20 md:py-28 overflow-hidden">
                <div className="absolute inset-0 gradient-bg opacity-90" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="relative container mx-auto px-4 text-center text-white">
                    <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-sm rounded-full text-sm font-semibold mb-6 border border-white/20">
                        Our Departments
                    </span>
                    <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                        9 Departments of <span className="text-yellow-300">Excellence</span>
                    </h1>
                    <p className="text-lg md:text-xl text-white/80 max-w-3xl mx-auto">
                        Explore our diverse range of undergraduate and postgraduate programs
                        designed to prepare you for a successful career.
                    </p>
                </div>
            </section>

            {/* Stats */}
            <section className="py-12 bg-white border-b border-gray-100">
                <div className="container mx-auto px-4">
                    <div className="flex flex-wrap justify-center gap-8 md:gap-16">
                        <div className="text-center">
                            <div className="text-3xl font-bold text-gray-900">9</div>
                            <div className="text-sm text-gray-600 flex items-center gap-1">
                                <Building2 className="w-4 h-4" /> Departments
                            </div>
                        </div>
                        <div className="text-center">
                            <div className="text-3xl font-bold text-gray-900">5000+</div>
                            <div className="text-sm text-gray-600 flex items-center gap-1">
                                <Users className="w-4 h-4" /> Students
                            </div>
                        </div>
                        <div className="text-center">
                            <div className="text-3xl font-bold text-gray-900">300+</div>
                            <div className="text-sm text-gray-600 flex items-center gap-1">
                                <Users className="w-4 h-4" /> Faculty
                            </div>
                        </div>
                        <div className="text-center">
                            <div className="text-3xl font-bold text-gray-900">6</div>
                            <div className="text-sm text-gray-600 flex items-center gap-1">
                                <Award className="w-4 h-4" /> NBA Accredited
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Departments Grid */}
            <section className="py-20 bg-gray-50">
                <div className="container mx-auto px-4">
                    <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
                        {departments.map((dept) => (
                            <Link
                                key={dept.code}
                                href={`/departments/${dept.code.toLowerCase()}`}
                                className="group relative overflow-hidden rounded-2xl bg-white shadow-lg hover:shadow-2xl transition-all duration-300"
                            >
                                <div className={`absolute inset-0 bg-gradient-to-br ${dept.color} opacity-0 group-hover:opacity-100 transition-opacity duration-300`} />
                                <div className="relative p-6 md:p-8">
                                    <div className="flex items-start justify-between mb-4">
                                        <span className="text-4xl">{dept.icon}</span>
                                        <ChevronRight className="w-5 h-5 text-gray-400 group-hover:text-white group-hover:translate-x-1 transition-all" />
                                    </div>
                                    <h3 className="text-xl font-bold text-gray-900 group-hover:text-white transition-colors mb-2">
                                        {dept.name}
                                    </h3>
                                    <p className="text-sm text-gray-500 group-hover:text-white/80 transition-colors mb-1">
                                        {dept.students > 0 ? `${dept.students}+ Students` : 'Foundation Department'}
                                    </p>
                                    <p className="text-xs text-gray-400 group-hover:text-white/70 transition-colors">
                                        Est. {dept.established}
                                    </p>
                                    <div className="mt-4 pt-4 border-t border-gray-100 group-hover:border-white/20 transition-colors">
                                        <span className="text-sm font-medium text-blue-600 group-hover:text-white transition-colors">
                                            Explore Department →
                                        </span>
                                    </div>
                                </div>
                            </Link>
                        ))}
                    </div>
                </div>
            </section>
        </div>
    );
}
