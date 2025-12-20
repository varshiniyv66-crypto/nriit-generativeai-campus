"use client";

import { useState } from "react";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, Cell, AreaChart, Area } from "recharts";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { TrendingUp, Award, Users, Briefcase, Info } from "lucide-react";
import placementData from "@/data/placements_yearwise.json";

interface PlacementComparativeAnalysisProps {
    department: string;
}

export function PlacementComparativeAnalysis({ department }: PlacementComparativeAnalysisProps) {
    const deptKey = department.toUpperCase();

    // Map department names to keys in JSON if needed
    const getDataKey = () => {
        if (["CSE", "COMPUTER SCIENCE"].includes(deptKey)) return "CSE";
        if (["ECE", "ELECTRONICS"].includes(deptKey)) return "ECE";
        if (["IT", "INFORMATION TECHNOLOGY"].includes(deptKey)) return "IT";
        if (["CIVIL", "CE"].includes(deptKey)) return "CIVIL";
        if (["MECH", "MECHANICAL"].includes(deptKey)) return "MECH";
        if (["EEE", "ELECTRICAL"].includes(deptKey)) return "EEE";
        if (["DS", "CSE-DS", "CSD", "DATA SCIENCE"].includes(deptKey)) return "DS";
        if (["AIML", "CSE-AI", "AI"].includes(deptKey)) return "AIML";
        if (["MBA"].includes(deptKey)) return "MBA";
        if (["MCA"].includes(deptKey)) return "MCA";
        return deptKey;
    };

    const jsonKey = getDataKey();
    const deptData = (placementData as any)[jsonKey] || {};
    const years = Object.keys(deptData).sort(); // Years are keys inside dept object

    const statsData = years.map(year => {
        const branchData = deptData[year] || [];

        // Calculate stats
        const totalPlaced = branchData.length;
        const packages = branchData.map((s: any) => {
            const pkg = parseFloat(strToPkg(s.package));
            return isNaN(pkg) ? 0 : pkg;
        }).filter((p: number) => p > 0);

        const highestPackage = packages.length > 0 ? Math.max(...packages) : 0;
        const averagePackage = packages.length > 0 ? (packages.reduce((a: number, b: number) => a + b, 0) / packages.length).toFixed(2) : "0.00";

        return {
            year,
            placed: totalPlaced,
            highest: highestPackage,
            average: parseFloat(averagePackage),
            rawBranchData: branchData
        };
    });

    function strToPkg(str: string) {
        if (!str) return "0";
        return str.toString().replace(/[^0-9.]/g, '');
    }

    return (
        <div className="space-y-8">
            <div className="flex items-center justify-between">
                <div className="space-y-1">
                    <h2 className="text-3xl font-black text-[#0B1120] tracking-tight flex items-center gap-3">
                        <TrendingUp className="w-8 h-8 text-blue-600" />
                        Comparative Placement Analysis
                    </h2>
                    <p className="text-slate-500 font-medium">3-Year Performance Trend for {deptKey} Department</p>
                </div>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                {/* 1. Placement Growth Chart */}
                <Card className="rounded-3xl border-[#1E3A8A]/10 shadow-xl overflow-hidden bg-white">
                    <CardHeader className="bg-gradient-to-br from-[#0B1120] to-[#1E3A8A] text-white p-6">
                        <CardTitle className="flex items-center gap-2">
                            <Users className="w-5 h-5 text-blue-400" />
                            Placed Students Trend
                        </CardTitle>
                        <CardDescription className="text-blue-100/70">Annual growth in student recruitment</CardDescription>
                    </CardHeader>
                    <CardContent className="p-6 h-[350px]">
                        <ResponsiveContainer width="100%" height="100%">
                            <BarChart data={statsData}>
                                <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E2E8F0" />
                                <XAxis dataKey="year" axisLine={false} tickLine={false} tick={{ fill: '#64748B', fontWeight: 600 }} />
                                <YAxis axisLine={false} tickLine={false} tick={{ fill: '#64748B' }} />
                                <Tooltip
                                    contentStyle={{ borderRadius: '16px', border: 'none', boxShadow: '0 10px 30px rgba(0,0,0,0.1)' }}
                                    cursor={{ fill: '#F1F5F9' }}
                                />
                                <Bar dataKey="placed" name="Placed Students" radius={[8, 8, 0, 0]}>
                                    {statsData.map((entry, index) => (
                                        <Cell key={`cell-${index}`} fill={index === statsData.length - 1 ? '#3B82F6' : '#94A3B8'} />
                                    ))}
                                </Bar>
                            </BarChart>
                        </ResponsiveContainer>
                    </CardContent>
                </Card>

                {/* 2. Package Evolution Chart */}
                <Card className="rounded-3xl border-[#B45309]/10 shadow-xl overflow-hidden bg-white">
                    <CardHeader className="bg-gradient-to-br from-[#451A03] to-[#92400E] text-white p-6">
                        <CardTitle className="flex items-center gap-2">
                            <Award className="w-5 h-5 text-amber-400" />
                            Package Evolution (LPA)
                        </CardTitle>
                        <CardDescription className="text-amber-100/70">Highest vs Average Salary Package</CardDescription>
                    </CardHeader>
                    <CardContent className="p-6 h-[350px]">
                        <ResponsiveContainer width="100%" height="100%">
                            <AreaChart data={statsData}>
                                <defs>
                                    <linearGradient id="colorHighest" x1="0" y1="0" x2="0" y2="1">
                                        <stop offset="5%" stopColor="#F59E0B" stopOpacity={0.3} />
                                        <stop offset="95%" stopColor="#F59E0B" stopOpacity={0} />
                                    </linearGradient>
                                </defs>
                                <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E2E8F0" />
                                <XAxis dataKey="year" axisLine={false} tickLine={false} tick={{ fill: '#64748B', fontWeight: 600 }} />
                                <YAxis axisLine={false} tickLine={false} tick={{ fill: '#64748B' }} />
                                <Tooltip
                                    contentStyle={{ borderRadius: '16px', border: 'none', boxShadow: '0 10px 30px rgba(0,0,0,0.1)' }}
                                />
                                <Legend verticalAlign="top" height={36} />
                                <Area type="monotone" dataKey="highest" name="Highest (LPA)" stroke="#D97706" fillOpacity={1} fill="url(#colorHighest)" strokeWidth={3} />
                                <Area type="monotone" dataKey="average" name="Average (LPA)" stroke="#0284C7" fill="none" strokeWidth={3} strokeDasharray="5 5" />
                            </AreaChart>
                        </ResponsiveContainer>
                    </CardContent>
                </Card>
            </div>

            {/* 3. Statistical Comparative Table */}
            <Card className="rounded-3xl border-slate-200 shadow-xl overflow-hidden bg-white">
                <div className="p-8 border-b border-slate-100 flex items-center gap-3">
                    <div className="p-3 bg-blue-50 rounded-2xl">
                        <Info className="w-6 h-6 text-blue-600" />
                    </div>
                    <div>
                        <h3 className="text-xl font-black text-[#0B1120]">Annual Growth Statistics</h3>
                        <p className="text-slate-400 text-sm font-medium">Detailed year-over-year recruitment metrics</p>
                    </div>
                </div>
                <Table>
                    <TableHeader>
                        <TableRow className="bg-slate-50 hover:bg-slate-50 border-b-2 border-slate-100">
                            <TableHead className="py-6 px-8 font-black text-[#0B1120]">Academic Year</TableHead>
                            <TableHead className="py-6 px-8 font-black text-[#0B1120] text-center">Placed Quality</TableHead>
                            <TableHead className="py-6 px-8 font-black text-[#0B1120] text-center">Highest Package</TableHead>
                            <TableHead className="py-6 px-8 font-black text-[#0B1120] text-center">Avg Package</TableHead>
                            <TableHead className="py-6 px-8 font-black text-[#0B1120] text-right">Success Index</TableHead>
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        {statsData.map((row, idx) => (
                            <TableRow key={idx} className="hover:bg-slate-50/50 transition-colors">
                                <TableCell className="py-6 px-8 font-bold text-slate-700">A.Y. {row.year}</TableCell>
                                <TableCell className="py-6 px-8 text-center">
                                    <div className="flex flex-col items-center">
                                        <span className="text-2xl font-black text-[#0B1120]">{row.placed}</span>
                                        <span className="text-[10px] uppercase font-bold text-slate-400">Total Selections</span>
                                    </div>
                                </TableCell>
                                <TableCell className="py-6 px-8 text-center">
                                    <span className="px-4 py-2 bg-emerald-50 text-emerald-700 rounded-xl font-black text-lg border border-emerald-100">
                                        {row.highest} LPA
                                    </span>
                                </TableCell>
                                <TableCell className="py-6 px-8 text-center">
                                    <span className="px-4 py-2 bg-blue-50 text-blue-700 rounded-xl font-black text-lg border border-blue-100">
                                        {row.average} LPA
                                    </span>
                                </TableCell>
                                <TableCell className="py-6 px-8 text-right">
                                    <div className="flex flex-col items-end">
                                        <div className={`flex items-center gap-1 font-black ${idx === 0 ? "text-slate-400" :
                                            (row.placed >= (statsData[idx - 1]?.placed || 0) ? "text-emerald-600" : "text-rose-600")
                                            }`}>
                                            {idx === 0 ? (
                                                <span className="text-sm">Baseline Year</span>
                                            ) : (
                                                <>
                                                    <TrendingUp className={`w-4 h-4 ${row.placed < (statsData[idx - 1]?.placed || 0) ? "rotate-180" : ""}`} />
                                                    {statsData[idx - 1]?.placed > 0
                                                        ? `${(((row.placed - statsData[idx - 1].placed) / statsData[idx - 1].placed) * 100).toFixed(1)}%`
                                                        : "New Sector"}
                                                </>
                                            )}
                                        </div>
                                        <span className="text-[10px] text-slate-400 font-medium italic">Verified by T&P Cell</span>
                                    </div>
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </Card>
        </div>
    );
}
