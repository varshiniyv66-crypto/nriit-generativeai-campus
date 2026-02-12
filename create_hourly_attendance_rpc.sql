-- =============================================
-- DATABASE FUNCTION: Daily Absentee Report
-- =============================================
-- This function fetches students who are absent on a specific date.
-- It aggregates the specific periods they missed and includes parent contact info.
CREATE OR REPLACE FUNCTION get_daily_absentee_report(
        report_date DATE,
        dept_filter TEXT DEFAULT NULL,
        year_filter INTEGER DEFAULT NULL,
        section_filter TEXT DEFAULT NULL
    ) RETURNS TABLE (
        student_id UUID,
        roll_number TEXT,
        student_name TEXT,
        department TEXT,
        year INTEGER,
        section TEXT,
        parent_phone TEXT,
        absent_periods INTEGER [],
        total_periods_absent BIGINT
    ) AS $$ BEGIN RETURN QUERY
SELECT s.id AS student_id,
    s.roll_number,
    s.full_name AS student_name,
    s.department,
    s.current_year AS year,
    s.section,
    s.parent_phone,
    ARRAY_AGG(
        pa.period_number
        ORDER BY pa.period_number
    ) AS absent_periods,
    COUNT(pa.period_number) AS total_periods_absent
FROM period_attendance pa
    JOIN student_profiles s ON pa.student_id = s.id
WHERE pa.attendance_date = report_date
    AND pa.status = 'absent'
    AND (
        dept_filter IS NULL
        OR s.department = dept_filter
    )
    AND (
        year_filter IS NULL
        OR s.current_year = year_filter
    )
    AND (
        section_filter IS NULL
        OR s.section = section_filter
    )
GROUP BY s.id,
    s.roll_number,
    s.full_name,
    s.department,
    s.current_year,
    s.section,
    s.parent_phone
ORDER BY s.current_year DESC,
    s.department,
    s.section,
    s.roll_number;
END;
$$ LANGUAGE plpgsql;
-- =============================================
-- USAGE EXAMPLE:
-- SELECT * FROM get_daily_absentee_report('2025-02-11', 'CSE', 4, 'A');
-- =============================================