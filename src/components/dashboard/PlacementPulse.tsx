"use client";

import React from "react";
import {
    TrendingUp,
    Award,
    Briefcase,
    Users,
    ChevronRight,
    ArrowUpRight,
    Building2,
    Zap,
    Target,
    Orbit
} from "lucide-react";
import {
    AreaChart,
    Area,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    ResponsiveContainer
} from "recharts";
import { motion } from "framer-motion";

const data = [
    { year: "2020", placed: 840, package: 12 },
    { year: "2021", placed: 910, package: 18 },
    { year: "2022", placed: 1050, package: 22 },
    { year: "2023", placed: 1180, package: 28 },
    { year: "2024", placed: 1248, package: 32 },
];

const recruiters = [
    { name: "Microsoft", logo: "Ⓜ️" },
    { name: "Amazon", logo: "📦" },
    { name: "Google", logo: "🔍" },
    { name: "TCS", logo: "⚙️" },
    { name: "Infosys", logo: "🔬" },
    { name: "Accenture", logo: "💠" },
    { name: "Capgemini", logo: "👒" },
    { name: "TechM", logo: "💻" },
    { name: "Cognizant", logo: "🧠" },
];

export function PlacementPulse() {
    return (
        <section className="py-24 bg-slate-900 text-white relative overflow-hidden">
            {/* Background elements */}
            <div className="absolute top-0 right-0 w-[800px] h-[800px] bg-blue-600/10 rounded-full blur-[120px] -mr-64 -mt-64" />
            <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-indigo-600/10 rounded-full blur-[80px] -ml-24 -mb-24" />

            <div className="container mx-auto px-4 relative z-10">
                <div className="flex flex-col lg:flex-row gap-20 items-center mb-20">
                    <div className="lg:w-1/2 space-y-8">
                        <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-500/10 border border-blue-500/20 text-blue-400 text-xs font-black uppercase tracking-widest">
                            <Zap className="w-4 h-4 fill-blue-400" />
                            Live Placement Pulse
                        </div>

                        <h2 className="text-5xl md:text-7xl font-black tracking-tight leading-none text-white">
                            A Powerhouse of <br />
                            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 via-indigo-400 to-blue-400 animate-gradient-x">
                                Global Careers
                            </span>
                        </h2>

                        <p className="text-xl text-slate-400 max-w-xl leading-relaxed">
                            NRIIT is transforming the engineering landscape with record-breaking placement stats.
                            Our graduates are leading innovations at top Fortune 500 companies.
                        </p>

                        <div className="grid grid-cols-2 gap-6">
                            <StatCard
                                label="Total Students Placed"
                                value="1,248+"
                                icon={Users}
                                color="text-blue-400"
                            />
                            <StatCard
                                label="Highest Package 2024"
                                value="₹ 32 LPA"
                                icon={Award}
                                color="text-amber-400"
                            />
                            <StatCard
                                label="Average Package"
                                value="₹ 6.5 LPA"
                                icon={Briefcase}
                                color="text-emerald-400"
                            />
                            <StatCard
                                label="Hiring Partners"
                                value="150+"
                                icon={Building2}
                                color="text-purple-400"
                            />
                        </div>

                        <div className="pt-4">
                            <button className="px-8 py-4 bg-white text-slate-900 font-black rounded-2xl flex items-center gap-3 hover:bg-blue-50 transition-all group">
                                View Placement Dashboard
                                <ArrowUpRight className="w-5 h-5 group-hover:translate-x-1 group-hover:-translate-y-1 transition-transform" />
                            </button>
                        </div>
                    </div>

                    <div className="lg:w-1/2 w-full">
                        <div className="bg-white/5 backdrop-blur-xl border border-white/10 rounded-[3rem] p-10 relative overflow-hidden group">
                            <div className="flex items-center justify-between mb-8 pb-4 border-b border-white/10">
                                <div>
                                    <h3 className="text-2xl font-bold">Success Trajectory</h3>
                                    <p className="text-slate-400 text-sm">Placement Trends & Package Evolution</p>
                                </div>
                                <div className="text-right">
                                    <div className="text-3xl font-black text-blue-400">+48%</div>
                                    <div className="text-[10px] text-slate-500 font-bold uppercase tracking-widest leading-none">YoY Growth</div>
                                </div>
                            </div>

                            <div className="h-[300px] w-full">
                                <ResponsiveContainer width="100%" height="100%">
                                    <AreaChart data={data}>
                                        <defs>
                                            <linearGradient id="colorPlaced" x1="0" y1="0" x2="0" y2="1">
                                                <stop offset="5%" stopColor="#3B82F6" stopOpacity={0.3} />
                                                <stop offset="95%" stopColor="#3B82F6" stopOpacity={0} />
                                            </linearGradient>
                                        </defs>
                                        <CartesianGrid strokeDasharray="3 3" stroke="#ffffff10" vertical={false} />
                                        <XAxis
                                            dataKey="year"
                                            stroke="#64748b"
                                            fontSize={12}
                                            tickLine={false}
                                            axisLine={false}
                                        />
                                        <YAxis hide />
                                        <Tooltip
                                            contentStyle={{
                                                backgroundColor: '#0f172a',
                                                border: '1px solid #ffffff10',
                                                borderRadius: '16px',
                                                color: '#fff'
                                            }}
                                            itemStyle={{ color: '#3B82F6' }}
                                        />
                                        <Area
                                            type="monotone"
                                            dataKey="placed"
                                            stroke="#3B82F6"
                                            strokeWidth={4}
                                            fillOpacity={1}
                                            fill="url(#colorPlaced)"
                                            animationDuration={2000}
                                        />
                                    </AreaChart>
                                </ResponsiveContainer>
                            </div>

                            <div className="mt-8 flex items-center justify-between text-xs font-bold uppercase tracking-[0.2em] text-slate-500">
                                <div className="flex items-center gap-2">
                                    <span className="w-2 h-2 rounded-full bg-blue-500"></span>
                                    Students Placed
                                </div>
                                <div className="flex items-center gap-2">
                                    <span className="w-2 h-2 rounded-full bg-emerald-500"></span>
                                    International Offers
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {/* Recruiter Marquee */}
                <div className="relative pt-10 border-t border-white/5">
                    <p className="text-center text-xs font-black uppercase tracking-[0.3em] text-slate-500 mb-10">
                        Top Strategic Partners
                    </p>
                    <div className="flex overflow-hidden group">
                        <div className="flex gap-20 animate-marquee whitespace-nowrap py-4 items-center">
                            {[...recruiters, ...recruiters].map((company, i) => (
                                <div key={i} className="flex items-center gap-4 group/item">
                                    <div className="w-12 h-12 rounded-xl bg-white/5 flex items-center justify-center text-2xl group-hover/item:bg-white/10 transition-colors">
                                        {company.logo}
                                    </div>
                                    <span className="text-xl font-bold text-slate-400 group-hover/item:text-white transition-colors">
                                        {company.name}
                                    </span>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
}

function StatCard({ label, value, icon: Icon, color }: any) {
    return (
        <div className="p-6 rounded-3xl bg-white/5 border border-white/5 hover:border-white/10 transition-all group">
            <div className={`p-3 rounded-2xl bg-white/5 w-fit mb-4 group-hover:scale-110 transition-transform`}>
                <Icon className={`w-5 h-5 ${color}`} />
            </div>
            <div className="text-2xl font-black mb-1">{value}</div>
            <div className="text-[10px] text-slate-500 uppercase font-black tracking-widest">{label}</div>
        </div>
    );
}
