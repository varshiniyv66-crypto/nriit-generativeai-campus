"use client";

import { useParams } from "next/navigation";
import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { User, Calendar, Award, ArrowRight, Target, BookOpen, TrendingUp, Users, Briefcase, GraduationCap, Brain, LineChart as ChartIcon } from "lucide-react";
import { BarChart, Bar, LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, AreaChart, Area } from 'recharts';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Progress } from "@/components/ui/progress";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { FacultyDirectoryButton } from "@/components/department/FacultyDirectoryButton";
import { YearWisePlacementsButton } from "@/components/department/YearWisePlacementsButton";
import { PlacementComparativeAnalysis } from "@/components/department/PlacementComparativeAnalysis";

const DEPARTMENTS: Record<string, {
    name: string;
    fullName: string;
    shortName: string;
    color: string;
    established: number;
    bannerImage: string;
}> = {
    'CSE': {
        name: 'Computer Science & Engineering',
        fullName: 'Department of Computer Science and Engineering',
        shortName: 'CSE',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2001,
        bannerImage: '/banners/cse.png',
    },
    'CSE-DS': {
        name: 'CSE (Data Science)',
        fullName: 'Department of Computer Science and Engineering (Data Science)',
        shortName: 'CSE-DS',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2020,
        bannerImage: '/banners/cse.png', // Reusing CSE for DS
    },
    'CSE-AI': {
        name: 'CSE (AI & ML)',
        fullName: 'Department of Computer Science and Engineering (AI & ML)',
        shortName: 'CSE-AI',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2020,
        bannerImage: '/banners/cse.png', // Reusing CSE for AI
    },
    'IT': {
        name: 'Information Technology',
        fullName: 'Department of Information Technology',
        shortName: 'IT',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2001,
        bannerImage: '/banners/it.png',
    },
    'ECE': {
        name: 'Electronics & Communication',
        fullName: 'Department of Electronics and Communication Engineering',
        shortName: 'ECE',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2001,
        bannerImage: '/banners/ece.png',
    },
    'CIVIL': {
        name: 'Civil Engineering',
        fullName: 'Department of Civil Engineering',
        shortName: 'CIVIL',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2008,
        bannerImage: '/banners/civil.png',
    },
    'MBA': {
        name: 'Master of Business Administration',
        fullName: 'Department of MBA',
        shortName: 'MBA',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2009,
        bannerImage: '/banners/mba.png',
    },
    'MCA': {
        name: 'Master of Computer Applications',
        fullName: 'Department of MCA',
        shortName: 'MCA',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2005,
        bannerImage: '/banners/mca.png',
    },
    'BSH': {
        name: 'Basic Sciences & Humanities',
        fullName: 'Department of Basic Sciences and Humanities',
        shortName: 'BSH',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2001,
        bannerImage: '/banners/civil.png', // Fallback for General Sciences
    },
    'EVT': {
        name: 'EVT',
        fullName: 'Department of EVT',
        shortName: 'EVT',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2024,
        bannerImage: '/banners/ece.png', // Fallback
    },
    'MTECH': {
        name: 'M.Tech Programs',
        fullName: 'Department of M.Tech (Structural Eng, CSE, DECS)',
        shortName: 'MTECH',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2010,
        bannerImage: '/banners/cse.png', // Fallback
    },
};

