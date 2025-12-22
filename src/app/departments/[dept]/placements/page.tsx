
"use client";

import { useState } from "react";
import { useParams } from "next/navigation";
import { departments as staticDepartments } from "@/data/departments";
import { DEPARTMENT_PLACEMENTS } from "@/data/placements-data";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, AreaChart, Area, ComposedChart, Line } from 'recharts';
import { TrendingUp, Users, Award, Briefcase, DollarSign, Download, FileText, ArrowUpRight, BookOpen, Handshake, Target, Calendar, Mic2, MonitorPlay, Zap, MapPin, Trophy, GraduationCap, Presentation } from "lucide-react";
import { motion } from "framer-motion";

export default function PlacementsPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const [selectedYear, setSelectedYear] = useState('2023-24');

    // Dynamic Data Source
    const placementData = (DEPARTMENT_PLACEMENTS as any)[deptCode.toLowerCase()] || DEPARTMENT_PLACEMENTS['cse'];
    const trendData = placementData.trend;

    // Safely access data categories
    const internships = placementData.internships || {};
    const training = placementData.training || {};
    const mouByYear = placementData.mouByYear || {};
    const lectures = placementData.tutorialsAndGuestLectures || {};
    const achievements = placementData.studentAchievements || {};
    const events = placementData.events || {};

    // Available years for filtering (derived from data keys or fixed set)
    const availableYears = ['2024-25', '2023-24', '2022-23', '2021-22'];

    // Calculate Latest Stats
    const latestYear = trendData[trendData.length - 1];
    const previousYear = trendData[trendData.length - 2];
    const growth = latestYear ? (latestYear.placed - (previousYear?.placed || 0)) : 0;

    return (
        <div className="min-h-screen bg-[#FDFCF8] text-slate-900 font-sans pb-20 selection:bg-rose-100">
            {/* 1. HERO SECTION */}
            <div className="relative pt-24 pb-12 px-6 overflow-hidden">
                <div className="absolute top-[-20%] right-[-10%] w-[800px] h-[800px] bg-gradient-to-b from-blue-100/40 via-indigo-50/20 to-transparent rounded-full blur-[120px] opacity-60 pointer-events-none" />
                <div className="absolute top-[20%] left-[-10%] w-[600px] h-[600px] bg-gradient-to-r from-emerald-50/50 to-teal-50/30 rounded-full blur-[100px] opacity-50 pointer-events-none" />

                <div className="container mx-auto relative z-10 text-center">
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="inline-flex items-center gap-2 mb-6"
                    >
                        <Badge variant="outline" className="bg-white/80 backdrop-blur-md px-4 py-1.5 rounded-full border-slate-200 text-slate-500 font-bold tracking-widest uppercase">
                            Career Success
                        </Badge>
                        <span className="w-1 h-1 bg-slate-300 rounded-full" />
                        <span className="text-xs font-bold text-blue-600 uppercase tracking-widest">{deptCode} Placements</span>
                    </motion.div>

                    <motion.h1
                        initial={{ opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        className="text-5xl md:text-7xl font-black text-slate-900 tracking-tighter mb-6"
                    >
                        Launch Your <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600">Career</span>
                    </motion.h1>

                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: 0.2 }}
                        className="grid grid-cols-2 md:grid-cols-4 gap-4 max-w-4xl mx-auto mt-12"
                    >
                        <div className="bg-white p-6 rounded-2xl shadow-sm border border-slate-100">
                            <div className="text-sm text-slate-500 font-semibold uppercase tracking-wider mb-1">Highest Pkg</div>
                            <div className="text-3xl md:text-4xl font-black text-slate-900">{latestYear?.highestPackage} LPA</div>
                            <div className="text-xs text-emerald-600 font-bold mt-2 flex items-center justify-center gap-1">
                                <TrendingUp className="w-3 h-3" /> All Time High
                            </div>
                        </div>
                        <div className="bg-white p-6 rounded-2xl shadow-sm border border-slate-100">
                            <div className="text-sm text-slate-500 font-semibold uppercase tracking-wider mb-1">Total Placed</div>
                            <div className="text-3xl md:text-4xl font-black text-slate-900">{latestYear?.placed}</div>
                            <div className="text-xs text-blue-600 font-bold mt-2 flex items-center justify-center gap-1">
                                <Users className="w-3 h-3" /> Students (24-25)
                            </div>
                        </div>
                        <div className="bg-white p-6 rounded-2xl shadow-sm border border-slate-100">
                            <div className="text-sm text-slate-500 font-semibold uppercase tracking-wider mb-1">Avg Package</div>
                            <div className="text-3xl md:text-4xl font-black text-slate-900">{latestYear?.avgPackage} LPA</div>
                            <div className="text-xs text-slate-400 font-bold mt-2 flex items-center justify-center gap-1">
                                Consistent Growth
                            </div>
                        </div>
                        <div className="bg-white p-6 rounded-2xl shadow-sm border border-slate-100">
                            <div className="text-sm text-slate-500 font-semibold uppercase tracking-wider mb-1">Offers Made</div>
                            <div className="text-3xl md:text-4xl font-black text-slate-900">{latestYear?.offers}</div>
                            <div className="text-xs text-emerald-600 font-bold mt-2 flex items-center justify-center gap-1">
                                <ArrowUpRight className="w-3 h-3" /> +{growth} vs Last Year
                            </div>
                        </div>
                    </motion.div>
                </div>
            </div>

            <div className="container mx-auto px-6 max-w-7xl">

                {/* Year Filter Control */}
                <div className="flex justify-end mb-6">
                    <div className="flex items-center gap-3 bg-white p-2 rounded-xl border border-slate-200 shadow-sm">
                        <span className="text-sm font-semibold text-slate-500 ml-2">Academic Year:</span>
                        <Select value={selectedYear} onValueChange={setSelectedYear}>
                            <SelectTrigger className="w-[140px] border-none bg-slate-100 font-bold text-slate-700 focus:ring-0">
                                <SelectValue placeholder="Select Year" />
                            </SelectTrigger>
                            <SelectContent>
                                {availableYears.map(year => (
                                    <SelectItem key={year} value={year} className="font-medium">{year}</SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                    </div>
                </div>

                {/* TABBED PANES */}
                <Tabs defaultValue="trends" className="space-y-8">
                    <div className="flex justify-center overflow-x-auto pb-4">
                        <TabsList className="bg-white p-1 rounded-full border border-slate-200 shadow-sm h-auto inline-flex min-w-max">
                            <TabsTrigger value="trends" className="rounded-full px-6 py-2.5 text-sm font-bold data-[state=active]:bg-blue-600 data-[state=active]:text-white transition-all">
                                <TrendingUp className="w-4 h-4 mr-2" /> Trends
                            </TabsTrigger>
                            <TabsTrigger value="internships" className="rounded-full px-6 py-2.5 text-sm font-bold data-[state=active]:bg-purple-600 data-[state=active]:text-white transition-all">
                                <Briefcase className="w-4 h-4 mr-2" /> Internships
                            </TabsTrigger>
                            <TabsTrigger value="training" className="rounded-full px-6 py-2.5 text-sm font-bold data-[state=active]:bg-indigo-600 data-[state=active]:text-white transition-all">
                                <GraduationCap className="w-4 h-4 mr-2" /> Training
                            </TabsTrigger>
                            <TabsTrigger value="activities" className="rounded-full px-6 py-2.5 text-sm font-bold data-[state=active]:bg-amber-600 data-[state=active]:text-white transition-all">
                                <Presentation className="w-4 h-4 mr-2" /> Workshops & Events
                            </TabsTrigger>
                            <TabsTrigger value="achievements" className="rounded-full px-6 py-2.5 text-sm font-bold data-[state=active]:bg-emerald-600 data-[state=active]:text-white transition-all">
                                <Trophy className="w-4 h-4 mr-2" /> Achievements
                            </TabsTrigger>
                            <TabsTrigger value="collaborations" className="rounded-full px-6 py-2.5 text-sm font-bold data-[state=active]:bg-slate-900 data-[state=active]:text-white transition-all">
                                <Handshake className="w-4 h-4 mr-2" /> MOUs
                            </TabsTrigger>
                        </TabsList>
                    </div>

                    {/* 1. TRENDS TAB */}
                    <TabsContent value="trends" className="space-y-8">
                        <div className="grid lg:grid-cols-3 gap-8">
                            <Card className="lg:col-span-2 rounded-[2rem] border-none shadow-xl shadow-slate-200/50 overflow-hidden">
                                <CardHeader className="bg-white border-b border-slate-100 pb-4">
                                    <CardTitle>Placement Analytics (3 Years)</CardTitle>
                                    <CardDescription>Comprehensive view of placement performance</CardDescription>
                                </CardHeader>
                                <CardContent className="bg-white pt-6">
                                    <div className="h-[400px] w-full">
                                        <ResponsiveContainer width="100%" height="100%">
                                            <ComposedChart data={trendData} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
                                                <defs>
                                                    <linearGradient id="colorPlaced" x1="0" y1="0" x2="0" y2="1">
                                                        <stop offset="5%" stopColor="#3b82f6" stopOpacity={0.8} />
                                                        <stop offset="95%" stopColor="#3b82f6" stopOpacity={0} />
                                                    </linearGradient>
                                                </defs>
                                                <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#f1f5f9" />
                                                <XAxis dataKey="year" axisLine={false} tickLine={false} tick={{ fill: '#64748b' }} dy={10} />
                                                <YAxis yAxisId="left" axisLine={false} tickLine={false} tick={{ fill: '#64748b' }} />
                                                <YAxis yAxisId="right" orientation="right" axisLine={false} tickLine={false} tick={{ fill: '#64748b' }} unit=" LPA" />
                                                <Tooltip
                                                    contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 15px -3px rgba(0, 0, 0, 0.1)' }}
                                                />
                                                <Legend wrapperStyle={{ paddingTop: '20px' }} />
                                                <Bar yAxisId="left" dataKey="placed" name="Placed Students" fill="url(#colorPlaced)" radius={[10, 10, 0, 0]} barSize={50} />
                                                <Line yAxisId="right" type="monotone" dataKey="highestPackage" name="Highest Pkg (LPA)" stroke="#ef4444" strokeWidth={3} dot={{ r: 6, fill: "#ef4444", strokeWidth: 2, stroke: "#fff" }} />
                                                <Line yAxisId="right" type="monotone" dataKey="avgPackage" name="Avg Pkg (LPA)" stroke="#10b981" strokeWidth={3} dot={{ r: 6, fill: "#10b981", strokeWidth: 2, stroke: "#fff" }} />
                                            </ComposedChart>
                                        </ResponsiveContainer>
                                    </div>
                                </CardContent>
                            </Card>

                            <div className="space-y-6">
                                <Card className="rounded-[2rem] bg-indigo-900 text-white border-none shadow-xl">
                                    <CardHeader>
                                        <CardTitle className="flex items-center gap-2 text-indigo-200"><Target className="w-5 h-5" /> Recent Recruiters</CardTitle>
                                    </CardHeader>
                                    <CardContent>
                                        <div className="flex flex-wrap gap-2">
                                            {["TCS", "Wipro", "Infosys", "Cognizant", "Accenture", "Capgemini"].map((company, i) => (
                                                <Badge key={i} variant="secondary" className="bg-indigo-800 text-indigo-100 hover:bg-indigo-700">{company}</Badge>
                                            ))}
                                        </div>
                                    </CardContent>
                                </Card>
                            </div>
                        </div>
                    </TabsContent>

                    {/* 2. INTERNSHIPS TAB */}
                    <TabsContent value="internships" className="space-y-6">
                        <Card className="rounded-[2rem] border-slate-200 shadow-sm overflow-hidden bg-white">
                            <CardHeader className="bg-slate-50/50 border-b border-slate-100">
                                <CardTitle className="flex items-center gap-2">
                                    <Briefcase className="w-5 h-5 text-purple-600" />
                                    Internship Records ({selectedYear})
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="p-0">
                                <Table>
                                    <TableHeader>
                                        <TableRow className="bg-slate-50/80 hover:bg-slate-50/80">
                                            <TableHead className="font-bold text-slate-700">Company</TableHead>
                                            <TableHead className="font-bold text-slate-700">Domain</TableHead>
                                            <TableHead className="font-bold text-slate-700">Duration</TableHead>
                                            <TableHead className="font-bold text-slate-700 text-right">Students</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {internships[selectedYear]?.length > 0 ? (
                                            internships[selectedYear].map((item: any, i: number) => (
                                                <TableRow key={i} className="hover:bg-slate-50">
                                                    <TableCell className="font-semibold text-slate-900">{item.company}</TableCell>
                                                    <TableCell><Badge variant="outline" className="text-slate-600 bg-slate-100">{item.domain}</Badge></TableCell>
                                                    <TableCell className="text-slate-600">{item.duration}</TableCell>
                                                    <TableCell className="text-right font-bold text-blue-600">{item.students}</TableCell>
                                                </TableRow>
                                            ))
                                        ) : (
                                            <TableRow>
                                                <TableCell colSpan={4} className="text-center py-8 text-slate-500 italic">No internship data available for {selectedYear}</TableCell>
                                            </TableRow>
                                        )}
                                    </TableBody>
                                </Table>
                            </CardContent>
                        </Card>
                    </TabsContent>

                    {/* 3. TRAINING TAB */}
                    <TabsContent value="training" className="space-y-6">
                        <Card className="rounded-[2rem] border-slate-200 shadow-sm overflow-hidden bg-white">
                            <CardHeader className="bg-slate-50/50 border-b border-slate-100">
                                <CardTitle className="flex items-center gap-2">
                                    <GraduationCap className="w-5 h-5 text-indigo-600" />
                                    Technical Training Programs ({selectedYear})
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="p-0">
                                <Table>
                                    <TableHeader>
                                        <TableRow className="bg-slate-50/80 hover:bg-slate-50/80">
                                            <TableHead className="font-bold text-slate-700">Topic / Technology</TableHead>
                                            <TableHead className="font-bold text-slate-700">Trainer / Organization</TableHead>
                                            <TableHead className="font-bold text-slate-700">Date</TableHead>
                                            <TableHead className="font-bold text-slate-700 whitespace-nowrap">Duration</TableHead>
                                            <TableHead className="font-bold text-slate-700 text-right">Participants</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {training[selectedYear]?.length > 0 ? (
                                            training[selectedYear].map((item: any, i: number) => (
                                                <TableRow key={i} className="hover:bg-slate-50">
                                                    <TableCell className="font-semibold text-slate-900">{item.topic}</TableCell>
                                                    <TableCell className="text-slate-600">{item.trainer}</TableCell>
                                                    <TableCell className="text-slate-600 whitespace-nowrap">{item.date}</TableCell>
                                                    <TableCell className="text-slate-600">{item.duration}</TableCell>
                                                    <TableCell className="text-right font-bold text-indigo-600">{item.students}</TableCell>
                                                </TableRow>
                                            ))
                                        ) : (
                                            <TableRow>
                                                <TableCell colSpan={5} className="text-center py-8 text-slate-500 italic">No training data available for {selectedYear}</TableCell>
                                            </TableRow>
                                        )}
                                    </TableBody>
                                </Table>
                            </CardContent>
                        </Card>
                    </TabsContent>

                    {/* 4. ACTIVITIES TAB (Guest Lectures & Events) */}
                    <TabsContent value="activities" className="space-y-8">
                        {/* Guest Lectures */}
                        <Card className="rounded-[2rem] border-slate-200 shadow-sm overflow-hidden bg-white">
                            <CardHeader className="bg-slate-50/50 border-b border-slate-100">
                                <CardTitle className="flex items-center gap-2">
                                    <Mic2 className="w-5 h-5 text-amber-600" />
                                    Guest Lectures, Workshops & Seminars ({selectedYear})
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="p-0">
                                <Table>
                                    <TableHeader>
                                        <TableRow className="bg-slate-50/80 hover:bg-slate-50/80">
                                            <TableHead className="font-bold text-slate-700">Event Title</TableHead>
                                            <TableHead className="font-bold text-slate-700">Type</TableHead>
                                            <TableHead className="font-bold text-slate-700">Resource Person</TableHead>
                                            <TableHead className="font-bold text-slate-700 text-right">Date</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {lectures[selectedYear]?.length > 0 ? (
                                            lectures[selectedYear].map((item: any, i: number) => (
                                                <TableRow key={i} className="hover:bg-slate-50">
                                                    <TableCell className="font-semibold text-slate-900">{item.title}</TableCell>
                                                    <TableCell><Badge variant="secondary" className="bg-amber-100 text-amber-700">{item.type}</Badge></TableCell>
                                                    <TableCell className="text-slate-600">{item.resourcePerson}</TableCell>
                                                    <TableCell className="text-right text-slate-600 font-medium whitespace-nowrap">{item.date}</TableCell>
                                                </TableRow>
                                            ))
                                        ) : (
                                            <TableRow>
                                                <TableCell colSpan={4} className="text-center py-8 text-slate-500 italic">No activities found for {selectedYear}</TableCell>
                                            </TableRow>
                                        )}
                                    </TableBody>
                                </Table>
                            </CardContent>
                        </Card>

                        {/* Events (Fests/Celebrations) - Only show if data exists */}
                        {events[selectedYear]?.length > 0 && (
                            <div className="grid md:grid-cols-2 gap-6">
                                {events[selectedYear].map((event: any, i: number) => (
                                    <Card key={i} className="rounded-2xl border-slate-200 shadow-sm hover:shadow-md transition-all">
                                        <CardHeader className="pb-3">
                                            <div className="flex justify-between items-start">
                                                <Badge className="bg-rose-500">{event.type}</Badge>
                                                <span className="text-sm font-bold text-slate-400">{event.date}</span>
                                            </div>
                                            <CardTitle className="mt-4 text-xl">{event.name}</CardTitle>
                                        </CardHeader>
                                        <CardContent>
                                            <p className="text-slate-600 leading-relaxed">{event.description}</p>
                                        </CardContent>
                                    </Card>
                                ))}
                            </div>
                        )}
                    </TabsContent>


                    {/* 5. ACHIEVEMENTS TAB */}
                    <TabsContent value="achievements" className="space-y-6">
                        <Card className="rounded-[2rem] border-slate-200 shadow-sm overflow-hidden bg-white">
                            <CardHeader className="bg-slate-50/50 border-b border-slate-100">
                                <CardTitle className="flex items-center gap-2">
                                    <Trophy className="w-5 h-5 text-emerald-600" />
                                    Student Achievements & Awards ({selectedYear})
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="p-0">
                                <Table>
                                    <TableHeader>
                                        <TableRow className="bg-slate-50/80 hover:bg-slate-50/80">
                                            <TableHead className="font-bold text-slate-700">Student Name</TableHead>
                                            <TableHead className="font-bold text-slate-700">Event / Competition</TableHead>
                                            <TableHead className="font-bold text-slate-700">Achievement / Prize</TableHead>
                                            <TableHead className="font-bold text-slate-700 text-right">Level</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {achievements[selectedYear]?.length > 0 ? (
                                            achievements[selectedYear].map((item: any, i: number) => (
                                                <TableRow key={i} className="hover:bg-slate-50">
                                                    <TableCell className="font-bold text-slate-900">{item.student}</TableCell>
                                                    <TableCell className="text-slate-600">{item.event}</TableCell>
                                                    <TableCell><Badge variant="outline" className="text-emerald-600 border-emerald-200 bg-emerald-50">{item.prize}</Badge></TableCell>
                                                    <TableCell className="text-right text-slate-600 font-medium">{item.level}</TableCell>
                                                </TableRow>
                                            ))
                                        ) : (
                                            <TableRow>
                                                <TableCell colSpan={4} className="text-center py-8 text-slate-500 italic">No achievements recorded for {selectedYear}</TableCell>
                                            </TableRow>
                                        )}
                                    </TableBody>
                                </Table>
                            </CardContent>
                        </Card>
                    </TabsContent>

                    {/* 6. COLLABORATIONS (MOUs) TAB */}
                    <TabsContent value="collaborations" className="space-y-6">
                        <Card className="rounded-[2rem] border-slate-200 shadow-sm overflow-hidden bg-white">
                            <CardHeader className="bg-slate-50/50 border-b border-slate-100">
                                <CardTitle className="flex items-center gap-2">
                                    <Handshake className="w-5 h-5 text-slate-900" />
                                    Active Industry MOUs & Partnerships ({selectedYear})
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="p-0">
                                <Table>
                                    <TableHeader>
                                        <TableRow className="bg-slate-50/80 hover:bg-slate-50/80">
                                            <TableHead className="font-bold text-slate-700">Organization</TableHead>
                                            <TableHead className="font-bold text-slate-700">Collaboration Type</TableHead>
                                            <TableHead className="font-bold text-slate-700">Location</TableHead>
                                            <TableHead className="font-bold text-slate-700 text-right">Signed Date</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {mouByYear[selectedYear]?.length > 0 ? (
                                            mouByYear[selectedYear].map((item: any, i: number) => (
                                                <TableRow key={i} className="hover:bg-slate-50">
                                                    <TableCell className="font-bold text-slate-900">{item.name}</TableCell>
                                                    <TableCell className="text-slate-600">{item.type}</TableCell>
                                                    <TableCell className="text-slate-600 flex items-center gap-1">
                                                        <MapPin className="w-3 h-3 text-slate-400" /> {item.loc}
                                                    </TableCell>
                                                    <TableCell className="text-right text-slate-600 font-mono text-xs">{item.date}</TableCell>
                                                </TableRow>
                                            ))
                                        ) : (
                                            <TableRow>
                                                <TableCell colSpan={4} className="text-center py-8 text-slate-500 italic">No new MOUs signed in {selectedYear}</TableCell>
                                            </TableRow>
                                        )}
                                    </TableBody>
                                </Table>
                            </CardContent>
                        </Card>
                    </TabsContent>

                </Tabs>
            </div>
        </div>
    );
}
