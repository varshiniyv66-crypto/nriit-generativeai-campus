"use client";

import { useEffect, useState, useMemo } from 'react';
import { useParams } from 'next/navigation';
import { motion, AnimatePresence } from 'framer-motion';
import { FacultyProfileModal } from "@/components/department/FacultyProfileModal";
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
import mbaFacultyYearwise from '@/data/mba_faculty_yearwise.json';
import mcaFacultyYearwise from '@/data/mca_faculty_yearwise.json';
import bshFacultyYearwise from '@/data/bsh_faculty_yearwise.json';
import civilFacultyYearwise from '@/data/civil_faculty_yearwise.json';
import evtFacultyYearwise from '@/data/evt_faculty_yearwise.json';

// Import faculty recognition data from SAR reports
import { getRecognitionByDepartment } from '@/data/faculty-recognition';

// Helper to get yearwise data by department
const getYearwiseData = (deptCode: string): Record<string, any[]> => {
    const dept = deptCode.toUpperCase();
    if (dept === 'CSE') return cseFacultyYearwise;
    if (dept === 'IT' || dept === 'INFORMATION TECHNOLOGY') return itFacultyYearwise;
    if (dept === 'ECE') return eceFacultyYearwise;
    if (['AIML', 'CSE-AI', 'CSE(AI&ML)', 'CSM'].includes(dept)) return cseAiFacultyYearwise;
    if (['DS', 'CSE-DS', 'CSD', 'DATA SCIENCE'].includes(dept)) return cseDsFacultyYearwise;
    if (dept === 'MBA' || dept === 'MASTER OF BUSINESS ADMINISTRATION') return mbaFacultyYearwise;
    if (dept === 'MCA' || dept === 'MASTER OF COMPUTER APPLICATIONS') return mcaFacultyYearwise;
    if (['BSH', 'S&H', 'FED', 'BASIC SCIENCES'].includes(dept)) return bshFacultyYearwise;
    if (['CIVIL', 'CIV', 'CE'].includes(dept)) return civilFacultyYearwise;
    if (['EVT', 'VLSI'].includes(dept)) return evtFacultyYearwise;
    return {}; // Return empty if no match
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
    pan?: string;
    nature?: string;
    panNumber?: string;
}

type SortOption = 'name' | 'designation' | 'experience';
type ViewMode = 'grid' | 'list';
type AcademicYear = '2025-26' | '2024-25' | '2023-24' | '2022-23';

