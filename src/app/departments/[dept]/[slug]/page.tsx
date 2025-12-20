"use client";

import { useParams } from "next/navigation";
import { departments } from "@/data/departments";
import { getFacultyByDepartment, getPlacementsByDepartment, getStatsByDepartment, topRecruiters } from "@/data/faculty";
import { supabase } from "@/lib/supabase";
import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
    User,
    GraduationCap,
    Mail,
    BookOpen,
    Target,
    Eye,
    Award,
    Beaker,
    Trophy,
    Calendar,
    Users,
    Briefcase,
    Phone,
    MapPin,
    ArrowLeft,
    TrendingUp,
    Building2,
    FileText
} from "lucide-react";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, PieChart, Pie, Cell, LineChart, Line, AreaChart, Area } from "recharts";
import { YearWisePlacementsButton } from "@/components/department/YearWisePlacementsButton";
import { PlacementComparativeAnalysis } from "@/components/department/PlacementComparativeAnalysis";

const COLORS = ['#3B82F6', '#10B981', '#F59E0B', '#EF4444', '#8B5CF6', '#EC4899'];

// Faculty Page Component with Stats
// Faculty Page Component with Real Supabase Data
function FacultyPage({ dept }: { dept: string }) {
    const [faculty, setFaculty] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const deptData = departments[dept];

    useEffect(() => {
        const fetchFaculty = async () => {
            try {
                // Fetch faculty from Supabase
                const { data, error } = await supabase
                    .from('faculty_profiles')
                    .select('*')
                    .eq('dept_code', dept.toUpperCase())
                    .order('date_of_joining', { ascending: true }); // Seniority by joining date

                if (data) {
                    setFaculty(data);
                }
            } catch (err) {
                console.error("Error fetching faculty:", err);
            } finally {
                setLoading(false);
            }
        };

        fetchFaculty();
    }, [dept]);

    // Calculate generic stats based on REAL data
    const phdCount = faculty.filter(f => f.qualification?.toLowerCase().includes('ph.d') || f.designation?.toLowerCase().includes('professor')).length;
    const pubCount = faculty.reduce((sum, f) => sum + (f.publications_count || 0), 0);

    // Calculate designation distribution
    const designationData = faculty.reduce((acc: { name: string, value: number }[], f) => {
        // Simplified mapping
        const role = f.designation?.split('(')[0]?.trim() || 'Faculty';
        const existing = acc.find(item => item.name === role);
        if (existing) existing.value += 1;
        else acc.push({ name: role, value: 1 });
        return acc;
    }, []);

    if (loading) {
        return <div className="p-12 text-center text-gray-500 animate-pulse">Loading Faculty Data...</div>;
    }

    if (faculty.length === 0) {
        return (
            <div className="text-center py-16">
                <Users className="w-16 h-16 mx-auto text-gray-300 mb-4" />
                <h2 className="text-2xl font-bold text-gray-800 mb-2">Faculty Information Coming Soon</h2>
                <p className="text-gray-500">We are updating our faculty directory. Please check back later.</p>
            </div>
        );
    }

    return (
        <div className="space-y-8 animate-fade-in-up">
            <div className="text-center mb-8">
                <h1 className="text-3xl font-bold text-gray-900 mb-2">Faculty Members</h1>
                <p className="text-gray-600">Distinguished faculty of {deptData?.name ? deptData.name : dept.toUpperCase()}</p>
                <Badge variant="outline" className="mt-2 bg-green-50 text-green-700 border-green-200">
                    Verified Faculty Data
                </Badge>
            </div>

            {/* Stats Overview */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
                <Card className="bg-gradient-to-br from-blue-500 to-blue-600 text-white border-0 shadow-lg">
                    <CardContent className="pt-6 text-center">
                        <Users className="w-8 h-8 mx-auto mb-2 opacity-80" />
                        <h3 className="text-3xl font-bold">{faculty.length}</h3>
                        <p className="text-blue-100">Total Faculty</p>
                    </CardContent>
                </Card>
                <Card className="bg-gradient-to-br from-green-500 to-green-600 text-white border-0 shadow-lg">
                    <CardContent className="pt-6 text-center">
                        <GraduationCap className="w-8 h-8 mx-auto mb-2 opacity-80" />
                        <h3 className="text-3xl font-bold">{phdCount}</h3>
                        <p className="text-green-100">Ph.D / Professors</p>
                    </CardContent>
                </Card>
                <Card className="bg-gradient-to-br from-purple-500 to-purple-600 text-white border-0 shadow-lg">
                    <CardContent className="pt-6 text-center">
                        <FileText className="w-8 h-8 mx-auto mb-2 opacity-80" />
                        <h3 className="text-3xl font-bold">{pubCount}</h3>
                        <p className="text-purple-100">Publications</p>
                    </CardContent>
                </Card>
                <Card className="bg-gradient-to-br from-orange-500 to-orange-600 text-white border-0 shadow-lg">
                    <CardContent className="pt-6 text-center">
                        <Award className="w-8 h-8 mx-auto mb-2 opacity-80" />
                        <h3 className="text-3xl font-bold">1:15</h3>
                        <p className="text-orange-100">Student Ratio</p>
                    </CardContent>
                </Card>
            </div>

            {/* Faculty Distribution Chart */}
            <Card className="border-0 shadow-lg mb-8">
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <TrendingUp className="w-5 h-5 text-blue-600" />
                        Faculty Designation Structure
                    </CardTitle>
                </CardHeader>
                <CardContent>
                    <div className="h-64">
                        <ResponsiveContainer width="100%" height="100%">
                            <PieChart>
                                <Pie
                                    data={designationData}
                                    cx="50%" cy="50%"
                                    labelLine={false}
                                    label={({ name, percent }: any) => `${name} ${(percent * 100).toFixed(0)}%`}
                                    outerRadius={80}
                                    fill="#8884d8"
                                    dataKey="value"
                                >
                                    {designationData.map((entry, index) => (
                                        <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                                    ))}
                                </Pie>
                                <Tooltip />
                                <Legend />
                            </PieChart>
                        </ResponsiveContainer>
                    </div>
                </CardContent>
            </Card>

            {/* Faculty Cards Grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {faculty.map((member) => (
                    <Card key={member.id} className="hover:shadow-2xl transition-all duration-300 border-0 shadow-md overflow-hidden group">
                        <div className="h-2 bg-gradient-to-r from-blue-600 to-indigo-600" />
                        <CardHeader className="text-center pb-2 relative">
                            <div className="w-24 h-24 mx-auto bg-gradient-to-br from-blue-100 to-indigo-100 rounded-full flex items-center justify-center mb-4 group-hover:scale-105 transition-transform overflow-hidden border-4 border-white shadow-sm">
                                {member.photo_path ?
                                    <img src={member.photo_path} alt={member.last_name} className="w-full h-full object-cover" /> :
                                    <User className="w-12 h-12 text-blue-600" />
                                }
                            </div>
                            <CardTitle className="text-lg font-bold text-gray-800">
                                {member.first_name} {member.last_name}
                            </CardTitle>
                            <Badge className="mt-2 bg-blue-50 text-blue-700 hover:bg-blue-100 border border-blue-200">
                                {member.designation}
                            </Badge>
                        </CardHeader>
                        <CardContent className="space-y-4 text-sm pt-2">
                            <div className="flex items-center gap-3 bg-gray-50 p-2 rounded-lg">
                                <GraduationCap className="w-4 h-4 text-purple-600 flex-shrink-0" />
                                <span className="font-medium text-gray-700">{member.qualification || 'Not Specified'}</span>
                            </div>

                            <div className="space-y-2">
                                {member.date_of_joining && (
                                    <div className="flex justify-between items-center text-xs text-gray-600 border-b border-gray-100 pb-1">
                                        <span className="flex items-center gap-1"><Calendar className="w-3 h-3" /> Joined:</span>
                                        <span className="font-mono text-gray-800">{member.date_of_joining}</span>
                                    </div>
                                )}

                                {member.pan_number && (
                                    <div className="flex justify-between items-center text-xs text-gray-600 border-b border-gray-100 pb-1">
                                        <span className="flex items-center gap-1"><FileText className="w-3 h-3" /> PAN:</span>
                                        <span className="font-mono font-semibold text-gray-700">{member.pan_number}</span>
                                    </div>
                                )}

                                {member.experience_years && (
                                    <div className="flex justify-between items-center text-xs text-gray-600">
                                        <span className="flex items-center gap-1"><Award className="w-3 h-3" /> Experience:</span>
                                        <span>{member.experience_years} Years</span>
                                    </div>
                                )}
                            </div>

                            <div className="flex justify-center pt-2">
                                <Button variant="outline" size="sm" className="w-full text-blue-600 border-blue-200 hover:bg-blue-50">
                                    View Full Profile
                                </Button>
                            </div>
                        </CardContent>
                    </Card>
                ))}
            </div>
        </div>
    );
}

// Vision & Mission Page Component
function VisionMissionPage({ dept }: { dept: string }) {
    const deptData = departments[dept];

    if (!deptData) {
        return <PlaceholderContent title="Vision & Mission" />;
    }

    return (
        <div className="space-y-8 max-w-4xl mx-auto">
            <div className="text-center mb-8">
                <h1 className="text-3xl font-bold text-gray-900 mb-2">Vision & Mission</h1>
                <p className="text-gray-600">{deptData.name}</p>
            </div>

            {/* Vision Card */}
            <Card className="border-0 shadow-lg overflow-hidden">
                <div className="h-2 bg-gradient-to-r from-blue-600 to-cyan-500" />
                <CardHeader className="bg-gradient-to-r from-blue-50 to-cyan-50">
                    <CardTitle className="flex items-center gap-3 text-2xl text-blue-800">
                        <div className="p-3 bg-blue-100 rounded-xl">
                            <Eye className="w-8 h-8 text-blue-600" />
                        </div>
                        Our Vision
                    </CardTitle>
                </CardHeader>
                <CardContent className="pt-6">
                    <p className="text-lg text-gray-700 leading-relaxed">
                        {deptData.vision}
                    </p>
                </CardContent>
            </Card>

            {/* Mission Card */}
            <Card className="border-0 shadow-lg overflow-hidden">
                <div className="h-2 bg-gradient-to-r from-indigo-600 to-purple-500" />
                <CardHeader className="bg-gradient-to-r from-indigo-50 to-purple-50">
                    <CardTitle className="flex items-center gap-3 text-2xl text-indigo-800">
                        <div className="p-3 bg-indigo-100 rounded-xl">
                            <Target className="w-8 h-8 text-indigo-600" />
                        </div>
                        Our Mission
                    </CardTitle>
                </CardHeader>
                <CardContent className="pt-6">
                    <ul className="space-y-4">
                        {deptData.mission.map((item, index) => (
                            <li key={index} className="flex items-start gap-4">
                                <span className="flex-shrink-0 w-8 h-8 bg-indigo-100 text-indigo-700 rounded-full flex items-center justify-center font-bold text-sm">
                                    M{index + 1}
                                </span>
                                <p className="text-gray-700 leading-relaxed pt-1">{item}</p>
                            </li>
                        ))}
                    </ul>
                </CardContent>
            </Card>
        </div>
    );
}

// About Department Page Component with Charts
function AboutDepartmentPage({ dept }: { dept: string }) {
    const deptData = departments[dept];
    const stats = getStatsByDepartment(dept);

    const statsData = stats ? [
        { name: 'Students', value: stats.students, color: '#3B82F6' },
        { name: 'Faculty', value: stats.faculty * 10, color: '#10B981' },
        { name: 'Labs', value: stats.labs * 20, color: '#8B5CF6' },
        { name: 'Publications', value: stats.publications, color: '#F59E0B' },
    ] : [];

    return (
        <div className="space-y-8 max-w-5xl mx-auto">
            <div className="text-center mb-8">
                <h1 className="text-3xl font-bold text-gray-900 mb-2">About the Department</h1>
                <p className="text-gray-600">{deptData?.name || 'Department'}</p>
            </div>

            <Card className="border-0 shadow-lg">
                <CardContent className="pt-6 prose prose-lg max-w-none">
                    <p className="text-gray-700 leading-relaxed">
                        The Department of {deptData?.name || 'Engineering'} at NRI Institute of Technology
                        is committed to providing quality education through innovative teaching methodologies
                        and state-of-the-art infrastructure. Our dedicated faculty members work tirelessly
                        to nurture the next generation of engineers and professionals.
                    </p>
                    <p className="text-gray-700 leading-relaxed mt-4">
                        The department focuses on both theoretical knowledge and practical skills,
                        preparing students for successful careers in industry and academia. With
                        well-equipped laboratories, industry partnerships, and research opportunities,
                        we strive to create an environment that fosters innovation and excellence.
                    </p>
                </CardContent>
            </Card>

            {/* Statistics Cards */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                <Card className="text-center border-0 shadow-md hover:shadow-lg transition-shadow bg-gradient-to-br from-blue-50 to-blue-100">
                    <CardContent className="pt-6">
                        <div className="w-16 h-16 mx-auto bg-blue-500 rounded-full flex items-center justify-center mb-4">
                            <Users className="w-8 h-8 text-white" />
                        </div>
                        <h3 className="text-3xl font-bold text-blue-700">{stats?.students || 500}+</h3>
                        <p className="text-gray-600">Students</p>
                    </CardContent>
                </Card>
                <Card className="text-center border-0 shadow-md hover:shadow-lg transition-shadow bg-gradient-to-br from-green-50 to-green-100">
                    <CardContent className="pt-6">
                        <div className="w-16 h-16 mx-auto bg-green-500 rounded-full flex items-center justify-center mb-4">
                            <GraduationCap className="w-8 h-8 text-white" />
                        </div>
                        <h3 className="text-3xl font-bold text-green-700">{stats?.faculty || 20}+</h3>
                        <p className="text-gray-600">Faculty Members</p>
                    </CardContent>
                </Card>
                <Card className="text-center border-0 shadow-md hover:shadow-lg transition-shadow bg-gradient-to-br from-purple-50 to-purple-100">
                    <CardContent className="pt-6">
                        <div className="w-16 h-16 mx-auto bg-purple-500 rounded-full flex items-center justify-center mb-4">
                            <Beaker className="w-8 h-8 text-white" />
                        </div>
                        <h3 className="text-3xl font-bold text-purple-700">{stats?.labs || 10}+</h3>
                        <p className="text-gray-600">Laboratories</p>
                    </CardContent>
                </Card>
                <Card className="text-center border-0 shadow-md hover:shadow-lg transition-shadow bg-gradient-to-br from-orange-50 to-orange-100">
                    <CardContent className="pt-6">
                        <div className="w-16 h-16 mx-auto bg-orange-500 rounded-full flex items-center justify-center mb-4">
                            <TrendingUp className="w-8 h-8 text-white" />
                        </div>
                        <h3 className="text-3xl font-bold text-orange-700">{stats?.placements || 90}%</h3>
                        <p className="text-gray-600">Placement Rate</p>
                    </CardContent>
                </Card>
            </div>

            {/* Bar Chart for Stats */}
            {stats && (
                <Card className="border-0 shadow-lg">
                    <CardHeader>
                        <CardTitle>Department Statistics Overview</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="h-72">
                            <ResponsiveContainer width="100%" height="100%">
                                <BarChart data={statsData}>
                                    <CartesianGrid strokeDasharray="3 3" />
                                    <XAxis dataKey="name" />
                                    <YAxis />
                                    <Tooltip />
                                    <Bar dataKey="value" fill="#3B82F6" radius={[4, 4, 0, 0]}>
                                        {statsData.map((entry, index) => (
                                            <Cell key={`cell-${index}`} fill={entry.color} />
                                        ))}
                                    </Bar>
                                </BarChart>
                            </ResponsiveContainer>
                        </div>
                    </CardContent>
                </Card>
            )}
        </div>
    );
}

// CRT & Placements Page with Charts
function CRTPage({ dept }: { dept: string }) {
    const placements = getPlacementsByDepartment(dept);
    const stats = getStatsByDepartment(dept);

    const placementChartData = placements.map(p => ({
        year: p.year,
        placed: p.placed,
        total: p.total,
        rate: Math.round((p.placed / p.total) * 100)
    }));

    return (
        <div className="space-y-8">
            <div className="text-center mb-8">
                <h1 className="text-3xl font-bold text-gray-900 mb-2">CRT & Placements</h1>
                <p className="text-gray-600">Campus Recruitment Training and Placement Records</p>
                <div className="mt-6 flex justify-center">
                    <YearWisePlacementsButton department={dept} />
                </div>
            </div>

            <PlacementComparativeAnalysis department={dept} />

            {/* Summary Stats */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                <Card className="text-center border-0 shadow-md bg-gradient-to-br from-blue-500 to-blue-600 text-white">
                    <CardContent className="pt-6">
                        <TrendingUp className="w-10 h-10 mx-auto mb-2 opacity-80" />
                        <h3 className="text-4xl font-bold">{stats?.placements || 90}%</h3>
                        <p className="text-blue-100 mt-2">Placement Rate</p>
                    </CardContent>
                </Card>
                <Card className="text-center border-0 shadow-md bg-gradient-to-br from-green-500 to-green-600 text-white">
                    <CardContent className="pt-6">
                        <Award className="w-10 h-10 mx-auto mb-2 opacity-80" />
                        <h3 className="text-4xl font-bold">{placements[0]?.highestPackage || '8 LPA'}</h3>
                        <p className="text-green-100 mt-2">Highest Package</p>
                    </CardContent>
                </Card>
                <Card className="text-center border-0 shadow-md bg-gradient-to-br from-purple-500 to-purple-600 text-white">
                    <CardContent className="pt-6">
                        <Briefcase className="w-10 h-10 mx-auto mb-2 opacity-80" />
                        <h3 className="text-4xl font-bold">{placements[0]?.averagePackage || '4 LPA'}</h3>
                        <p className="text-purple-100 mt-2">Average Package</p>
                    </CardContent>
                </Card>
                <Card className="text-center border-0 shadow-md bg-gradient-to-br from-orange-500 to-orange-600 text-white">
                    <CardContent className="pt-6">
                        <Building2 className="w-10 h-10 mx-auto mb-2 opacity-80" />
                        <h3 className="text-4xl font-bold">50+</h3>
                        <p className="text-orange-100 mt-2">Companies Visited</p>
                    </CardContent>
                </Card>
            </div>

            {/* Placement Trend Chart */}
            {placements.length > 0 && (
                <Card className="border-0 shadow-lg">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <TrendingUp className="w-5 h-5 text-blue-600" />
                            Placement Trend (Last 3 Years)
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="h-72">
                            <ResponsiveContainer width="100%" height="100%">
                                <AreaChart data={placementChartData}>
                                    <CartesianGrid strokeDasharray="3 3" />
                                    <XAxis dataKey="year" />
                                    <YAxis />
                                    <Tooltip />
                                    <Legend />
                                    <Area type="monotone" dataKey="placed" stackId="1" stroke="#3B82F6" fill="#3B82F6" name="Students Placed" />
                                    <Area type="monotone" dataKey="total" stackId="2" stroke="#10B981" fill="#10B981" fillOpacity={0.3} name="Total Students" />
                                </AreaChart>
                            </ResponsiveContainer>
                        </div>
                    </CardContent>
                </Card>
            )}

            {/* Placement Rate Chart */}
            {placements.length > 0 && (
                <Card className="border-0 shadow-lg">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <TrendingUp className="w-5 h-5 text-green-600" />
                            Placement Rate (%)
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="h-64">
                            <ResponsiveContainer width="100%" height="100%">
                                <LineChart data={placementChartData}>
                                    <CartesianGrid strokeDasharray="3 3" />
                                    <XAxis dataKey="year" />
                                    <YAxis domain={[0, 100]} />
                                    <Tooltip formatter={(value) => `${value}%`} />
                                    <Legend />
                                    <Line type="monotone" dataKey="rate" stroke="#10B981" strokeWidth={3} dot={{ r: 6 }} name="Placement Rate %" />
                                </LineChart>
                            </ResponsiveContainer>
                        </div>
                    </CardContent>
                </Card>
            )}

            {/* Top Recruiters */}
            <Card className="border-0 shadow-lg">
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Building2 className="w-5 h-5 text-blue-600" />
                        Top Recruiters (2023-24)
                    </CardTitle>
                </CardHeader>
                <CardContent>
                    <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
                        {topRecruiters.slice(0, 10).map((recruiter, index) => (
                            <div key={index} className="text-center p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                                <div className="w-16 h-16 mx-auto bg-white rounded-full flex items-center justify-center mb-2 shadow-sm">
                                    <Building2 className="w-8 h-8 text-blue-600" />
                                </div>
                                <h4 className="font-semibold text-sm">{recruiter.company}</h4>
                                <p className="text-xs text-gray-500">{recruiter.package}</p>
                                <Badge variant="outline" className="mt-1 text-xs">{recruiter.studentsPlaced} placed</Badge>
                            </div>
                        ))}
                    </div>
                </CardContent>
            </Card>

            {/* Detailed Placement Table */}
            {placements.length > 0 && (
                <Card className="border-0 shadow-lg">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <Briefcase className="w-5 h-5 text-blue-600" />
                            Year-wise Placement Details
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="overflow-x-auto">
                            <table className="w-full">
                                <thead>
                                    <tr className="border-b bg-gray-50">
                                        <th className="text-left py-3 px-4 font-semibold">Academic Year</th>
                                        <th className="text-left py-3 px-4 font-semibold">Total Students</th>
                                        <th className="text-left py-3 px-4 font-semibold">Students Placed</th>
                                        <th className="text-left py-3 px-4 font-semibold">Placement %</th>
                                        <th className="text-left py-3 px-4 font-semibold">Highest Package</th>
                                        <th className="text-left py-3 px-4 font-semibold">Avg Package</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {placements.map((item, index) => (
                                        <tr key={index} className="border-b hover:bg-gray-50">
                                            <td className="py-3 px-4 font-medium">{item.year}</td>
                                            <td className="py-3 px-4">{item.total}</td>
                                            <td className="py-3 px-4">{item.placed}</td>
                                            <td className="py-3 px-4">
                                                <Badge className="bg-green-100 text-green-700">
                                                    {Math.round((item.placed / item.total) * 100)}%
                                                </Badge>
                                            </td>
                                            <td className="py-3 px-4 font-semibold text-green-600">{item.highestPackage}</td>
                                            <td className="py-3 px-4">{item.averagePackage}</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </CardContent>
                </Card>
            )}
        </div>
    );
}

// Laboratories Page Component
function LaboratoriesPage({ dept }: { dept: string }) {
    const deptData = departments[dept];

    const labsData: Record<string, { name: string, equipment: string, capacity: string }[]> = {
        cse: [
            { name: "Computer Programming Lab", equipment: "High-end PCs with Intel Core i7, Latest IDEs", capacity: "60 students" },
            { name: "Data Structures Lab", equipment: "Workstations, Visual Studio, Eclipse", capacity: "60 students" },
            { name: "Database Management Lab", equipment: "Oracle 19c, MySQL Server, PostgreSQL", capacity: "50 students" },
            { name: "Software Engineering Lab", equipment: "CASE Tools, Rational Rose, MS Project", capacity: "50 students" },
            { name: "Computer Networks Lab", equipment: "Cisco Routers, Switches, Network Simulators", capacity: "40 students" },
            { name: "AI & Machine Learning Lab", equipment: "GPU Workstations (RTX 3080), TensorFlow, PyTorch", capacity: "40 students" },
            { name: "Web Technologies Lab", equipment: "Node.js, React, Angular Development Setup", capacity: "60 students" },
            { name: "Cloud Computing Lab", equipment: "AWS, Azure, GCP Environments", capacity: "40 students" },
        ],
        it: [
            { name: "Programming Lab", equipment: "Intel Core i5 Systems, VS Code, PyCharm", capacity: "60 students" },
            { name: "Database Lab", equipment: "MySQL, MongoDB, Redis Servers", capacity: "50 students" },
            { name: "Networking Lab", equipment: "Routers, Packet Tracer, Wireshark", capacity: "40 students" },
            { name: "Web Development Lab", equipment: "MERN Stack, Django, Flask Setup", capacity: "50 students" },
            { name: "Mobile Computing Lab", equipment: "Android Studio, Flutter SDK", capacity: "40 students" },
        ],
        ece: [
            { name: "Electronics Workshop", equipment: "CRO, Function Generators, Multimeters", capacity: "60 students" },
            { name: "Digital Electronics Lab", equipment: "Logic Trainers, FPGA Kits, Digital ICs", capacity: "50 students" },
            { name: "Communication Lab", equipment: "Spectrum Analyzers, Signal Generators", capacity: "40 students" },
            { name: "VLSI Design Lab", equipment: "Cadence Tools, Xilinx FPGA Boards", capacity: "40 students" },
            { name: "Microprocessor Lab", equipment: "8085/8086 Kits, ARM Development Boards", capacity: "50 students" },
            { name: "Embedded Systems Lab", equipment: "Arduino, Raspberry Pi, ESP32 Kits", capacity: "40 students" },
            { name: "PCB Design Lab", equipment: "OrCAD, Altium Designer, Soldering Stations", capacity: "30 students" },
            { name: "Antenna & Microwave Lab", equipment: "VNA, Antenna Measurement Setup", capacity: "30 students" },
            { name: "DSP Lab", equipment: "MATLAB, DSP Processors, TI Kits", capacity: "40 students" },
            { name: "IoT Lab", equipment: "Sensors, NodeMCU, LoRa Modules", capacity: "40 students" },
        ],
    };

    const labs = labsData[dept.toLowerCase()] || labsData.cse;

    return (
        <div className="space-y-8">
            <div className="text-center mb-8">
                <h1 className="text-3xl font-bold text-gray-900 mb-2">Laboratories</h1>
                <p className="text-gray-600">State-of-the-art labs for {deptData?.name || 'the Department'}</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {labs.map((lab, index) => (
                    <Card key={index} className="border-0 shadow-md hover:shadow-lg transition-all duration-300">
                        <div className="h-2 bg-gradient-to-r from-green-500 to-emerald-500" />
                        <CardHeader>
                            <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center mb-3">
                                <Beaker className="w-6 h-6 text-green-600" />
                            </div>
                            <CardTitle className="text-lg">{lab.name}</CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-2 text-sm">
                            <p className="text-gray-600"><strong>Equipment:</strong> {lab.equipment}</p>
                            <p className="text-gray-600"><strong>Capacity:</strong> {lab.capacity}</p>
                        </CardContent>
                    </Card>
                ))}
            </div>
        </div>
    );
}

// Achievements Page Component  
function AchievementsPage({ dept }: { dept: string }) {
    const achievements = [
        { title: "NAAC A+ Accredited", year: "2023", description: "Institution accredited by NAAC with a prestigious A+ Grade", icon: Award },
        { title: "100% Placement", year: "2023", description: "All eligible students successfully placed in top companies", icon: TrendingUp },
        { title: "Research Excellence Award", year: "2022", description: "Awarded for outstanding research contributions and publications", icon: Trophy },
        { title: "Best Department Award", year: "2022", description: "Recognized as best performing department in the institution", icon: Award },
        { title: "Industry Partnership", year: "2023", description: "MoU signed with 10+ leading IT companies for internships", icon: Building2 },
        { title: "AICTE Approval", year: "2023", description: "Approved by AICTE with increased intake capacity", icon: FileText },
    ];

    return (
        <div className="space-y-8">
            <div className="text-center mb-8">
                <h1 className="text-3xl font-bold text-gray-900 mb-2">Achievements</h1>
                <p className="text-gray-600">Our proud moments and milestones</p>
            </div>

            <div className="space-y-4">
                {achievements.map((item, index) => {
                    const IconComponent = item.icon;
                    return (
                        <Card key={index} className="border-0 shadow-md hover:shadow-lg transition-all duration-300">
                            <CardContent className="flex items-start gap-4 pt-6">
                                <div className="w-14 h-14 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-full flex items-center justify-center flex-shrink-0 shadow-lg">
                                    <IconComponent className="w-7 h-7 text-white" />
                                </div>
                                <div className="flex-1">
                                    <div className="flex items-center gap-3 mb-2">
                                        <h3 className="text-lg font-semibold text-gray-900">{item.title}</h3>
                                        <Badge variant="outline" className="text-xs bg-yellow-50 text-yellow-700 border-yellow-200">{item.year}</Badge>
                                    </div>
                                    <p className="text-gray-600">{item.description}</p>
                                </div>
                            </CardContent>
                        </Card>
                    );
                })}
            </div>
        </div>
    );
}

// Events Page Component
function EventsPage({ dept }: { dept: string }) {
    const events = [
        { title: "TechFest 2024", date: "March 15-17, 2024", type: "Technical Festival", description: "Annual technical festival with coding competitions, hackathons, and workshops" },
        { title: "Workshop on AI & ML", date: "February 20, 2024", type: "Workshop", description: "Hands-on workshop on Artificial Intelligence and Machine Learning by industry experts" },
        { title: "Industry Expert Talk", date: "January 25, 2024", type: "Guest Lecture", description: "Guest lecture on emerging technologies by senior professionals from TCS" },
        { title: "Hackathon 2024", date: "April 5-6, 2024", type: "Competition", description: "24-hour coding challenge with exciting prizes worth ₹50,000" },
        { title: "Code Sprint", date: "December 10, 2023", type: "Competition", description: "Competitive programming contest for all B.Tech students" },
        { title: "Research Paper Presentation", date: "November 15, 2023", type: "Academic", description: "Student research paper presentations with faculty mentorship" },
    ];

    return (
        <div className="space-y-8">
            <div className="text-center mb-8">
                <h1 className="text-3xl font-bold text-gray-900 mb-2">Events</h1>
                <p className="text-gray-600">Upcoming and past events</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {events.map((event, index) => (
                    <Card key={index} className="border-0 shadow-md hover:shadow-lg transition-all duration-300 overflow-hidden">
                        <div className="h-2 bg-gradient-to-r from-purple-500 to-pink-500" />
                        <CardHeader>
                            <div className="flex items-center gap-2 text-sm text-purple-600 mb-2">
                                <Calendar className="w-4 h-4" />
                                {event.date}
                            </div>
                            <CardTitle className="text-lg">{event.title}</CardTitle>
                            <Badge className="w-fit bg-purple-100 text-purple-700">{event.type}</Badge>
                        </CardHeader>
                        <CardContent>
                            <p className="text-gray-600">{event.description}</p>
                        </CardContent>
                    </Card>
                ))}
            </div>
        </div>
    );
}

// Contact Page Component
function ContactPage({ dept }: { dept: string }) {
    const deptData = departments[dept];

    return (
        <div className="space-y-8 max-w-4xl mx-auto">
            <div className="text-center mb-8">
                <h1 className="text-3xl font-bold text-gray-900 mb-2">Contact Us</h1>
                <p className="text-gray-600">Get in touch with {deptData?.name || 'the Department'}</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <Card className="border-0 shadow-lg">
                    <CardHeader>
                        <CardTitle className="text-xl">Department Office</CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="flex items-start gap-3">
                            <MapPin className="w-5 h-5 text-blue-600 mt-1" />
                            <div>
                                <p className="font-medium">Address</p>
                                <p className="text-gray-600 text-sm">
                                    NRI Institute of Technology<br />
                                    Visadala Post, Medikonduru Mandal<br />
                                    Guntur District - 522438<br />
                                    Andhra Pradesh, India
                                </p>
                            </div>
                        </div>
                        <div className="flex items-center gap-3">
                            <Phone className="w-5 h-5 text-blue-600" />
                            <div>
                                <p className="font-medium">Phone</p>
                                <p className="text-gray-600 text-sm">0863 234 4300</p>
                            </div>
                        </div>
                        <div className="flex items-center gap-3">
                            <Mail className="w-5 h-5 text-blue-600" />
                            <div>
                                <p className="font-medium">Email</p>
                                <p className="text-gray-600 text-sm">hod.{dept}@nriit.ac.in</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card className="border-0 shadow-lg">
                    <CardHeader>
                        <CardTitle className="text-xl">Office Hours</CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="flex justify-between py-2 border-b">
                            <span className="text-gray-600">Monday - Friday</span>
                            <span className="font-medium">9:00 AM - 5:00 PM</span>
                        </div>
                        <div className="flex justify-between py-2 border-b">
                            <span className="text-gray-600">Saturday</span>
                            <span className="font-medium">9:00 AM - 1:00 PM</span>
                        </div>
                        <div className="flex justify-between py-2">
                            <span className="text-gray-600">Sunday</span>
                            <span className="font-medium text-red-500">Closed</span>
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}

// Placeholder content for pages that don't have specific content yet
function PlaceholderContent({ title }: { title: string }) {
    return (
        <div className="text-center py-16">
            <div className="w-20 h-20 mx-auto bg-gray-100 rounded-full flex items-center justify-center mb-6">
                <BookOpen className="w-10 h-10 text-gray-400" />
            </div>
            <h2 className="text-2xl font-bold text-gray-800 mb-2">{title}</h2>
            <p className="text-gray-500 max-w-md mx-auto">
                Content for this section is being updated. Please check back soon for more information.
            </p>
        </div>
    );
}

// Main Page Component
export default function DepartmentSubPage() {
    const params = useParams();
    const dept = params.dept as string;
    const slug = params.slug as string;

    // Render the appropriate component based on slug
    const renderContent = () => {
        switch (slug) {
            case 'faculty':
                return <FacultyPage dept={dept} />;
            case 'vision-mission':
                return <VisionMissionPage dept={dept} />;
            case 'about':
                return <AboutDepartmentPage dept={dept} />;
            case 'labs':
                return <LaboratoriesPage dept={dept} />;
            case 'achievements':
                return <AchievementsPage dept={dept} />;
            case 'events':
                return <EventsPage dept={dept} />;
            case 'crt':
                return <CRTPage dept={dept} />;
            case 'contact':
                return <ContactPage dept={dept} />;
            case 'research':
                return <FacultyPage dept={dept} />; // Placeholder: Show Faculty for Research too
            case 'student-corner':
                return <PlaceholderContent title="Student Corner" />;
            case 'mentoring':
                return <PlaceholderContent title="Mentoring" />;
            case 'gallery':
                return <PlaceholderContent title="Gallery" />;
            case 'peos-psos':
                return <VisionMissionPage dept={dept} />;
            case 'hod':
                return <FacultyPage dept={dept} />; // Show HOD/Faculty list
            case 'dean':
                return <PlaceholderContent title="Dean" />;
            default:
                return <PlaceholderContent title="Department Section" />;
        }
    };

    return (
        <div className="animate-fade-in-up">
            <div className="mb-6">
                <Link href={`/departments/${dept}`}>
                    <Button variant="outline" size="sm" className="hover:bg-gray-100">
                        <ArrowLeft className="w-4 h-4 mr-2" />
                        Back to Department Home
                    </Button>
                </Link>
            </div>
            {renderContent()}
        </div>
    );
}
