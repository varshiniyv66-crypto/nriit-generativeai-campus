"use client";

import { Dialog, DialogContent, DialogTrigger } from "@/components/ui/dialog";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { ScrollArea } from "@/components/ui/scroll-area";
import { motion, AnimatePresence } from "framer-motion";
import {
    FileText,
    GraduationCap,
    Briefcase,
    Award,
    ExternalLink,
    Mail,
    Globe,
    BookOpen,
    Sparkles,
    CheckCircle2,
    Building2
} from "lucide-react";
import { useState } from "react";

interface FacultyProfileModalProps {
    faculty: {
        id: string;
        name: string;
        designation: string;
        qualification: string;
        photo: string;
        resumeUrl?: string; // Optional Google Drive Link
        experience?: string; // e.g. "14+ Years"
        nature?: string; // Regular/Adjunct
        pan?: string;
    };
    researchData?: any; // Optional research stats/pubs
}

export function FacultyProfileModal({ faculty, researchData }: FacultyProfileModalProps) {
    const [isOpen, setIsOpen] = useState(false);

    // Parse experience to number for visual timeline
    const expYears = parseInt(faculty.experience?.replace(/[^0-9]/g, '') || "0");
    const isDoctorate = faculty.qualification.toLowerCase().includes("ph.d") || faculty.name.toLowerCase().includes("dr.");

    return (
        <Dialog open={isOpen} onOpenChange={setIsOpen}>
            <DialogTrigger asChild>
                <button
                    className="group/btn relative px-6 py-2.5 rounded-xl bg-white/5 hover:bg-orange-500 overflow-hidden transition-all duration-300 border border-white/10 hover:border-orange-400 shadow-xl"
                >
                    <div className="absolute inset-0 bg-gradient-to-r from-transparent via-white/20 to-transparent translate-x-[-100%] group-hover/btn:translate-x-[100%] transition-transform duration-700" />
                    <span className="relative flex items-center gap-2 text-sm font-bold text-slate-300 group-hover/btn:text-white uppercase tracking-wider">
                        <FileText className="w-4 h-4" />
                        <span className="hidden sm:inline">View</span> Profile
                    </span>
                </button>
            </DialogTrigger>

            <DialogContent className="max-w-4xl p-0 overflow-hidden bg-slate-950 border-slate-800 text-slate-100 rounded-3xl shadow-2xl shadow-orange-500/10">
                <div className="grid grid-cols-1 lg:grid-cols-12 h-full max-h-[90vh] lg:h-[600px]">

                    {/* LEFT SIDE: Visual Identity */}
                    <div className="lg:col-span-4 relative bg-slate-900 section-pattern overflow-hidden p-8 flex flex-col items-center text-center border-r border-white/5">
                        {/* Background Effects */}
                        <div className="absolute top-0 left-0 w-full h-full bg-gradient-to-b from-orange-500/10 to-transparent opacity-50" />
                        <div className="absolute -top-24 -left-24 w-48 h-48 bg-orange-500/20 rounded-full blur-[50px]" />

                        <div className="relative z-10 w-full flex flex-col items-center gap-6">
                            {/* Photo with Premium Ring */}
                            <div className="relative w-40 h-40">
                                <div className="absolute inset-0 rounded-full bg-gradient-to-r from-amber-300 via-orange-500 to-amber-300 animate-spin-slow opacity-75 blur-sm" />
                                <div className="relative w-full h-full rounded-full border-4 border-slate-900 bg-slate-800 overflow-hidden">
                                    {faculty.photo && !faculty.photo.includes('ui-avatars.com') ? (
                                        <img
                                            src={faculty.photo}
                                            alt={faculty.name}
                                            referrerPolicy="no-referrer"
                                            className="w-full h-full object-cover"
                                            onError={(e) => {
                                                const target = e.target as HTMLImageElement;
                                                target.src = `https://ui-avatars.com/api/?name=${encodeURIComponent(faculty.name)}&background=random&color=fff&size=128`;
                                            }}
                                        />
                                    ) : (
                                        <div className="w-full h-full flex items-center justify-center bg-gradient-to-br from-slate-800 to-slate-900 text-3xl font-bold text-slate-500">
                                            {faculty.name.substring(0, 2).toUpperCase()}
                                        </div>
                                    )}
                                </div>
                                {isDoctorate && (
                                    <div className="absolute bottom-0 right-0 bg-gradient-to-r from-amber-400 to-orange-600 text-white p-2 rounded-full border-4 border-slate-900 shadow-lg" title="Ph.D Scholar">
                                        <Award className="w-5 h-5" />
                                    </div>
                                )}
                            </div>

                            {/* Name & Title */}
                            <div className="space-y-2">
                                <h2 className="text-2xl font-black tracking-tight text-white bg-clip-text text-transparent bg-gradient-to-b from-white to-slate-400">
                                    {faculty.name}
                                </h2>
                                <div className="flex flex-col gap-1 items-center">
                                    <Badge variant="outline" className="border-orange-500/30 text-orange-400 bg-orange-500/5 uppercase tracking-wider text-[10px]">
                                        {faculty.designation}
                                    </Badge>
                                    <span className="text-xs text-slate-400 font-medium flex items-center gap-1">
                                        {faculty.qualification}
                                    </span>
                                </div>
                            </div>

                            {/* Contact / Actions */}
                            <div className="w-full space-y-3 mt-auto">
                                {faculty.resumeUrl && (
                                    <Button asChild className="w-full bg-gradient-to-r from-orange-600 to-amber-600 hover:from-orange-500 hover:to-amber-500 text-white font-bold border-0 shadow-lg shadow-orange-900/20">
                                        <a href={faculty.resumeUrl} target="_blank" rel="noopener noreferrer" className="flex items-center gap-2">
                                            <FileText className="w-4 h-4" /> View Full Details
                                        </a>
                                    </Button>
                                )}
                            </div>
                        </div>
                    </div>

                    {/* RIGHT SIDE: Detailed Content */}
                    <div className="lg:col-span-8 bg-slate-950 flex flex-col h-full overflow-hidden">
                        <ScrollArea className="flex-1 p-8">
                            <div className="space-y-8">

                                {/* 1. EXPERIENCE TIMELINE */}
                                <section>
                                    <h3 className="flex items-center gap-2 text-sm font-black text-slate-500 uppercase tracking-widest mb-6">
                                        <Briefcase className="w-4 h-4 text-orange-500" /> Professional Trajectory
                                    </h3>

                                    <div className="relative pl-4 border-l-2 border-slate-800 space-y-8">
                                        <div className="relative">
                                            <div className="absolute -left-[21px] top-1 w-3 h-3 rounded-full bg-orange-500 shadow-[0_0_10px_rgba(249,115,22,0.5)]" />
                                            <div className="bg-slate-900/50 p-4 rounded-2xl border border-white/5">
                                                <div className="flex justify-between items-start mb-2">
                                                    <h4 className="text-lg font-bold text-white">Current Role</h4>
                                                    <Badge className="bg-emerald-500/10 text-emerald-400 border-emerald-500/20">Active</Badge>
                                                </div>
                                                <p className="text-slate-400 text-sm">Serving as <span className="text-white font-medium">{faculty.designation}</span> in the department, contributing to academic excellence and research.</p>
                                                <div className="mt-3 flex items-center gap-4 text-xs font-mono text-slate-500">
                                                    <span className="flex items-center gap-1"><Building2 className="w-3 h-3" /> NRIIT</span>
                                                    <span className="flex items-center gap-1"><CheckCircle2 className="w-3 h-3" /> {faculty.nature}</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div className="relative">
                                            <div className="absolute -left-[21px] top-1 w-3 h-3 rounded-full bg-slate-700" />
                                            <div className="flex flex-col gap-2">
                                                <h4 className="text-sm font-bold text-slate-400">Total Experience</h4>
                                                <div className="flex items-center gap-3">
                                                    <div className="h-3 flex-1 bg-slate-900 rounded-full overflow-hidden border border-slate-800">
                                                        <motion.div
                                                            initial={{ width: 0 }}
                                                            animate={{ width: `${Math.min(expYears * 4, 100)}%` }}
                                                            transition={{ duration: 1.5, ease: "easeOut" }}
                                                            className="h-full bg-gradient-to-r from-blue-600 to-cyan-400"
                                                        />
                                                    </div>
                                                    <span className="text-2xl font-black text-white">{expYears > 0 ? expYears : '--'}+ <span className="text-xs font-medium text-slate-500">Years</span></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                {/* 2. ACADEMIC HIGHLIGHTS */}
                                <section>
                                    <h3 className="flex items-center gap-2 text-sm font-black text-slate-500 uppercase tracking-widest mb-6">
                                        <Sparkles className="w-4 h-4 text-purple-500" /> Impact & Expertise
                                    </h3>

                                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                        <div className="p-4 rounded-2xl bg-gradient-to-br from-slate-900 to-slate-900/50 border border-white/5 hover:border-purple-500/30 transition-colors group">
                                            <div className="w-10 h-10 rounded-lg bg-purple-500/10 flex items-center justify-center text-purple-400 mb-3 group-hover:scale-110 transition-transform">
                                                <BookOpen className="w-5 h-5" />
                                            </div>
                                            <h4 className="text-sm font-bold text-white mb-1">Research Domain</h4>
                                            <p className="text-xs text-slate-400 line-clamp-2">
                                                Specialized in Advanced Computing, Algorithms, and System Design.
                                            </p>
                                        </div>

                                        <div className="p-4 rounded-2xl bg-gradient-to-br from-slate-900 to-slate-900/50 border border-white/5 hover:border-blue-500/30 transition-colors group">
                                            <div className="w-10 h-10 rounded-lg bg-blue-500/10 flex items-center justify-center text-blue-400 mb-3 group-hover:scale-110 transition-transform">
                                                <Globe className="w-5 h-5" />
                                            </div>
                                            <h4 className="text-sm font-bold text-white mb-1">Global Registry</h4>
                                            <p className="text-xs text-slate-400">
                                                Verified Faculty Member ID: <span className="font-mono text-white">{faculty.id || 'N/A'}</span>
                                            </p>
                                        </div>
                                    </div>
                                </section>

                            </div>
                        </ScrollArea>
                    </div>

                </div>
            </DialogContent>
        </Dialog>
    );
}
