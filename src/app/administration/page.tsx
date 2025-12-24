"use client";

import { User, Quote, Mail, Award, Building, BookOpen, ShieldCheck, Crown, Briefcase, GraduationCap } from "lucide-react";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { departments } from "@/data/departments";

interface AdminProfile {
    name: string;
    role: string;
    message: string;
    icon: any;
    quoteHeader: string;
    color: string;
    photo?: string;
}

export default function AdministrationPage() {
    // 1. Principal (The Topmost)
    const principal: AdminProfile = {
        name: "Dr. Dola Sanjay S",
        role: "Principal",
        message: "Welcome to NRIIT. We are committed to fostering a vibrant learning community where students are empowered to explore, innovate, and lead. Our focus is on holistic development and academic rigour to prepare students for global challenges.",
        icon: Crown,
        quoteHeader: "Principal's Message",
        color: "#EF4444" // Red
    };

    // 2. Director (Academics) - Standalone Level
    const directorAcademics: AdminProfile = {
        name: "Dr. Kota Srinivas",
        role: "Director (Academics)",
        message: "Academic excellence is the cornerstone of NRIIT. We strive to provide a curriculum that is not only rigorous but also relevant to industry needs. Our focus is on outcome-based education that fosters critical thinking and innovation.",
        icon: BookOpen,
        quoteHeader: "Excellence in Education",
        color: "#D4AF37" // Gold
    };

    // 3. ED & AO (Equal Level)
    const adminManagement: AdminProfile[] = [
        {
            name: "Mr. P. Tilak Babu",
            role: "Executive Director",
            message: "Our goal is to create an environment where every student has access to the best resources to achieve their dreams. We are constantly upgrading our laboratories, libraries, and campus facilities to meet international standards.",
            icon: Briefcase,
            quoteHeader: "Building a Foundation",
            color: "#1E3A8A" // Dark Blue
        },
        {
            name: "Sri Seetharamaiah",
            role: "Administrative Officer",
            message: "Discipline and smooth operations are vital for any institution. We ensure that the campus environment is safe, organized, and conducive to learning. We are here to support students and faculty in all administrative needs.",
            icon: ShieldCheck,
            quoteHeader: "Commitment to Service",
            color: "#059669" // Emerald Green
        }
    ];

    // 4. Dean (Standalone Level)
    const dean: AdminProfile = {
        name: "Dr. Y.V. Raghava Rao",
        role: "Dean (Academics)",
        message: "We are not just teaching technology; we are shaping the architects of the digital future. Innovation, Integrity, and Impact are the pillars of our education.",
        icon: GraduationCap,
        quoteHeader: "Fostering Innovation",
        color: "#0891B2", // Cyan
    };

    // 5. HODs (Dynamically fetched)
    const hods = Object.values(departments).filter(d => d.hod).map(d => ({
        name: d.hod!.name,
        role: d.hod!.designation,
        dept: d.name,
        code: d.code,
        photo: d.hod!.photo,
        message: d.hod!.message,
        color: "#64748B" // Slate
    }));

    return (
        <div className="bg-slate-50 min-h-screen pt-28 pb-16">
            <div className="container mx-auto px-4 max-w-6xl space-y-16 animate-in fade-in duration-500">

                {/* Page Header */}
                <div className="text-center space-y-4">
                    <Badge className="bg-blue-100 text-blue-700 hover:bg-blue-200 text-sm px-4 py-1">Governance</Badge>
                    <h1 className="text-4xl md:text-5xl font-extrabold text-slate-900 tracking-tight">Institutional Leadership</h1>
                    <p className="text-lg text-slate-600 max-w-2xl mx-auto">The visionaries guiding NRI Institute of Technology towards excellence.</p>
                </div>

                {/* 1. PRINCIPAL SECTON (Full Width) */}
                <div className="space-y-6">
                    <h2 className="text-2xl font-bold text-slate-900 border-l-4 border-red-500 pl-4">Principal</h2>
                    <Card className="border-t-4 border-t-red-500 shadow-xl bg-white overflow-hidden">
                        <div className="flex flex-col md:flex-row">
                            <div className="md:w-80 bg-slate-50 border-r border-slate-100 flex flex-col shrink-0">
                                <div className="aspect-[3/4] relative overflow-hidden group">
                                    <img
                                        src={`https://ui-avatars.com/api/?name=${encodeURIComponent(principal.name)}&background=${principal.color.replace('#', '')}&color=fff&size=512`}
                                        alt={principal.name}
                                        className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                                    />
                                    <div className="absolute top-0 right-0 bg-red-500 text-white text-xs font-bold px-3 py-1 rounded-bl-lg">HEAD OF INSTITUTION</div>
                                </div>
                                <div className="p-6 text-center md:text-left">
                                    <h3 className="text-2xl font-bold text-slate-900 leading-tight">{principal.name}</h3>
                                    <p className="text-md font-bold text-red-600 mt-1">{principal.role}</p>
                                    <Button className="w-full mt-6 bg-red-600 hover:bg-red-700 text-white">Contact Principal</Button>
                                </div>
                            </div>
                            <div className="flex-1 p-8 md:p-12 flex flex-col justify-center bg-white">
                                <div className="max-w-3xl">
                                    <Crown className="w-12 h-12 text-red-100 mb-6" />
                                    <h2 className="text-3xl font-bold text-slate-900 mb-6">{principal.quoteHeader}</h2>
                                    <p className="italic text-xl text-slate-700 font-medium border-l-4 border-red-200 pl-6 py-2 leading-relaxed">
                                        "{principal.message}"
                                    </p>
                                </div>
                            </div>
                        </div>
                    </Card>
                </div>

                {/* 2. DIRECTOR ACADEMICS */}
                <div className="space-y-6">
                    <h2 className="text-2xl font-bold text-slate-900 border-l-4 border-[#D4AF37] pl-4">Director (Academics)</h2>
                    <Card className="border-t-4 border-t-[#D4AF37] shadow-lg bg-white overflow-hidden">
                        <div className="flex flex-col md:flex-row">
                            <div className="md:w-64 bg-slate-50 border-r border-slate-100 flex flex-col shrink-0">
                                <div className="aspect-[3/4] relative overflow-hidden group">
                                    <img
                                        src={`https://ui-avatars.com/api/?name=${encodeURIComponent(directorAcademics.name)}&background=${directorAcademics.color.replace('#', '')}&color=fff&size=512`}
                                        alt={directorAcademics.name}
                                        className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                                    />
                                </div>
                                <div className="p-5 text-center md:text-left">
                                    <h3 className="text-lg font-bold text-slate-900 leading-tight">{directorAcademics.name}</h3>
                                    <p className="text-sm font-bold mt-1" style={{ color: directorAcademics.color }}>{directorAcademics.role}</p>
                                </div>
                            </div>
                            <div className="flex-1 p-8 flex flex-col justify-center bg-white">
                                <div className="max-w-3xl">
                                    <BookOpen className="w-10 h-10 opacity-20 mb-4" style={{ color: directorAcademics.color }} />
                                    <h2 className="text-2xl font-bold text-slate-900 mb-4">{directorAcademics.quoteHeader}</h2>
                                    <p className="italic text-lg text-slate-700 font-medium border-l-4 pl-4 bg-slate-50 py-3 rounded-r-lg" style={{ borderLeftColor: directorAcademics.color }}>
                                        "{directorAcademics.message}"
                                    </p>
                                </div>
                            </div>
                        </div>
                    </Card>
                </div>

                {/* 3. ED & AO (EQUAL LEVEL) */}
                <div className="space-y-6">
                    <h2 className="text-2xl font-bold text-slate-900 border-l-4 border-blue-800 pl-4">Administration Management</h2>
                    <div className="grid md:grid-cols-2 gap-8">
                        {adminManagement.map((profile, index) => (
                            <Card key={index} className="overflow-hidden hover:shadow-xl transition-all duration-300 border-t-4 bg-white" style={{ borderTopColor: profile.color }}>
                                <div className="flex flex-col sm:flex-row h-full">
                                    <div className="sm:w-48 shrink-0 bg-slate-50 relative">
                                        <div className="aspect-[3/4]">
                                            <img
                                                src={profile.photo || `https://ui-avatars.com/api/?name=${encodeURIComponent(profile.name)}&background=${profile.color.replace('#', '')}&color=fff&size=512`}
                                                alt={profile.name}
                                                className="w-full h-full object-cover"
                                            />
                                        </div>
                                    </div>
                                    <div className="p-5 flex flex-col justify-center flex-1">
                                        <h3 className="text-lg font-bold text-slate-900">{profile.name}</h3>
                                        <p className="text-xs font-bold uppercase tracking-wide mb-3" style={{ color: profile.color }}>{profile.role}</p>
                                        <p className="text-slate-600 italic text-sm line-clamp-4">"{profile.message}"</p>
                                    </div>
                                </div>
                            </Card>
                        ))}
                    </div>
                </div>

                {/* 4. DEAN (ACADEMICS) */}
                <div className="space-y-6">
                    <h2 className="text-2xl font-bold text-slate-900 border-l-4 border-cyan-600 pl-4">Deans</h2>
                    <Card className="border-t-4 border-cyan-600 shadow-md bg-white overflow-hidden">
                        <div className="flex flex-col md:flex-row">
                            <div className="md:w-56 bg-slate-50 border-r border-slate-100 flex flex-col shrink-0">
                                <div className="aspect-[3/4] relative overflow-hidden group">
                                    <img
                                        src={dean.photo || `https://ui-avatars.com/api/?name=${encodeURIComponent(dean.name)}&background=${dean.color.replace('#', '')}&color=fff&size=512`}
                                        alt={dean.name}
                                        className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                                    />
                                </div>
                                <div className="p-4 text-center md:text-left">
                                    <h3 className="text-lg font-bold text-slate-900 leading-tight">{dean.name}</h3>
                                    <p className="text-sm font-bold text-cyan-600 mt-1">{dean.role}</p>
                                </div>
                            </div>
                            <div className="flex-1 p-6 md:p-8 flex flex-col justify-center bg-white">
                                <GraduationCap className="w-8 h-8 opacity-20 mb-3 text-cyan-600" />
                                <h2 className="text-xl font-bold text-slate-900 mb-3">{dean.quoteHeader}</h2>
                                <p className="italic text-base text-slate-700 font-medium leading-relaxed">
                                    "{dean.message}"
                                </p>
                            </div>
                        </div>
                    </Card>
                </div>

                {/* 5. HODs GRID */}
                <div className="space-y-6 pt-8 border-t border-slate-200">
                    <div className="flex items-center justify-between">
                        <h2 className="text-2xl font-bold text-slate-900 border-l-4 border-slate-800 pl-4">Heads of Departments</h2>
                        <Badge variant="outline" className="text-slate-500">{hods.length} Departments</Badge>
                    </div>
                    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                        {hods.map((hod, index) => (
                            <Card key={index} className="hover:shadow-lg transition-all group border-none shadow-sm ring-1 ring-slate-200 hover:ring-2 hover:ring-[#D4AF37]">
                                <div className="p-4 flex flex-col items-center text-center space-y-3">
                                    <div className="w-20 h-20 rounded-full overflow-hidden shrink-0 border-2 border-slate-100 group-hover:border-[#D4AF37] transition-colors shadow-sm">
                                        <img
                                            src={hod.photo || `https://ui-avatars.com/api/?name=${encodeURIComponent(hod.name)}&background=random&color=fff&size=256`}
                                            alt={hod.name}
                                            className="w-full h-full object-cover"
                                        />
                                    </div>
                                    <div>
                                        <h4 className="font-bold text-slate-900 text-sm group-hover:text-[#1E3A8A] transition-colors line-clamp-1">{hod.name}</h4>
                                        <p className="text-[11px] font-semibold text-slate-500 mt-1 uppercase tracking-wider">{hod.role}</p>
                                        <Badge variant="secondary" className="mt-2 text-[10px] bg-slate-100 text-slate-600">{hod.dept}</Badge>
                                    </div>
                                </div>
                            </Card>
                        ))}
                    </div>
                </div>

            </div>
        </div>
    );
}
