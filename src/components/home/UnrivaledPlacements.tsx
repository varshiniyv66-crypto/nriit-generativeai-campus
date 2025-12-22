"use client";

import Link from "next/link";
import { ArrowRight, TrendingUp, Award, Briefcase } from "lucide-react";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Cell } from "recharts";
import placementData from "@/data/placements_yearwise.json";

// Process real data for the chart
const processChartData = () => {
    // Aggregating highest package across all departments per year
    const years = ["2022-23", "2023-24", "2024-25"];
    const chartData = years.map(year => {
        let maxPkg = 0;
        let totalPkg = 0;
        let count = 0;

        Object.values(placementData).forEach((deptData: any) => {
            const yearList = deptData[year] || [];
            yearList.forEach((student: any) => {
                const pkg = parseFloat(student.package.replace(/[^0-9.]/g, '')) || 0;
                if (pkg > maxPkg) maxPkg = pkg;
                if (pkg > 0) {
                    totalPkg += pkg;
                    count++;
                }
            });
        });

        return {
            year: year.replace("20", "'"), // '22-23, '23-24
            highest: maxPkg,
            average: count > 0 ? (totalPkg / count).toFixed(2) : 0
        };
    });

    // Override 2024-25 Highest if user claimed 16.5 (and parser missed it)
    // The user explicitly asked for 16.5 LPA for 2024
    const latest = chartData.find(d => d.year === "'24-25");
    if (latest && latest.highest < 16.5) {
        latest.highest = 16.5;
    }

    return chartData;
};

const data = processChartData();
const latestYear = data[data.length - 1];

export function UnrivaledPlacements() {
    return (
        <section className="py-24 bg-white dark:bg-slate-950 relative overflow-hidden">
            <div className="container mx-auto px-4">
                <div className="grid lg:grid-cols-2 gap-16 items-center">

                    {/* LEFT CONTENTS */}
                    <div className="space-y-8">
                        <div>
                            <h2 className="text-4xl md:text-5xl font-serif text-[#0B1120] dark:text-white leading-tight">
                                Unrivaled Career Outcomes
                            </h2>
                            <div className="w-24 h-1.5 bg-[#D4AF37] mt-6 rounded-full" />
                        </div>

                        <p className="text-lg text-slate-600 dark:text-slate-300 leading-relaxed max-w-xl">
                            Our students consistently secure top-tier positions at global technology giants.
                            With a consistent <span className="font-bold text-[#0B1120] dark:text-white">95%+ placement record</span>,
                            we bridge the gap between academia and industry excellence.
                        </p>

                        <div className="flex flex-wrap gap-6">
                            {/* Highest Package Card */}
                            <div className="bg-white dark:bg-slate-900 border border-slate-100 dark:border-slate-800 rounded-3xl p-8 shadow-[0_20px_40px_-15px_rgba(0,0,0,0.1)] hover:shadow-xl transition-shadow min-w-[240px]">
                                <div className="text-4xl font-black text-[#1E3A8A] dark:text-blue-400 mb-2">
                                    ₹{latestYear.highest} LPA
                                </div>
                                <div className="text-sm font-bold text-slate-400 uppercase tracking-wider">
                                    Highest Package 2024
                                </div>
                            </div>

                            {/* Average Package Card */}
                            <div className="bg-white dark:bg-slate-900 border border-slate-100 dark:border-slate-800 rounded-3xl p-8 shadow-[0_20px_40px_-15px_rgba(0,0,0,0.1)] hover:shadow-xl transition-shadow min-w-[240px]">
                                <div className="text-4xl font-black text-[#D4AF37] mb-2">
                                    ₹{latestYear.average} LPA
                                </div>
                                <div className="text-sm font-bold text-slate-400 uppercase tracking-wider">
                                    Average Package
                                </div>
                            </div>
                        </div>

                        <div className="pt-4">
                            <Link
                                href="/placements"
                                className="inline-flex items-center gap-2 text-[#1E3A8A] dark:text-blue-400 font-bold hover:text-[#D4AF37] transition-colors text-lg group"
                            >
                                View Placement Report
                                <ArrowRight className="w-5 h-5 group-hover:translate-x-2 transition-transform" />
                            </Link>
                        </div>
                    </div>

                    {/* RIGHT CHART CARD */}
                    <div className="bg-white dark:bg-slate-900 rounded-[3rem] p-8 md:p-12 shadow-[0_40px_80px_-20px_rgba(0,0,0,0.1)] border border-slate-100 dark:border-slate-800 relative">
                        {/* Decorative background blob */}
                        <div className="absolute top-0 right-0 w-64 h-64 bg-slate-50 dark:bg-slate-800/50 rounded-bl-[3rem] -z-10" />

                        <div className="flex items-center justify-between mb-8">
                            <h3 className="text-xl font-bold text-[#0B1120] dark:text-white">Package Growth (LPA)</h3>
                            <div className="p-2 bg-slate-50 dark:bg-slate-800 rounded-lg">
                                <TrendingUp className="w-5 h-5 text-[#D4AF37]" />
                            </div>
                        </div>

                        <div className="h-[300px] w-full">
                            <ResponsiveContainer width="100%" height="100%">
                                <BarChart data={data} barGap={8}>
                                    <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#F1F5F9" />
                                    <XAxis
                                        dataKey="year"
                                        axisLine={false}
                                        tickLine={false}
                                        tick={{ fill: '#94A3B8', fontSize: 12, fontWeight: 600 }}
                                        dy={10}
                                    />
                                    <YAxis
                                        axisLine={false}
                                        tickLine={false}
                                        tick={{ fill: '#94A3B8', fontSize: 12 }}
                                        tickFormatter={(value) => `${value} LPA`}
                                    />
                                    <Tooltip
                                        cursor={{ fill: '#F8FAFC' }}
                                        contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 30px rgba(0,0,0,0.1)' }}
                                    />
                                    {/* Highest Bar */}
                                    <Bar dataKey="highest" name="Highest" radius={[4, 4, 4, 4]} barSize={20}>
                                        {data.map((entry, index) => (
                                            <Cell key={`cell-${index}`} fill="#1E3A8A" />
                                        ))}
                                    </Bar>
                                    {/* Average Bar */}
                                    <Bar dataKey="average" name="Average" radius={[4, 4, 4, 4]} barSize={20}>
                                        {data.map((entry, index) => (
                                            <Cell key={`cell-${index}`} fill="#D4AF37" />
                                        ))}
                                    </Bar>
                                </BarChart>
                            </ResponsiveContainer>
                        </div>

                        <div className="flex items-center gap-6 mt-6 justify-center">
                            <div className="flex items-center gap-2">
                                <div className="w-3 h-3 rounded-full bg-[#1E3A8A]" />
                                <span className="text-xs font-bold text-slate-500 uppercase">Highest</span>
                            </div>
                            <div className="flex items-center gap-2">
                                <div className="w-3 h-3 rounded-full bg-[#D4AF37]" />
                                <span className="text-xs font-bold text-slate-500 uppercase">Average</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
}
