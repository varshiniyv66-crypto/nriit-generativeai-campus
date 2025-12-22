
"use client";

import { useParams } from "next/navigation";
import { departments as staticDepartments } from "@/data/departments";
import { DEPARTMENT_EVENTS } from "@/data/events-data";
import { Calendar, MapPin, Clock, ArrowRight, Filter, Search, History, Trophy, Mic2, MonitorPlay, BookOpen, Users, Sparkles } from "lucide-react";
import { motion } from "framer-motion";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

export default function EventsPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();

    // Fetch Dynamic Data based on Department Code
    const deptEventsData = DEPARTMENT_EVENTS[deptCode.toLowerCase()] || DEPARTMENT_EVENTS['cse'];

    const events = deptEventsData.upcomingEvents;
    const featuredPastEvents = deptEventsData.featuredPastEvents;
    const academicStats = deptEventsData.academicStats;
    const sportsStats = deptEventsData.sportsStats;

    const deptInfo = staticDepartments[deptCode.toLowerCase()];

    return (
        <div className="min-h-screen bg-[#FDFCF8] text-slate-900 font-sans pb-20 selection:bg-rose-100">
            {/* 1. HERO SECTION: Stunning Light Theme */}
            <div className="relative pt-24 pb-20 px-6 overflow-hidden">
                {/* Luminous Background Mesh */}
                <div className="absolute top-[-20%] right-[-10%] w-[800px] h-[800px] bg-gradient-to-b from-rose-100/40 via-pink-50/20 to-transparent rounded-full blur-[120px] opacity-60 pointer-events-none" />
                <div className="absolute top-[20%] left-[-10%] w-[600px] h-[600px] bg-gradient-to-r from-blue-50/50 to-indigo-50/30 rounded-full blur-[100px] opacity-50 pointer-events-none" />

                <div className="container mx-auto relative z-10 text-center">
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="inline-flex items-center gap-2 mb-6"
                    >
                        <Badge variant="outline" className="bg-white/80 backdrop-blur-md px-4 py-1.5 rounded-full border-slate-200 text-slate-500 font-bold tracking-widest uppercase">
                            Departmental Hub
                        </Badge>
                        <span className="w-1 h-1 bg-slate-300 rounded-full" />
                        <span className="text-xs font-bold text-rose-500 uppercase tracking-widest">Life at {deptCode}</span>
                    </motion.div>

                    <motion.h1
                        initial={{ opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        className="text-5xl md:text-7xl font-black text-slate-900 tracking-tighter mb-6"
                    >
                        Events & <span className="text-transparent bg-clip-text bg-gradient-to-r from-rose-500 to-orange-500">Culture</span>
                    </motion.h1>

                    <motion.p
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: 0.2 }}
                        className="text-lg md:text-xl text-slate-500 max-w-2xl mx-auto font-medium leading-relaxed"
                    >
                        From <span className="text-slate-900 font-bold">Code Hunts</span> to <span className="text-slate-900 font-bold">Cultural Fests</span>, explore the vibrant student life driven by our Academic and Sports clubs.
                    </motion.p>
                </div>
            </div>

            <div className="container mx-auto px-6 max-w-7xl">

                <Tabs defaultValue="upcoming" className="space-y-12">
                    <div className="flex justify-center">
                        <TabsList className="bg-white p-1 rounded-full border border-slate-200 shadow-sm h-auto">
                            <TabsTrigger value="upcoming" className="rounded-full px-8 py-3 text-sm font-bold data-[state=active]:bg-rose-500 data-[state=active]:text-white transition-all">
                                Upcoming Events
                            </TabsTrigger>
                            <TabsTrigger value="past" className="rounded-full px-8 py-3 text-sm font-bold data-[state=active]:bg-slate-900 data-[state=active]:text-white transition-all">
                                Event Archive
                            </TabsTrigger>
                            <TabsTrigger value="clubs" className="rounded-full px-8 py-3 text-sm font-bold data-[state=active]:bg-blue-600 data-[state=active]:text-white transition-all">
                                Club Activities
                            </TabsTrigger>
                        </TabsList>
                    </div>

                    {/* UPCOMING EVENTS */}
                    <TabsContent value="upcoming">
                        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                            {/* Featured Upcoming */}
                            <motion.div
                                initial={{ opacity: 0, y: 20 }}
                                animate={{ opacity: 1, y: 0 }}
                                className="col-span-full bg-slate-900 rounded-[2.5rem] p-8 md:p-12 relative overflow-hidden text-white group"
                            >
                                <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/stardust.png')] opacity-10"></div>
                                <div className="absolute top-0 right-0 w-96 h-96 bg-rose-500/20 rounded-full blur-[100px] group-hover:bg-rose-500/30 transition-colors"></div>

                                <div className="relative z-10 flex flex-col md:flex-row justify-between items-start md:items-end gap-8">
                                    <div>
                                        <Badge className="bg-rose-500 hover:bg-rose-600 text-white border-none mb-4 px-3 py-1 text-sm">Main Event</Badge>
                                        <h3 className="text-4xl md:text-5xl font-black mb-4 leading-tight">National Tech Symposium 2025</h3>
                                        <div className="flex flex-wrap gap-6 text-slate-300 font-medium font-mono text-sm">
                                            <span className="flex items-center gap-2"><Calendar className="w-4 h-4 text-rose-400" /> March 15, 2025</span>
                                            <span className="flex items-center gap-2"><Clock className="w-4 h-4 text-rose-400" /> 09:00 AM</span>
                                            <span className="flex items-center gap-2"><MapPin className="w-4 h-4 text-rose-400" /> Main Auditorium</span>
                                        </div>
                                    </div>
                                    <Button className="bg-white text-slate-900 hover:bg-rose-50 rounded-full px-8 py-6 font-bold text-lg shadow-lg hover:shadow-rose-500/20 transition-all">
                                        Register Now <ArrowRight className="ml-2 w-5 h-5" />
                                    </Button>
                                </div>
                            </motion.div>

                            {/* Standard Upcoming */}
                            {events.map((event) => (
                                <motion.div
                                    key={event.id}
                                    whileHover={{ y: -10 }}
                                    className="bg-white rounded-[2rem] p-6 border border-slate-100 shadow-sm hover:shadow-xl transition-all group"
                                >
                                    <div className="mb-6 relative">
                                        <div className="aspect-video bg-slate-100 rounded-2xl overflow-hidden">
                                            <div className={`w-full h-full bg-gradient-to-br ${event.category === 'Workshop' ? 'from-blue-500/10 to-blue-500/5' : 'from-rose-500/10 to-rose-500/5'} group-hover:scale-110 transition-transform duration-500`} />
                                        </div>
                                        <div className="absolute top-4 left-4 bg-white/90 backdrop-blur text-slate-900 font-bold rounded-lg px-3 py-1 text-xs uppercase tracking-wider shadow-sm">
                                            {event.date}
                                        </div>
                                    </div>
                                    <h4 className="text-xl font-bold text-slate-900 mb-2 group-hover:text-rose-600 transition-colors">{event.title}</h4>
                                    <p className="text-slate-500 text-sm mb-4 line-clamp-2">{event.description}</p>
                                    <div className="flex items-center gap-2 text-xs font-bold text-slate-400 uppercase tracking-wider">
                                        <MapPin className="w-3 h-3" /> {event.location}
                                    </div>
                                </motion.div>
                            ))}
                        </div>
                    </TabsContent>

                    {/* PAST ARCHIVES (SAR DATA) */}
                    <TabsContent value="past">
                        <div className="space-y-12">
                            {/* Featured Grid */}
                            <div>
                                <h3 className="text-2xl font-black text-slate-900 mb-6 flex items-center gap-3">
                                    <History className="w-6 h-6 text-slate-400" /> Recent Highlights (Verified Records)
                                </h3>
                                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                                    {featuredPastEvents.map((ev, i) => (
                                        <motion.div
                                            key={i}
                                            initial={{ opacity: 0, scale: 0.9 }}
                                            whileInView={{ opacity: 1, scale: 1 }}
                                            viewport={{ once: true }}
                                            transition={{ delay: i * 0.1 }}
                                            className="bg-white rounded-2xl p-6 border border-slate-100 shadow-sm hover:shadow-md transition-all text-center"
                                        >
                                            <div className="w-12 h-12 bg-rose-50 text-rose-500 rounded-full flex items-center justify-center mx-auto mb-4">
                                                <Trophy className="w-6 h-6" />
                                            </div>
                                            <Badge variant="secondary" className="mb-3">{ev.year}</Badge>
                                            <h4 className="font-bold text-lg text-slate-900 mb-1">{ev.title}</h4>
                                            <p className="text-xs text-slate-500 font-mono mb-2 uppercase tracking-wide">{ev.category}</p>
                                            <div className="text-[10px] text-slate-400">Coord: {ev.coordinator}</div>
                                        </motion.div>
                                    ))}
                                </div>
                            </div>

                            {/* Detailed Logs Table (Academic Club) */}
                            <Card className="border-none shadow-xl bg-slate-900 text-white rounded-[2rem] overflow-hidden">
                                <CardHeader className="bg-slate-800/50 p-8">
                                    <CardTitle className="text-2xl">Consolidated Event Statistics</CardTitle>
                                    <CardDescription className="text-slate-400">Detailed breakdown of Academic Club activities (Workshops, Lectures, Seminars) over the last 4 years (Official Records)</CardDescription>
                                </CardHeader>
                                <CardContent className="p-0">
                                    <div className="overflow-x-auto">
                                        <table className="w-full text-left">
                                            <thead className="bg-slate-800 text-slate-300 text-xs uppercase tracking-wider">
                                                <tr>
                                                    <th className="px-8 py-5">Academic Year</th>
                                                    <th className="px-8 py-5 text-center text-purple-400">Workshops</th>
                                                    <th className="px-8 py-5 text-center text-pink-400">Guest Lectures</th>
                                                    <th className="px-8 py-5 text-center text-blue-400">Seminars</th>
                                                    <th className="px-8 py-5 text-right font-bold text-white">Total Events</th>
                                                </tr>
                                            </thead>
                                            <tbody className="divide-y divide-slate-800 text-sm">
                                                {academicStats.map((row, i) => (
                                                    <tr key={i} className="hover:bg-slate-800/50 transition-colors">
                                                        <td className="px-8 py-5 font-bold font-mono text-slate-300">{row.year}</td>
                                                        <td className="px-8 py-5 text-center font-bold">{row.workshops}</td>
                                                        <td className="px-8 py-5 text-center font-bold">{row.lectures}</td>
                                                        <td className="px-8 py-5 text-center font-bold">{row.seminars}</td>
                                                        <td className="px-8 py-5 text-right font-black text-lg">{row.workshops + row.lectures + row.seminars}</td>
                                                    </tr>
                                                ))}
                                            </tbody>
                                        </table>
                                    </div>
                                </CardContent>
                            </Card>
                        </div>
                    </TabsContent>

                    {/* CLUB ACTIVITIES */}
                    <TabsContent value="clubs">
                        <div className="grid md:grid-cols-2 gap-8">
                            {/* Academic Club */}
                            <Card className="rounded-[2rem] border-slate-100 shadow-lg">
                                <CardHeader>
                                    <CardTitle className="flex items-center gap-3"><BookOpen className="w-6 h-6 text-purple-600" /> Academic Club</CardTitle>
                                    <CardDescription>Focuses on technical skill enhacement through Workshops and Seminars.</CardDescription>
                                </CardHeader>
                                <CardContent>
                                    <div className="space-y-4">
                                        {academicStats.slice(0, 3).map((stat, i) => (
                                            <div key={i} className="flex justify-between items-center p-3 rounded-xl bg-slate-50">
                                                <span className="font-bold text-slate-700">{stat.year}</span>
                                                <div className="flex gap-2">
                                                    <Badge className="bg-purple-100 text-purple-700 hover:bg-purple-200">{stat.workshops} Workshops</Badge>
                                                    <Badge className="bg-blue-100 text-blue-700 hover:bg-blue-200">{stat.lectures} Lectures</Badge>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </CardContent>
                            </Card>

                            {/* Sports Club */}
                            <Card className="rounded-[2rem] border-slate-100 shadow-lg">
                                <CardHeader>
                                    <CardTitle className="flex items-center gap-3"><Trophy className="w-6 h-6 text-rose-600" /> Sports Club</CardTitle>
                                    <CardDescription>Promotes physical fitness and team spirit through Intra and Inter-college tournaments.</CardDescription>
                                </CardHeader>
                                <CardContent>
                                    <div className="space-y-4">
                                        {sportsStats.map((stat, i) => (
                                            <div key={i} className="flex justify-between items-center p-3 rounded-xl bg-slate-50">
                                                <span className="font-bold text-slate-700">{stat.year}</span>
                                                <Badge className="bg-rose-100 text-rose-700 hover:bg-rose-200">{stat.count} Major Events</Badge>
                                            </div>
                                        ))}
                                    </div>
                                </CardContent>
                            </Card>
                        </div>
                    </TabsContent>
                </Tabs>

            </div>
        </div>
    );
}
