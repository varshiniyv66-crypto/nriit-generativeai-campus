// ===========================================
// NRIIT Platform - Application Constants
// ===========================================

import { DepartmentCode } from '@/types';

// ===========================================
// Department Information
// ===========================================

export const DEPARTMENTS: Record<DepartmentCode, {
    name: string;
    fullName: string;
    shortName: string;
    color: string;
    icon: string;
    established: number;
}> = {
    'CSE': {
        name: 'Computer Science & Engineering',
        fullName: 'Department of Computer Science and Engineering',
        shortName: 'CSE',
        color: '#2563EB', // Blue
        icon: '💻',
        established: 2008,
    },
    'CSE-DS': {
        name: 'CSE - Data Science',
        fullName: 'Department of Computer Science and Engineering (Data Science)',
        shortName: 'CSE-DS',
        color: '#7C3AED', // Purple
        icon: '📊',
        established: 2020,
    },
    'ECE': {
        name: 'Electronics & Communication',
        fullName: 'Department of Electronics and Communication Engineering',
        shortName: 'ECE',
        color: '#F59E0B', // Amber
        icon: '📡',
        established: 2008,
    },
    'CSE-AI': {
        name: 'CSE - AI & ML',
        fullName: 'Department of Computer Science and Engineering (Artificial Intelligence & Machine Learning)',
        shortName: 'CSE-AI',
        color: '#EC4899', // Pink
        icon: '🤖',
        established: 2021,
    },
    'IT': {
        name: 'Information Technology',
        fullName: 'Department of Information Technology',
        shortName: 'IT',
        color: '#10B981', // Green
        icon: '🌐',
        established: 2008,
    },
    'EVT': {
        name: 'Electric Vehicle Technology',
        fullName: 'Department of Electric Vehicle Technology',
        shortName: 'EVT',
        color: '#22C55E', // Emerald
        icon: '⚡',
        established: 2023,
    },
    'CIVIL': {
        name: 'Civil Engineering',
        fullName: 'Department of Civil Engineering',
        shortName: 'CIVIL',
        color: '#EF4444', // Red
        icon: '🏗️',
        established: 2008,
    },
    'BSH': {
        name: 'Humanities & Sciences',
        fullName: 'Department of Humanities and Sciences',
        shortName: 'BSH',
        color: '#64748B', // Slate
        icon: '📚',
        established: 2008,
    },
    'MBA': {
        name: 'Master of Business Administration',
        fullName: 'Department of Master of Business Administration',
        shortName: 'MBA',
        color: '#06B6D4', // Cyan
        icon: '📈',
        established: 2009,
    },
    'MCA': {
        name: 'Master of Computer Applications',
        fullName: 'Department of Master of Computer Applications',
        shortName: 'MCA',
        color: '#8B5CF6', // Violet
        icon: '🎓',
        established: 2023,
    },
};

// ===========================================
// Department Page Routes
// ===========================================

export const DEPARTMENT_PAGE_SLUGS = [
    'home',
    'about',
    'vision-mission',
    'peos-psos',
    'hod',
    'dean',
    'faculty',
    'labs',
    'research',
    'achievements',
    'events',
    'student-corner',
    'crt',
    'mentoring',
    'gallery',
    'contact',
] as const;

export type DepartmentPageSlug = typeof DEPARTMENT_PAGE_SLUGS[number];

export const DEPARTMENT_PAGE_TITLES: Record<DepartmentPageSlug, string> = {
    'home': 'Home',
    'about': 'About Department',
    'vision-mission': 'Vision & Mission',
    'peos-psos': 'PEOs & PSOs',
    'hod': 'Head of Department',
    'dean': 'Dean',
    'faculty': 'Faculty',
    'labs': 'Laboratories',
    'research': 'Research',
    'achievements': 'Achievements',
    'events': 'Events',
    'student-corner': 'Student Corner',
    'crt': 'CRT & Placements',
    'mentoring': 'Mentoring',
    'gallery': 'Gallery',
    'contact': 'Contact Us',
};

// ===========================================
// Academic Settings (from requirements)
// ===========================================

