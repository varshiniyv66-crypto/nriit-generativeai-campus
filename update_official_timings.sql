-- SQL to update time slots to match NRIIT official format

-- Update existing timetable entries to use correct timings
UPDATE timetable SET
  start_time = CASE period_number
    WHEN 1 THEN '09:00'::time
    WHEN 2 THEN '09:50'::time
    WHEN 3 THEN '10:50'::time
    WHEN 4 THEN '11:40'::time
    WHEN 5 THEN '13:10'::time
    WHEN 6 THEN '14:00'::time
    WHEN 7 THEN '15:00'::time
    WHEN 8 THEN '15:40'::time
  END,
  end_time = CASE period_number
    WHEN 1 THEN '09:50'::time
    WHEN 2 THEN '10:40'::time
    WHEN 3 THEN '11:40'::time
    WHEN 4 THEN '12:30'::time
    WHEN 5 THEN '14:00'::time
    WHEN 6 THEN '14:50'::time
    WHEN 7 THEN '15:40'::time
    WHEN 8 THEN '16:20'::time
  END;

-- Verify the update
SELECT 
  period_number,
  start_time,
  end_time,
  (end_time - start_time) as duration,
  COUNT(*) as entries
FROM timetable
GROUP BY period_number, start_time, end_time
ORDER BY period_number;
