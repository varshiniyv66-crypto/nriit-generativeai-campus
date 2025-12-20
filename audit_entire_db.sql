
-- =========================================================
-- SUPER DIAGNOSTIC: List All Tables + Columns + Row Counts (FIXED)
-- =========================================================

SELECT 
    t.table_name,
    COUNT(c.column_name) as column_count,
    (
        SELECT n_live_tup 
        FROM pg_stat_user_tables 
        WHERE relname = t.table_name 
        LIMIT 1 
    ) as approx_row_count
FROM information_schema.tables t
LEFT JOIN information_schema.columns c 
    ON t.table_name = c.table_name 
    AND t.table_schema = c.table_schema
WHERE t.table_schema = 'public' 
AND t.table_type = 'BASE TABLE'
GROUP BY t.table_name
ORDER BY t.table_name;
