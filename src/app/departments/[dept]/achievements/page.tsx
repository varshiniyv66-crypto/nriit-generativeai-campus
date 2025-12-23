
"use client";

import { useParams } from "next/navigation";
import { useMemo } from "react";
import { departments as staticDepartments } from "@/data/departments";
import { DEPARTMENT_ACHIEVEMENTS } from "@/data/achievements-data";
import { getRecognitionByDepartment, getTotalAwards } from "@/data/faculty-recognition";
import { Trophy, Home, Sparkles, Filter, Calendar, User, Search, Upload, CheckCircle2, X, Globe2, GraduationCap, Award, BookOpen, Star } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { useState, useEffect } from "react";
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
    DialogFooter,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select";

// --- CREATIVE NOMINATION FORM COMPONENT ---
function NominationForm({ onClose }: { onClose: () => void }) {
    const [step, setStep] = useState(1);
    const [isSubmitting, setIsSubmitting] = useState(false);

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        setIsSubmitting(true);
        // Simulate API call
        setTimeout(() => {
            setIsSubmitting(false);
            setStep(2); // Success State
        }, 1500);
    };

    if (step === 2) {
        return (
            <motion.div
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                className="flex flex-col items-center justify-center py-10 text-center"
            >
                <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mb-6">
                    <CheckCircle2 className="w-10 h-10 text-green-600 animate-bounce" />
                </div>
                <h3 className="text-2xl font-black text-slate-900 mb-2">Nomination Submitted!</h3>
                <p className="text-slate-500 mb-8 max-w-xs">Your achievement has been sent to the Department Head for review. Keep shining!</p>
                <Button onClick={onClose} className="bg-slate-900 text-white rounded-full px-8">Close</Button>
            </motion.div>
        );
    }

    return (
        <form onSubmit={handleSubmit} className="space-y-6 py-4">
            <div className="space-y-4">
                <div className="space-y-2">
                    <Label htmlFor="applicantName" className="text-xs font-bold uppercase tracking-wider text-slate-500">Your Name</Label>
                    <Input id="applicantName" placeholder="Full Name" required className="bg-slate-50 border-slate-200 font-bold text-slate-900" />
                </div>
                <div className="grid grid-cols-2 gap-4">
                    <div className="space-y-2">
                        <Label htmlFor="email" className="text-xs font-bold uppercase tracking-wider text-slate-500">Email Address</Label>
                        <Input id="email" type="email" placeholder="john@example.com" required className="bg-slate-50 border-slate-200" />
                    </div>
                    <div className="space-y-2">
                        <Label htmlFor="phone" className="text-xs font-bold uppercase tracking-wider text-slate-500">Phone Number</Label>
                        <Input id="phone" type="tel" placeholder="+91..." required className="bg-slate-50 border-slate-200" />
                    </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                    <div className="space-y-2">
                        <Label htmlFor="category" className="text-xs font-bold uppercase tracking-wider text-slate-500">Category</Label>
                        <Select required>
                            <SelectTrigger className="bg-slate-50 border-slate-200">
                                <SelectValue placeholder="Select Type" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="innovation">Innovation & Tech</SelectItem>
                                <SelectItem value="academic">Academic Excellence</SelectItem>
                                <SelectItem value="sports">Sports & Cultural</SelectItem>
                                <SelectItem value="research">Research & Patents</SelectItem>
                            </SelectContent>
                        </Select>
                    </div>
                    <div className="space-y-2">
                        <Label htmlFor="date" className="text-xs font-bold uppercase tracking-wider text-slate-500">Date</Label>
                        <Input type="date" id="date" required className="bg-slate-50 border-slate-200" />
                    </div>
                </div>

                <div className="space-y-2">
                    <Label htmlFor="title" className="text-xs font-bold uppercase tracking-wider text-slate-500">Achievement Title</Label>
                    <Input id="title" placeholder="e.g., National Coding Hackathon Winner" required className="bg-slate-50 border-slate-200 font-bold text-slate-900" />
                </div>

                <div className="space-y-2">
                    <Label htmlFor="desc" className="text-xs font-bold uppercase tracking-wider text-slate-500">Description</Label>
                    <Textarea id="desc" placeholder="Briefly describe what you achieved and its impact..." className="bg-slate-50 border-slate-200 min-h-[100px]" required />
                </div>

                <div className="space-y-2">
                    <Label htmlFor="proof" className="text-xs font-bold uppercase tracking-wider text-slate-500">Proof URL (Drive/LinkedIn)</Label>
                    <div className="relative">
                        <Upload className="absolute left-3 top-3 w-4 h-4 text-slate-400" />
                        <Input id="proof" placeholder="https://..." className="pl-10 bg-slate-50 border-slate-200" />
                    </div>
                </div>
            </div>

            <DialogFooter className="pt-4">
                <Button type="submit" disabled={isSubmitting} className="w-full bg-gradient-to-r from-amber-500 to-orange-500 hover:from-amber-600 hover:to-orange-600 text-white font-bold py-6 rounded-xl shadow-lg shadow-amber-500/20 transition-all hover:scale-[1.02] active:scale-[0.98]">
                    {isSubmitting ? (
                        <span className="flex items-center gap-2"><Sparkles className="w-4 h-4 animate-spin" /> Submitting...</span>
                    ) : (
                        <span className="flex items-center gap-2"><Trophy className="w-4 h-4" /> Submit Nomination</span>
                    )}
                </Button>
            </DialogFooter>
        </form>
    );
}

