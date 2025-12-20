"use client";

import { useState } from "react";
import { Users, Search, Download, X, Calendar, ChevronDown, Briefcase, TrendingUp } from "lucide-react";
import { Button } from "@/components/ui/button";
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
    DialogDescription,
} from "@/components/ui/dialog";
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table";
import { Input } from "@/components/ui/input";

// Import year-wise placement data
import placementData from "@/data/placements_yearwise.json";

interface PlacementStatsButtonProps {
    department: string;
}

const AVAILABLE_YEARS = ["2024-25", "2023-24", "2022-23"];

export function PlacementStatsButton({ department }: PlacementStatsButtonProps) {
    const [isOpen, setIsOpen] = useState(false);
    const [searchTerm, setSearchTerm] = useState("");
    const [selectedYear, setSelectedYear] = useState("2024-25");

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
        // Map other depts if they exist in JSON
        return deptKey;
    };

    const jsonKey = getDataKey();
    const rawData = (placementData as any)[jsonKey]?.[selectedYear] || [];

    // Filter data
    const filteredData = rawData.filter((item: any) =>
        item.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.company.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.regNo.toLowerCase().includes(searchTerm.toLowerCase())
    );

    // Calculate stats
    const totalStudents = filteredData.length;
    const maxPackage = filteredData.reduce((max: number, item: any) => {
        const pkg = parseFloat(item.package.replace(/[^0-9.]/g, '')) || 0;
        return pkg > max ? pkg : max;
    }, 0);

    // Count unique companies
    const uniqueCompanies = new Set(filteredData.map((item: any) => item.company)).size;

    return (
        <>
            <Button
                onClick={() => setIsOpen(true)}
                className="group relative overflow-hidden bg-[#0B1120] text-white font-black px-8 py-6 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-500 scale-100 hover:scale-105 active:scale-95 border border-white/10"
            >
                <div className="absolute inset-0 bg-[#D4AF37]/10 translate-y-full group-hover:translate-y-0 transition-transform duration-500" />
                <span className="relative flex items-center gap-3">
                    <TrendingUp className="w-6 h-6 text-[#D4AF37]" />
                    PLACEMENT STATS
                </span>
            </Button>

            <Dialog open={isOpen} onOpenChange={setIsOpen}>
                <DialogContent className="max-w-[95vw] w-[1200px] h-[90vh] flex flex-col p-0 overflow-hidden rounded-3xl border-[#D4AF37]/30 bg-white/95 backdrop-blur-2xl">
                    <DialogHeader className="p-8 bg-gradient-to-br from-[#0B1120] to-[#1E3A8A] text-white">
                        <div className="flex flex-col gap-6">
                            <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
                                <div>
                                    <DialogTitle className="text-3xl font-black flex items-center gap-3">
                                        <Briefcase className="w-8 h-8 text-[#D4AF37]" />
                                        {deptKey} Placement Records
                                    </DialogTitle>
                                    <DialogDescription className="text-blue-100 text-lg mt-2 font-medium">
                                        Official Placement Data & Statistics
                                    </DialogDescription>
                                </div>
                                <div className="flex items-center gap-4 w-full md:w-auto">
                                    <div className="relative flex-1 md:w-64">
                                        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                                        <Input
                                            placeholder="Search student, company..."
                                            className="pl-10 w-full bg-white/10 border-white/20 text-white placeholder:text-white/50 focus:ring-[#D4AF37]"
                                            value={searchTerm}
                                            onChange={(e) => setSearchTerm(e.target.value)}
                                        />
                                    </div>
                                    <Button variant="outline" className="border-white/20 text-white hover:bg-white/10 rounded-xl" onClick={() => window.print()}>
                                        <Download className="w-4 h-4 mr-2" />
                                        Print
                                    </Button>
                                </div>
                            </div>

                            {/* Stats Cards */}
                            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                                <div className="bg-white/10 rounded-2xl p-4 border border-white/10 backdrop-blur-sm">
                                    <div className="text-blue-200 text-xs font-bold uppercase tracking-wider mb-1">Total Placed</div>
                                    <div className="text-3xl font-black text-white">{totalStudents}</div>
                                </div>
                                <div className="bg-white/10 rounded-2xl p-4 border border-white/10 backdrop-blur-sm">
                                    <div className="text-blue-200 text-xs font-bold uppercase tracking-wider mb-1">Highest Package</div>
                                    <div className="text-3xl font-black text-[#D4AF37]">{maxPackage > 0 ? `${maxPackage} LPA` : "N/A"}</div>
                                </div>
                                <div className="bg-white/10 rounded-2xl p-4 border border-white/10 backdrop-blur-sm">
                                    <div className="text-blue-200 text-xs font-bold uppercase tracking-wider mb-1">Companies</div>
                                    <div className="text-3xl font-black text-white">{uniqueCompanies}</div>
                                </div>
                            </div>

                            {/* Year Selector Tabs */}
                            <div className="flex items-center gap-2 mt-2">
                                <Calendar className="w-5 h-5 text-[#D4AF37]" />
                                <span className="text-sm text-blue-100 mr-2">Academic Year:</span>
                                <div className="flex gap-2 text-black">
                                    {AVAILABLE_YEARS.map((year) => (
                                        <button
                                            key={year}
                                            onClick={() => setSelectedYear(year)}
                                            className={`px-4 py-2 rounded-xl font-bold text-sm transition-all ${selectedYear === year
                                                ? "bg-[#D4AF37] text-[#0B1120] shadow-lg shadow-[#D4AF37]/30"
                                                : "bg-white/10 text-white hover:bg-white/20 border border-white/20"
                                                }`}
                                        >
                                            {year}
                                        </button>
                                    ))}
                                </div>
                            </div>
                        </div>
                    </DialogHeader>

                    <div className="flex-1 overflow-auto p-8 pt-4">
                        <div className="rounded-2xl border border-slate-200 overflow-hidden shadow-sm bg-white">
                            <Table>
                                <TableHeader>
                                    <TableRow className="bg-slate-50 hover:bg-slate-50 border-b-2 border-slate-100">
                                        <TableHead className="w-[60px] font-black text-[#0B1120] py-4">S.NO</TableHead>
                                        <TableHead className="font-black text-[#0B1120] py-4">STUDENT NAME & REG.NO</TableHead>
                                        <TableHead className="font-black text-[#0B1120] py-4">COMPANY</TableHead>
                                        <TableHead className="font-black text-[#0B1120] py-4">PACKAGE (CTC)</TableHead>
                                    </TableRow>
                                </TableHeader>
                                <TableBody>
                                    {filteredData.length > 0 ? (
                                        filteredData.map((student: any, idx: number) => (
                                            <TableRow key={idx} className="hover:bg-[#D4AF37]/5 transition-colors group">
                                                <TableCell className="font-bold text-slate-400 py-4">{idx + 1}</TableCell>
                                                <TableCell className="py-4">
                                                    <div className="flex flex-col">
                                                        <span className="font-bold text-[#0B1120] text-[15px] group-hover:text-[#D4AF37] transition-colors">
                                                            {student.name}
                                                        </span>
                                                        <span className="text-xs font-mono text-slate-500 font-medium">{student.regNo}</span>
                                                    </div>
                                                </TableCell>
                                                <TableCell className="font-bold text-slate-700 py-4">{student.company}</TableCell>
                                                <TableCell className="py-4">
                                                    <span className="px-3 py-1 bg-emerald-100 text-emerald-800 rounded-lg font-bold text-sm border border-emerald-200">
                                                        {student.package}
                                                    </span>
                                                </TableCell>
                                            </TableRow>
                                        ))
                                    ) : (
                                        <TableRow>
                                            <TableCell colSpan={4} className="h-96 text-center">
                                                <div className="flex flex-col items-center justify-center gap-4 py-20">
                                                    <div className="p-6 bg-slate-50 rounded-full">
                                                        <Search className="w-12 h-12 text-slate-200" />
                                                    </div>
                                                    <div className="space-y-1">
                                                        <p className="text-2xl font-black text-slate-300">No Records Found</p>
                                                        <p className="text-slate-400 text-sm">No placement data available for {deptKey} - {selectedYear}.</p>
                                                    </div>
                                                </div>
                                            </TableCell>
                                        </TableRow>
                                    )}
                                </TableBody>
                            </Table>
                        </div>
                    </div>

                    <div className="p-6 border-t border-slate-100 bg-white md:flex items-center justify-between gap-4 hidden">
                        <div className="text-sm font-medium text-slate-500">
                            Showing {filteredData.length} placements
                        </div>
                        <div className="text-[10px] text-slate-400 font-medium uppercase tracking-[0.2em] italic">
                            © 2025 NRI Institute of Technology
                        </div>
                    </div>
                </DialogContent>
            </Dialog>
        </>
    );
}
