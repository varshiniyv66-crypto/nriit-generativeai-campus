"use client";

import { useParams } from "next/navigation";
import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { User, Calendar, Award, ArrowRight, Target, BookOpen, TrendingUp, Users, Briefcase, GraduationCap, Brain, LineChart as ChartIcon, Quote } from "lucide-react";
import { BarChart, Bar, LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, AreaChart, Area } from 'recharts';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Progress } from "@/components/ui/progress";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { FacultyDirectoryButton } from "@/components/department/FacultyDirectoryButton";
import { YearWisePlacementsButton } from "@/components/department/YearWisePlacementsButton";
import { PlacementComparativeAnalysis } from "@/components/department/PlacementComparativeAnalysis";
import { departments as staticDepartments } from "@/data/departments";
import { DEPARTMENT_ACADEMIC_DATA } from "@/data/academic-outcomes";

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
        established: 2008,
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
        established: 2021,
        bannerImage: '/banners/cse.png', // Reusing CSE for AI
    },
    'IT': {
        name: 'Information Technology',
        fullName: 'Department of Information Technology',
        shortName: 'IT',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2008,
        bannerImage: '/banners/it.png',
    },
    'ECE': {
        name: 'Electronics & Communication',
        fullName: 'Department of Electronics and Communication Engineering',
        shortName: 'ECE',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2008,
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
        established: 2008,
        bannerImage: '/banners/civil.png', // Fallback for General Sciences
    },
    'EVT': {
        name: 'EVT',
        fullName: 'Department of EVT',
        shortName: 'EVT',
        color: 'from-[#1E4080] to-[#E5A818]',
        established: 2022,
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

    const staticDeptInfo = staticDepartments[deptParam.toLowerCase()] || null;
    const academicOutcomes = DEPARTMENT_ACADEMIC_DATA[deptParam.toUpperCase()] || null;

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
                <TabsList className="grid w-full grid-cols-2 md:grid-cols-6 h-auto p-1.5 bg-[#EFF6FF] backdrop-blur-sm border border-blue-100 rounded-xl">
                    <TabsTrigger value="overview" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Overview</TabsTrigger>
                    <TabsTrigger value="admissions" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Admissions</TabsTrigger>
                    <TabsTrigger value="placements" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Placements</TabsTrigger>
                    <TabsTrigger value="outcomes" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Outcomes</TabsTrigger>
                    <TabsTrigger value="labs" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Labs</TabsTrigger>
                    <TabsTrigger value="mentoring" className="data-[state=active]:bg-[#1E3A8A] data-[state=active]:text-white data-[state=active]:shadow-md py-3 rounded-lg font-semibold transition-all">Mentoring</TabsTrigger>
                </TabsList>

                <TabsContent value="overview" className="space-y-8">
                    {/* Vision & Mission Section - Universal Layout - Profiles removed as per request */}
                    <div className="w-full">
                        <Card className="border-t-4 border-t-[#1E3A8A] shadow-lg bg-white h-full">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2 text-xl text-[#1E3A5F]">
                                    <Target className="w-6 h-6 text-[#3B82F6]" />
                                    Vision & Mission
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="space-y-6">
                                <div className="grid md:grid-cols-2 gap-6">
                                    <div className="bg-gradient-to-r from-[#EFF6FF] to-transparent p-6 rounded-xl border border-blue-100">
                                        <Badge className="mb-3 bg-[#1E3A8A] text-white hover:bg-[#1E3A8A] px-3 py-1">Department Vision</Badge>
                                        <p className="text-[#1E3A5F] text-lg leading-relaxed font-semibold italic">
                                            "{staticDeptInfo?.vision || visionMission?.vision || "To be a premier department creating globally competent professionals..."}"
                                        </p>
                                    </div>
                                    <div className="bg-gradient-to-r from-[#F0FDF4] to-transparent p-6 rounded-xl border border-green-100">
                                        <Badge className="mb-3 bg-[#16A34A] text-white hover:bg-[#16A34A] px-3 py-1">Department Mission</Badge>
                                        <ul className="space-y-3">
                                            {(staticDeptInfo?.mission || (visionMission?.mission ? [visionMission.mission] : [])).map((m: string, idx: number) => (
                                                <li key={idx} className="flex gap-3 text-[#1E3A5F]">
                                                    <span className="flex-shrink-0 w-6 h-6 rounded-full bg-green-100 text-green-700 flex items-center justify-center text-xs font-bold">{idx + 1}</span>
                                                    <span className="text-md leading-relaxed">{m}</span>
                                                </li>
                                            ))}
                                            {(!staticDeptInfo?.mission && !visionMission?.mission) && (
                                                <li className="text-gray-500 italic">Data is being synchronized with Official Records.</li>
                                            )}
                                        </ul>
                                    </div>
                                </div>
                            </CardContent>
                        </Card>
                    </div>

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
                    <div className="grid md:grid-cols-2 gap-8">
                        {/* PEOs Section */}
                        <Card className="shadow-lg border-t-4 border-t-[#1E3A8A] bg-white">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2 text-[#1E3A5F]">
                                    <Target className="w-5 h-5 text-[#3B82F6]" />
                                    Program Educational Objectives (PEO)
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <ul className="space-y-4">
                                    {academicOutcomes?.peos.map((peo) => (
                                        <li key={peo.id} className="flex gap-4 group">
                                            <span className="flex-shrink-0 w-12 h-12 rounded-xl bg-blue-50 text-[#1E3A8A] flex items-center justify-center font-bold text-sm group-hover:bg-[#1E3A8A] group-hover:text-white transition-all shadow-sm">{peo.id}</span>
                                            <p className="text-gray-700 text-sm leading-relaxed pt-1">{peo.statement}</p>
                                        </li>
                                    ))} {academicOutcomes?.peos.length === 0 && <li className="text-gray-500 italic">PEO data is being updated from Official Records.</li>}
                                </ul>
                            </CardContent>
                        </Card>

                        {/* PSOs Section */}
                        <Card className="shadow-lg border-t-4 border-t-[#E5A818] bg-white">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2 text-[#1E3A5F]">
                                    <Award className="w-5 h-5 text-[#E5A818]" />
                                    Program Specific Outcomes (PSO)
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <ul className="space-y-4">
                                    {academicOutcomes?.psos.map((pso) => (
                                        <li key={pso.id} className="flex gap-4 group">
                                            <span className="flex-shrink-0 w-12 h-12 rounded-xl bg-amber-50 text-[#854D0E] flex items-center justify-center font-bold text-sm group-hover:bg-[#E5A818] group-hover:text-[#1E3A8A] transition-all shadow-sm">{pso.id}</span>
                                            <p className="text-gray-700 text-sm leading-relaxed pt-1">{pso.statement}</p>
                                        </li>
                                    ))} {academicOutcomes?.psos.length === 0 && <li className="text-gray-500 italic">PSO data is being updated from Official Records.</li>}
                                </ul>
                            </CardContent>
                        </Card>
                    </div>

                    <div className="rounded-[2.5rem] bg-gradient-to-br from-slate-900 to-slate-800 p-8 md:p-12 text-white shadow-2xl relative overflow-hidden">
                        <div className="absolute top-0 right-0 w-96 h-96 bg-blue-500/20 rounded-full blur-[100px] pointer-events-none" />

                        <div className="relative z-10">
                            <div className="flex items-center gap-4 mb-8">
                                <div className="p-4 bg-white/10 rounded-2xl backdrop-blur-md">
                                    <Target className="w-8 h-8 text-blue-400" />
                                </div>
                                <div>
                                    <h3 className="text-3xl font-black tracking-tight text-white">Program Outcomes Matrix</h3>
                                    <p className="text-blue-200 font-medium">Attainment vs Target performance metrics</p>
                                </div>
                            </div>

                            <div className="grid gap-6">
                                {attainment.length > 0 ? attainment.map((po) => (
                                    <div key={po.id} className="group bg-white/5 hover:bg-white/10 p-6 rounded-2xl transition-all border border-white/5 hover:border-blue-400/30">
                                        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-4">
                                            <span className="font-bold text-lg text-blue-100 group-hover:text-white transition-colors flex items-center gap-3">
                                                <span className="w-8 h-8 rounded-lg bg-blue-500/20 flex items-center justify-center text-xs text-blue-300">{po.po_code}</span>
                                                {po.po_name || 'Outcome'}
                                            </span>
                                            <Badge variant="outline" className="border-blue-400/30 text-blue-300 bg-blue-500/10 px-3 py-1">
                                                {po.attained_level.toFixed(2)} / {po.target_level.toFixed(2)}
                                            </Badge>
                                        </div>
                                        <div className="relative h-3 w-full bg-slate-700/50 rounded-full overflow-hidden">
                                            <div
                                                className="absolute top-0 left-0 h-full bg-gradient-to-r from-blue-600 to-blue-400 transition-all duration-1000 shadow-[0_0_15px_rgba(59,130,246,0.5)]"
                                                style={{ width: `${(po.attained_level / 3) * 100}%` }}
                                            />
                                            <div
                                                className="absolute top-0 w-1 h-full bg-red-400 z-10 opacity-80"
                                                style={{ left: `${(po.target_level / 3) * 100}%` }}
                                                title="Target Level"
                                            />
                                        </div>
                                    </div>
                                )) : <div className="text-center py-10 text-slate-500">No Attainment Data Found in Database</div>}
                            </div>
                        </div>
                    </div>
                </TabsContent>

                {/* LABS TAB */}
                <TabsContent value="labs" className="space-y-8">
                    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {staticDeptInfo?.labs?.map((lab, idx) => (
                            <Card key={idx} className="hover:shadow-xl transition-all border-none bg-white shadow-md ring-1 ring-gray-100 group">
                                <CardHeader className="bg-[#F8FAFC] group-hover:bg-[#EFF6FF] transition-colors">
                                    <CardTitle className="text-[#1E3A8A] text-lg font-bold flex items-center gap-2">
                                        <div className="w-8 h-8 rounded-lg bg-blue-100 text-blue-700 flex items-center justify-center text-xs">{idx + 1}</div>
                                        {lab.name}
                                    </CardTitle>
                                    <Badge variant="secondary" className="w-fit bg-blue-50 text-blue-600 border-blue-100">{lab.location}</Badge>
                                </CardHeader>
                                <CardContent className="pt-6">
                                    <p className="text-[#64748B] text-sm leading-relaxed">
                                        {lab.description}
                                    </p>
                                </CardContent>
                            </Card>
                        )) || (
                                <div className="col-span-full py-20 text-center bg-gray-50 rounded-2xl border-2 border-dashed border-gray-200">
                                    <BookOpen className="w-12 h-12 text-gray-300 mx-auto mb-4" />
                                    <p className="text-gray-500 font-medium">Laboratory information is being cataloged for this department.</p>
                                </div>
                            )}
                    </div>
                </TabsContent>

                {/* MENTORING TAB */}
                <TabsContent value="mentoring" className="space-y-8">
                    <div className="grid md:grid-cols-2 gap-8">
                        {/* Objectives & Process */}
                        <Card className="shadow-lg border-t-4 border-t-pink-600 bg-white">
                            <CardHeader>
                                <CardTitle className="text-pink-900 flex items-center gap-2">
                                    <Brain className="w-6 h-6 text-pink-600" />
                                    Mentoring System
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="space-y-6">
                                <div>
                                    <h4 className="font-bold text-[#1E3A8A] mb-3 flex items-center gap-2">
                                        <Users className="w-4 h-4" /> Objectives
                                    </h4>
                                    <ul className="space-y-2">
                                        {(staticDeptInfo?.mentoring?.objectives || ["Encourage personal growth", "Support academic success"]).map((obj, i) => (
                                            <li key={i} className="text-sm text-gray-600 flex gap-2">
                                                <span className="text-pink-500">•</span> {obj}
                                            </li>
                                        ))}
                                    </ul>
                                </div>
                                <div className="pt-4 border-t border-gray-100">
                                    <h4 className="font-bold text-[#1E3A8A] mb-3 flex items-center gap-2">
                                        <BookOpen className="w-4 h-4" /> The Process
                                    </h4>
                                    <ul className="space-y-2">
                                        {(staticDeptInfo?.mentoring?.process || ["Standard counseling", "Periodic reviews"]).map((proc, i) => (
                                            <li key={i} className="text-sm text-gray-600 flex gap-2 italic">
                                                <span className="text-pink-500">→</span> {proc}
                                            </li>
                                        ))}
                                    </ul>
                                </div>
                            </CardContent>
                        </Card>

                        {/* Mentoring Impact Data (Existing) */}
                        <Card className="shadow-lg border-t-4 border-t-[#3B82F6] bg-white">
                            <CardHeader>
                                <CardTitle className="text-[#1E3A8A] flex items-center gap-2">
                                    <TrendingUp className="w-6 h-6 text-[#3B82F6]" />
                                    Performance Impact
                                </CardTitle>
                                <CardDescription>Progression of weak learners over academic assessment years</CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="overflow-hidden rounded-lg border border-gray-100">
                                    <Table>
                                        <TableHeader>
                                            <TableRow className="bg-gray-50/80">
                                                <TableHead className="text-xs font-bold uppercase text-gray-500">Academic Year</TableHead>
                                                <TableHead className="text-right text-xs font-bold uppercase text-gray-500">Weak Learners</TableHead>
                                                <TableHead className="text-right text-xs font-bold uppercase text-gray-500">Improved</TableHead>
                                                <TableHead className="text-right text-xs font-bold uppercase text-gray-500">Success</TableHead>
                                            </TableRow>
                                        </TableHeader>
                                        <TableBody>
                                            {mentoring.length > 0 ? mentoring.map((m) => (
                                                <TableRow key={m.id} className="hover:bg-blue-50/50 transition-colors">
                                                    <TableCell className="font-medium text-[#1E3A8A]">{m.academic_year}</TableCell>
                                                    <TableCell className="text-right text-red-500 font-medium">{m.weak_learners_identified}</TableCell>
                                                    <TableCell className="text-right text-green-500 font-medium">{m.weak_learners_improved}</TableCell>
                                                    <TableCell className="text-right font-black text-[#1E3A8A]">
                                                        {((m.weak_learners_improved / m.weak_learners_identified) * 100).toFixed(1)}%
                                                    </TableCell>
                                                </TableRow>
                                            )) : (
                                                <TableRow>
                                                    <TableCell colSpan={4} className="text-center py-8 text-gray-400">Loading historical data...</TableCell>
                                                </TableRow>
                                            )}
                                        </TableBody>
                                    </Table>
                                </div>
                            </CardContent>
                        </Card>
                    </div>
                </TabsContent>
            </Tabs>
        </div>
    );
}
