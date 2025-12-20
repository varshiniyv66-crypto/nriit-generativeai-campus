// Supabase Database Types
// This is a placeholder - in production, generate with: npx supabase gen types typescript

export type Database = {
    public: {
        Tables: {
            faculty_profiles: {
                Row: {
                    id: string;
                    first_name: string;
                    last_name: string;
                    email: string;
                    dept_code: string;
                    designation: string | null;
                    pan_number: string | null;
                    employee_id: string | null;
                    created_at: string;
                };
                Insert: Omit<Database['public']['Tables']['faculty_profiles']['Row'], 'id' | 'created_at'>;
                Update: Partial<Database['public']['Tables']['faculty_profiles']['Insert']>;
            };
            student_profiles: {
                Row: {
                    id: string;
                    first_name: string;
                    last_name: string;
                    email: string;
                    roll_number: string;
                    dept_code: string;
                    semester: number;
                    section: string;
                    mentor_id: string | null;
                    created_at: string;
                };
                Insert: Omit<Database['public']['Tables']['student_profiles']['Row'], 'id' | 'created_at'>;
                Update: Partial<Database['public']['Tables']['student_profiles']['Insert']>;
            };
            class_sections: {
                Row: {
                    id: string;
                    name: string;
                    dept_code: string;
                    semester: number;
                    section: string;
                    academic_year: string;
                    room_no: string | null;
                    class_incharge: string | null;
                    created_at: string;
                };
                Insert: Omit<Database['public']['Tables']['class_sections']['Row'], 'id' | 'created_at'>;
                Update: Partial<Database['public']['Tables']['class_sections']['Insert']>;
            };
            courses: {
                Row: {
                    id: string;
                    course_code: string;
                    course_name: string;
                    dept_code: string;
                    semester: number;
                    credits: number;
                    course_type: string;
                    created_at: string;
                };
                Insert: Omit<Database['public']['Tables']['courses']['Row'], 'id' | 'created_at'>;
                Update: Partial<Database['public']['Tables']['courses']['Insert']>;
            };
            timetable: {
                Row: {
                    id: string;
                    class_section_id: string;
                    course_id: string | null;
                    faculty_id: string | null;
                    day_of_week: number;
                    period_number: number;
                    start_time: string;
                    end_time: string;
                    room_number: string | null;
                    academic_year: string;
                    created_at: string;
                };
                Insert: Omit<Database['public']['Tables']['timetable']['Row'], 'id' | 'created_at'>;
                Update: Partial<Database['public']['Tables']['timetable']['Insert']>;
            };
            period_attendance: {
                Row: {
                    id: string;
                    timetable_id: string;
                    student_id: string;
                    faculty_id: string;
                    date: string;
                    status: string;
                    created_at: string;
                };
                Insert: Omit<Database['public']['Tables']['period_attendance']['Row'], 'id' | 'created_at'>;
                Update: Partial<Database['public']['Tables']['period_attendance']['Insert']>;
            };
        };
        Views: {};
        Functions: {};
        Enums: {};
    };
};
