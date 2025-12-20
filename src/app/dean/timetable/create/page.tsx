'use client';

import React, { useState, useEffect, useRef } from 'react';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { toast } from 'sonner';
import {
    Calendar, Clock, Users, BookOpen, Save, Wand2, RefreshCw,
    Loader2, Printer, Download, AlertTriangle, Check, X
} from 'lucide-react';

// Constants
const DEPARTMENTS = ['CSE', 'IT', 'ECE', 'EEE', 'MECH', 'CIVIL', 'MBA', 'MCA'];
const SECTIONS = ['A', 'B', 'C', 'D'];
const SEMESTERS = [1, 2, 3, 4, 5, 6, 7, 8];
const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
const PERIODS = [
    { id: 1, label: 'P1', time: '9:00-9:50' },
    { id: 2, label: 'P2', time: '9:50-10:40' },
    { id: 'break1', label: 'BREAK', time: '10:40-10:50', isBreak: true },
    { id: 3, label: 'P3', time: '10:50-11:40' },
    { id: 4, label: 'P4', time: '11:40-12:30' },
    { id: 'lunch', label: 'LUNCH', time: '12:30-1:10', isBreak: true },
    { id: 5, label: 'P5', time: '1:10-2:00' },
    { id: 6, label: 'P6', time: '2:00-2:50' },
    { id: 'break2', label: 'BREAK', time: '2:50-3:00', isBreak: true },
    { id: 7, label: 'P7', time: '3:00-3:40' },
    { id: 8, label: 'P8', time: '3:40-4:20' },
];

// Special subjects available to all
const SPECIAL_SUBJECTS = [
    { code: 'COUN', name: 'Counseling' },
    { code: 'LIB', name: 'Library' },
    { code: 'TS', name: 'Telangana Studies' },
    { code: 'M/C', name: 'Moral & Cultural' },
    { code: 'FREE', name: 'Free Period' },
];

// Color mapping for subject types
const getSubjectColor = (code: string, subjects: Subject[]) => {
    if (!code || code === 'FREE') return 'bg-gray-100 dark:bg-gray-800 text-gray-500';

    const specialCodes = ['COUN', 'LIB', 'TS', 'M/C'];
    if (specialCodes.includes(code)) {
        return 'bg-amber-100 dark:bg-amber-900/40 text-amber-800 dark:text-amber-200 border-amber-300';
    }

    if (code.includes('LAB')) {
        return 'bg-emerald-100 dark:bg-emerald-900/40 text-emerald-800 dark:text-emerald-200 border-emerald-300';
    }

    const subject = subjects.find(s => s.code === code);
    if (subject?.type === 'lab') {
        return 'bg-emerald-100 dark:bg-emerald-900/40 text-emerald-800 dark:text-emerald-200 border-emerald-300';
    }

    return 'bg-blue-100 dark:bg-blue-900/40 text-blue-800 dark:text-blue-200 border-blue-300';
};

// Get initials for avatar
const getInitials = (name: string) => {
    return name.split(' ').map(n => n[0]).join('').toUpperCase().slice(0, 2);
};

// Generate avatar color from name
const getAvatarColor = (name: string) => {
    const colors = [
        'bg-red-500', 'bg-blue-500', 'bg-green-500', 'bg-yellow-500',
        'bg-purple-500', 'bg-pink-500', 'bg-indigo-500', 'bg-teal-500'
    ];
    let hash = 0;
    for (let i = 0; i < name.length; i++) {
        hash = name.charCodeAt(i) + ((hash << 5) - hash);
    }
    return colors[Math.abs(hash) % colors.length];
};

interface Faculty {
    id: string;
    name: string;
    department: string;
}

interface Subject {
    code: string;
    name: string;
    type: 'theory' | 'lab' | 'special';
}

interface CellData {
    subjectCode: string;
    facultyId: string;
    facultyName: string;
}

type TimetableGrid = Record<string, Record<number, CellData>>;

