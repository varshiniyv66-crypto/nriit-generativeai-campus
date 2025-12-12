// ===========================================
// Supabase Client Configuration
// Primary data store: ERP, CMS, Accreditation, Analytics
// ===========================================

import { createClient } from '@supabase/supabase-js';
import type { Database } from '@/types/supabase';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

if (!supabaseUrl || !supabaseAnonKey) {
    throw new Error('Missing Supabase environment variables');
}

// Client-side Supabase client (uses anon key)
export const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
    auth: {
        persistSession: true,
        autoRefreshToken: true,
        detectSessionInUrl: true,
    },
    realtime: {
        params: {
            eventsPerSecond: 10,
        },
    },
});

// Server-side Supabase client (uses service role key)
// Only use in server actions and API routes
export const createServerSupabaseClient = () => {
    const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

    if (!supabaseServiceKey) {
        throw new Error('Missing Supabase service role key');
    }

    return createClient<Database>(supabaseUrl, supabaseServiceKey, {
        auth: {
            persistSession: false,
            autoRefreshToken: false,
        },
    });
};

// Helper to get authenticated Supabase client with user session
export const getSupabaseClient = async () => {
    const { data: { session } } = await supabase.auth.getSession();

    if (session) {
        return supabase;
    }

    return null;
};

// Database types for type-safe queries
export type Tables = Database['public']['Tables'];
export type Enums = Database['public']['Enums'];

// Common query helpers
export const db = {
    // Users
    users: () => supabase.from('users'),

    // Departments
    departments: () => supabase.from('departments'),

    // Faculty
    faculty: () => supabase.from('faculty_profiles'),

    // Students
    students: () => supabase.from('student_profiles'),

    // Courses
    courses: () => supabase.from('courses'),

    // Attendance
    attendance: () => supabase.from('period_attendance'),
    attendanceAlerts: () => supabase.from('attendance_alerts'),

    // Exams
    examSchedule: () => supabase.from('exam_schedule'),
    internalMarks: () => supabase.from('internal_marks'),
    externalMarks: () => supabase.from('external_marks'),
    hallTickets: () => supabase.from('hall_tickets'),

    // Fees
    feeMaster: () => supabase.from('fee_master'),
    feeTransactions: () => supabase.from('fee_transactions'),
    feeReceipts: () => supabase.from('fee_receipts'),

    // Mentoring
    mentorAllocations: () => supabase.from('mentor_allocations'),
    mentoringSessions: () => supabase.from('mentoring_sessions'),
    riskFlags: () => supabase.from('student_risk_flags'),

    // CRT
    crtMaterials: () => supabase.from('crt_materials'),
    crtTests: () => supabase.from('crt_tests'),

    // Certificates
    certificateRequests: () => supabase.from('certificate_requests'),

    // CMS
    departmentPages: () => supabase.from('department_pages'),
    departmentPosts: () => supabase.from('department_posts'),
    departmentGalleries: () => supabase.from('department_galleries'),

    // Files
    fileAssets: () => supabase.from('file_assets'),

    // Accreditation
    nbaClaims: () => supabase.from('nba_claims'),
    nbaClaimEvidence: () => supabase.from('nba_claim_evidence'),
    coAttainment: () => supabase.from('co_attainment'),
    poAttainment: () => supabase.from('po_attainment'),

    // AI
    aiInsights: () => supabase.from('ai_insights'),

    // Audit
    auditEvents: () => supabase.from('audit_events'),

    // Notifications
    notifications: () => supabase.from('notifications'),
};

export default supabase;
