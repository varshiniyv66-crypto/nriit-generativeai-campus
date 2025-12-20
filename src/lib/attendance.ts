import supabase from './supabase';

// ============================================
// FACULTY FUNCTIONS
// ============================================

/**
 * Get faculty profile by employee ID
 */
export async function getFacultyProfile(employeeId: string) {
    try {
        const { data, error } = await supabase
            .from('faculty_profiles')
            .select('*')
            .eq('employee_id', employeeId)
            .single();

        if (error) throw error;
        return { data, error: null };
    } catch (error) {
        console.error('Error fetching faculty profile:', error);
        return { data: null, error };
    }
}

/**
 * Get faculty's timetable with class and course details
 */
export async function getFacultyTimetable(facultyId: string) {
    try {
        const { data, error } = await supabase
            .from('timetable')
            .select(`
                *,
                course:courses (
                    id,
                    course_code,
                    course_name,
                    dept_code,
                    semester
                ),
                class_section:class_sections (
                    id,
                    dept_code,
                    semester,
                    section,
                    academic_year,
                    strength
                )
            `)
            .eq('faculty_id', facultyId)
            .order('day_of_week')
            .order('period_number');

        if (error) throw error;
        return { data, error: null };
    } catch (error) {
        console.error('Error fetching faculty timetable:', error);
        return { data: null, error };
    }
}

/**
 * Extract unique classes from timetable
 */
export function extractUniqueClasses(timetable: any[]) {
    const classMap = new Map();

    timetable?.forEach((entry) => {
        const cs = entry.class_section;
        if (cs) {
            const key = `${cs.dept_code}-${cs.semester}-${cs.section}`;
            if (!classMap.has(key)) {
                classMap.set(key, {
                    id: cs.id,
                    dept_code: cs.dept_code,
                    semester: cs.semester,
                    section: cs.section,
                    academic_year: cs.academic_year,
                    strength: cs.strength,
                    display: `${romanNumeral(cs.semester)} ${cs.dept_code}-${cs.section}`
                });
            }
        }
    });

    return Array.from(classMap.values());
}

/**
 * Extract unique subjects from timetable
 */
export function extractUniqueSubjects(timetable: any[]) {
    const subjectMap = new Map();

    timetable?.forEach((entry) => {
        const course = entry.course;
        if (course) {
            if (!subjectMap.has(course.id)) {
                subjectMap.set(course.id, {
                    id: course.id,
                    course_code: course.course_code,
                    course_name: course.course_name,
                    dept_code: course.dept_code,
                    semester: course.semester,
                    display: `${course.course_code} - ${course.course_name}`
                });
            }
        }
    });

    return Array.from(subjectMap.values());
}

/**
 * Get today's classes for faculty
 */
export function getTodayClasses(timetable: any[]) {
    const today = new Date().getDay(); // 0=Sunday, 1=Monday, etc.
    const dayOfWeek = today === 0 ? 6 : today; // Convert Sunday to 6

    return timetable?.filter(entry => entry.day_of_week === dayOfWeek) || [];
}

// ============================================
// STUDENT FUNCTIONS
// ============================================

/**
 * Get students for a specific class
 */
export async function getStudentsByClass(deptCode: string, semester: number, section: string) {
    try {
        const { data, error } = await supabase
            .from('student_profiles')
            .select('id, roll_number, first_name, last_name, current_semester, section')
            .eq('dept_code', deptCode)
            .eq('current_semester', semester)
            .eq('section', section)
            .eq('is_active', true)
            .order('roll_number');

        if (error) throw error;
        return { data, error: null };
    } catch (error) {
        console.error('Error fetching students:', error);
        return { data: null, error };
    }
}

/**
 * Get student's overall attendance percentage
 */
export async function getStudentAttendancePercentage(studentId: string) {
    try {
        const { data, error } = await supabase
            .from('period_attendance')
            .select('status')
            .eq('student_id', studentId);

        if (error) throw error;

        const total = data?.length || 0;
        const present = data?.filter(a =>
            ['present', 'late', 'on_duty', 'medical_leave'].includes(a.status)
        ).length || 0;

        const percentage = total > 0 ? Math.round((present / total) * 100) : 100;

        return { percentage, total, present, error: null };
    } catch (error) {
        console.error('Error calculating attendance:', error);
        return { percentage: 0, total: 0, present: 0, error };
    }
}

// ============================================
// ATTENDANCE FUNCTIONS
// ============================================

/**
 * Load existing attendance for a specific date and class
 */
export async function loadAttendance(
    date: string,
    classSectionId: string,
    courseId: string
) {
    try {
        const { data, error } = await supabase
            .from('period_attendance')
            .select('*')
            .eq('attendance_date', date)
            .eq('class_section_id', classSectionId)
            .eq('course_id', courseId);

        if (error) throw error;
        return { data, error: null };
    } catch (error) {
        console.error('Error loading attendance:', error);
        return { data: null, error };
    }
}

/**
 * Save attendance records
 */
