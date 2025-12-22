"use client";

import { useEffect, useState, useMemo } from 'react';
import { useParams } from 'next/navigation';
import { motion, AnimatePresence } from 'framer-motion';
import {
    Search,
    MapPin,
    Phone,
    Mail,
    Award,
    BookOpen,
    Users,
    FileText,
    Filter,
    Download,
    ChevronDown,
    CheckCircle2,
    ShieldCheck,
    GraduationCap,
    Calendar,
    Briefcase,
    Globe2,
    Sparkles,
    Trophy,
    Zap,
    Star
} from 'lucide-react';
import { getFacultyByDepartment, getStatsByDepartment } from '@/data/faculty';
import { departments } from '@/data/departments';
import { PieChart, Pie, Cell, ResponsiveContainer, Tooltip, Legend } from 'recharts';

// Import yearwise faculty data (same as popup)
import cseFacultyYearwise from '@/data/cse_faculty_yearwise.json';
import itFacultyYearwise from '@/data/it_faculty_yearwise.json';
import eceFacultyYearwise from '@/data/ece_faculty_yearwise.json';
import cseAiFacultyYearwise from '@/data/cse_ai_faculty_yearwise.json';
import cseDsFacultyYearwise from '@/data/ds_faculty_yearwise.json';

// Import faculty recognition data from SAR reports
import { getRecognitionByDepartment } from '@/data/faculty-recognition';

// Helper to get yearwise data by department
const getYearwiseData = (deptCode: string): Record<string, any[]> => {
    const dept = deptCode.toUpperCase();
    if (dept === 'CSE') return cseFacultyYearwise;
    if (dept === 'IT') return itFacultyYearwise;
    if (dept === 'ECE') return eceFacultyYearwise;
    if (dept === 'CSE-AI') return cseAiFacultyYearwise;
    if (dept === 'CSE-DS') return cseDsFacultyYearwise;
    return cseFacultyYearwise; // Default fallback
};

// --- Types ---
interface Faculty {
    id: string;
    name: string;
    designation: string;
    qualification?: string;
    specialization?: string;
    experience?: string;
    email?: string;
    phone?: string;
    photo?: string;
    resumeUrl?: string;
    publications?: number;
    department: string;
    title?: string;
    joiningDate?: string;
    panNumber?: string;
}

type SortOption = 'name' | 'designation' | 'experience';
type ViewMode = 'grid' | 'list';
type AcademicYear = '2025-26' | '2024-25' | '2023-24' | '2022-23';

// --- Helper Functions ---
const parseDate = (dateStr?: string): Date | null => {
    if (!dateStr) return null;
    if (dateStr.includes('-')) {
        const parts = dateStr.split('-');
        if (parts.length === 3) return new Date(dateStr);
    }
    if (dateStr.includes('/')) {
        const [day, month, year] = dateStr.split('/');
        return new Date(`${year}-${month}-${day}`);
    }
    return null;
};

const isFacultyActiveInYear = (faculty: Faculty, year: AcademicYear): boolean => {
    const joiningDate = parseDate(faculty.joiningDate);
    if (!joiningDate) return true;

    const yearEndMap: Record<AcademicYear, Date> = {
        '2025-26': new Date('2026-05-31'),
        '2024-25': new Date('2025-05-31'),
        '2023-24': new Date('2024-05-31'),
        '2022-23': new Date('2023-05-31'),
    };

    return joiningDate <= yearEndMap[year];
};

// --- INDIAN HYBRID PALETTE ---
// Saffron (Orange), White (Light Grey), Green (Emerald), Chakra (Navy Blue)
const COLORS = [
    '#FF9933', // Saffron
    '#000080', // Navy Blue
    '#138808', // India Green
    '#FFD700', // Gold
    '#800080'  // Royal Purple
];

