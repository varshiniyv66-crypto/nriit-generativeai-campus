"use client";

import { useState } from "react";
import { Users, Search, Download, X, Calendar, ChevronDown } from "lucide-react";
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

// Import year-wise faculty data
import cseFacultyData from "@/data/cse_faculty_yearwise.json";
import eceFacultyData from "@/data/ece_faculty_yearwise.json";
import aimlFacultyData from "@/data/cse_ai_faculty_yearwise.json";
import dsFacultyData from "@/data/ds_faculty_yearwise.json";
import bshFacultyData from "@/data/bsh_faculty_yearwise.json";
import itFacultyData from "@/data/it_faculty_yearwise.json";
import civilFacultyData from "@/data/civil_faculty_yearwise.json";
import mbaFacultyData from "@/data/mba_faculty_yearwise.json";
import mcaFacultyData from "@/data/mca_faculty_yearwise.json";
import evtFacultyData from "@/data/evt_faculty_yearwise.json";

interface FacultyDirectoryButtonProps {
    department: string;
}

const AVAILABLE_YEARS = ["2025-26", "2024-25", "2023-24", "2022-23"];

export function FacultyDirectoryButton({ department }: FacultyDirectoryButtonProps) {
    const [isOpen, setIsOpen] = useState(false);
    const [searchTerm, setSearchTerm] = useState("");
    const [selectedYear, setSelectedYear] = useState("2025-26");

    const deptKey = department.toUpperCase();

    // Get faculty data based on department and year
    const getFacultyData = () => {
        if (deptKey === "CSE") {
            return (cseFacultyData as any)[selectedYear] || [];
        }
        if (deptKey === "ECE") {
            return (eceFacultyData as any)[selectedYear] || [];
        }
        if (["AIML", "CSE-AI", "CSE(AI&ML)", "CSM"].includes(deptKey)) {
            return (aimlFacultyData as any)[selectedYear] || [];
        }
        if (["DS", "CSE-DS", "CSD", "DATA SCIENCE"].includes(deptKey)) {
            return (dsFacultyData as any)[selectedYear] || [];
        }
        if (["BSH", "S&H", "FED", "BASIC SCIENCES"].includes(deptKey)) {
            return (bshFacultyData as any)[selectedYear] || [];
        }
        if (["IT", "INFORMATION TECHNOLOGY"].includes(deptKey)) {
            return (itFacultyData as any)[selectedYear] || [];
        }
        if (["CIVIL", "CIV", "CE"].includes(deptKey)) {
            return (civilFacultyData as any)[selectedYear] || [];
        }
        if (["MBA", "MASTER OF BUSINESS ADMINISTRATION"].includes(deptKey)) {
            return (mbaFacultyData as any)[selectedYear] || [];
        }
        if (["MCA", "MASTER OF COMPUTER APPLICATIONS"].includes(deptKey)) {
            return (mcaFacultyData as any)[selectedYear] || [];
        }
        if (["EVT", "VLSI"].includes(deptKey)) {
            return (evtFacultyData as any)[selectedYear] || [];
        }
        // For other departments, return empty for now
        return [];
    };

    const rawData = getFacultyData();

    // Normalize the data
    const displayData = rawData.map((item: any, idx: number) => ({
        sno: item.sno || (idx + 1).toString(),
        name: item.name || item.NAME || item["Name of the Faculty"] || "N/A",
        designation: item.designation || item.Designation || "N/A",
        qualification: item.qualification || item.Qualification || "N/A",
        doj: item.doj || item.DOJ || item["Date of Joining"] || "N/A",
        pan: item.pan || "N/A",
        nature: item.nature || "Regular"
    })).filter((item: any) => item.name && item.name !== "N/A");

    const filteredData = displayData.filter((item: any) =>
        item.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.designation.toLowerCase().includes(searchTerm.toLowerCase())
    );

    return (
        <>
            <Button
                onClick={() => setIsOpen(true)}
                className="group relative overflow-hidden bg-gradient-to-r from-[#D4AF37] to-[#F5C84C] text-[#0B1120] font-black px-8 py-6 rounded-2xl shadow-[0_10px_30px_rgba(212,175,55,0.3)] hover:shadow-[0_15px_40px_rgba(212,175,55,0.5)] transition-all duration-500 scale-100 hover:scale-105 active:scale-95 border-2 border-white/20"
            >
                <div className="absolute inset-0 bg-white/20 translate-y-full group-hover:translate-y-0 transition-transform duration-500" />
                <span className="relative flex items-center gap-3">
                    <Users className="w-6 h-6" />
                    FACULTY DIRECTORY
                </span>
            </Button>

            <Dialog open={isOpen} onOpenChange={setIsOpen}>
                <DialogContent className="max-w-[95vw] w-[1200px] h-[90vh] flex flex-col p-0 overflow-hidden rounded-3xl border-[#D4AF37]/30 bg-white/95 backdrop-blur-2xl">
                    <DialogHeader className="p-8 bg-gradient-to-br from-[#0B1120] to-[#1E3A8A] text-white">
                        <div className="flex flex-col gap-6">
                            <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
                                <div>
                                    <DialogTitle className="text-3xl font-black flex items-center gap-3">
                                        <Users className="w-8 h-8 text-[#D4AF37]" />
                                        {deptKey} Faculty Directory
                                    </DialogTitle>
                                    <DialogDescription className="text-blue-100 text-lg mt-2 font-medium">
                                        Official Faculty Registry for {deptKey} Department
                                    </DialogDescription>
                                </div>
                                <div className="flex items-center gap-4 w-full md:w-auto">
                                    <div className="relative flex-1 md:w-64">
                                        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                                        <Input
                                            placeholder="Search faculty..."
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

                            {/* Year Selector Tabs */}
                            <div className="flex items-center gap-2">
                                <Calendar className="w-5 h-5 text-[#D4AF37]" />
                                <span className="text-sm text-blue-100 mr-2">Academic Year:</span>
                                <div className="flex gap-2">
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
                                        <TableHead className="font-black text-[#0B1120] py-4">FACULTY NAME</TableHead>
                                        <TableHead className="font-black text-[#0B1120] py-4">DESIGNATION</TableHead>
                                        <TableHead className="font-black text-[#0B1120] py-4">QUALIFICATION</TableHead>
                                        <TableHead className="font-black text-[#0B1120] py-4">DATE OF JOINING</TableHead>
                                        <TableHead className="font-black text-[#0B1120] py-4">NATURE</TableHead>
                                    </TableRow>
                                </TableHeader>
                                <TableBody>
                                    {filteredData.length > 0 ? (
                                        filteredData.map((faculty: any, idx: number) => (
                                            <TableRow key={idx} className="hover:bg-[#D4AF37]/5 transition-colors group">
                                                <TableCell className="font-bold text-slate-400 py-4">{idx + 1}</TableCell>
                                                <TableCell className="font-bold text-[#0B1120] text-[15px] group-hover:text-[#D4AF37] transition-colors py-4">
                                                    {faculty.name}
                                                </TableCell>
                                                <TableCell className="py-4">
                                                    <span className={`px-3 py-1 rounded-lg font-bold text-[11px] uppercase tracking-wider border ${faculty.designation.toLowerCase().includes('professor & hod') || faculty.designation.toLowerCase().includes('dean')
                                                        ? 'bg-violet-50 text-violet-700 border-violet-100'
                                                        : faculty.designation.toLowerCase().includes('associate')
                                                            ? 'bg-emerald-50 text-emerald-700 border-emerald-100'
                                                            : 'bg-blue-50 text-blue-700 border-blue-100'
                                                        }`}>
                                                        {faculty.designation}
                                                    </span>
                                                </TableCell>
                                                <TableCell className="font-medium text-slate-600 py-4">{faculty.qualification}</TableCell>
                                                <TableCell className="font-medium text-slate-600 font-mono text-sm py-4">{faculty.doj}</TableCell>
                                                <TableCell className="py-4">
                                                    <span className="px-2 py-1 bg-emerald-100 text-emerald-700 rounded text-xs font-bold">
                                                        {faculty.nature}
                                                    </span>
                                                </TableCell>
                                            </TableRow>
                                        ))
                                    ) : (
                                        <TableRow>
                                            <TableCell colSpan={6} className="h-96 text-center">
                                                <div className="flex flex-col items-center justify-center gap-4 py-20">
                                                    <div className="p-6 bg-slate-50 rounded-full">
                                                        <Search className="w-12 h-12 text-slate-200" />
                                                    </div>
                                                    <div className="space-y-1">
                                                        <p className="text-2xl font-black text-slate-300">No Records Found</p>
                                                        <p className="text-slate-400 text-sm">No faculty data available for {deptKey} - {selectedYear}.</p>
                                                    </div>
                                                    {searchTerm && (
                                                        <Button variant="link" className="text-[#D4AF37] font-bold" onClick={() => setSearchTerm("")}>
                                                            Clear Search Filters
                                                        </Button>
                                                    )}
                                                </div>
                                            </TableCell>
                                        </TableRow>
                                    )}
                                </TableBody>
                            </Table>
                        </div>
                    </div>

                    <div className="p-6 border-t border-slate-100 bg-white flex flex-col md:flex-row items-center justify-between gap-4">
                        <div className="flex items-center gap-4">
                            <div className="text-sm text-slate-500 font-medium tracking-wide">
                                <span className="text-[#0B1120] font-black font-mono text-lg mr-2">{filteredData.length}</span>
                                Faculty Members for AY {selectedYear}
                            </div>
                            <div className="h-4 w-px bg-slate-300 hidden md:block" />
                            <div className="flex items-center gap-2 text-xs font-bold text-emerald-600 bg-emerald-50 px-3 py-1 rounded-full border border-emerald-100 uppercase tracking-tighter">
                                <div className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse" />
                                Verified Data from Excel
                            </div>
                        </div>
                        <div className="text-[10px] text-slate-400 font-medium uppercase tracking-[0.2em] italic">
                            © 2025 NRI Institute of Technology - Excellence in Professional Education
                        </div>
                    </div>
                </DialogContent>
            </Dialog>
        </>
    );
}
