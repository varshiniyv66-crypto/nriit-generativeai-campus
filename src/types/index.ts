// ===========================================
// NRIIT Platform - TypeScript Types
// Generated from Supabase Schema
// ===========================================

// Enum Types
export type UserRole =
    | 'student'
    | 'faculty'
    | 'hod'
    | 'dean'
    | 'principal'
    | 'admin'
    | 'dean_content_admin'
    | 'exam_cell'
    | 'accounts'
    | 'librarian'
    | 'transport'
    | 'hostel_warden';

export type DepartmentCode =
    | 'CSE'
    | 'CSE-DS'
    | 'ECE'
    | 'CSE-AI'
    | 'IT'
    | 'EVT'
    | 'CIVIL'
    | 'BSH'
    | 'MBA'
    | 'MCA';

export type Gender = 'male' | 'female' | 'other';

export type BloodGroup = 'A+' | 'A-' | 'B+' | 'B-' | 'AB+' | 'AB-' | 'O+' | 'O-';

export type FilePurpose =
    | 'faculty_photo'
    | 'student_photo'
    | 'circular'
    | 'timetable'
    | 'hall_ticket'
    | 'certificate'
    | 'receipt'
    | 'material'
    | 'accreditation_evidence'
    | 'post_attachment'
    | 'gallery_image'
    | 'banner_image'
    | 'lab_photo'
    | 'event_photo'
    | 'achievement_proof';

export type FeeCategory =
    | 'tuition'
    | 'hostel'
    | 'transport'
    | 'library'
    | 'regular_exam'
    | 'backlog_exam'
    | 'revaluation'
    | 'late_fee'
    | 'misc';

export type PaymentStatus = 'pending' | 'completed' | 'failed' | 'refunded' | 'cancelled';

export type AttendanceStatus = 'present' | 'absent' | 'late' | 'on_duty' | 'medical_leave';

export type CertificateType =
    | 'bonafide'
    | 'conduct'
    | 'bus_pass'
    | 'fee_receipt'
    | 'tc'
    | 'migration'
    | 'study'
    | 'character';

export type CertificateStatus =
    | 'requested'
    | 'processing'
    | 'approved'
    | 'rejected'
    | 'issued'
    | 'collected';

export type RiskLevel = 'low' | 'medium' | 'high' | 'critical';

export type SemesterType = 'odd' | 'even';

export type ExamType =
    | 'internal_1'
    | 'internal_2'
    | 'mid_1'
    | 'mid_2'
    | 'external'
    | 'supplementary';

// ===========================================
// Core Entity Types
// ===========================================

export interface User {
    id: string;
    email?: string;
    phone?: string;
    role: UserRole;
    is_active: boolean;
    email_verified: boolean;
    phone_verified: boolean;
    last_login?: string;
    created_at: string;
    updated_at: string;
}

export interface Department {
    id: string;
    code: DepartmentCode;
    name: string;
    short_name: string;
    description?: string;
    vision?: string;
    mission?: string;
    established_year?: number;
    hod_id?: string;
    dean_id?: string;
    banner_image_path?: string;
    logo_path?: string;
    contact_email?: string;
    contact_phone?: string;
    location?: string;
    is_active: boolean;
    created_at: string;
    updated_at: string;
}

export interface FacultyProfile {
    id: string;
    user_id?: string;
    employee_id: string;
    first_name: string;
    last_name: string;
    dept_code: DepartmentCode;
    designation: string;
    qualification?: string;
    specialization?: string;
    experience_years?: number;
    date_of_joining?: string;
    date_of_birth?: string;
    gender?: Gender;
    blood_group?: BloodGroup;
    phone?: string;
    email?: string;
    personal_email?: string;
    address?: string;
    city?: string;
    state?: string;
    pincode?: string;
    photo_path?: string;
    resume_path?: string;
    google_scholar_id?: string;
    orcid_id?: string;
    research_gate_id?: string;
    scopus_id?: string;
    publications_count: number;
    patents_count: number;
    projects_count: number;
    is_mentor: boolean;
    is_active: boolean;
    created_at: string;
    updated_at: string;
}