export const ACADEMIC_SETTINGS = {
    PERIODS_PER_DAY: 8, // Assumption: 8 periods/day as per requirements
    MIN_ATTENDANCE_PERCENT: 75, // Assumption: 75-80% attendance rule
    MAX_ATTENDANCE_PERCENT: 80,
    INTERNALS_PER_SEMESTER: 2, // Assumption: 2 internals as per requirements
    CONSECUTIVE_ABSENCE_ALERT_THRESHOLD: 2, // Alert after 2 consecutive absences
    SEMESTERS_UG: 8,
    SEMESTERS_PG: 4,
    WORKING_DAYS: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
};

export const PERIOD_TIMINGS = [
    { period: 1, start: '09:00', end: '09:50' },
    { period: 2, start: '09:50', end: '10:40' },
    { period: 3, start: '10:50', end: '11:40' },
    { period: 4, start: '11:40', end: '12:30' },
    { period: 5, start: '13:30', end: '14:20' },
    { period: 6, start: '14:20', end: '15:10' },
    { period: 7, start: '15:20', end: '16:10' },
    { period: 8, start: '16:10', end: '17:00' },
];

// ===========================================
// Image Ratio Constants (from requirements)
// ===========================================

export const IMAGE_RATIOS = {
    FACULTY_PHOTO: { width: 1, height: 1, label: '1:1 (Square)' }, // Faculty/HOD/Dean
    BANNER: { width: 16, height: 6, label: '16:6 (Wide Banner)' },
    GALLERY: { width: 16, height: 9, label: '16:9 (Standard)' }, // Labs/Gallery/Events
    CARD_THUMBNAIL: { width: 4, height: 3, label: '4:3 (Card)' },
    LOGO: { width: 1, height: 1, label: '1:1 (Square)' },
};

// ===========================================
// File Upload Settings
// ===========================================

