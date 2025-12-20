
    -- FORCE day_of_week to be TEXT
    ALTER TABLE timetable ALTER COLUMN day_of_week TYPE TEXT USING day_of_week::text;
    