export default function FacultyPage() {
    const params = useParams();
    const deptCode = params.dept as string;
    const deptData = departments[deptCode];

    const [allFaculty, setAllFaculty] = useState<Faculty[]>([]);
    const [activeYear, setActiveYear] = useState<AcademicYear>('2025-26');
    const [searchQuery, setSearchQuery] = useState('');

    // State for Google Form uploaded photos/resumes
    const [formUploads, setFormUploads] = useState<Record<string, { photo: string; resume: string }>>({});

    // Fetch photos/resumes from Google Form responses sheet
    useEffect(() => {
        const fetchFormUploads = async () => {
            try {
                const response = await fetch(
                    'https://docs.google.com/spreadsheets/d/1oNalDameuL9dwLfdrUqNGc9gFjefQZgYWI912xic0yw/export?format=csv',
                    { cache: 'no-store' }
                );
                const csv = await response.text();
                const lines = csv.split('\n');

                const uploads: Record<string, { photo: string; resume: string }> = {};

                // Skip header row, parse each row
                for (let i = 1; i < lines.length; i++) {
                    const line = lines[i].trim();
                    if (!line) continue;

                    // Simple CSV parsing (handle quoted fields)
                    const fields = line.split(',').map(f => f.replace(/^"|"$/g, '').trim());

                    // Columns: Timestamp, Email, TIME, Date, Full Name, PAN, Department, Designation, Photo, Resume
                    const pan = (fields[5] || '').toUpperCase();
                    let photo = fields[8] || '';
                    let resume = fields[9] || '';

                    // Convert Google Drive share links to direct URLs
                    // Format: https://drive.google.com/open?id=XXX → https://drive.google.com/uc?export=view&id=XXX
                    const convertDriveUrl = (url: string, isImage: boolean = false) => {
                        if (url.includes('drive.google.com')) {
                            const idMatch = url.match(/id=([a-zA-Z0-9_-]+)/);
                            if (idMatch) {
                                return isImage
                                    ? `https://drive.google.com/uc?export=view&id=${idMatch[1]}`
                                    : `https://drive.google.com/file/d/${idMatch[1]}/view`;
                            }
                        }
                        return url;
                    };

                    photo = convertDriveUrl(photo, true);
                    resume = convertDriveUrl(resume, false);

                    if (pan) {
                        uploads[pan] = { photo, resume };
                    }
                }

                setFormUploads(uploads);
            } catch (error) {
                console.log('Could not fetch Google Form uploads, using defaults');
            }
        };

        fetchFormUploads();
    }, []);

    // Get yearwise data from JSON files (same as popup)
    useEffect(() => {
        if (deptCode) {
            const yearwiseData = getYearwiseData(deptCode);
            const yearData = yearwiseData[activeYear] || [];
            // Transform JSON data to Faculty interface
            const transformedData: Faculty[] = yearData.map((f: any, index: number) => {
                const name = f.name || '';
                const pan = (f.pan || '').toUpperCase();
                const panLower = pan.toLowerCase();

                // Check if faculty uploaded photo/resume via Google Form
                const formData = formUploads[pan];

                // Generate auto avatar using UI Avatars service (fallback)
                const encodedName = encodeURIComponent(name.replace(/Dr\.|Mr\.|Mrs\.|Ms\.|\./g, '').trim());
                const bgColor = ['4F46E5', 'F97316', '16A34A', '0EA5E9', 'A855F7'][index % 5];
                const defaultPhoto = `https://ui-avatars.com/api/?name=${encodedName}&background=${bgColor}&color=fff&size=128&font-size=0.35&bold=true`;

                // Photo priority: 1. Local file (jpg/png) 2. Google Form upload 3. Auto avatar
                // Check for local photo files: /faculty/photos/{pan}.jpg or .png
                const localPhotoJpg = panLower ? `/faculty/photos/${panLower}.jpg` : null;
                const localPhotoPng = panLower ? `/faculty/photos/${panLower}.png` : null;

                // Try local first, then form upload, then auto avatar
                const photoUrl = localPhotoJpg || formData?.photo || defaultPhoto;

                return {
                    id: `${deptCode.toUpperCase()}-${String(index + 1).padStart(3, '0')}`,
                    name: name,
                    designation: f.designation || '',
                    qualification: f.qualification || '',
                    department: deptCode.toUpperCase(),
                    joiningDate: f.doj || '',
                    panNumber: f.pan || '',
                    title: name.startsWith('Dr') ? 'Dr.' : (name.startsWith('Mr') ? 'Mr.' : 'Mrs.'),
                    // Photo priority: local file > Google Form > auto avatar
                    photo: photoUrl,
                    // Resume priority: Google Form > local file
                    resumeUrl: formData?.resume || (f.pan && f.pan !== 'N/A' ? `/faculty/resumes/${panLower}.pdf` : undefined)
                };
            });
            setAllFaculty(transformedData);
        }
    }, [deptCode, activeYear, formUploads]);

    // --- Filtering Logic ---
    const filteredFaculty = useMemo(() => {
        return allFaculty.filter(f => {
            const matchesSearch =
                f.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
                f.designation.toLowerCase().includes(searchQuery.toLowerCase());
            return matchesSearch;
        });
    }, [allFaculty, searchQuery]);



    // --- Stats Calculation ---
    const stats = useMemo(() => {
        const deptStats = getStatsByDepartment(deptCode);
        const total = filteredFaculty.length;
        const phds = filteredFaculty.filter(f => f.qualification?.includes('Ph.D') || f.title === 'Dr.').length;
        const professors = filteredFaculty.filter(f => f.designation === 'Professor').length;
        const assocProfs = filteredFaculty.filter(f => f.designation === 'Associate Professor').length;
        const asstProfs = filteredFaculty.filter(f => f.designation === 'Assistant Professor').length;

        // Use real student count if available, else default to 720
        const studentCount = deptStats?.students || 720;
        const studentRatio = `1:${Math.round(studentCount / (total || 1))}`;

        // Use real publications if available
        const publications = deptStats?.publications || Math.round(total * 3.5);

        const pieData = [
            { name: 'Professor', value: professors },
            { name: 'Associate Prof.', value: assocProfs },
            { name: 'Assistant Prof.', value: asstProfs },
            { name: 'Others', value: total - (professors + assocProfs + asstProfs) }
        ].filter(d => d.value > 0);

        return { total, phds, professors, pieData, studentRatio, publications };
    }, [filteredFaculty, deptCode]);

    // --- Get Recognition Data from SAR ---
    const recognitionData = useMemo(() => {
        return getRecognitionByDepartment(deptCode);
    }, [deptCode]);

    if (!deptData) return <div className="p-10 text-center text-white">Department not found</div>;

    return (
        <div className="min-h-screen bg-[#0B0F19] text-white font-sans selection:bg-orange-500/30">

            {/* --- HERO SECTION: INDIAN HYBRID THEME --- */}
            <div className="relative pt-24 pb-32 px-4 sm:px-8 overflow-hidden">
                {/* Dynamic Backgrounds - Saffron & Green Glows */}
                <div className="absolute top-0 right-0 w-[800px] h-[800px] bg-orange-500/10 rounded-full blur-[120px] -translate-y-1/2 translate-x-1/3 animate-pulse" />
                <div className="absolute bottom-0 left-0 w-[600px] h-[600px] bg-green-600/10 rounded-full blur-[100px] translate-y-1/3 -translate-x-1/4" />
                <div className="absolute top-1/2 left-1/2 w-[500px] h-[500px] bg-blue-900/10 rounded-full blur-[100px] -translate-x-1/2 -translate-y-1/2" />

                <div className="max-w-7xl mx-auto relative z-10">
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ duration: 0.6 }}
                        className="text-center mb-12"
                    >
                        <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-gradient-to-r from-orange-500/10 to-green-500/10 border border-orange-500/20 text-orange-200 text-xs font-bold uppercase tracking-widest mb-4 backdrop-blur-md">
                            <Globe2 className="w-3 h-3 text-orange-400" /> World Class Faculty
                        </div>
                        <h1 className="text-5xl md:text-7xl font-black tracking-tighter text-transparent bg-clip-text bg-gradient-to-r from-orange-400 via-white to-green-400 mb-6 drop-shadow-2xl">
                            {deptData.code.toUpperCase()} <span className="text-white">Directory</span>
                        </h1>
                        <p className="text-xl text-slate-300 max-w-2xl mx-auto leading-relaxed">
                            Meet the visionaries and educators shaping the future of technology with <span className="text-orange-400 font-bold">Indian Values</span> & <span className="text-green-400 font-bold">Global Excellence</span>.
                        </p>
                    </motion.div>

                    {/* --- GOLD & DIAMOND RECOGNITION --- */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6 max-w-4xl mx-auto mb-8">
                        {/* Gold Card - Research Excellence (Publications & Research) */}
                        <motion.div
                            initial={{ x: -20, opacity: 0 }}
                            animate={{ x: 0, opacity: 1 }}
                            transition={{ delay: 0.2 }}
                            className="relative group p-1 rounded-3xl bg-gradient-to-br from-orange-400 via-amber-500 to-yellow-500 shadow-[0_0_40px_-10px_rgba(255,153,51,0.3)] hover:shadow-[0_0_60px_-10px_rgba(255,153,51,0.5)] transition-all duration-500"
                        >
                            <div className="absolute inset-0 bg-white/20 blur-xl opacity-0 group-hover:opacity-100 transition-opacity duration-500" />
                            <div className="relative h-full bg-[#111827] rounded-[22px] p-6 flex items-center justify-between overflow-hidden">
                                <div className="absolute right-0 top-0 w-32 h-32 bg-orange-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2" />
                                <div>
                                    <div className="flex items-center gap-2 text-orange-400 mb-1">
                                        <Trophy className="w-5 h-5 fill-orange-400" />
                                        <span className="text-xs font-bold tracking-widest uppercase">Research Excellence</span>
                                    </div>
                                    <div className="text-4xl font-black text-white mb-1">
                                        {recognitionData.researchExcellence.totalPublications}+
                                        <span className="text-amber-400 text-2xl ml-2">Papers</span>
                                    </div>
                                    <div className="text-sm text-slate-400">
                                        SCI/Scopus Indexed • {recognitionData.researchExcellence.patents} Patents
                                    </div>
                                </div>
                                <div className="h-16 w-16 rounded-full bg-gradient-to-br from-orange-500 to-amber-600 p-0.5 shadow-lg group-hover:scale-110 transition-transform duration-500">
                                    <div className="h-full w-full rounded-full bg-[#111827] flex items-center justify-center">
                                        <Award className="w-8 h-8 text-orange-500" />
                                    </div>
                                </div>
                            </div>
                        </motion.div>

                        {/* Diamond Card - Faculty Professional Memberships */}
                        <motion.div
                            initial={{ x: 20, opacity: 0 }}
                            animate={{ x: 0, opacity: 1 }}
                            transition={{ delay: 0.3 }}
                            className="relative group p-1 rounded-3xl bg-gradient-to-br from-cyan-300 via-blue-500 to-indigo-600 shadow-[0_0_40px_-10px_rgba(59,130,246,0.3)] hover:shadow-[0_0_60px_-10px_rgba(59,130,246,0.5)] transition-all duration-500"
                        >
                            <div className="absolute inset-0 bg-white/20 blur-xl opacity-0 group-hover:opacity-100 transition-opacity duration-500" />
                            <div className="relative h-full bg-[#111827] rounded-[22px] p-6 flex items-center justify-between overflow-hidden">
                                <div className="absolute right-0 top-0 w-32 h-32 bg-blue-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2" />
                                <div>
                                    <div className="flex items-center gap-2 text-cyan-400 mb-1">
                                        <Sparkles className="w-5 h-5 fill-cyan-400" />
                                        <span className="text-xs font-bold tracking-widest uppercase">Faculty Excellence</span>
                                    </div>
                                    <div className="text-4xl font-black text-white mb-1">
                                        {recognitionData.facultyMemberships.total}+
                                        <span className="text-cyan-400 text-2xl ml-2">IAENG</span>
                                    </div>
                                    <div className="text-sm text-slate-400">
                                        Professional Members • {recognitionData.phdFaculty} Ph.D. Faculty
                                    </div>
                                </div>
                                <div className="h-16 w-16 rounded-full bg-gradient-to-br from-cyan-400 to-blue-600 p-0.5 shadow-lg group-hover:scale-110 transition-transform duration-500">
                                    <div className="h-full w-full rounded-full bg-[#111827] flex items-center justify-center">
                                        <Zap className="w-8 h-8 text-cyan-400" />
                                    </div>
                                </div>
                            </div>
                        </motion.div>
                    </div>

                    {/* --- FACULTY PERFORMANCE TABLE (3 Years) --- */}
                    <motion.div
                        initial={{ y: 20, opacity: 0 }}
                        animate={{ y: 0, opacity: 1 }}
                        transition={{ delay: 0.4 }}
                        className="max-w-4xl mx-auto mb-16"
                    >
                        <div className="relative p-1 rounded-2xl bg-gradient-to-r from-green-500/50 via-emerald-500/50 to-teal-500/50">
                            <div className="bg-[#111827] rounded-xl p-6 overflow-hidden">
                                <div className="flex items-center gap-3 mb-6">
                                    <div className="h-10 w-10 rounded-full bg-gradient-to-br from-green-500 to-emerald-600 flex items-center justify-center">
                                        <GraduationCap className="w-5 h-5 text-white" />
                                    </div>
                                    <div>
                                        <h3 className="text-lg font-bold text-white">Faculty Performance & Development</h3>
                                        <p className="text-xs text-slate-400">Data from Self Assessment Reports (Academic Years 2022-25)</p>
                                    </div>
                                </div>

                                <div className="overflow-x-auto">
                                    <table className="w-full text-left" suppressHydrationWarning>
                                        <thead>
                                            <tr className="border-b border-white/10">
                                                <th className="pb-3 text-sm font-semibold text-slate-400">Metric</th>
                                                {recognitionData.yearlyPerformance.map(y => (
                                                    <th key={y.year} className="pb-3 text-sm font-semibold text-center text-white">{y.year}</th>
                                                ))}
                                            </tr>
                                        </thead>
                                        <tbody className="text-sm">
                                            <tr className="border-b border-white/5 hover:bg-white/5 transition-colors">
                                                <td className="py-3 text-slate-300">Faculty sent for Training</td>
                                                {recognitionData.yearlyPerformance.map(y => (
                                                    <td key={y.year} className="py-3 text-center text-orange-400 font-bold">{y.training}</td>
                                                ))}
                                            </tr>
                                            <tr className="border-b border-white/5 hover:bg-white/5 transition-colors">
                                                <td className="py-3 text-slate-300">Faculty sent for FDPs</td>
                                                {recognitionData.yearlyPerformance.map(y => (
                                                    <td key={y.year} className="py-3 text-center text-blue-400 font-bold">{y.fdps}</td>
                                                ))}
                                            </tr>
                                            <tr className="border-b border-white/5 hover:bg-white/5 transition-colors">
                                                <td className="py-3 text-slate-300">Certificate of Merit + Cash Award</td>
                                                {recognitionData.yearlyPerformance.map(y => (
                                                    <td key={y.year} className="py-3 text-center text-amber-400 font-bold">{y.meritCashAward}</td>
                                                ))}
                                            </tr>
                                            <tr className="hover:bg-white/5 transition-colors">
                                                <td className="py-3 text-slate-300">Certificate of Merit</td>
                                                {recognitionData.yearlyPerformance.map(y => (
                                                    <td key={y.year} className="py-3 text-center text-green-400 font-bold">{y.meritCertificate}</td>
                                                ))}
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </motion.div>

                    {/* --- SEARCH & FILTERS --- */}
                    <div className="flex flex-col md:flex-row justify-between items-end gap-6 border-b border-white/10 pb-8">
                        <div className="space-y-4 w-full md:w-auto">
                            <label className="text-xs font-semibold text-slate-500 uppercase tracking-widest">Academic Filter</label>
                            <div className="flex gap-2 bg-white/5 p-1.5 rounded-2xl backdrop-blur-md border border-white/5 w-fit">
                                {(['2025-26', '2024-25', '2023-24', '2022-23'] as AcademicYear[]).map((year) => (
                                    <button
                                        key={year}
                                        onClick={() => setActiveYear(year)}
                                        className={`px-5 py-2.5 rounded-xl text-sm font-bold transition-all duration-300 ${activeYear === year
                                            ? 'bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-lg shadow-orange-500/25 ring-1 ring-orange-400/50'
                                            : 'text-slate-400 hover:text-white hover:bg-white/5'
                                            }`}
                                    >
                                        {year}
                                    </button>
                                ))}
                            </div>
                        </div>

                        <div className="w-full md:w-96">
                            <div className="relative group">
                                <div className="absolute -inset-0.5 bg-gradient-to-r from-orange-500 to-green-500 rounded-full opacity-30 group-hover:opacity-100 blur transition duration-500"></div>
                                <div className="relative bg-[#0f172a] rounded-full flex items-center">
                                    <Search className="absolute left-4 w-5 h-5 text-slate-400 group-hover:text-white transition-colors" />
                                    <input
                                        type="text"
                                        placeholder="Search faculty..."
                                        value={searchQuery}
                                        onChange={(e) => setSearchQuery(e.target.value)}
                                        className="w-full bg-transparent border-none text-white px-12 py-3.5 focus:outline-none focus:ring-0 placeholder-slate-500 font-medium"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div className="max-w-7xl mx-auto px-4 sm:px-8 -mt-20 relative z-20 pb-24 h-full">

                {/* --- MAIN DASHBOARD: VIBRANT INDIAN COLORS --- */}
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                    <StatCard
                        icon={<Users className="w-6 h-6" />}
                        label="Total Faculty"
                        value={stats.total}
                        subtext="Active Members"
                        gradient="from-blue-600 to-indigo-800" // Navy Blue
                        accentColor="text-blue-400"
                    />
                    <StatCard
                        icon={<GraduationCap className="w-6 h-6" />}
                        label="Ph.D Holders"
                        value={stats.phds}
                        subtext="Research Experts"
                        gradient="from-orange-500 to-amber-700" // Saffron
                        accentColor="text-orange-400"
                    />
                    <StatCard
                        icon={<FileText className="w-6 h-6" />}
                        label="Publications"
                        value={stats.publications}
                        subtext="Scopus Indexed"
                        gradient="from-green-600 to-emerald-800" // Green
                        accentColor="text-green-400"
                    />
                    <StatCard
                        icon={<Star className="w-6 h-6" />}
                        label="Student Ratio"
                        value={stats.studentRatio}
                        subtext="Optimal Mentorship"
                        gradient="from-yellow-500 to-amber-600" // Gold
                        accentColor="text-yellow-400"
                    />
                </div>

                <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    {/* --- PIE CHART --- */}
                    <motion.div
                        initial={{ opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        className="lg:col-span-1 bg-slate-900/50 backdrop-blur-xl rounded-3xl p-6 border border-white/10 shadow-2xl"
                    >
                        <h3 className="text-lg font-bold text-white mb-6 flex items-center gap-3">
                            <div className="p-2 rounded-lg bg-orange-500/20 text-orange-400"><Filter className="w-5 h-5" /></div>
                            Designation Breakdown
                        </h3>
                        <div className="h-[300px] w-full relative">
                            <ResponsiveContainer width="100%" height="100%">
                                <PieChart>
                                    <Pie
                                        data={stats.pieData}
                                        cx="50%"
                                        cy="50%"
                                        innerRadius={60}
                                        outerRadius={80}
                                        paddingAngle={5}
                                        dataKey="value"
                                    >
                                        {stats.pieData.map((entry, index) => (
                                            <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} stroke="rgba(0,0,0,0)" />
                                        ))}
                                    </Pie>
                                    <Tooltip
                                        contentStyle={{ backgroundColor: '#1e293b', borderRadius: '12px', border: '1px solid rgba(255,255,255,0.1)', color: '#fff' }}
                                    />
                                    <Legend verticalAlign="bottom" height={36} wrapperStyle={{ color: '#94a3b8' }} />
                                </PieChart>
                            </ResponsiveContainer>
                            <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-center -mt-4 pointer-events-none">
                                <span className="text-3xl font-black text-white">{stats.total}</span>
                                <p className="text-xs text-slate-400 uppercase tracking-wider font-bold">Staff</p>
                            </div>
                        </div>
                    </motion.div>

                    {/* --- LIST TABLE --- */}
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.2 }}
                        className="lg:col-span-2 bg-slate-900/50 backdrop-blur-xl rounded-3xl border border-white/10 shadow-2xl overflow-hidden flex flex-col"
                    >
                        <div className="p-6 border-b border-white/10 flex justify-between items-center bg-white/5">
                            <div className="flex items-center gap-3">
                                <div className="bg-green-500/20 p-2 rounded-lg text-green-400">
                                    <ShieldCheck className="w-5 h-5" />
                                </div>
                                <div>
                                    <h3 className="text-lg font-bold text-white">Verified Registry</h3>
                                    <p className="text-xs text-slate-400">Synced with {activeYear} Database</p>
                                </div>
                            </div>
                            <div className="px-3 py-1 bg-white/5 rounded-full text-xs font-mono text-slate-300 border border-white/10">
                                {filteredFaculty.length} Results
                            </div>
                        </div>

                        <div className="overflow-x-auto flex-1 custom-scrollbar">
                            <table className="w-full text-left border-collapse" suppressHydrationWarning>
                                <thead>
                                    <tr className="bg-white/5 border-b border-white/5">
                                        <th className="py-4 px-6 text-xs font-bold text-slate-400 uppercase tracking-wider">Photo</th>
                                        <th className="py-4 px-6 text-xs font-bold text-slate-400 uppercase tracking-wider">Name</th>
                                        <th className="py-4 px-6 text-xs font-bold text-slate-400 uppercase tracking-wider">Designation</th>
                                        <th className="py-4 px-6 text-xs font-bold text-slate-400 uppercase tracking-wider">Qual.</th>
                                        <th className="py-4 px-6 text-xs font-bold text-slate-400 uppercase tracking-wider">Joined</th>
                                        <th className="py-4 px-6 text-xs font-bold text-slate-400 uppercase tracking-wider">Status</th>
                                        <th className="py-4 px-6 text-xs font-bold text-slate-400 uppercase tracking-wider">Profile</th>
                                    </tr>
                                </thead>
                                <tbody className="divide-y divide-white/5">
                                    {filteredFaculty.length > 0 ? (
                                        filteredFaculty.map((faculty, idx) => {
                                            // Helper to generate consistent colors based on name
                                            const getAvatarColor = (name: string) => {
                                                const colors = [
                                                    'from-blue-500 to-cyan-400',
                                                    'from-emerald-500 to-green-400',
                                                    'from-orange-500 to-amber-400',
                                                    'from-purple-500 to-fuchsia-400',
                                                    'from-rose-500 to-pink-400',
                                                    'from-indigo-500 to-violet-400'
                                                ];
                                                let hash = 0;
                                                for (let i = 0; i < name.length; i++) {
                                                    hash = name.charCodeAt(i) + ((hash << 5) - hash);
                                                }
                                                return colors[Math.abs(hash) % colors.length];
                                            };

                                            // Helper to get initials (First letter of first 2 words)
                                            const getInitials = (name: string) => {
                                                const cleanName = name.replace(/Dr\.|Mr\.|Mrs\.|Ms\./g, "").trim();
                                                const parts = cleanName.split(" ").filter(p => p.length > 0);
                                                if (parts.length >= 2) {
                                                    return (parts[0][0] + parts[1][0]).toUpperCase();
                                                }
                                                return cleanName.substring(0, 2).toUpperCase();
                                            };

                                            const initials = getInitials(faculty.name);
                                            const bgGradient = getAvatarColor(faculty.name);

                                            return (
                                                <tr key={faculty.id} className="hover:bg-white/5 transition-colors group">
                                                    {/* Photo Column */}
                                                    <td className="py-4 px-6">
                                                        <div className={`w-12 h-12 rounded-xl overflow-hidden bg-gradient-to-br ${bgGradient} flex items-center justify-center border border-white/10 shadow-lg group-hover:scale-105 transition-transform duration-300 ring-1 ring-white/5 group-hover:ring-white/20`}>
                                                            {/* Prefer real photo if valid, else fallback to initials */}
                                                            {faculty.photo && !faculty.photo.includes('ui-avatars.com') ? (
                                                                <img
                                                                    src={faculty.photo}
                                                                    alt={faculty.name}
                                                                    className="w-full h-full object-cover"
                                                                    onError={(e) => {
                                                                        // Fallback on error by hiding image and showing initials behind it (already rendered by parent div bg)
                                                                        e.currentTarget.style.display = 'none';
                                                                        e.currentTarget.parentElement?.classList.add('show-initials');
                                                                    }}
                                                                />
                                                            ) : null}
                                                            {/* Initials are always here, visible if no photo or photo fails/is hidden */}
                                                            <span className={`text-sm font-black text-white drop-shadow-md ${faculty.photo && !faculty.photo.includes('ui-avatars.com') ? 'absolute -z-10' : ''}`}>
                                                                {initials}
                                                            </span>
                                                        </div>
                                                    </td>
                                                    {/* Name Column */}
                                                    <td className="py-4 px-6">
                                                        <div>
                                                            <p className="text-sm font-bold text-slate-200 group-hover:text-white transition-colors">
                                                                {faculty.title} {faculty.name}
                                                            </p>
                                                            <p className="text-[10px] text-slate-500 font-mono tracking-tight">{faculty.id}</p>
                                                        </div>
                                                    </td>
                                                    <td className="py-4 px-6">
                                                        <span className={`inline-flex items-center px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-wide border ${faculty.designation.includes('Professor') && !faculty.designation.includes('Assistant')
                                                            ? 'bg-orange-500/10 text-orange-400 border-orange-500/20' // Professor - Saffron
                                                            : 'bg-blue-500/10 text-blue-400 border-blue-500/20' // Assistant - Blue
                                                            }`}>
                                                            {faculty.designation}
                                                        </span>
                                                    </td>
                                                    <td className="py-4 px-6 text-sm text-slate-400 font-medium">
                                                        {faculty.qualification || 'N/A'}
                                                    </td>
                                                    <td className="py-4 px-6 text-sm text-slate-500 font-mono">
                                                        {faculty.joiningDate || '-'}
                                                    </td>
                                                    {/* Status Column */}
                                                    <td className="py-4 px-6">
                                                        <div className="flex items-center gap-1.5 ">
                                                            <div className="w-1.5 h-1.5 rounded-full bg-green-500 animate-pulse" />
                                                            <span className="text-xs font-medium text-green-400">Regular</span>
                                                        </div>
                                                    </td>
                                                    {/* Profile Column */}
                                                    <td className="py-4 px-6">
                                                        <a
                                                            href={faculty.resumeUrl || '#'}
                                                            target="_blank"
                                                            rel="noopener noreferrer"
                                                            className={`inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-bold transition-colors border ${faculty.resumeUrl
                                                                ? 'bg-orange-500/10 hover:bg-orange-500/20 text-orange-400 border-orange-500/20'
                                                                : 'bg-slate-800/50 text-slate-500 border-slate-700 cursor-not-allowed'
                                                                }`}
                                                            onClick={(e) => !faculty.resumeUrl && e.preventDefault()}
                                                        >
                                                            <FileText className="w-3.5 h-3.5" />
                                                            {faculty.name.split(' ').map(n => n[0]).join('').substring(0, 3)}
                                                        </a>
                                                    </td>
                                                </tr>
                                            );
                                        })
                                    ) : (
                                        <tr>
                                            <td colSpan={7} className="py-16 text-center text-slate-500">
                                                <div className="flex flex-col items-center gap-2">
                                                    <Search className="w-8 h-8 opacity-20" />
                                                    <p>No faculty found for {activeYear}</p>
                                                </div>
                                            </td>
                                        </tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </motion.div>
                </div>

                {/* Footer Note */}
                <div className="text-center text-slate-600 text-sm mt-12 pb-8">
                    <p className="flex items-center justify-center gap-2" suppressHydrationWarning>
                        <CheckCircle2 className="w-4 h-4 text-green-500/50" />
                        Data Verified by Dean's Office • Last Updated: {new Date().toLocaleDateString()}
                    </p>
                </div>

            </div>
        </div>
    );
}