export const FILE_UPLOAD = {
    MAX_SIZE_MB: 10,
    MAX_SIZE_BYTES: 10 * 1024 * 1024,
    ALLOWED_IMAGE_TYPES: ['image/jpeg', 'image/png', 'image/webp'],
    ALLOWED_DOC_TYPES: [
        'application/pdf',
        'application/msword',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'application/vnd.ms-excel',
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'application/vnd.ms-powerpoint',
        'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    ],
    IMAGE_EXTENSIONS: ['.jpg', '.jpeg', '.png', '.webp'],
    DOC_EXTENSIONS: ['.pdf', '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx'],
};

// ===========================================
// Role Permissions
// ===========================================

export const ROLE_PERMISSIONS = {
    student: {
        canView: ['own_profile', 'attendance', 'marks', 'fees', 'materials', 'notifications'],
        canEdit: ['own_profile'],
        dashboard: '/student/dashboard',
    },
    faculty: {
        canView: ['own_profile', 'classes', 'students', 'materials', 'mentees'],
        canEdit: ['own_profile', 'attendance', 'marks', 'materials', 'mentoring_sessions'],
        dashboard: '/faculty/dashboard',
    },
    hod: {
        canView: ['department', 'faculty', 'students', 'courses', 'reports'],
        canEdit: ['department', 'faculty_assignments', 'timetable', 'cms'],
        canApprove: ['leave', 'certificates', 'materials'],
        dashboard: '/hod/dashboard',
    },
    dean: {
        canView: ['all_departments', 'faculty', 'students', 'reports', 'analytics'],
        canEdit: ['department_settings', 'faculty', 'policies'],
        canApprove: ['major_requests', 'budget'],
        dashboard: '/dean/dashboard',
    },
    principal: {
        canView: ['everything'],
        canEdit: ['policies', 'settings'],
        canApprove: ['everything'],
        dashboard: '/principal/dashboard',
    },
    admin: {
        canView: ['everything'],
        canEdit: ['everything'],
        canDelete: ['everything'],
        dashboard: '/admin/dashboard',
    },
    dean_content_admin: {
        canView: ['all_cms'],
        canEdit: ['all_department_pages', 'all_department_posts', 'all_galleries', 'all_uploads'],
        dashboard: '/admin/cms',
    },
    exam_cell: {
        canView: ['exams', 'marks', 'hall_tickets', 'results'],
        canEdit: ['exam_schedule', 'marks', 'hall_tickets', 'results'],
        dashboard: '/admin/exams',
    },
    accounts: {
        canView: ['fees', 'transactions', 'receipts', 'reports'],
        canEdit: ['fee_master', 'transactions', 'receipts'],
        dashboard: '/admin/fees',
    },
};

// ===========================================
// Navigation Routes
// ===========================================

export const NAV_ROUTES = {
    public: [
        { href: '/', label: 'Home' },
        { href: '/about', label: 'About' },
        { href: '/departments', label: 'Departments' },
        { href: '/admissions', label: 'Admissions' },
        { href: '/placements', label: 'Placements' },
        { href: '/research', label: 'Research' },
        { href: '/news-events', label: 'News & Events' },
        { href: '/contact', label: 'Contact' },
    ],
    dean: [
        { href: '/dean/dashboard', label: 'Dashboard', icon: 'LayoutDashboard' },
        { href: '/dean/timetable', label: 'Timetable', icon: 'Calendar' },
        { href: '/dean/timetable/create', label: 'Create Timetable', icon: 'PlusCircle' },
        { href: '/dean/timetable/upload', label: 'Upload Timetable', icon: 'Upload' },
        { href: '/dean/faculty', label: 'Faculty', icon: 'Users' },
        { href: '/dean/students', label: 'Students', icon: 'GraduationCap' },
        { href: '/dean/attendance', label: 'Attendance', icon: 'UserCheck' },
        { href: '/dean/reports', label: 'Reports', icon: 'BarChart' },
        { href: '/dean/analytics', label: 'Analytics', icon: 'TrendingUp' },
    ],
    student: [
        { href: '/student/dashboard', label: 'Dashboard', icon: 'LayoutDashboard' },
        { href: '/student/attendance', label: 'Attendance', icon: 'UserCheck' },
        { href: '/student/results', label: 'Results', icon: 'FileText' },
        { href: '/student/fee-payments', label: 'Fee Payments', icon: 'CreditCard' },
        { href: '/student/materials', label: 'Materials', icon: 'BookOpen' },
        { href: '/student/certificates', label: 'Certificates', icon: 'Award' },
        { href: '/student/profile', label: 'Profile', icon: 'User' },
    ],
    faculty: [
        { href: '/faculty/dashboard', label: 'Dashboard', icon: 'LayoutDashboard' },
        { href: '/faculty/attendance', label: 'Attendance', icon: 'UserCheck' },
        { href: '/faculty/marks', label: 'Marks Entry', icon: 'FileText' },
        { href: '/faculty/classes', label: 'My Classes', icon: 'GraduationCap' },
        { href: '/faculty/mentoring', label: 'Mentoring', icon: 'Users' },
        { href: '/faculty/materials', label: 'Materials', icon: 'BookOpen' },
        { href: '/faculty/profile', label: 'Profile', icon: 'User' },
    ],
    hod: [
        { href: '/hod/dashboard', label: 'Dashboard', icon: 'LayoutDashboard' },
        { href: '/hod/faculty', label: 'Faculty', icon: 'Users' },
        { href: '/hod/students', label: 'Students', icon: 'GraduationCap' },
        { href: '/hod/attendance', label: 'Attendance', icon: 'UserCheck' },
        { href: '/hod/courses', label: 'Courses', icon: 'BookOpen' },
        { href: '/hod/reports', label: 'Reports', icon: 'BarChart' },
        { href: '/hod/accreditation', label: 'Accreditation', icon: 'Award' },
    ],
    admin: [
        { href: '/admin/dashboard', label: 'Dashboard', icon: 'LayoutDashboard' },
        { href: '/admin/departments', label: 'Departments', icon: 'Building2' },
        { href: '/admin/faculty', label: 'Faculty', icon: 'Users' },
        { href: '/admin/students', label: 'Students', icon: 'GraduationCap' },
        { href: '/admin/attendance', label: 'Attendance', icon: 'UserCheck' },
        { href: '/admin/exams', label: 'Exams', icon: 'FileText' },
        { href: '/admin/fees', label: 'Fees', icon: 'CreditCard' },
        { href: '/admin/mentoring', label: 'Mentoring', icon: 'Heart' },
        { href: '/admin/crt', label: 'CRT', icon: 'Briefcase' },
        { href: '/admin/certificates', label: 'Certificates', icon: 'Award' },
        { href: '/admin/cms', label: 'CMS', icon: 'Newspaper' },
        { href: '/admin/uploads', label: 'Uploads', icon: 'Upload' },
        { href: '/admin/settings', label: 'Settings', icon: 'Settings' },
    ],
    accreditation: [
        { href: '/accreditation/naac', label: 'NAAC', icon: 'Shield' },
        { href: '/accreditation/nirf', label: 'NIRF', icon: 'TrendingUp' },
    ],
};

// ===========================================
// Institution Information
// ===========================================

export const INSTITUTION = {
    name: 'NRI Institute of Technology',
    shortName: 'NRIIT',
    code: 'NRIIT',
    location: 'Vijayawada, Andhra Pradesh, India',
    address: 'Visadala, Guntur',
    phone: '0863 234 4300',
    email: 'nriit.guntur@gmail.com',
    website: 'https://www.nriit.ac.in',
    established: 2008,
    type: 'Private Engineering College',
    affiliation: 'JNTUK - Jawaharlal Nehru Technological University, Kakinada',
    accreditations: ['NAAC'],
    socialMedia: {
        facebook: 'https://facebook.com/nriit',
        twitter: 'https://twitter.com/nriit',
        linkedin: 'https://linkedin.com/company/nriit',
        youtube: 'https://youtube.com/nriit',
        instagram: 'https://instagram.com/nriit',
    },
};

// ===========================================
// API Endpoints
// ===========================================

export const API_ENDPOINTS = {
    auth: {
        sendOtp: '/api/auth/send-otp',
        verifyOtp: '/api/auth/verify-otp',
        logout: '/api/auth/logout',
        session: '/api/auth/session',
    },
    attendance: {
        mark: '/api/attendance/mark',
        get: '/api/attendance/get',
        alerts: '/api/attendance/alerts',
        summary: '/api/attendance/summary',
    },
    exams: {
        schedule: '/api/exams/schedule',
        marks: '/api/exams/marks',
        hallTickets: '/api/exams/hall-tickets',
    },
    fees: {
        dues: '/api/fees/dues',
        pay: '/api/fees/pay',
        receipt: '/api/fees/receipt',
        history: '/api/fees/history',
    },
    ai: {
        studentInsights: '/api/ai/student-insights',
        facultyInsights: '/api/ai/faculty-insights',
        departmentInsights: '/api/ai/department-insights',
        instituteInsights: '/api/ai/institute-insights',
    },
    upload: {
        file: '/api/upload/file',
        image: '/api/upload/image',
        batch: '/api/upload/batch',
    },
};

// ===========================================
// Grading System
// ===========================================

export const GRADING_SYSTEM = [
    { grade: 'O', minMarks: 90, maxMarks: 100, gradePoints: 10, description: 'Outstanding' },
    { grade: 'A+', minMarks: 80, maxMarks: 89, gradePoints: 9, description: 'Excellent' },
    { grade: 'A', minMarks: 70, maxMarks: 79, gradePoints: 8, description: 'Very Good' },
    { grade: 'B+', minMarks: 60, maxMarks: 69, gradePoints: 7, description: 'Good' },
    { grade: 'B', minMarks: 50, maxMarks: 59, gradePoints: 6, description: 'Above Average' },
    { grade: 'C', minMarks: 45, maxMarks: 49, gradePoints: 5, description: 'Average' },
    { grade: 'P', minMarks: 40, maxMarks: 44, gradePoints: 4, description: 'Pass' },
    { grade: 'F', minMarks: 0, maxMarks: 39, gradePoints: 0, description: 'Fail' },
];

export const getGrade = (marks: number) => {
    return GRADING_SYSTEM.find(g => marks >= g.minMarks && marks <= g.maxMarks);
};