// Confirmation Dialog Component
const ConfirmDialog = ({
    isOpen,
    onClose,
    onConfirm,
    title,
    message
}: {
    isOpen: boolean;
    onClose: () => void;
    onConfirm: () => void;
    title: string;
    message: string;
}) => {
    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center">
            <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
            <div className="relative bg-white dark:bg-gray-900 rounded-2xl shadow-2xl p-6 max-w-md w-full mx-4 transform transition-all animate-in fade-in zoom-in duration-200">
                <div className="flex items-start gap-4">
                    <div className="flex-shrink-0 w-12 h-12 rounded-full bg-amber-100 dark:bg-amber-900/50 flex items-center justify-center">
                        <AlertTriangle className="h-6 w-6 text-amber-600" />
                    </div>
                    <div className="flex-1">
                        <h3 className="text-lg font-semibold text-gray-900 dark:text-white">{title}</h3>
                        <p className="mt-2 text-gray-600 dark:text-gray-400">{message}</p>
                    </div>
                </div>
                <div className="mt-6 flex gap-3 justify-end">
                    <Button variant="outline" onClick={onClose}>
                        <X className="h-4 w-4 mr-2" />
                        Cancel
                    </Button>
                    <Button onClick={onConfirm} className="bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700">
                        <Check className="h-4 w-4 mr-2" />
                        Confirm Save
                    </Button>
                </div>
            </div>
        </div>
    );
};