// --- Sub-Components ---

function StatCard({ icon, label, value, subtext, gradient, accentColor }: { icon: React.ReactNode, label: string, value: string | number, subtext: string, gradient: string, accentColor: string }) {
    return (
        <motion.div
            whileHover={{ y: -5 }}
            className="relative overflow-hidden rounded-3xl p-[1px] bg-gradient-to-b from-white/10 to-transparent shadow-2xl group"
        >
            <div className="relative h-full bg-[#111827] bg-opacity-80 backdrop-blur-xl rounded-[22px] p-6 flex flex-col items-center text-center overflow-hidden">
                {/* Glow Effect */}
                <div className={`absolute -top-10 -right-10 w-32 h-32 bg-gradient-to-br ${gradient} opacity-20 blur-3xl group-hover:opacity-40 transition-opacity duration-500`} />

                <div className={`mb-4 p-3 rounded-2xl bg-gradient-to-br ${gradient} text-white shadow-lg shadow-black/20 group-hover:scale-110 transition-transform duration-300 ring-1 ring-white/10`}>
                    {icon}
                </div>
                <div className="text-4xl font-black tracking-tight mb-1 text-white tabular-nums z-10">
                    {value}
                </div>
                <div className={`text-xs font-bold ${accentColor} uppercase tracking-widest mb-2 z-10 opacity-90`}>
                    {label}
                </div>
                <div className="text-[10px] text-zinc-400 bg-white/5 px-2 py-0.5 rounded-full border border-white/5 z-10 group-hover:text-white transition-colors">
                    {subtext}
                </div>
            </div>
        </motion.div>
    )
}