export interface StudentProfile {
    id: string;
    user_id?: string;
    roll_number: string;
    registration_number?: string;
    first_name: string;
    last_name: string;
    dept_code: DepartmentCode;
    batch_id?: string;
    current_semester: number;
    section?: string;
    date_of_birth?: string;
    gender?: Gender;
    blood_group?: BloodGroup;
    phone?: string;
    email?: string;
    personal_email?: string;
    father_name?: string;
    father_phone?: string;
    father_occupation?: string;
    mother_name?: string;
    mother_phone?: string;
    mother_occupation?: string;
    guardian_name?: string;
    guardian_phone?: string;
    guardian_relation?: string;
    permanent_address?: string;
    current_address?: string;
    city?: string;
    state?: string;
    pincode?: string;
    nationality: string;
    category?: string;
    photo_path?: string;
    admission_date?: string;
    admission_type?: string;
    previous_institution?: string;
    previous_marks?: number;
    is_hosteler: boolean;
    hostel_room?: string;
    is_transport_user: boolean;
    transport_route?: string;
    mentor_id?: string;
    is_active: boolean;
    created_at: string;
    updated_at: string;
}

export interface Course {
    id: string;
    course_code: string;
    course_name: string;
    dept_code: DepartmentCode;
    semester: number;
    credits: number;
    lecture_hours: number;
    tutorial_hours: number;
    practical_hours: number;
    course_type?: string;
    is_elective: boolean;
    syllabus_path?: string;
    is_active: boolean;
    created_at: string;
    updated_at: string;
}

export interface PeriodAttendance {
    id: string;
    student_id: string;
    course_id: string;
    faculty_id?: string;
    class_section_id?: string;
    attendance_date: string;
    period_number: number;
    status: AttendanceStatus;
    remarks?: string;
    marked_by?: string;
    marked_at: string;
    created_at: string;
}

export interface AttendanceAlert {
    id: string;
    student_id: string;
    course_id?: string;
    alert_type: string;
    consecutive_absences?: number;
    current_percentage?: number;
    message: string;
    is_sent: boolean;
    sent_via?: string;
    sent_at?: string;
    acknowledged: boolean;
    acknowledged_by?: string;
    acknowledged_at?: string;
    created_at: string;
}

// ===========================================
// CMS Types
// ===========================================

export interface ContentBlock {
    type: 'heading' | 'paragraph' | 'image' | 'list' | 'table' | 'video' | 'embed' | 'quote';
    content: unknown;
    props?: Record<string, unknown>;
}

export interface DepartmentPage {
    id: string;
    dept_code: DepartmentCode;
    slug: string;
    title: string;
    subtitle?: string;
    body_json?: ContentBlock[];
    banner_image_path?: string;
    meta_title?: string;
    meta_description?: string;
    is_published: boolean;
    published_at?: string;
    updated_by?: string;
    updated_at: string;
    created_at: string;
}

export interface DepartmentPost {
    id: string;
    dept_code: DepartmentCode;
    category: 'news' | 'events' | 'achievements' | 'circular' | 'notice';
    title: string;
    summary?: string;
    content_json?: ContentBlock[];
    cover_image_path?: string;
    attachments?: { name: string; path: string; type: string }[];
    tags?: string[];
    is_pinned: boolean;
    is_published: boolean;
    published_at?: string;
    event_date?: string;
    event_end_date?: string;
    event_venue?: string;
    author_id?: string;
    updated_by?: string;
    updated_at: string;
    created_at: string;
}

export interface DepartmentGallery {
    id: string;
    dept_code: DepartmentCode;
    title: string;
    description?: string;
    images: { path: string; caption?: string; sort_order: number }[];
    event_date?: string;
    category?: string;
    is_published: boolean;
    created_by?: string;
    created_at: string;
    updated_at: string;
}

// ===========================================
// Accreditation Types
// ===========================================

export interface NBACriterion {
    id: string;
    criterion_number: number;
    criterion_name: string;
    max_marks: number;
    description?: string;
    weightage?: number;
    created_at: string;
}

export interface NBAClaim {
    id: string;
    dept_code: DepartmentCode;
    criterion_id?: string;
    academic_year: string;
    claim_title: string;
    claim_description?: string;
    target_value?: number;
    achieved_value?: number;
    supporting_data?: Record<string, unknown>;
    status: 'draft' | 'under_review' | 'approved' | 'rejected';
    created_by?: string;
    reviewed_by?: string;
    reviewed_at?: string;
    created_at: string;
    updated_at: string;
}

