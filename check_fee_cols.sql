
-- =========================================================
-- GOLD DIAMOND: Seed Fee Structure & Transactions
-- =========================================================

-- Check fee table columns first
SELECT column_name FROM information_schema.columns WHERE table_name = 'fee_master' ORDER BY ordinal_position;
SELECT column_name FROM information_schema.columns WHERE table_name = 'fee_transactions' ORDER BY ordinal_position;
