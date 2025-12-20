-- Check current timetable timings vs official NRIIT format

-- 1. Show current timings in database
SELECT DISTINCT
  period_number,
  start_time,
  end_time,
  (end_time - start_time) as duration
FROM timetable
ORDER BY period_number;

-- 2. Compare with official format
SELECT 
  period_number,
  'Current: ' || start_time || ' - ' || end_time as current_timing,
  'Official: ' || CASE period_number
    WHEN 1 THEN '09:00 - 09:50'
    WHEN 2 THEN '09:50 - 10:40'
    WHEN 3 THEN '10:50 - 11:40'
    WHEN 4 THEN '11:40 - 12:30'
    WHEN 5 THEN '13:10 - 14:00'
    WHEN 6 THEN '14:00 - 14:50'
    WHEN 7 THEN '15:00 - 15:40'
    WHEN 8 THEN '15:40 - 16:20'
  END as official_timing,
  CASE 
    WHEN start_time::text = CASE period_number
      WHEN 1 THEN '09:00:00'
      WHEN 2 THEN '09:50:00'
      WHEN 3 THEN '10:50:00'
      WHEN 4 THEN '11:40:00'
      WHEN 5 THEN '13:10:00'
      WHEN 6 THEN '14:00:00'
      WHEN 7 THEN '15:00:00'
      WHEN 8 THEN '15:40:00'
    END THEN '✅ CORRECT'
    ELSE '❌ WRONG - NEEDS UPDATE'
  END as status
FROM (
  SELECT DISTINCT period_number, start_time, end_time
  FROM timetable
  ORDER BY period_number
) t;