export interface NBAClaimEvidence {
    id: string;
    claim_id: string;
    evidence_type?: 'file' | 'data_record' | 'external_link';
    file_asset_id?: string;
    linked_table?: string;
    linked_record_id?: string;
    external_url?: string;
    description?: string;
    sort_order: number;
    created_at: string;
}

export interface COAttainment {
    id: string;
    course_id: string;
    co_number: number;
    academic_year: string;
    semester_type: SemesterType;
    section?: string;
    direct_attainment?: number;
    indirect_attainment?: number;
    overall_attainment?: number;
    target_attainment: number;
    is_target_achieved?: boolean;
    calculation_method?: string;
    calculation_data?: Record<string, unknown>;
    created_at: string;
    updated_at: string;
}

// ===========================================
// File Asset Types
// ===========================================

export interface FileAsset {
    id: string;
    dept_code?: DepartmentCode;
    owner_role?: UserRole;
    owner_user_id?: string;
    file_name: string;
    original_name: string;
    file_type: string;
    file_size?: number;
    storage_path: string;
    purpose: FilePurpose;
    tags?: string[];
    linked_entity_type?: string;
    linked_entity_id?: string;
    thumbnail_path?: string;
    is_public: boolean;
    upload_status: 'uploading' | 'completed' | 'failed';
    created_at: string;
    updated_at: string;
}

// ===========================================
// AI Insights Types
// ===========================================

export interface AIInsight {
    id: string;
    insight_type: string;
    target_type?: string;
    target_id?: string;
    dept_code?: DepartmentCode;
    insight_data: Record<string, unknown>;
    confidence_score?: number;
    generated_by?: string;
    model_version?: string;
    is_actionable: boolean;
    action_taken: boolean;
    action_details?: string;
    generated_at: string;
    expires_at?: string;
    created_at: string;
}

// ===========================================
// Dashboard Types
// ===========================================

export interface AttendanceSummary {
    student_id: string;
    roll_number: string;
    student_name: string;
    dept_code: DepartmentCode;
    course_code: string;
    course_name: string;
    total_classes: number;
    present_count: number;
    absent_count: number;
    attendance_percentage: number;
}

export interface DepartmentStats {
    dept_code: DepartmentCode;
    dept_name: string;
    faculty_count: number;
    student_count: number;
    courses_count: number;
    labs_count: number;
}

export interface FacultyWorkload {
    faculty_id: string;
    employee_id: string;
    faculty_name: string;
    dept_code: DepartmentCode;
    designation: string;
    courses_assigned: number;
    sections_handled: number;
    total_hours_per_week: number;
}

// ===========================================
// API Response Types
// ===========================================

export interface ApiResponse<T> {
    success: boolean;
    data?: T;
    error?: string;
    message?: string;
}

export interface PaginatedResponse<T> {
    data: T[];
    total: number;
    page: number;
    limit: number;
    totalPages: number;
}

// ===========================================
// Form Types
// ===========================================

export interface LoginForm {
    phone: string;
    otp?: string;
}

export interface AttendanceMarkForm {
    class_section_id: string;
    course_id: string;
    attendance_date: string;
    period_number: number;
    attendance: { student_id: string; status: AttendanceStatus; remarks?: string }[];
}

export interface InternalMarksForm {
    course_id: string;
    exam_type: ExamType;
    academic_year: string;
    semester_type: SemesterType;
    marks: { student_id: string; marks_obtained: number; is_absent: boolean }[];
}

export interface CertificateRequestForm {
    certificate_type: CertificateType;
    purpose: string;
    copies_required: number;
    urgency: 'normal' | 'urgent';
}

export interface MentoringSessionForm {
    student_id: string;
    session_date: string;
    session_type: string;
    discussion_points: string;
    action_items: string;
    student_feedback?: string;
    mentor_remarks?: string;
    next_session_date?: string;
    attendance_discussed: boolean;
    academics_discussed: boolean;
    career_discussed: boolean;
    personal_issues_discussed: boolean;
}
