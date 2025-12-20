"use client";

import React, { useState, useEffect } from "react";
import { Building2, Wifi, Users, Monitor, Cpu, BookOpen, GraduationCap, Zap } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";

interface BlockData {
    name: string;
    students: string;
    color: string;
    icon: React.ReactNode;
    gridArea: string;
    connectivity: string;
    floors: number;
}

const campusBlocks: BlockData[] = [
    { name: "Admin & Library Wing", students: "1,240", color: "#013C58", icon: <BookOpen className="w-6 h-6" />, gridArea: "1 / 2 / 3 / 4", connectivity: "10 Gbps", floors: 4 },
    { name: "Engineering Block A (CSE/IT)", students: "2,850", color: "#1e40af", icon: <Monitor className="w-6 h-6" />, gridArea: "1 / 1 / 2 / 2", connectivity: "10 Gbps", floors: 3 },
    { name: "Engineering Block B (ECE/EVT)", students: "1,920", color: "#7c3aed", icon: <Cpu className="w-6 h-6" />, gridArea: "1 / 4 / 2 / 5", connectivity: "10 Gbps", floors: 3 },
    { name: "Engineering Block C (ME/CE)", students: "1,150", color: "#334155", icon: <Building2 className="w-6 h-6" />, gridArea: "3 / 1 / 4 / 2", connectivity: "5 Gbps", floors: 3 },
    { name: "Platinum Jubilee Auditorium", students: "650", color: "#F5A201", icon: <GraduationCap className="w-6 h-6" />, gridArea: "3 / 4 / 4 / 5", connectivity: "5 Gbps", floors: 2 },
];

function CampusBlockCard({ block, index }: { block: BlockData; index: number }) {
    const [hovered, setHovered] = useState(false);

    return (
        <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.1 }}
            className="relative group cursor-pointer"
            style={{ gridArea: block.gridArea }}
            onMouseEnter={() => setHovered(true)}
            onMouseLeave={() => setHovered(false)}
        >
            <div
                className={`h-full min-h-[120px] rounded-2xl border transition-all duration-500 p-4 flex flex-col justify-between ${hovered ? 'scale-105 shadow-2xl z-20 border-[#D4AF37]' : 'border-white/10'}`}
                style={{
                    backgroundColor: hovered ? block.color : `${block.color}66`,
                    boxShadow: hovered ? `0 0 40px ${block.color}88` : 'none'
                }}
            >
                <div className="flex items-start justify-between">
                    <div className="p-2 rounded-xl bg-white/10 text-white">
                        {block.icon}
                    </div>
                    <div className="flex items-center gap-1 text-green-400 text-[10px] font-bold">
                        <Wifi className="w-3 h-3" />
                        <span>{block.connectivity}</span>
                    </div>
                </div>

                <div>
                    <h4 className="text-white font-bold text-sm leading-tight mb-1">{block.name}</h4>
                    <div className="flex items-center gap-2 text-white/60 text-[10px]">
                        <Users className="w-3 h-3" />
                        <span>{block.students} active</span>
                    </div>
                </div>
            </div>

            {/* Hover Details */}
            <AnimatePresence>
                {hovered && (
                    <motion.div
                        initial={{ opacity: 0, y: 10, scale: 0.95 }}
                        animate={{ opacity: 1, y: 0, scale: 1 }}
                        exit={{ opacity: 0, y: 10, scale: 0.95 }}
                        className="absolute -top-24 left-1/2 -translate-x-1/2 bg-slate-900/95 backdrop-blur-xl text-white p-4 rounded-2xl border border-[#D4AF37]/50 shadow-2xl min-w-[220px] z-30 pointer-events-none"
                    >
                        <div className="text-[#D4AF37] font-bold text-sm mb-2">{block.name}</div>
                        <div className="space-y-2 text-xs">
                            <div className="flex justify-between">
                                <span className="text-slate-400">Active Students</span>
                                <span className="font-bold">{block.students}</span>
                            </div>
                            <div className="flex justify-between">
                                <span className="text-slate-400">Floors</span>
                                <span className="font-bold">{block.floors}</span>
                            </div>
                            <div className="flex justify-between">
                                <span className="text-slate-400">Network</span>
                                <span className="text-green-400 font-bold">{block.connectivity}</span>
                            </div>
                            <div className="h-1 w-full bg-slate-800 rounded-full overflow-hidden mt-2">
                                <motion.div
                                    className="h-full bg-gradient-to-r from-[#D4AF37] to-[#F5A201]"
                                    initial={{ width: 0 }}
                                    animate={{ width: '85%' }}
                                    transition={{ duration: 0.5 }}
                                />
                            </div>
                        </div>
                        <div className="absolute -bottom-2 left-1/2 -translate-x-1/2 w-4 h-4 bg-slate-900 rotate-45 border-r border-b border-[#D4AF37]/50" />
                    </motion.div>
                )}
            </AnimatePresence>
        </motion.div>
    );
}