export async function saveAttendance(attendanceRecords: any[]) {
    try {
        // First, delete existing records for this date/class/course
        if (attendanceRecords.length > 0) {
            const firstRecord = attendanceRecords[0];
            await supabase
                .from('period_attendance')
                .delete()
                .eq('attendance_date', firstRecord.attendance_date)
                .eq('class_section_id', firstRecord.class_section_id)
                .eq('course_id', firstRecord.course_id);
        }

        // Insert new records
        const { data, error } = await supabase
            .from('period_attendance')
            .insert(attendanceRecords)
            .select();

        if (error) throw error;
        return { data, error: null };
    } catch (error) {
        console.error('Error saving attendance:', error);
        return { data: null, error };
    }
}

/**
 * Get attendance statistics for a class
 */
export async function getClassAttendanceStats(
    classSectionId: string,
    courseId: string,
    startDate?: string,
    endDate?: string
) {
    try {
        let query = supabase
            .from('period_attendance')
            .select('status, attendance_date')
            .eq('class_section_id', classSectionId)
            .eq('course_id', courseId);

        if (startDate) query = query.gte('attendance_date', startDate);
        if (endDate) query = query.lte('attendance_date', endDate);

        const { data, error } = await query;

        if (error) throw error;

        const total = data?.length || 0;
        const present = data?.filter(a =>
            ['present', 'late', 'on_duty', 'medical_leave'].includes(a.status)
        ).length || 0;
        const absent = data?.filter(a => a.status === 'absent').length || 0;

        return {
            total,
            present,
            absent,
            percentage: total > 0 ? Math.round((present / total) * 100) : 0,
            error: null
        };
    } catch (error) {
        console.error('Error getting class stats:', error);
        return { total: 0, present: 0, absent: 0, percentage: 0, error };
    }
}

// ============================================
// DEAN/ADMIN FUNCTIONS
// ============================================

/**
 * Get department-wise attendance statistics
 */
export async function getDepartmentAttendanceStats(date?: string) {
    try {
        const targetDate = date || new Date().toISOString().split('T')[0];

        // Get all departments
        const { data: departments } = await supabase
            .from('departments')
            .select('code, name')
            .eq('is_active', true);

        if (!departments) return { data: [], error: null };

        // Get attendance stats for each department
        const stats = await Promise.all(
            departments.map(async (dept) => {
                // Get total students in department
                const { count: totalStudents } = await supabase
                    .from('student_profiles')
                    .select('*', { count: 'exact', head: true })
                    .eq('dept_code', dept.code)
                    .eq('is_active', true);

                // Get today's attendance records
                const { data: attendance } = await supabase
                    .from('period_attendance')
                    .select('student_id, status')
                    .eq('attendance_date', targetDate)
                    .eq('dept_code', dept.code); // Optimization: filter by dept_code directly on period_attendance if available, or join. 

                // Note: period_attendance might not have dept_code directly if normalized. 
                // Let's stick to the join if we aren't sure, but wait, the previous code used:
                // .eq('student.dept_code', dept.code) with nested select.
                // Let's use the previous join approach but add student_id.

                const { data: attendanceWithJoin } = await supabase
                    .from('period_attendance')
                    .select(`
                        student_id,
                        status,
                        student:student_profiles!inner(dept_code)
                    `)
                    .eq('attendance_date', targetDate)
                    .eq('student.dept_code', dept.code);

                const records = attendanceWithJoin || [];

                // Calculate present periods
                const presentPeriodsCount = records.filter(a =>
                    ['present', 'late', 'on_duty', 'medical_leave'].includes(a.status)
                ).length;

                // Calculate unique students who were present at least once
                const uniquePresentStudents = new Set(
                    records.filter(a => ['present', 'late', 'on_duty', 'medical_leave'].includes(a.status))
                        .map(a => a.student_id)
                ).size;

                return {
                    dept_code: dept.code,
                    dept_name: dept.name,
                    total_students: totalStudents || 0,
                    present_today: uniquePresentStudents,
                    percentage: totalStudents ? Math.round((presentPeriodsCount / (totalStudents * 8)) * 100) : 0
                };
            })
        );

        return { data: stats, error: null };
    } catch (error) {
        console.error('Error getting department stats:', error);
        return { data: [], error };
    }
}

// ============================================
// UTILITY FUNCTIONS
// ============================================

/**
 * Convert semester number to Roman numeral
 */
function romanNumeral(num: number): string {
    const map: { [key: number]: string } = {
        1: 'I', 2: 'II', 3: 'III', 4: 'IV',
        5: 'V', 6: 'VI', 7: 'VII', 8: 'VIII'
    };
    return map[num] || num.toString();
}

/**
 * Format date to YYYY-MM-DD
 */
export function formatDate(date: Date): string {
    return date.toISOString().split('T')[0];
}

/**
 * Get current academic year
 */
export function getCurrentAcademicYear(): string {
    const now = new Date();
    const year = now.getFullYear();
    const month = now.getMonth() + 1; // 0-indexed

    // Academic year starts in July (month 7)
    if (month >= 7) {
        return `${year}-${(year + 1).toString().slice(-2)}`;
    } else {
        return `${year - 1}-${year.toString().slice(-2)}`;
    }
}
