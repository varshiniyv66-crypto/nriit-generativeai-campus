"use client";

import { useParams, notFound } from "next/navigation";
import { User, Calendar, Award, ArrowRight } from "lucide-react";

const DEPARTMENTS: Record<string, {
    name: string;
    fullName: string;
    shortName: string;
    color: string;
    established: number;
}> = {
    'CSE': {
        name: 'Computer Science & Engineering',
        fullName: 'Department of Computer Science and Engineering',
        shortName: 'CSE',
        color: 'from-blue-600 to-blue-800',
        established: 2001,
    },
    'CSE-DS': {
        name: 'CSE (Data Science)',
        fullName: 'Department of Computer Science and Engineering (Data Science)',
        shortName: 'CSE-DS',
        color: 'from-purple-600 to-purple-800',
        established: 2020,
    },
    'CSE-AI': {
        name: 'CSE (AI & ML)',
        fullName: 'Department of Computer Science and Engineering (AI & ML)',
        shortName: 'CSE-AI',
        color: 'from-pink-600 to-pink-800',
        established: 2020,
    },
    'IT': {
        name: 'Information Technology',
        fullName: 'Department of Information Technology',
        shortName: 'IT',
        color: 'from-green-600 to-green-800',
        established: 2001,
    },
    'ECE': {
        name: 'Electronics & Communication',
        fullName: 'Department of Electronics and Communication Engineering',
        shortName: 'ECE',
        color: 'from-amber-600 to-amber-800',
        established: 2001,
    },
    'CIVIL': {
        name: 'Civil Engineering',
        fullName: 'Department of Civil Engineering',
        shortName: 'CIVIL',
        color: 'from-red-600 to-red-800',
        established: 2008,
    },
    'MBA': {
        name: 'Master of Business Administration',
        fullName: 'Department of MBA',
        shortName: 'MBA',
        color: 'from-cyan-600 to-cyan-800',
        established: 2009,
    },
    'MCA': {
        name: 'Master of Computer Applications',
        fullName: 'Department of MCA',
        shortName: 'MCA',
        color: 'from-violet-600 to-violet-800',
        established: 2005,
    },
    'BSH': {
        name: 'Basic Sciences & Humanities',
        fullName: 'Department of Basic Sciences and Humanities',
        shortName: 'BSH',
        color: 'from-slate-600 to-slate-800',
        established: 2001,
    },
};

export default function DepartmentHome() {
    const params = useParams();
    const deptParam = (params.dept as string || '').toUpperCase();
    const deptData = DEPARTMENTS[deptParam];

    if (!deptData) {
        return (
            <div className="flex items-center justify-center min-h-[60vh]">
                <div className="text-center">
                    <h1 className="text-3xl font-bold text-gray-900 mb-4">Department Not Found</h1>
                    <p className="text-gray-500">The department you are looking for does not exist.</p>
                </div>
            </div>
        );
    }

    return (
        <div className="space-y-8 animate-fade-in-up">
            {/* Banner */}
            <div className="relative h-64 md:h-80 rounded-2xl overflow-hidden glass-card group">
                <div className={`absolute inset-0 bg-gradient-to-r ${deptData.color} opacity-90`} />
                <div className="absolute inset-0 opacity-20 bg-[url('/grid-pattern.svg')]" />

                <div className="absolute inset-0 flex items-center justify-center text-center p-6">
                    <div>
                        <span className="inline-block px-4 py-1 bg-white/20 backdrop-blur-md rounded-full text-white text-sm font-medium mb-4 border border-white/30">
                            Est. {deptData.established}
                        </span>
                        <h1 className="text-4xl md:text-5xl font-bold text-white mb-4 drop-shadow-lg">
                            Welcome to {deptData.shortName}
                        </h1>
                        <p className="text-lg text-white/90 max-w-2xl mx-auto">
                            {deptData.fullName}
                        </p>
                    </div>
                </div>
            </div>

            {/* Main Content Grid */}
            <div className="grid md:grid-cols-3 gap-8">
                {/* Left Column - Main Info */}
                <div className="md:col-span-2 space-y-8">
                    <div className="bg-white rounded-2xl p-8 shadow-sm border border-gray-100">
                        <h2 className="text-2xl font-bold text-gray-900 mb-4 pb-2 border-b-2 border-gray-100 flex items-center gap-2">
                            <span className="text-blue-600">About</span> the Department
                        </h2>
                        <div className="prose max-w-none text-gray-600">
                            <p>
                                The {deptData.fullName} at NRIIT is committed to excellence in teaching,
                                research, and innovation. Established in {deptData.established}, we strive
                                to produce globally competent professionals.
                            </p>
                        </div>
                    </div>

                    <div className="bg-white rounded-2xl p-8 shadow-sm border border-gray-100">
                        <h2 className="text-2xl font-bold text-gray-900 mb-6 pb-2 border-b-2 border-gray-100 flex items-center gap-2">
                            <Award className="w-6 h-6 text-blue-600" />
                            Recent Achievements
                        </h2>
                        <div className="space-y-4">
                            {[1, 2, 3].map((_, i) => (
                                <div key={i} className="flex gap-4 p-4 rounded-xl bg-gray-50 hover:bg-blue-50 transition-colors group">
                                    <div className="flex-shrink-0 w-12 h-12 bg-white rounded-lg shadow-sm flex items-center justify-center text-blue-600 font-bold text-lg">
                                        {i + 1}
                                    </div>
                                    <div>
                                        <h3 className="font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">
                                            Student Achievement Title Here
                                        </h3>
                                        <p className="text-sm text-gray-500">
                                            Description of the achievement...
                                        </p>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>

                {/* Right Column - Updates & HOD */}
                <div className="space-y-8">
                    {/* HOD Card */}
                    <div className="glass-card p-6 rounded-2xl text-center relative overflow-hidden">
                        <div className="absolute top-0 inset-x-0 h-24 bg-blue-600 opacity-10" />
                        <div className="relative">
                            <div className="w-24 h-24 mx-auto bg-gray-200 rounded-full border-4 border-white shadow-md mb-4 flex items-center justify-center">
                                <User className="w-10 h-10 text-gray-400" />
                            </div>
                            <h3 className="text-lg font-bold text-gray-900">Dr. Name Here</h3>
                            <p className="text-blue-600 font-medium text-sm mb-4">Head of Department</p>
                            <p className="text-sm text-gray-500 italic mb-4">
                                "Welcome to the department. We focus on holistic development..."
                            </p>
                            <button className="text-sm font-semibold text-blue-600 hover:underline">
                                View Profile
                            </button>
                        </div>
                    </div>

                    {/* News & Events */}
                    <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                        <h3 className="font-bold text-gray-900 mb-4 flex items-center gap-2">
                            <Calendar className="w-5 h-5 text-blue-600" />
                            Latest Updates
                        </h3>
                        <div className="space-y-4">
                            {[1, 2, 3].map((_, i) => (
                                <div key={i} className="border-l-2 border-gray-200 pl-4 py-1 hover:border-blue-600 transition-colors">
                                    <span className="text-xs text-gray-400 block mb-1">Dec {10 - i}, 2024</span>
                                    <a href="#" className="text-sm font-medium text-gray-700 hover:text-blue-600 block line-clamp-2">
                                        Department workshop on AI and Machine Learning...
                                    </a>
                                </div>
                            ))}
                        </div>
                        <button className="w-full mt-6 py-2 text-sm font-semibold text-center text-gray-500 hover:text-blue-600 border border-gray-200 rounded-lg hover:border-blue-600 transition-all">
                            View All Events
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}