export default function DigitalTwin() {
    const [isLoaded, setIsLoaded] = useState(false);

    useEffect(() => {
        setIsLoaded(true);
    }, []);

    return (
        <section className="relative w-full bg-[#020617] overflow-hidden rounded-[3rem] border border-white/5 my-20 shadow-2xl">
            <div className="container mx-auto px-8 py-16">
                <div className="grid lg:grid-cols-2 gap-12 items-center">
                    {/* Left Info */}
                    <div className="space-y-6">
                        <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 text-[#D4AF37] text-[10px] font-bold uppercase tracking-widest">
                            <span className="w-2 h-2 rounded-full bg-[#D4AF37] animate-ping" />
                            Live Digital Node
                        </div>
                        <h2 className="text-4xl md:text-5xl font-black text-white tracking-tight">
                            NRIIT <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#F5A201]">Digital Twin</span>
                        </h2>
                        <p className="text-slate-400 text-lg leading-relaxed">
                            An interactive simulation of our campus infrastructure, monitoring academic flow and performance across all departments.
                        </p>
                        <div className="flex gap-4 flex-wrap">
                            <div className="p-4 rounded-2xl bg-white/5 border border-white/10">
                                <div className="text-2xl font-bold text-white">5,000+</div>
                                <div className="text-[10px] text-slate-500 uppercase font-black">Connected Minds</div>
                            </div>
                            <div className="p-4 rounded-2xl bg-white/5 border border-white/10">
                                <div className="text-2xl font-bold text-white">100%</div>
                                <div className="text-[10px] text-slate-500 uppercase font-black">IoT Integration</div>
                            </div>
                            <div className="p-4 rounded-2xl bg-white/5 border border-white/10">
                                <div className="text-2xl font-bold text-[#D4AF37]">Live</div>
                                <div className="text-[10px] text-slate-500 uppercase font-black">Real-Time Data</div>
                            </div>
                        </div>
                    </div>

                    {/* Right - Interactive Campus Map */}
                    <motion.div
                        initial={{ opacity: 0, x: 50 }}
                        animate={{ opacity: isLoaded ? 1 : 0, x: isLoaded ? 0 : 50 }}
                        transition={{ duration: 0.8 }}
                        className="relative"
                    >
                        {/* Campus Grid */}
                        <div
                            className="grid gap-3 p-6 rounded-3xl bg-gradient-to-br from-slate-900/50 to-slate-800/30 border border-white/5 backdrop-blur-sm"
                            style={{
                                gridTemplateColumns: 'repeat(4, 1fr)',
                                gridTemplateRows: 'repeat(3, 120px)'
                            }}
                        >
                            {campusBlocks.map((block, index) => (
                                <CampusBlockCard key={block.name} block={block} index={index} />
                            ))}

                            {/* Center Logo */}
                            <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 flex items-center justify-center pointer-events-none z-10">
                                <div className="w-16 h-16 rounded-full bg-[#D4AF37]/20 border border-[#D4AF37]/50 flex items-center justify-center animate-pulse">
                                    <Zap className="w-8 h-8 text-[#D4AF37]" />
                                </div>
                            </div>
                        </div>

                        {/* Floating Label */}
                        <div className="absolute -bottom-6 left-1/2 -translate-x-1/2 text-center">
                            <div className="text-slate-500 text-xs font-medium bg-black/60 px-4 py-2 rounded-full backdrop-blur-md border border-white/10">
                                Hover over buildings for real-time data
                            </div>
                        </div>
                    </motion.div>
                </div>
            </div>
        </section>
    );
}