export default function DepartmentHome() {
    const params = useParams();
    const deptParam = (params.dept as string || '').toUpperCase();
    const deptData = DEPARTMENTS[deptParam];

    const [visionMission, setVisionMission] = useState<any>(null);
    const [admissions, setAdmissions] = useState<any[]>([]);
    const [placements, setPlacements] = useState<any[]>([]);
    const [attainment, setAttainment] = useState<any[]>([]);
    const [mentoring, setMentoring] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchData = async () => {
            if (!deptParam) return;

            try {
                // 1. Get Department ID
                const { data: dept }: { data: any } = await supabase
                    .from('departments')
                    .select('id, code')
                    .eq('code', deptParam)
                    .single();

                if (dept) {
                    const deptId = (dept as any).id;
                    // Fetch all data in parallel
                    const [vmRes, admRes, placeRes, attRes, mentRes] = await Promise.all([
                        supabase.from('nba_program_details').select('*').eq('department_id', deptId).single(),
                        supabase.from('nba_admissions').select('*').eq('department_id', deptId).order('academic_year', { ascending: true }),
                        supabase.from('nba_placements').select('*').eq('department_id', deptId).order('academic_year', { ascending: true }),
                        supabase.from('nba_attainment_summary').select('*').eq('department_id', deptId).order('po_code', { ascending: true }),
                        supabase.from('nba_mentoring_impact').select('*').eq('department_id', deptId).order('academic_year', { ascending: true })
                    ]);

                    if ((vmRes as any).data) setVisionMission((vmRes as any).data);
                    if ((admRes as any).data) setAdmissions((admRes as any).data);
                    if ((placeRes as any).data) setPlacements((placeRes as any).data);
                    if ((attRes as any).data) setAttainment((attRes as any).data);
                    if ((mentRes as any).data) setMentoring((mentRes as any).data);
                }
            } catch (error) {
                console.error("Error fetching dept data:", error);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [deptParam]);

    if (!deptData) return <div className="p-8 text-center text-xl text-gray-500">Department Not Found</div>;

    return (
        <div className="space-y-8 animate-fade-in-up">
            {/* Custom Navy+Gold+Lavender Premium Banner */}
            <div className="relative h-72 md:h-96 rounded-3xl overflow-hidden shadow-2xl ring-1 ring-[#E5A818]/30 group">
                {/* 1. Underlying Tech Image with Ken Burns Effect */}
                <div
                    className="absolute inset-0 bg-cover bg-center transition-transform duration-[20s] ease-linear group-hover:scale-110"
                    style={{ backgroundImage: `url(${deptData.bannerImage})` }}
                />

                {/* 2. Navy Blue Color Overlay (Gradient to Transparent) */}
                <div className="absolute inset-0 bg-gradient-to-r from-[#1E4080] via-[#1E4080]/90 to-transparent mix-blend-multiply" />
                <div className="absolute inset-0 bg-gradient-to-r from-[#1E4080] via-[#1E4080]/80 to-transparent" />

                {/* 3. Gold Accent Stripe */}
                <div className="absolute top-0 left-0 w-full h-2 bg-[#E5A818] shadow-[0_0_15px_#E5A818]" />
                <div className="absolute bottom-0 left-0 w-full h-1 bg-gradient-to-r from-[#E5A818] to-transparent opacity-60" />

                {/* 4. Animated Tech Elements Overlay */}
                <div className="absolute inset-0 opacity-20 bg-[url('/grid-pattern.svg')] mix-blend-overlay animate-pulse-slow" />

                {/* 5. Content */}
                <div className="absolute inset-0 flex flex-col justify-center px-8 md:px-16 z-10">
                    <div className="space-y-6 max-w-4xl transform transition-all duration-700 translate-x-0">
                        <div className="flex items-center gap-3 animate-fade-in-right">
                            <Badge className="bg-[#E5A818] text-[#1E4080] hover:bg-[#D49605] border-none px-4 py-1.5 text-sm tracking-widest font-bold shadow-lg">
                                ESTD. {deptData.established}
                            </Badge>
                            <Badge variant="outline" className="text-white border-white/40 backdrop-blur-md px-4 py-1.5 text-sm tracking-wider uppercase font-medium">
                                AUTONOMOUS • NAAC A+ GRADE
                            </Badge>
                        </div>

                        <h1 className="text-5xl md:text-7xl font-black text-white drop-shadow-lg tracking-tight leading-tight">
                            {deptData.shortName} <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#E5A818] to-[#FCD34D] block text-3xl md:text-5xl mt-2 font-bold">{deptData.name}</span>
                        </h1>

                        <p className="text-lg md:text-xl text-[#E8E4F0] max-w-2xl font-light leading-relaxed border-l-4 border-[#E5A818] pl-6 py-2 bg-[#1E4080]/30 backdrop-blur-sm rounded-r-lg">
                            {deptData.fullName}
                        </p>

                        <div className="pt-4 flex flex-wrap items-center gap-4 animate-fade-in delay-500">
                            <FacultyDirectoryButton department={deptParam} />
                            <YearWisePlacementsButton department={deptParam} />
                        </div>
                    </div>
                </div>
            </div>

            <Tabs defaultValue="overview" className="space-y-8">
                <TabsList className="grid w-full grid-cols-2 md:grid-cols-5 h-auto p-1.5 bg-[#EFF6FF] backdrop-blur-sm border border-blue-100 rounded-xl">
                    <TabsTrigger value="overview" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Overview</TabsTrigger>
                    <TabsTrigger value="admissions" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Admissions</TabsTrigger>
                    <TabsTrigger value="placements" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Placements</TabsTrigger>
                    <TabsTrigger value="outcomes" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Outcomes</TabsTrigger>
                    <TabsTrigger value="mentoring" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Mentoring</TabsTrigger>
                </TabsList>

                <TabsContent value="overview" className="space-y-8">
                    <Card className="border-t-4 border-t-[#1E3A8A] shadow-lg bg-white">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2 text-xl text-[#1E3A5F]">
                                <Target className="w-6 h-6 text-[#3B82F6]" />
                                Vision & Mission
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-6">
                            <div className="bg-gradient-to-r from-[#EFF6FF] to-transparent p-6 rounded-xl border border-blue-100">
                                <Badge className="mb-3 bg-[#1E3A8A] text-white hover:bg-[#1E3A8A]">Vision</Badge>
                                <p className="text-[#1E3A5F] text-lg leading-relaxed font-medium">
                                    {visionMission?.vision || "To be a premier department creating globally competent professionals..."}
                                </p>
                            </div>
                            <div className="bg-gradient-to-r from-[#EFF6FF] to-transparent p-6 rounded-xl border border-blue-100">
                                <Badge className="mb-3 bg-[#3B82F6] text-white hover:bg-[#3B82F6]">Mission</Badge>
                                <p className="text-[#1E3A5F] text-lg leading-relaxed font-medium">
                                    {visionMission?.mission || "M1: To provide quality education... M2: To foster innovation..."}
                                </p>
                            </div>
                        </CardContent>
                    </Card>

                    <div className="grid md:grid-cols-2 gap-8">
                        <Card className="hover:shadow-lg transition-shadow border-l-4 border-l-[#3B82F6] bg-white">
                            <CardHeader><CardTitle className="text-base flex gap-2 text-[#1E3A5F]"><Briefcase className="w-5 h-5 text-[#3B82F6]" />Placements Highlight</CardTitle></CardHeader>
                            <CardContent>
                                <div className="text-3xl font-bold text-[#1E3A8A]">
                                    {placements.length > 0 ? `${placements[placements.length - 1].avg_package} LPA` : "Pending Data"}
                                </div>
                                <p className="text-sm text-[#64748B]">Average Package (Latest)</p>
                            </CardContent>
                        </Card>
                        <Card className="hover:shadow-lg transition-shadow border-l-4 border-l-[#60A5FA] bg-white">
                            <CardHeader><CardTitle className="text-base flex gap-2 text-[#1E3A5F]"><GraduationCap className="w-5 h-5 text-[#60A5FA]" />Admissions Highlight</CardTitle></CardHeader>
                            <CardContent>
                                <div className="text-3xl font-bold text-[#1E3A8A]">
                                    {admissions.length > 0 ? `${((admissions[admissions.length - 1].admitted_count / admissions[admissions.length - 1].sanctioned_intake) * 100).toFixed(1)}%` : "Pending Data"}
                                </div>
                                <p className="text-sm text-[#64748B]">Fill Rate (Latest Year)</p>
                            </CardContent>
                        </Card>
                    </div>
                </TabsContent>

                {/* ADMISSIONS TAB */}
                <TabsContent value="admissions" className="space-y-8">
                    <Card className="shadow-lg border-t-4 border-t-[#1E3A8A] bg-white">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2 text-[#1E3A5F]">
                                <TrendingUp className="w-5 h-5 text-[#3B82F6]" />
                                Intake vs Admitted Trends
                            </CardTitle>
                        </CardHeader>
                        <CardContent>
                            <div className="h-[400px]">
                                {admissions.length > 0 ? (
                                    <ResponsiveContainer width="100%" height="100%">
                                        <BarChart data={admissions} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
                                            <CartesianGrid strokeDasharray="3 3" vertical={false} opacity={0.3} />
                                            <XAxis dataKey="academic_year" />
                                            <YAxis />
                                            <Tooltip contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 15px -3px rgba(0, 0, 0, 0.1)' }} />
                                            <Legend />
                                            <Bar dataKey="sanctioned_intake" name="Sanctioned" fill="#60A5FA" radius={[4, 4, 0, 0]} barSize={30} />
                                            <Bar dataKey="admitted_count" name="Admitted" fill="#1E3A8A" radius={[4, 4, 0, 0]} barSize={30} />
                                        </BarChart>
                                    </ResponsiveContainer>
                                ) : <div className="flex h-full items-center justify-center text-[#64748B]">No Data Available</div>}
                            </div>
                        </CardContent>
                    </Card>
                </TabsContent>

                {/* PLACEMENTS TAB */}
                <TabsContent value="placements" className="space-y-12">
                    {/* Comparative Analysis Section */}
                    <PlacementComparativeAnalysis department={deptParam} />

                    {/* Original Database-driven Chart */}
                    <Card className="shadow-lg border-t-4 border-t-[#3B82F6] bg-white mt-12">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2 text-[#1E3A5F]">
                                <Briefcase className="w-5 h-5 text-[#1E3A8A]" />
                                Salary Package Trends (LPA)
                            </CardTitle>
                        </CardHeader>
                        <CardContent>
                            <div className="h-[400px]">
                                {placements.length > 0 ? (
                                    <ResponsiveContainer width="100%" height="100%">
                                        <AreaChart data={placements} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
                                            <defs>
                                                <linearGradient id="colorMax" x1="0" y1="0" x2="0" y2="1">
                                                    <stop offset="5%" stopColor="#1E3A8A" stopOpacity={0.8} />
                                                    <stop offset="95%" stopColor="#1E3A8A" stopOpacity={0} />
                                                </linearGradient>
                                                <linearGradient id="colorAvg" x1="0" y1="0" x2="0" y2="1">
                                                    <stop offset="5%" stopColor="#60A5FA" stopOpacity={0.8} />
                                                    <stop offset="95%" stopColor="#60A5FA" stopOpacity={0} />
                                                </linearGradient>
                                            </defs>
                                            <XAxis dataKey="academic_year" />
                                            <YAxis />
                                            <CartesianGrid strokeDasharray="3 3" vertical={false} opacity={0.3} />
                                            <Tooltip contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 15px -3px rgba(0, 0, 0, 0.1)' }} />
                                            <Legend />
                                            <Area type="monotone" dataKey="max_package" stroke="#1E3A8A" fillOpacity={1} fill="url(#colorMax)" name="Highest Package" />
                                            <Area type="monotone" dataKey="avg_package" stroke="#60A5FA" fillOpacity={1} fill="url(#colorAvg)" name="Average Package" />
                                        </AreaChart>
                                    </ResponsiveContainer>
                                ) : <div className="flex h-full items-center justify-center text-[#64748B]">No Data Available</div>}
                            </div>
                        </CardContent>
                    </Card>
                </TabsContent>

                {/* OUTCOMES TAB */}
                <TabsContent value="outcomes" className="space-y-8">
                    <Card className="shadow-lg">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <ChartIcon className="w-5 h-5 text-orange-600" />
                                Program Outcomes (PO) Attainment
                            </CardTitle>
                            <CardDescription>Target vs Attained Levels (Scale of 3.0)</CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-6">
                            {attainment.length > 0 ? attainment.map((po) => (
                                <div key={po.id} className="space-y-2">
                                    <div className="flex justify-between items-center text-sm font-medium">
                                        <span className="text-gray-700">{po.po_code}</span>
                                        <span className="text-gray-500">{po.attained_level} / {po.target_level}</span>
                                    </div>
                                    <div className="relative pt-1">
                                        <Progress value={(po.attained_level / 3) * 100} className="h-3" />
                                        {/* Target Marker could act like a vertical line, but simple progress is good */}
                                    </div>
                                </div>
                            )) : <div className="text-center py-10 text-gray-500">No Attainment Data Found</div>}
                        </CardContent>
                    </Card>
                </TabsContent>

                {/* MENTORING TAB */}
                <TabsContent value="mentoring" className="space-y-8">
                    <Card className="shadow-lg">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <Brain className="w-5 h-5 text-pink-600" />
                                Mentoring Impact
                            </CardTitle>
                            <CardDescription>Transformation of Weak Learners to Advanced Learners</CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="overflow-hidden rounded-lg border border-gray-200">
                                <Table>
                                    <TableHeader>
                                        <TableRow className="bg-gray-50 hover:bg-gray-50">
                                            <TableHead>Academic Year</TableHead>
                                            <TableHead className="text-right">Weak Learners ID'd</TableHead>
                                            <TableHead className="text-right">Improved</TableHead>
                                            <TableHead className="text-right">Success Rate</TableHead>
                                            <TableHead>Remedial Actions</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {mentoring.map((m) => (
                                            <TableRow key={m.id}>
                                                <TableCell className="font-medium">{m.academic_year}</TableCell>
                                                <TableCell className="text-right text-red-600">{m.weak_learners_identified}</TableCell>
                                                <TableCell className="text-right text-green-600">{m.weak_learners_improved}</TableCell>
                                                <TableCell className="text-right font-bold">
                                                    {((m.weak_learners_improved / m.weak_learners_identified) * 100).toFixed(1)}%
                                                </TableCell>
                                                <TableCell className="text-gray-600 italic">{m.actions_taken}</TableCell>
                                            </TableRow>
                                        ))}
                                    </TableBody>
                                </Table>
                            </div>
                        </CardContent>
                    </Card>
                </TabsContent>
            </Tabs>
        </div>
    );
}
