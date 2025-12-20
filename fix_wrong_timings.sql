-- Fix incorrect timetable timings to match official NRIIT format

-- Step 1: Show entries that need fixing
SELECT 
  COUNT(*) as wrong_entries,
  period_number,
  start_time,
  end_time
FROM timetable
WHERE 
  (period_number = 7 AND end_time = '15:50:00'::time) OR
  (period_number = 8 AND start_time = '15:50:00'::time)
GROUP BY period_number, start_time, end_time;

-- Step 2: Fix Period 7 (should be 15:00 - 15:40, not 15:00 - 15:50)
UPDATE timetable
SET end_time = '15:40:00'::time
WHERE period_number = 7 AND end_time = '15:50:00'::time;

-- Step 3: Fix Period 8 (should be 15:40 - 16:20, not 15:50 - 16:40)
UPDATE timetable
SET 
  start_time = '15:40:00'::time,
  end_time = '16:20:00'::time
WHERE period_number = 8 AND start_time = '15:50:00'::time;

-- Step 4: Verify all timings are now correct
SELECT 
  period_number,
  start_time,
  end_time,
  (end_time - start_time) as duration,
  COUNT(*) as total_entries,
  CASE 
    WHEN period_number IN (1,2,3,4,5,6) AND (end_time - start_time) = '00:50:00'::interval THEN '✅ 50 min'
    WHEN period_number IN (7,8) AND (end_time - start_time) = '00:40:00'::interval THEN '✅ 40 min'
    ELSE '❌ WRONG'
  END as status
FROM timetable
GROUP BY period_number, start_time, end_time
ORDER BY period_number, start_time;

-- Step 5: Summary
SELECT 
  'Total timetable entries' as description,
  COUNT(*) as count
FROM timetable
UNION ALL
SELECT 
  'Entries with correct timings' as description,
  COUNT(*) as count
FROM timetable
WHERE 
  (period_number = 1 AND start_time = '09:00:00' AND end_time = '09:50:00') OR
  (period_number = 2 AND start_time = '09:50:00' AND end_time = '10:40:00') OR
  (period_number = 3 AND start_time = '10:50:00' AND end_time = '11:40:00') OR
  (period_number = 4 AND start_time = '11:40:00' AND end_time = '12:30:00') OR
  (period_number = 5 AND start_time = '13:10:00' AND end_time = '14:00:00') OR
  (period_number = 6 AND start_time = '14:00:00' AND end_time = '14:50:00') OR
  (period_number = 7 AND start_time = '15:00:00' AND end_time = '15:40:00') OR
  (period_number = 8 AND start_time = '15:40:00' AND end_time = '16:20:00');