// --- Helper Functions ---
const parseDate = (dateStr?: string): Date | null => {
    if (!dateStr) return null;

    let day: string | undefined, month: string | undefined, year: string | undefined;

    // Handle YYYY-MM-DD or DD-MM-YYYY
    if (dateStr.includes('-')) {
        const parts = dateStr.split('-').map(p => p.trim());
        if (parts[0].length === 4) {
            [year, month, day] = parts;
        } else {
            [day, month, year] = parts;
        }
    }
    // Handle DD/MM/YYYY
    else if (dateStr.includes('/')) {
        [day, month, year] = dateStr.split('/').map(p => p.trim());
    }
    // Handle DD.MM.YYYY
    else if (dateStr.includes('.')) {
        [day, month, year] = dateStr.split('.').map(p => p.trim());
    } else {
        return null;
    }

    const y = parseInt(year || '0', 10);
    const m = parseInt(month || '0', 10);
    const d = parseInt(day || '0', 10);

    if (isNaN(y) || isNaN(m) || isNaN(d) || y < 1900 || y > 2100) return null;

    return new Date(y, m - 1, d);
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

                    // Simple CSV parser that handles quotes
                    // This regex matches: "quoted value" OR non-comma-value
                    const parts = line.match(/(".*?"|[^",\s]+)(?=\s*,|\s*$)/g);

                    if (parts && parts.length >= 4) {
                        // Assuming columns: Timestamp, Email, FacultyId/Name/Details..., Photo, Resume, PAN
                        // Adjust indices based on actual Google Sheet columns
                        // From previous context: 2=Name, 3=Designation, 4=Photo, 5=Resume, 6=PAN
                        // But let's look for known patterns

                        // We need PAN to map securely. Assuming PAN is in one of the columns or we map by ID
                        // Let's rely on finding a PAN-like string in the row
                        // Standard PAN regex: [A-Z]{5}[0-9]{4}[A-Z]{1}

                        const rowText = line.toUpperCase();
                        const panMatch = rowText.match(/[A-Z]{5}[0-9]{4}[A-Z]{1}/);

                        if (panMatch) {
                            const pan = panMatch[0];
                            // Extract URLs
                            // Google Drive links usually contain 'drive.google.com'
                            let photo = parts.find(p => p.includes('drive.google.com') && (p.toLowerCase().includes('photo') || p.toLowerCase().includes('image') || lines[0].split(',')[lines[i].indexOf(p)]?.toLowerCase().includes('photo'))) || '';
                            let resume = parts.find(p => p.includes('drive.google.com') && (p.toLowerCase().includes('resume') || p.toLowerCase().includes('cv') || p.toLowerCase().includes('pdf'))) || '';

                            // Fallback: If strict column mapping is needed, we would need the header.
                            // For now, let's grab the first two Drive links found
                            const driveLinks = parts.filter(p => p.includes('drive.google.com'));
                            if (driveLinks.length > 0) photo = driveLinks[0].replace(/"/g, '');
                            if (driveLinks.length > 1) resume = driveLinks[1].replace(/"/g, '');

                            // Clean URLs
                            const convertDriveUrl = (url: string, isImage: boolean = false) => {
                                if (url.includes('drive.google.com')) {
                                    const idMatch = url.match(/id=([a-zA-Z0-9_-]+)/);
                                    if (idMatch) {
                                        return isImage
                                            ? `https://drive.google.com/thumbnail?id=${idMatch[1]}&sz=w1000` // Revert to thumbnail API as it is more standard and headers are handled better
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
                let rawName = f.name || f.NAME || f["Name of the Faculty"] || '';
                rawName = rawName.trim();

                // Determine Title (Case insensitive, handles with or without dot)
                let title = '';
                const upperName = rawName.toUpperCase();

                if (upperName.startsWith('DR')) title = 'Dr.';
                else if (upperName.startsWith('PROF')) title = 'Prof.';
                else if (upperName.startsWith('MRS')) title = 'Mrs.';
                else if (upperName.startsWith('MS')) title = 'Ms.';
                else if (upperName.startsWith('MR')) title = 'Mr.';
                else {
                    // If no title found in name, check designation or default based on gender if available (not available here)
                    // For now, default to empty to avoid "Mr. Ms. Name" issues
                    // But if we want a default, we should be careful. 
                    // User complained about "Mr. Dr", implying "Mr" was forced.
                    title = '';
                }

                // Clean name: Remove titles and special chars
                // Regex matches: Start of string -> One or more (Title + optional dot + space)
                // FIX: Use word boundaries (\b) to prevent "Mr" matching inside "Mrs"
                // FIX: Use global flag and loop concept by matching the pattern at the start
                const cleanName = rawName.replace(/^(\b(Prof|Mrs|Ms|Dr|Mr)\b\.?\s*)+/i, '').trim();

                const pan = (f.pan || f.PAN || '').toUpperCase();
                const panLower = pan.toLowerCase();

                // Check if faculty uploaded photo/resume via Google Form
                const formData = formUploads[pan];

                // Generate auto avatar using UI Avatars service (fallback)
                const encodedName = encodeURIComponent(cleanName);
                const bgColor = ['4F46E5', 'F97316', '16A34A', '0EA5E9', 'A855F7'][index % 5];
                const defaultPhoto = `https://ui-avatars.com/api/?name=${encodedName}&background=${bgColor}&color=fff&size=128&font-size=0.35&bold=true`;

                // Photo priority: 1. Google Form upload 2. Local file (jpg/png) 3. Auto avatar
                const localPhotoJpg = panLower ? `/faculty/photos/${panLower}.jpg` : null;
                // FIX: Prioritize formData.photo because localPhotoJpg is just a string path that might 404.
                // If the user uploaded a photo via Form, we want to show that.
                const photoUrl = formData?.photo || localPhotoJpg || defaultPhoto;

                // Calculate Experience
                let experience = 'N/A';
                const dojRaw = f.doj || f.DOJ || f["Date of Joining"] || f["date_of_joining"];
                if (dojRaw) {
                    const dojDate = parseDate(dojRaw); // Use helper function
                    if (dojDate && !isNaN(dojDate.getTime())) {
                        const currentYear = new Date().getFullYear();
                        const joinYear = dojDate.getFullYear();
                        const diff = currentYear - joinYear;
                        // Defensive check: Ensure diff is a number and non-negative
                        const safeYears = (isNaN(diff) || diff < 0) ? 0 : diff;
                        experience = `${safeYears}+ Years`;
                    }
                }

                return {
                    id: f.id || `${deptCode.toUpperCase()}-${String(index + 1).padStart(3, '0')}`,
                    name: cleanName,
                    designation: f.designation || f.Designation || '',
                    qualification: f.qualification || f.Qualification || '',
                    department: deptCode.toUpperCase(),
                    joiningDate: dojRaw || '',
                    panNumber: pan,
                    title: title, // Use detected or empty title
                    photo: photoUrl,
                    experience: experience, // Pass calculated experience
                    resumeUrl: formData?.resume // Removed fallback to local path to prevent redirection to Dashboard on 404
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

                    {/* --- PREMIUM LIST VIEW (Gold & Diamond Standard) --- */}
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.2 }}
                        className="lg:col-span-2 space-y-4"
                    >
                        <div className="p-6 rounded-3xl bg-slate-900/50 backdrop-blur-xl border border-white/10 flex justify-between items-center">
                            <div className="flex items-center gap-3">
                                <div className="bg-gradient-to-br from-amber-400 to-orange-600 p-2.5 rounded-xl shadow-lg shadow-orange-500/20 text-white">
                                    <ShieldCheck className="w-5 h-5" />
                                </div>
                                <div>
                                    <h3 className="text-xl font-black text-white tracking-tight">Verified Faculty Registry</h3>
                                    <p className="text-xs text-slate-400 font-medium">Synced with {activeYear} Database • {filteredFaculty.length} Members</p>
                                </div>
                            </div>
                        </div>

                        <div className="flex flex-col gap-4">
                            {filteredFaculty.length > 0 ? (
                                filteredFaculty.map((faculty, idx) => {
                                    const initials = faculty.name.replace(/Dr\.|Mr\.|Mrs\.|Ms\./g, "").trim().split(" ").slice(0, 2).map(n => n[0]).join("").toUpperCase();

                                    return (
                                        <motion.div
                                            initial={{ opacity: 0, x: -10 }}
                                            animate={{ opacity: 1, x: 0 }}
                                            transition={{ delay: idx * 0.05 }}
                                            key={faculty.id}
                                            className="group relative bg-slate-900/40 hover:bg-slate-800/60 backdrop-blur-md border border-white/5 hover:border-orange-500/30 rounded-3xl p-4 transition-all duration-300 hover:shadow-[0_0_30px_-10px_rgba(249,115,22,0.15)] overflow-hidden"
                                        >
                                            {/* Gold/Diamond Accent Line */}
                                            <div className="absolute left-0 top-0 bottom-0 w-1 bg-gradient-to-b from-transparent via-orange-500/50 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500" />

                                            <div className="flex flex-col sm:flex-row items-center gap-6">
                                                {/* LARGE PHOTO SECTION */}
                                                <div className="relative shrink-0">
                                                    <div className="w-24 h-24 sm:w-28 sm:h-28 rounded-2xl overflow-hidden p-[2px] bg-gradient-to-br from-orange-400 via-yellow-200 to-amber-600 shadow-2xl">
                                                        <div className="w-full h-full rounded-[14px] overflow-hidden bg-slate-950 relative">
                                                            {faculty.photo && !faculty.photo.includes('ui-avatars.com') ? (
                                                                <img
                                                                    src={faculty.photo}
                                                                    alt={faculty.name}
                                                                    referrerPolicy="no-referrer"
                                                                    className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                                                                    onError={(e) => {
                                                                        e.currentTarget.style.display = 'none';
                                                                        e.currentTarget.parentElement?.querySelector('.fallback-initials')?.classList.remove('hidden');
                                                                    }}
                                                                />
                                                            ) : (
                                                                <div className="w-full h-full flex items-center justify-center bg-gradient-to-br from-indigo-900 to-slate-900">
                                                                    <span className="text-2xl font-black text-white/20">{initials}</span>
                                                                </div>
                                                            )}
                                                            {/* Fallback Initials (Hidden by default) */}
                                                            <div className="fallback-initials hidden absolute inset-0 bg-gradient-to-br from-indigo-900 to-slate-900 items-center justify-center">
                                                                <span className="text-2xl font-black text-white/20">{initials}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    {/* Verified Badge */}
                                                    <div className="absolute -bottom-2 -right-2 bg-emerald-500 text-white p-1 rounded-full shadow-lg border-2 border-slate-900">
                                                        <CheckCircle2 className="w-3 h-3" />
                                                    </div>
                                                </div>

                                                {/* CONTENT SECTION */}
                                                <div className="flex-1 text-center sm:text-left space-y-2 w-full">
                                                    <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
                                                        <div>
                                                            <h4 className="text-xl sm:text-2xl font-black text-white group-hover:text-amber-400 transition-colors tracking-tight">
                                                                {faculty.title} {faculty.name}
                                                            </h4>
                                                            <div className="flex flex-wrap items-center justify-center sm:justify-start gap-2 mt-1">
                                                                <span className={`px-2.5 py-0.5 rounded-md text-[10px] font-bold uppercase tracking-wider border ${faculty.designation.includes('Professor')
                                                                    ? 'bg-orange-500/10 text-orange-400 border-orange-500/20'
                                                                    : 'bg-blue-500/10 text-blue-400 border-blue-500/20'
                                                                    }`}>
                                                                    {faculty.designation}
                                                                </span>
                                                                <span className="hidden sm:inline text-slate-600">•</span>
                                                                <span className="text-xs text-slate-400 font-medium">{faculty.qualification}</span>
                                                            </div>
                                                        </div>

                                                        {/* RESUME / PROFILE BUTTON - INNOVATIVE INTERACTION */}
                                                        <div className="mt-4 sm:mt-0 relative z-20">
                                                            {faculty.resumeUrl ? (
                                                                <FacultyProfileModal
                                                                    faculty={{
                                                                        id: faculty.pan || faculty.id || "N/A",
                                                                        name: (faculty.title || "") + " " + faculty.name,
                                                                        designation: faculty.designation || "Faculty",
                                                                        qualification: faculty.qualification || "",
                                                                        photo: faculty.photo || "",
                                                                        resumeUrl: faculty.resumeUrl,
                                                                        experience: faculty.experience || "0 Years",
                                                                        nature: faculty.nature || "Regular",
                                                                    }}
                                                                />
                                                            ) : (
                                                                <div className="px-6 py-2.5 rounded-xl bg-white/5 border border-white/5 opacity-50 cursor-not-allowed">
                                                                    <span className="text-xs font-bold text-slate-500 uppercase tracking-widest">No Resume</span>
                                                                </div>
                                                            )}
                                                        </div>
                                                    </div>

                                                    <div className="grid grid-cols-2 sm:grid-cols-3 gap-2 mt-4">
                                                        <div className="p-2 sm:p-3 rounded-xl bg-white/5 border border-white/5">
                                                            <div className="text-[10px] text-slate-500 uppercase font-bold text-left">Experience</div>
                                                            <div className="text-sm font-bold text-slate-200 text-left">{faculty.experience || 'N/A'}</div>
                                                        </div>
                                                        <div className="p-2 sm:p-3 rounded-xl bg-white/5 border border-white/5">
                                                            <div className="text-[10px] text-slate-500 uppercase font-bold text-left">Nature</div>
                                                            <div className="text-sm font-bold text-emerald-400 text-left">Regular</div>
                                                        </div>
                                                        <div className="p-2 sm:p-3 rounded-xl bg-white/5 border border-white/5 col-span-2 sm:col-span-1">
                                                            <div className="text-[10px] text-slate-500 uppercase font-bold text-left">ID Number</div>
                                                            <div className="text-xs font-mono text-slate-300 text-left mt-0.5">{faculty.id}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </motion.div>
                                    );
                                })
                            ) : (
                                <div className="py-20 text-center bg-slate-900/50 rounded-3xl border border-white/10 border-dashed">
                                    <Search className="w-12 h-12 text-slate-600 mx-auto mb-4" />
                                    <h3 className="text-lg font-bold text-slate-300">No Faculty Found</h3>
                                    <p className="text-sm text-slate-500">Try adjusting your search filters</p>
                                </div>
                            )}
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
