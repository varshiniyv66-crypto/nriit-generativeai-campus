## 🔍 FACULTY MANAGEMENT TROUBLESHOOTING GUIDE

### Issue: "No faculty members found" showing 0 faculty

This means the page loaded but data isn't being fetched from Supabase.

---

## ✅ QUICK FIX STEPS:

### Step 1: Check Browser Console
1. Open the Faculty Management page: http://localhost:3000/dean/faculty
2. Press **F12** to open Developer Tools
3. Click on the **Console** tab
4. Look for any red error messages
5. Take a screenshot and share with me

### Step 2: Check Network Tab
1. In Developer Tools, click **Network** tab
2. Refresh the page (F5)
3. Look for requests to Supabase
4. Check if any requests are failing (red color)
5. Share screenshot if you see errors

### Step 3: Verify Supabase Connection
Run this in SQL Editor:
```sql
-- Test if faculty data exists
SELECT COUNT(*) as total_faculty FROM faculty_profiles;

-- Test if departments exist
SELECT COUNT(*) as total_departments FROM departments;

-- Test the exact query the page uses
SELECT 
    fp.*,
    d.dept_name,
    d.dept_code
FROM faculty_profiles fp
LEFT JOIN departments d ON fp.department_id = d.id
ORDER BY fp.first_name
LIMIT 10;
```

Expected results:
- total_faculty: 244
- total_departments: 9
- Should see 10 faculty rows with department info

---

## 🔧 POSSIBLE CAUSES & SOLUTIONS:

### Cause 1: Supabase Environment Variables Not Set
**Solution**: Check `.env.local` file has:
```
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### Cause 2: RLS Policies Blocking Access
**Solution**: We already disabled RLS, but verify:
```sql
SELECT tablename, rowsecurity 
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename = 'faculty_profiles';
```
Should show: rowsecurity = false

### Cause 3: Browser Cache Issue
**Solution**:
1. Hard refresh: Ctrl + Shift + R
2. Or clear browser cache
3. Restart dev server: Stop (Ctrl+C) and run `npm run dev` again

### Cause 4: Page Not Re-rendering
**Solution**: The page might be cached. Try:
1. Close the browser tab
2. Open a new tab
3. Go to: http://localhost:3000/dean/faculty

---

## 🎯 ALTERNATIVE: Use Direct Database Query Page

I can create a simpler test page that shows faculty data directly without complex queries.

Would you like me to:
1. Create a simple test page to verify data is accessible?
2. Add more debugging to the current page?
3. Check the Supabase connection settings?

---

## 📸 WHAT TO SHARE:

Please share screenshots of:
1. Browser Console (F12 → Console tab)
2. Network tab showing Supabase requests
3. The Faculty Management page

This will help me identify the exact issue!

---

**Most Common Fix**: Hard refresh the page (Ctrl + Shift + R)