export default function TimetableCreatePage() {
    // Form State
    const [department, setDepartment] = useState('');
    const [section, setSection] = useState('');
    const [semester, setSemester] = useState<number>(0);
    const [roomNo, setRoomNo] = useState('');
    const [classIncharge, setClassIncharge] = useState('');

    // Data State
    const [subjects, setSubjects] = useState<Subject[]>([]);
    const [faculty, setFaculty] = useState<Faculty[]>([]);
    const [allFaculty, setAllFaculty] = useState<Faculty[]>([]);
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [generating, setGenerating] = useState(false);

    // Timetable Grid State
    const [grid, setGrid] = useState<TimetableGrid>({});

    // Active cell for editing
    const [activeCell, setActiveCell] = useState<{ day: string; period: number } | null>(null);

    // Confirmation dialog
    const [showConfirm, setShowConfirm] = useState(false);

    // Print ref
    const printRef = useRef<HTMLDivElement>(null);

    // Fetch faculty when department changes
    useEffect(() => {
        if (department) {
            fetchDepartmentData();
        }
    }, [department, semester]);

    // Fetch all faculty on mount (for cross-department selection)
    useEffect(() => {
        fetchAllFaculty();
    }, []);

    const fetchDepartmentData = async () => {
        setLoading(true);
        try {
            const res = await fetch(`/api/faculty?dept=${department}`);
            if (res.ok) {
                const data = await res.json();
                setFaculty(data.faculty || []);
            }

            const sampleSubjects: Subject[] = generateSampleSubjects(department, semester);
            setSubjects(sampleSubjects);
        } catch (error) {
            console.error('Error fetching data:', error);
            toast.error('Failed to load department data');
        }
        setLoading(false);
    };

    const fetchAllFaculty = async () => {
        try {
            const res = await fetch('/api/faculty');
            if (res.ok) {
                const data = await res.json();
                setAllFaculty(data.faculty || []);
            }
        } catch (error) {
            console.error('Error fetching all faculty:', error);
        }
    };

    // Generate sample subjects (replace with DB fetch in production)
    const generateSampleSubjects = (dept: string, sem: number): Subject[] => {
        const baseSubjects: Record<string, Subject[]> = {
            CSE: [
                { code: 'OS', name: 'Operating Systems', type: 'theory' },
                { code: 'DBMS', name: 'Database Management Systems', type: 'theory' },
                { code: 'AI', name: 'Artificial Intelligence', type: 'theory' },
                { code: 'ML', name: 'Machine Learning', type: 'theory' },
                { code: 'CC', name: 'Cloud Computing', type: 'theory' },
                { code: 'SPM', name: 'Software Project Management', type: 'theory' },
                { code: 'DL_LAB', name: 'Deep Learning Lab', type: 'lab' },
                { code: 'DV_LAB', name: 'Data Visualization Lab', type: 'lab' },
            ],
            IT: [
                { code: 'WEB', name: 'Web Technologies', type: 'theory' },
                { code: 'NET', name: 'Computer Networks', type: 'theory' },
                { code: 'SEC', name: 'Information Security', type: 'theory' },
                { code: 'IOT', name: 'Internet of Things', type: 'theory' },
                { code: 'WEB_LAB', name: 'Web Lab', type: 'lab' },
            ],
            ECE: [
                { code: 'DSP', name: 'Digital Signal Processing', type: 'theory' },
                { code: 'VLSI', name: 'VLSI Design', type: 'theory' },
                { code: 'EMC', name: 'Electromagnetic Compatibility', type: 'theory' },
                { code: 'COMM', name: 'Communication Systems', type: 'theory' },
                { code: 'VLSI_LAB', name: 'VLSI Lab', type: 'lab' },
            ],
            EEE: [
                { code: 'PE', name: 'Power Electronics', type: 'theory' },
                { code: 'EM', name: 'Electrical Machines', type: 'theory' },
                { code: 'PS', name: 'Power Systems', type: 'theory' },
                { code: 'PE_LAB', name: 'Power Electronics Lab', type: 'lab' },
            ],
            MECH: [
                { code: 'TD', name: 'Thermodynamics', type: 'theory' },
                { code: 'FM', name: 'Fluid Mechanics', type: 'theory' },
                { code: 'MD', name: 'Machine Design', type: 'theory' },
                { code: 'CAD_LAB', name: 'CAD Lab', type: 'lab' },
            ],
            CIVIL: [
                { code: 'SM', name: 'Structural Mechanics', type: 'theory' },
                { code: 'GEO', name: 'Geotechnical Engineering', type: 'theory' },
                { code: 'ENV', name: 'Environmental Engineering', type: 'theory' },
                { code: 'SUR_LAB', name: 'Surveying Lab', type: 'lab' },
            ],
            MBA: [
                { code: 'FM', name: 'Financial Management', type: 'theory' },
                { code: 'HRM', name: 'Human Resource Management', type: 'theory' },
                { code: 'MKT', name: 'Marketing Management', type: 'theory' },
                { code: 'OM', name: 'Operations Management', type: 'theory' },
            ],
            MCA: [
                { code: 'JAVA', name: 'Java Programming', type: 'theory' },
                { code: 'DS', name: 'Data Structures', type: 'theory' },
                { code: 'ALGO', name: 'Algorithms', type: 'theory' },
                { code: 'JAVA_LAB', name: 'Java Lab', type: 'lab' },
            ],
        };
        return baseSubjects[dept] || [];
    };

    // Handle cell click
    const handleCellClick = (day: string, periodId: number) => {
        setActiveCell({ day, period: periodId });
    };

    // Update cell data
    const updateCell = (day: string, periodId: number, data: Partial<CellData>) => {
        setGrid((prev) => ({
            ...prev,
            [day]: {
                ...prev[day],
                [periodId]: {
                    ...(prev[day]?.[periodId] || { subjectCode: '', facultyId: '', facultyName: '' }),
                    ...data,
                },
            },
        }));
    };

    // Auto-generate timetable
    const autoGenerate = async () => {
        if (!department || !semester) {
            toast.error('Please select department and semester first');
            return;
        }

        setGenerating(true);

        // Simulate processing time for better UX
        await new Promise(resolve => setTimeout(resolve, 800));

        const newGrid: TimetableGrid = {};
        const theorySubjects = subjects.filter(s => s.type === 'theory');
        const labSubjects = subjects.filter(s => s.type === 'lab');

        DAYS.forEach((day) => {
            newGrid[day] = {};
            const periodsToFill = [1, 2, 3, 4, 5, 6, 7, 8];

            periodsToFill.forEach((periodId) => {
                let subjectCode = '';
                let facultyId = '';
                let facultyName = '';

                // Distribute subjects
                if (periodId <= 4) {
                    const subjIndex = (DAYS.indexOf(day) + periodId) % theorySubjects.length;
                    subjectCode = theorySubjects[subjIndex]?.code || 'FREE';
                } else if (periodId <= 6) {
                    if (day === 'Wednesday' || day === 'Friday') {
                        const labIndex = Math.floor(Math.random() * labSubjects.length);
                        subjectCode = labSubjects[labIndex]?.code || 'FREE';
                    } else {
                        subjectCode = ['COUN', 'LIB'][Math.floor(Math.random() * 2)];
                    }
                } else {
                    subjectCode = ['TS', 'M/C', 'LIB', 'COUN'][periodId - 7];
                }

                if (faculty.length > 0 && subjectCode !== 'FREE') {
                    const randomFac = faculty[Math.floor(Math.random() * faculty.length)];
                    facultyId = randomFac?.id || '';
                    facultyName = randomFac?.name || '';
                }

                newGrid[day][periodId] = { subjectCode, facultyId, facultyName };
            });
        });

        setGrid(newGrid);
        setGenerating(false);
        toast.success('Timetable auto-generated! Review and adjust as needed.');
    };

    // Save timetable with confirmation
    const handleSaveClick = () => {
        if (!department || !section || !semester || !roomNo) {
            toast.error('Please fill all required fields');
            return;
        }
        setShowConfirm(true);
    };

    // Actual save operation
    const saveTimetable = async () => {
        setShowConfirm(false);
        setSaving(true);

        try {
            const payload = {
                department,
                section,
                semester,
                roomNo,
                classIncharge,
                grid,
            };

            const res = await fetch('/api/timetable/create', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload),
            });

            if (res.ok) {
                const data = await res.json();
                toast.success(`🎉 Timetable saved! ${data.results?.entriesCreated || 0} entries created.`);
            } else {
                const err = await res.json();
                toast.error(err.error || 'Failed to save timetable');
            }
        } catch (error) {
            console.error('Save error:', error);
            toast.error('Failed to save timetable');
        }
        setSaving(false);
    };

    // Clear grid
    const clearGrid = () => {
        setGrid({});
        toast.info('Timetable cleared');
    };

    // Print timetable
    const handlePrint = () => {
        window.print();
    };

    // Export as image/PDF (simplified - opens print dialog)
    const handleExport = () => {
        const printContent = printRef.current;
        if (!printContent) return;

        const printWindow = window.open('', '_blank');
        if (!printWindow) return;

        printWindow.document.write(`
            <!DOCTYPE html>
            <html>
            <head>
                <title>Timetable - ${department} ${section}</title>
                <style>
                    body { font-family: Arial, sans-serif; padding: 20px; }
                    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                    th, td { border: 1px solid #333; padding: 8px; text-align: center; }
                    th { background: #1e40af; color: white; }
                    .header { text-align: center; margin-bottom: 20px; }
                    .theory { background: #dbeafe; }
                    .lab { background: #d1fae5; }
                    .special { background: #fef3c7; }
                    .break { background: #e5e7eb; }
                </style>
            </head>
            <body>
                <div class="header">
                    <h1>NRIIT - ${department} Department</h1>
                    <h2>Section ${section} | Semester ${semester} | Room ${roomNo}</h2>
                    <p>Academic Year: 2025-2026</p>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Day</th>
                            ${PERIODS.map(p => `<th>${p.label}<br/><small>${p.time}</small></th>`).join('')}
                        </tr>
                    </thead>
                    <tbody>
                        ${DAYS.map(day => `
                            <tr>
                                <td><strong>${day}</strong></td>
                                ${PERIODS.map(p => {
            if (p.isBreak) return `<td class="break">${p.label}</td>`;
            const cell = grid[day]?.[p.id as number];
            const code = cell?.subjectCode || '';
            let className = '';
            if (code.includes('LAB')) className = 'lab';
            else if (['COUN', 'LIB', 'TS', 'M/C'].includes(code)) className = 'special';
            else if (code && code !== 'FREE') className = 'theory';
            return `<td class="${className}">${code}</td>`;
        }).join('')}
                            </tr>
                        `).join('')}
                    </tbody>
                </table>
            </body>
            </html>
        `);
        printWindow.document.close();
        printWindow.print();
    };

    // Get cell display
    const getCellDisplay = (day: string, periodId: number) => {
        const cell = grid[day]?.[periodId];
        if (!cell?.subjectCode) return '';
        return cell.subjectCode;
    };

    // Count filled cells
    const filledCells = Object.values(grid).reduce((acc, day) => {
        return acc + Object.values(day).filter(cell => cell.subjectCode && cell.subjectCode !== 'FREE').length;
    }, 0);

    return (
        <div className="p-6 space-y-6 print:p-0">
            {/* Header */}
            <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4 print:hidden">
                <div>
                    <h1 className="text-3xl font-bold bg-gradient-to-r from-blue-600 to-indigo-600 bg-clip-text text-transparent flex items-center gap-3">
                        <Calendar className="h-8 w-8 text-blue-600" />
                        Create Timetable
                    </h1>
                    <p className="text-gray-600 dark:text-gray-400 mt-1">
                        Build timetables for any department with ease • {filledCells} periods filled
                    </p>
                </div>
                <div className="flex flex-wrap gap-2">
                    <Button variant="outline" onClick={handlePrint} className="gap-2">
                        <Printer className="h-4 w-4" />
                        Print
                    </Button>
                    <Button variant="outline" onClick={handleExport} className="gap-2">
                        <Download className="h-4 w-4" />
                        Export
                    </Button>
                    <Button variant="outline" onClick={clearGrid} className="gap-2">
                        <RefreshCw className="h-4 w-4" />
                        Clear
                    </Button>
                    <Button
                        variant="outline"
                        onClick={autoGenerate}
                        disabled={generating}
                        className="gap-2"
                    >
                        {generating ? (
                            <Loader2 className="h-4 w-4 animate-spin" />
                        ) : (
                            <Wand2 className="h-4 w-4" />
                        )}
                        {generating ? 'Generating...' : 'Auto-Generate'}
                    </Button>
                    <Button
                        onClick={handleSaveClick}
                        disabled={saving}
                        className="gap-2 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700"
                    >
                        {saving ? (
                            <Loader2 className="h-4 w-4 animate-spin" />
                        ) : (
                            <Save className="h-4 w-4" />
                        )}
                        {saving ? 'Saving...' : 'Save Timetable'}
                    </Button>
                </div>
            </div>

            {/* Configuration Card */}
            <Card className="print:hidden border-0 shadow-lg">
                <CardHeader className="bg-gradient-to-r from-blue-50 to-indigo-50 dark:from-blue-900/20 dark:to-indigo-900/20 rounded-t-lg">
                    <CardTitle className="flex items-center gap-2">
                        <BookOpen className="h-5 w-5 text-blue-600" />
                        Class Details
                    </CardTitle>
                    <CardDescription>Select department, section, and semester</CardDescription>
                </CardHeader>
                <CardContent className="pt-6">
                    <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
                        {/* Department */}
                        <div className="space-y-2">
                            <Label className="text-sm font-medium">Department *</Label>
                            <Select value={department} onValueChange={setDepartment}>
                                <SelectTrigger className="h-11">
                                    <SelectValue placeholder="Select Dept" />
                                </SelectTrigger>
                                <SelectContent>
                                    {DEPARTMENTS.map((d) => (
                                        <SelectItem key={d} value={d}>{d}</SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        {/* Section */}
                        <div className="space-y-2">
                            <Label className="text-sm font-medium">Section *</Label>
                            <Select value={section} onValueChange={setSection}>
                                <SelectTrigger className="h-11">
                                    <SelectValue placeholder="Select" />
                                </SelectTrigger>
                                <SelectContent>
                                    {SECTIONS.map((s) => (
                                        <SelectItem key={s} value={s}>{s}</SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        {/* Semester */}
                        <div className="space-y-2">
                            <Label className="text-sm font-medium">Semester *</Label>
                            <Select value={semester.toString()} onValueChange={(v) => setSemester(parseInt(v))}>
                                <SelectTrigger className="h-11">
                                    <SelectValue placeholder="Select" />
                                </SelectTrigger>
                                <SelectContent>
                                    {SEMESTERS.map((s) => (
                                        <SelectItem key={s} value={s.toString()}>{s}</SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        {/* Room No */}
                        <div className="space-y-2">
                            <Label className="text-sm font-medium">Room No *</Label>
                            <Input
                                value={roomNo}
                                onChange={(e) => setRoomNo(e.target.value)}
                                placeholder="e.g. 301"
                                className="h-11"
                            />
                        </div>

                        {/* Class Incharge */}
                        <div className="space-y-2">
                            <Label className="text-sm font-medium">Class Incharge</Label>
                            <Select value={classIncharge} onValueChange={setClassIncharge}>
                                <SelectTrigger className="h-11">
                                    <SelectValue placeholder="Select" />
                                </SelectTrigger>
                                <SelectContent>
                                    {loading ? (
                                        <div className="p-4 flex items-center justify-center">
                                            <Loader2 className="h-5 w-5 animate-spin text-blue-600" />
                                        </div>
                                    ) : (
                                        faculty.map((f) => (
                                            <SelectItem key={f.id} value={f.id}>
                                                <div className="flex items-center gap-2">
                                                    <div className={`w-6 h-6 rounded-full ${getAvatarColor(f.name)} flex items-center justify-center text-white text-xs font-medium`}>
                                                        {getInitials(f.name)}
                                                    </div>
                                                    {f.name}
                                                </div>
                                            </SelectItem>
                                        ))
                                    )}
                                </SelectContent>
                            </Select>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Legend */}
            <div className="flex flex-wrap gap-4 px-2 print:hidden">
                <div className="flex items-center gap-2">
                    <div className="w-4 h-4 rounded bg-blue-100 border border-blue-300"></div>
                    <span className="text-sm text-gray-600">Theory</span>
                </div>
                <div className="flex items-center gap-2">
                    <div className="w-4 h-4 rounded bg-emerald-100 border border-emerald-300"></div>
                    <span className="text-sm text-gray-600">Lab</span>
                </div>
                <div className="flex items-center gap-2">
                    <div className="w-4 h-4 rounded bg-amber-100 border border-amber-300"></div>
                    <span className="text-sm text-gray-600">Special</span>
                </div>
            </div>

            {/* Timetable Grid */}
            <Card className="border-0 shadow-lg" ref={printRef}>
                <CardHeader className="bg-gradient-to-r from-blue-50 to-indigo-50 dark:from-blue-900/20 dark:to-indigo-900/20 rounded-t-lg print:hidden">
                    <CardTitle className="flex items-center gap-2">
                        <Clock className="h-5 w-5 text-blue-600" />
                        Timetable Grid
                    </CardTitle>
                    <CardDescription>Click on a cell to assign subject and faculty</CardDescription>
                </CardHeader>
                <CardContent className="overflow-x-auto p-0">
                    <table className="w-full border-collapse">
                        <thead>
                            <tr className="bg-gradient-to-r from-blue-600 to-indigo-600 text-white">
                                <th className="border border-blue-700 p-3 text-left font-semibold min-w-[100px]">Day</th>
                                {PERIODS.map((p) => (
                                    <th
                                        key={p.id}
                                        className={`border border-blue-700 p-2 text-center font-semibold min-w-[80px] ${p.isBreak ? 'bg-gray-600 text-xs min-w-[60px]' : ''
                                            }`}
                                    >
                                        <div className="font-bold">{p.label}</div>
                                        <div className="text-xs font-normal opacity-80">{p.time}</div>
                                    </th>
                                ))}
                            </tr>
                        </thead>
                        <tbody>
                            {DAYS.map((day, dayIndex) => (
                                <tr key={day} className={dayIndex % 2 === 0 ? 'bg-white dark:bg-gray-900' : 'bg-gray-50 dark:bg-gray-800/50'}>
                                    <td className="border p-3 font-semibold bg-gray-100 dark:bg-gray-800">
                                        {day}
                                    </td>
                                    {PERIODS.map((p) => {
                                        if (p.isBreak) {
                                            return (
                                                <td
                                                    key={p.id}
                                                    className="border p-2 bg-gray-200 dark:bg-gray-700 text-center text-xs text-gray-500 font-medium"
                                                >
                                                    {p.label}
                                                </td>
                                            );
                                        }

                                        const cellValue = getCellDisplay(day, p.id as number);
                                        const isActive = activeCell?.day === day && activeCell?.period === p.id;
                                        const colorClass = getSubjectColor(cellValue, subjects);

                                        return (
                                            <td
                                                key={p.id}
                                                onClick={() => handleCellClick(day, p.id as number)}
                                                className={`border p-2 text-center cursor-pointer transition-all duration-200 print:cursor-default ${isActive
                                                        ? 'ring-2 ring-blue-500 ring-inset bg-blue-50 dark:bg-blue-900/50'
                                                        : ''
                                                    } ${cellValue ? colorClass : 'hover:bg-blue-50 dark:hover:bg-gray-700'}`}
                                            >
                                                {cellValue ? (
                                                    <div className="font-semibold text-sm">{cellValue}</div>
                                                ) : (
                                                    <span className="text-gray-400 text-xs print:hidden">+</span>
                                                )}
                                            </td>
                                        );
                                    })}
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </CardContent>
            </Card>

            {/* Active Cell Editor */}
            {activeCell && (
                <Card className="border-2 border-blue-500 shadow-xl print:hidden animate-in slide-in-from-bottom duration-300">
                    <CardHeader className="pb-3">
                        <CardTitle className="text-lg flex items-center gap-2">
                            <div className="w-3 h-3 rounded-full bg-blue-500 animate-pulse"></div>
                            Edit: {activeCell.day} - Period {activeCell.period}
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                            {/* Subject Selection */}
                            <div className="space-y-2">
                                <Label className="text-sm font-medium">Subject</Label>
                                <Select
                                    value={grid[activeCell.day]?.[activeCell.period]?.subjectCode || 'none'}
                                    onValueChange={(val) => {
                                        const actualVal = val === 'none' ? '' : val;
                                        updateCell(activeCell.day, activeCell.period, { subjectCode: actualVal });
                                    }}
                                >
                                    <SelectTrigger className="h-11">
                                        <SelectValue placeholder="Select Subject" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem value="FREE">
                                            <span className="text-gray-500">FREE - Free Period</span>
                                        </SelectItem>
                                        {subjects.map((s) => (
                                            <SelectItem key={s.code} value={s.code}>
                                                <div className="flex items-center gap-2">
                                                    <div className={`w-2 h-2 rounded-full ${s.type === 'lab' ? 'bg-emerald-500' : 'bg-blue-500'
                                                        }`}></div>
                                                    {s.code} - {s.name}
                                                    <span className="text-xs text-gray-500">({s.type})</span>
                                                </div>
                                            </SelectItem>
                                        ))}
                                        {SPECIAL_SUBJECTS.map((s) => (
                                            <SelectItem key={s.code} value={s.code}>
                                                <div className="flex items-center gap-2">
                                                    <div className="w-2 h-2 rounded-full bg-amber-500"></div>
                                                    {s.code} - {s.name}
                                                    <span className="text-xs text-gray-500">(special)</span>
                                                </div>
                                            </SelectItem>
                                        ))}
                                    </SelectContent>
                                </Select>
                            </div>

                            {/* Faculty Selection with Avatar */}
                            <div className="space-y-2">
                                <Label className="text-sm font-medium">Faculty</Label>
                                <Select
                                    value={grid[activeCell.day]?.[activeCell.period]?.facultyId || 'none'}
                                    onValueChange={(val) => {
                                        const actualVal = val === 'none' ? '' : val;
                                        const fac = allFaculty.find((f) => f.id === actualVal);
                                        updateCell(activeCell.day, activeCell.period, {
                                            facultyId: actualVal,
                                            facultyName: fac?.name || '',
                                        });
                                    }}
                                >
                                    <SelectTrigger className="h-11">
                                        <SelectValue placeholder="Select Faculty" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem value="none">
                                            <span className="text-gray-500">-- No Faculty --</span>
                                        </SelectItem>
                                        {faculty.map((f) => (
                                            <SelectItem key={f.id} value={f.id}>
                                                <div className="flex items-center gap-2">
                                                    <div className={`w-7 h-7 rounded-full ${getAvatarColor(f.name)} flex items-center justify-center text-white text-xs font-bold`}>
                                                        {getInitials(f.name)}
                                                    </div>
                                                    <span>{f.name}</span>
                                                </div>
                                            </SelectItem>
                                        ))}
                                        {allFaculty
                                            .filter((f) => f.department !== department)
                                            .slice(0, 15)
                                            .map((f) => (
                                                <SelectItem key={f.id} value={f.id}>
                                                    <div className="flex items-center gap-2">
                                                        <div className={`w-7 h-7 rounded-full ${getAvatarColor(f.name)} flex items-center justify-center text-white text-xs font-bold opacity-70`}>
                                                            {getInitials(f.name)}
                                                        </div>
                                                        <span className="text-gray-600">{f.name}</span>
                                                        <span className="text-xs text-gray-400">({f.department})</span>
                                                    </div>
                                                </SelectItem>
                                            ))}
                                    </SelectContent>
                                </Select>
                            </div>
                        </div>

                        <div className="mt-6 flex justify-end">
                            <Button
                                variant="outline"
                                onClick={() => setActiveCell(null)}
                                className="gap-2"
                            >
                                <Check className="h-4 w-4" />
                                Done
                            </Button>
                        </div>
                    </CardContent>
                </Card>
            )}

            {/* Tips Card */}
            <Card className="bg-gradient-to-r from-blue-50 to-indigo-50 dark:from-blue-900/20 dark:to-indigo-900/20 border-blue-200 dark:border-blue-800 print:hidden">
                <CardContent className="p-4">
                    <div className="flex items-start gap-3">
                        <Users className="h-5 w-5 text-blue-600 mt-0.5" />
                        <div>
                            <p className="font-medium text-blue-900 dark:text-blue-100">
                                Tips for Creating Timetables
                            </p>
                            <ul className="mt-2 text-sm text-blue-800 dark:text-blue-200 space-y-1">
                                <li>• Select department and semester first to load relevant subjects</li>
                                <li>• Click "Auto-Generate" for a quick starting point</li>
                                <li>• Click any cell to manually assign subject and faculty</li>
                                <li>• Labs are shown in green, special subjects in yellow</li>
                                <li>• Use Print/Export to save as PDF</li>
                            </ul>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Confirmation Dialog */}
            <ConfirmDialog
                isOpen={showConfirm}
                onClose={() => setShowConfirm(false)}
                onConfirm={saveTimetable}
                title="Save Timetable?"
                message={`This will save the timetable for ${department}-${section} (Semester ${semester}). If a timetable already exists for this class, it will be replaced.`}
            />
        </div>
    );
}
