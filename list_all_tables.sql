-- ============================================
-- LIST ALL TABLES IN SUPABASE DATABASE
-- ============================================
-- Run this in Supabase SQL Editor to see all tables
-- ============================================

-- Query 1: List all tables with row counts
SELECT 
    schemaname,
    tablename,
    (SELECT COUNT(*) FROM information_schema.columns 
     WHERE table_schema = schemaname AND table_name = tablename) as column_count
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY tablename;

-- Query 2: List all tables with detailed info
SELECT 
    table_name,
    (SELECT COUNT(*) 
     FROM information_schema.columns 
     WHERE table_schema = 'public' AND table_name = t.table_name) as columns,
    pg_size_pretty(pg_total_relation_size(quote_ident(table_name)::regclass)) as size
FROM information_schema.tables t
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Query 3: List all tables with column details
SELECT 
    table_name,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;

-- Query 4: Simple list of table names only
SELECT tablename 
FROM pg_tables 
WHERE schemaname = 'public' 
ORDER BY tablename;

-- Query 5: Count total tables
SELECT COUNT(*) as total_tables
FROM pg_tables
WHERE schemaname = 'public';