export default function AchievementsPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const achievements = DEPARTMENT_ACHIEVEMENTS[deptCode.toLowerCase()] || DEPARTMENT_ACHIEVEMENTS['cse'];
    const deptInfo = staticDepartments[deptCode.toLowerCase()];

    // Get faculty recognition data for dynamic stats
    const recognitionData = useMemo(() => getRecognitionByDepartment(deptCode), [deptCode]);

    // Calculate dynamic stats
    const totalAchievements = achievements.length;
    const totalAwards = getTotalAwards(recognitionData);
    const totalPublications = recognitionData.researchExcellence.totalPublications;
    const totalPatents = recognitionData.researchExcellence.patents;

    const [isDialogOpen, setIsDialogOpen] = useState(false);

    const containerVariants = {
        hidden: { opacity: 0 },
        visible: { opacity: 1, transition: { staggerChildren: 0.1 } }
    };

    const itemVariants = {
        hidden: { opacity: 0, scale: 0.9 },
        visible: { opacity: 1, scale: 1, transition: { type: "spring" as const, stiffness: 100 } }
    };

    return (
        <div className="min-h-screen bg-[#FDFCF8] text-slate-900 font-sans pb-20 selection:bg-amber-100">
            {/* 1. HERO SECTION: Pearl White & Gold Hallmark */}
            <div className="relative pt-24 pb-20 px-6 overflow-hidden">
                {/* Luminous Background Mesh */}
                <div className="absolute top-[-20%] right-[-10%] w-[800px] h-[800px] bg-gradient-to-b from-amber-100/40 via-yellow-50/20 to-transparent rounded-full blur-[120px] opacity-60 pointer-events-none" />
                <div className="absolute top-[20%] left-[-10%] w-[600px] h-[600px] bg-gradient-to-r from-blue-50/50 to-purple-50/30 rounded-full blur-[100px] opacity-50 pointer-events-none" />

                <div className="container mx-auto relative z-10 text-center">
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="inline-flex items-center gap-2 mb-6"
                    >
                        <Badge variant="outline" className="bg-white/80 backdrop-blur-md px-4 py-1.5 rounded-full border-slate-200 text-slate-500 font-bold tracking-widest uppercase">
                            Hall of Distinction
                        </Badge>
                        <span className="w-1 h-1 bg-slate-300 rounded-full" />
                        <span className="text-xs font-bold text-amber-600 uppercase tracking-widest">{deptCode} Excellence</span>
                    </motion.div>

                    <motion.h1
                        initial={{ opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        className="text-5xl md:text-7xl font-black text-slate-900 tracking-tighter mb-6"
                    >
                        Achievements
                    </motion.h1>

                    <motion.p
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: 0.2 }}
                        className="text-xl text-slate-500 max-w-2xl mx-auto font-medium leading-relaxed"
                    >
                        Celebrating the <span className="text-amber-600 font-bold">Gold Standard</span> of excellence set by {deptInfo ? deptInfo.name : deptCode} students and faculty on the global stage.
                    </motion.p>
                </div>
            </div>

            {/* 1.5 INTERNATIONAL RECOGNITION STATS */}
            <div className="container mx-auto px-6 max-w-7xl mb-16 relative z-10">
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.4 }}
                    className="grid grid-cols-1 md:grid-cols-2 gap-6"
                >
                    {/* Gold Medals Card */}
                    <div className="relative overflow-hidden bg-gradient-to-br from-amber-400 to-yellow-600 rounded-[2.5rem] p-1 shadow-2xl shadow-amber-500/30 group hover:scale-[1.02] transition-transform duration-500">
                        <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-20 mix-blend-overlay"></div>
                        <div className="relative bg-gradient-to-br from-amber-500 via-yellow-500 to-amber-600 rounded-[2.4rem] p-8 h-full flex flex-col justify-between overflow-hidden">
                            <div className="absolute top-0 right-0 p-8 opacity-20 transform translate-x-1/3 -translate-y-1/3">
                                <Trophy className="w-64 h-64 text-white" />
                            </div>
                            <div>
                                <div className="flex items-center gap-2 text-amber-100 font-bold tracking-widest uppercase text-xs mb-2">
                                    <Sparkles className="w-4 h-4" /> International Level
                                </div>
                                <h3 className="text-white text-3xl font-black tracking-tight">Global Excellence</h3>
                            </div>
                            <div className="mt-8">
                                <div className="text-[5rem] leading-none font-black text-white drop-shadow-sm">
                                    {totalPublications}+
                                </div>
                                <div className="text-amber-100 text-xl font-bold uppercase tracking-wider mt-2">
                                    Research Papers
                                </div>
                                <div className="text-amber-200/70 text-sm mt-1">
                                    {totalPatents} Patents Filed
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Diamond Medals Card */}
                    <div className="relative overflow-hidden bg-slate-900 rounded-[2.5rem] p-1 shadow-2xl shadow-cyan-500/20 group hover:scale-[1.02] transition-transform duration-500">
                        <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/stardust.png')] opacity-30"></div>
                        <div className="absolute -inset-1 bg-gradient-to-r from-cyan-400 via-blue-500 to-purple-600 rounded-[2.5rem] opacity-70 blur-md group-hover:opacity-100 transition-opacity duration-500"></div>
                        <div className="relative bg-slate-900 rounded-[2.4rem] p-8 h-full flex flex-col justify-between overflow-hidden z-10">
                            <div className="absolute top-0 right-0 p-8 opacity-10 transform translate-x-1/3 -translate-y-1/3">
                                <Sparkles className="w-64 h-64 text-cyan-400" />
                            </div>
                            <div>
                                <div className="flex items-center gap-2 text-cyan-300 font-bold tracking-widest uppercase text-xs mb-2">
                                    <Globe2 className="w-4 h-4" /> World Class
                                </div>
                                <h3 className="text-white text-3xl font-black tracking-tight">Innovation Titans</h3>
                            </div>
                            <div className="mt-8">
                                <div className="text-[5rem] leading-none font-black text-transparent bg-clip-text bg-gradient-to-r from-cyan-200 via-white to-blue-200 drop-shadow-[0_0_15px_rgba(34,211,238,0.5)]">
                                    {totalAwards}
                                </div>
                                <div className="text-cyan-200/80 text-xl font-bold uppercase tracking-wider mt-2 flex items-center gap-2">
                                    Faculty Awards
                                </div>
                                <div className="text-cyan-300/60 text-sm mt-1">
                                    Certificate of Merit Recipients
                                </div>
                            </div>
                        </div>
                    </div>
                </motion.div>
            </div>

            {/* HALL OF FAME - FACULTY EXCELLENCE */}
            <div className="container mx-auto px-6 max-w-7xl mb-16">
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.5 }}
                >
                    <div className="flex items-center gap-4 mb-8">
                        <div className="p-4 bg-gradient-to-br from-purple-500 to-indigo-600 rounded-2xl shadow-lg shadow-purple-500/30">
                            <GraduationCap className="w-8 h-8 text-white" />
                        </div>
                        <div>
                            <h2 className="text-3xl font-black text-slate-900 tracking-tight">Faculty Hall of Fame</h2>
                            <p className="text-slate-500 font-medium">Performance & Development Metrics (SAR Data)</p>
                        </div>
                    </div>

                    <div className="bg-white rounded-3xl shadow-xl border border-slate-100 overflow-hidden">
                        <div className="overflow-x-auto">
                            <table className="w-full" suppressHydrationWarning>
                                <thead>
                                    <tr className="bg-gradient-to-r from-slate-900 to-slate-800 text-white">
                                        <th className="py-5 px-6 text-left font-black uppercase tracking-wider text-sm">Metric</th>
                                        {recognitionData.yearlyPerformance.map((year) => (
                                            <th key={year.year} className="py-5 px-6 text-center font-black uppercase tracking-wider text-sm">
                                                <span className="bg-white/10 px-3 py-1 rounded-full">{year.year}</span>
                                            </th>
                                        ))}
                                    </tr>
                                </thead>
                                <tbody className="divide-y divide-slate-100">
                                    <tr className="hover:bg-purple-50/50 transition-colors">
                                        <td className="py-5 px-6">
                                            <div className="font-bold text-slate-700 flex items-center gap-3">
                                                <div className="w-10 h-10 bg-blue-100 rounded-xl flex items-center justify-center">
                                                    <BookOpen className="w-5 h-5 text-blue-600" />
                                                </div>
                                                Faculty sent for Training
                                            </div>
                                        </td>
                                        {recognitionData.yearlyPerformance.map((year) => (
                                            <td key={year.year} className="py-5 px-6 text-center">
                                                <span className="text-2xl font-black text-blue-600">{year.training}</span>
                                            </td>
                                        ))}
                                    </tr>
                                    <tr className="hover:bg-purple-50/50 transition-colors">
                                        <td className="py-5 px-6">
                                            <div className="font-bold text-slate-700 flex items-center gap-3">
                                                <div className="w-10 h-10 bg-indigo-100 rounded-xl flex items-center justify-center">
                                                    <GraduationCap className="w-5 h-5 text-indigo-600" />
                                                </div>
                                                Faculty sent for FDPs
                                            </div>
                                        </td>
                                        {recognitionData.yearlyPerformance.map((year) => (
                                            <td key={year.year} className="py-5 px-6 text-center">
                                                <span className="text-2xl font-black text-indigo-600">{year.fdps}</span>
                                            </td>
                                        ))}
                                    </tr>
                                    <tr className="hover:bg-amber-50/50 transition-colors">
                                        <td className="py-5 px-6">
                                            <div className="font-bold text-slate-700 flex items-center gap-3">
                                                <div className="w-10 h-10 bg-amber-100 rounded-xl flex items-center justify-center">
                                                    <Trophy className="w-5 h-5 text-amber-600" />
                                                </div>
                                                Certificate of Merit + Cash Award
                                            </div>
                                        </td>
                                        {recognitionData.yearlyPerformance.map((year) => (
                                            <td key={year.year} className="py-5 px-6 text-center">
                                                <span className="text-2xl font-black text-amber-600">{year.meritCashAward}</span>
                                            </td>
                                        ))}
                                    </tr>
                                    <tr className="hover:bg-emerald-50/50 transition-colors">
                                        <td className="py-5 px-6">
                                            <div className="font-bold text-slate-700 flex items-center gap-3">
                                                <div className="w-10 h-10 bg-emerald-100 rounded-xl flex items-center justify-center">
                                                    <Award className="w-5 h-5 text-emerald-600" />
                                                </div>
                                                Certificate of Merit
                                            </div>
                                        </td>
                                        {recognitionData.yearlyPerformance.map((year) => (
                                            <td key={year.year} className="py-5 px-6 text-center">
                                                <span className="text-2xl font-black text-emerald-600">{year.meritCertificate}</span>
                                            </td>
                                        ))}
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div className="bg-slate-50 px-6 py-4 flex items-center justify-between">
                            <span className="text-xs font-bold text-slate-500 uppercase tracking-wider">Source: Self Assessment Report (SAR)</span>
                            <Badge className="bg-purple-100 text-purple-700 border-purple-200">Verified Data</Badge>
                        </div>
                    </div>
                </motion.div>
            </div>

            {/* 2. STUDENT HALL OF FAME - NEW PREMIUM SECTION */}
            <div className="container mx-auto px-6 max-w-7xl mb-16">
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    className="relative"
                >
                    <div className="flex items-center gap-4 mb-10">
                        <div className="p-4 bg-gradient-to-br from-amber-500 to-orange-600 rounded-2xl shadow-lg shadow-amber-500/30">
                            <Star className="w-8 h-8 text-white" />
                        </div>
                        <div>
                            <h2 className="text-3xl font-black text-slate-900 tracking-tight">Student Hall of Fame</h2>
                            <p className="text-slate-500 font-medium">Elite performers and global competition winners</p>
                        </div>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                        {achievements.filter(a => ['National', 'First', 'Winner', 'Gold'].some(k => a.title.includes(k) || a.description.includes(k))).slice(0, 3).map((achievement, idx) => (
                            <motion.div
                                key={`hall-${achievement.id}`}
                                initial={{ opacity: 0, scale: 0.9 }}
                                whileInView={{ opacity: 1, scale: 1 }}
                                transition={{ delay: idx * 0.1 }}
                                viewport={{ once: true }}
                                className="relative group"
                            >
                                <div className="absolute -inset-1 bg-gradient-to-r from-amber-500 via-orange-500 to-yellow-500 rounded-[2.5rem] blur opacity-25 group-hover:opacity-100 transition duration-1000 group-hover:duration-200"></div>
                                <div className="relative bg-white rounded-[2.4rem] p-8 border border-amber-100 shadow-xl overflow-hidden">
                                    {/* Spotlight Ornament */}
                                    <div className="absolute -top-10 -right-10 w-32 h-32 bg-amber-50 rounded-full blur-3xl opacity-60" />

                                    <div className="flex items-start justify-between mb-6">
                                        <div className="w-16 h-16 bg-amber-50 rounded-2xl flex items-center justify-center text-amber-600">
                                            <Trophy className="w-8 h-8" />
                                        </div>
                                        <Badge className="bg-amber-100 text-amber-700 border-none font-black text-[10px] uppercase tracking-widest px-3 py-1">
                                            Top Elite
                                        </Badge>
                                    </div>

                                    <h3 className="text-2xl font-black text-slate-900 mb-2 leading-tight">
                                        {achievement.title}
                                    </h3>
                                    <p className="text-slate-500 text-sm font-medium mb-6 line-clamp-2">
                                        {achievement.description}
                                    </p>

                                    <div className="flex items-center gap-3 pt-6 border-t border-slate-50">
                                        <div className="w-10 h-10 rounded-full bg-gradient-to-br from-slate-100 to-slate-50 flex items-center justify-center text-slate-400 font-black text-xs border border-white">
                                            {achievement.recipient.split(' ').map(n => n[0]).join('')}
                                        </div>
                                        <div>
                                            <div className="text-xs font-black text-slate-900 uppercase tracking-wider">{achievement.recipient}</div>
                                            <div className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">{achievement.date}</div>
                                        </div>
                                    </div>
                                </div>
                            </motion.div>
                        ))}
                    </div>
                </motion.div>
            </div>

            {/* 3. STUDENT ACHIEVEMENTS GRID */}
            <div className="container mx-auto px-6 max-w-7xl">
                <motion.div
                    variants={containerVariants}
                    initial="hidden"
                    animate="visible"
                    className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"
                >
                    {achievements.map((achievement) => (
                        <motion.div
                            key={achievement.id}
                            variants={itemVariants}
                            whileHover={{ y: -10 }}
                            className="group relative bg-white rounded-[2rem] p-1 border border-slate-100 shadow-[0_10px_30px_-10px_rgba(0,0,0,0.05)] hover:shadow-[0_20px_40px_-10px_rgba(217,119,6,0.15)] transition-all duration-500"
                        >
                            <div className="absolute inset-0 bg-gradient-to-br from-amber-500/0 via-amber-500/0 to-amber-500/5 rounded-[2rem] opacity-0 group-hover:opacity-100 transition-opacity duration-500" />

                            <div className="relative bg-white rounded-[1.8rem] p-8 h-full flex flex-col items-start overflow-hidden">
                                {/* Top Accents */}
                                <div className={`absolute top-0 right-0 w-24 h-24 bg-${achievement.color}-50 rounded-bl-[4rem] -mr-4 -mt-4 transition-transform group-hover:scale-110`} />

                                <div className="relative mb-6">
                                    <div className={`w-14 h-14 rounded-2xl bg-${achievement.color}-50 text-${achievement.color}-600 flex items-center justify-center shadow-sm group-hover:scale-110 group-hover:rotate-6 transition-all duration-300`}>
                                        <achievement.icon className="w-7 h-7" />
                                    </div>
                                </div>

                                <div className="flex-1">
                                    <div className="flex items-center gap-2 mb-3">
                                        <Badge variant="outline" className={`bg-transparent text-${achievement.color}-600 border-${achievement.color}-200 text-[10px] font-black uppercase tracking-widest`}>
                                            {achievement.category}
                                        </Badge>
                                        <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest flex items-center gap-1">
                                            <Calendar className="w-3 h-3" /> {achievement.date}
                                        </span>
                                    </div>

                                    <h3 className="text-2xl font-black text-slate-900 mb-3 leading-tight group-hover:text-amber-600 transition-colors">
                                        {achievement.title}
                                    </h3>

                                    <p className="text-sm text-slate-500 font-medium leading-relaxed mb-6">
                                        {achievement.description}
                                    </p>
                                </div>

                                <div className="w-full pt-6 border-t border-slate-50 flex items-center gap-3">
                                    <div className="w-8 h-8 rounded-full bg-slate-100 flex items-center justify-center text-slate-400">
                                        <User className="w-4 h-4" />
                                    </div>
                                    <span className="text-xs font-bold text-slate-700">
                                        {achievement.recipient}
                                    </span>
                                </div>
                            </div>
                        </motion.div>
                    ))}

                    {/* Decorative Call to Action Card with DIALOG */}
                    <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
                        <DialogTrigger asChild>
                            <motion.div
                                variants={itemVariants}
                                whileHover={{ scale: 1.02 }}
                                whileTap={{ scale: 0.98 }}
                                className="group bg-slate-900 rounded-[2rem] p-8 relative overflow-hidden flex flex-col justify-center text-center items-center cursor-pointer shadow-2xl shadow-slate-900/20 h-full min-h-[400px]"
                            >
                                <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/stardust.png')] opacity-10" />
                                <div className="absolute top-0 left-0 w-40 h-40 bg-blue-500/20 rounded-full blur-[50px] animate-pulse" />
                                <div className="absolute bottom-0 right-0 w-40 h-40 bg-amber-500/20 rounded-full blur-[50px] animate-pulse delay-700" />

                                <div className="relative z-10 w-full flex flex-col items-center">
                                    <div className="w-20 h-20 bg-white/10 rounded-full flex items-center justify-center mx-auto mb-6 backdrop-blur-sm border border-white/10 group-hover:bg-white/20 group-hover:scale-110 transition-all duration-500">
                                        <Sparkles className="w-10 h-10 text-amber-400" />
                                    </div>
                                    <h3 className="text-3xl font-black text-white mb-3">Submit Nomination</h3>
                                    <p className="text-slate-400 mb-8 max-w-xs mx-auto leading-relaxed">
                                        Achieved something remarkable? Submit your details to be featured in the Hall of Fame.
                                    </p>
                                    <Button className="px-8 py-6 bg-white text-slate-900 rounded-xl font-bold text-lg hover:bg-amber-50 hover:scale-105 transition-all w-full md:w-auto shadow-lg shadow-white/10 group-hover:shadow-white/20">
                                        Open Form
                                    </Button>
                                </div>
                            </motion.div>
                        </DialogTrigger>
                        <DialogContent className="sm:max-w-[425px] md:max-w-[600px] bg-white rounded-3xl border-none shadow-2xl p-0 overflow-hidden">
                            <div className="bg-slate-900 p-8 relative overflow-hidden text-center">
                                <div className="absolute top-0 left-0 w-full h-full bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10"></div>
                                <div className="relative z-10">
                                    <div className="w-12 h-12 bg-white/10 rounded-xl flex items-center justify-center mx-auto mb-4 backdrop-blur-sm border border-white/10">
                                        <Trophy className="w-6 h-6 text-amber-400" />
                                    </div>
                                    <DialogTitle className="text-2xl font-black text-white">Nominate Achievement</DialogTitle>
                                    <DialogDescription className="text-slate-400 mt-2">
                                        Provide details about the award, patent, or recognition.
                                    </DialogDescription>
                                </div>
                            </div>
                            <div className="p-8">
                                <NominationForm onClose={() => setIsDialogOpen(false)} />
                            </div>
                        </DialogContent>
                    </Dialog>

                </motion.div>
            </div>
        </div>
    );
}
