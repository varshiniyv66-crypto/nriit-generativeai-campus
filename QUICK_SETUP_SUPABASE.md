# 🚀 QUICK START - Supabase Setup (10 Minutes)

## 🎯 Goal: Make Your Project Gold + Diamond Medal Winner!

Follow these **3 SIMPLE STEPS** to complete Supabase setup:

---

## ⚡ STEP 1: Create Storage Buckets (3 minutes)

### Open Supabase Dashboard:
👉 https://supabase.com/dashboard

### Navigate to: Storage → Buckets → Create Bucket

### Create these 6 buckets:

| Bucket Name | Public? | Size Limit | MIME Types |
|-------------|---------|------------|------------|
| `faculty-photos` | ✅ YES | 2 MB | image/jpeg, image/png |
| `faculty-resumes` | ❌ NO | 5 MB | application/pdf |
| `student-photos` | ✅ YES | 2 MB | image/jpeg, image/png |
| `student-documents` | ❌ NO | 5 MB | application/pdf |
| `course-materials` | ❌ NO | 10 MB | application/pdf, ppt, pptx |
| `circulars` | ✅ YES | 5 MB | application/pdf |

### How to Create Each Bucket:
1. Click "New Bucket"
2. Enter bucket name (e.g., `faculty-photos`)
3. Set "Public bucket" (check or uncheck based on table above)
4. Click "Create bucket"
5. Click on bucket name → Settings → Set file size limit and MIME types
6. Repeat for all 6 buckets

---

## ⚡ STEP 2: Run SQL Script (2 minutes)

### Navigate to: SQL Editor → New Query

### Copy-Paste this file content:
📄 Open: `setup_supabase_complete.sql`

### Click: **RUN** ▶️

### Expected Output:
```
✅ Storage policies created
✅ Dean user created in database
✅ RLS disabled for development
✅ Data verification complete
```

---

## ⚡ STEP 3: Create Dean Auth User (2 minutes)

### Navigate to: Authentication → Users → Add User

### Fill in:
- **Email:** `dean@nriit.ac.in`
- **Password:** `Dean@123`
- **Auto Confirm User:** ✅ CHECK THIS BOX!
- **Email Confirm:** ✅ CHECK THIS BOX!

### Click: **Create User**

---

## ✅ VERIFICATION (1 minute)

### Check if everything is working:

1. **Storage Buckets:**
   - Go to Storage → Should see 6 buckets
   - Click `faculty-photos` → Should be public
   - Click `faculty-resumes` → Should be private

2. **Dean User:**
   - Go to SQL Editor → Run:
   ```sql
   SELECT email, role FROM users WHERE email = 'dean@nriit.ac.in';
   ```
   - Should return: `dean@nriit.ac.in | dean`

3. **Auth User:**
   - Go to Authentication → Users
   - Should see `dean@nriit.ac.in` in the list

4. **Data Count:**
   - Go to SQL Editor → Run:
   ```sql
   SELECT 
     (SELECT COUNT(*) FROM faculty_profiles) as faculty,
     (SELECT COUNT(*) FROM student_profiles) as students,
     (SELECT COUNT(*) FROM mentor_allocations) as mentors;
   ```
   - Should return: `~100 faculty, ~1560 students, ~1560 mentors`

---

## 🎉 DONE! What's Next?

### Tell me: **"Supabase setup complete!"**

### I will build:
1. ✨ **Dean Dashboard** with:
   - Faculty Management UI (Add/Edit/Delete)
   - File Upload Interface (Photos & Resumes)
   - Academic Analytics & Reports
   - Department-wise Statistics
   - Beautiful Charts & Visualizations
   - Export to PDF/Excel

2. 🚀 **API Endpoints**:
   - `/api/admin/faculty/add` - Add new faculty
   - `/api/admin/faculty/edit` - Edit faculty
   - `/api/admin/faculty/delete` - Delete faculty
   - `/api/admin/upload` - File uploads

3. 💎 **Premium Features**:
   - Drag-and-drop file upload
   - Image preview before upload
   - Bulk faculty import (Excel/CSV)
   - Real-time data updates
   - Search & filter
   - Pagination

---

## 🐛 Troubleshooting

### Issue: "Bucket already exists"
**Solution:** Skip that bucket, it's already created

### Issue: "Policy already exists"
**Solution:** That's fine, policies are already set

### Issue: "Dean user already exists"
**Solution:** Perfect! User is already created

### Issue: Can't find Supabase Dashboard
**Solution:** Go to https://supabase.com/dashboard and login

### Issue: Don't see my project
**Solution:** Check project selector in top-left corner

---

## 📞 Need Help?

### Common Questions:

**Q: Do I need to create all 6 buckets?**
A: Minimum: `faculty-photos` and `faculty-resumes`. Others are optional but recommended.

**Q: What if I forget the Dean password?**
A: You can reset it in Authentication → Users → Click on user → Reset password

**Q: Can I use a different email for Dean?**
A: Yes, but update the SQL script and code accordingly

**Q: Is this setup permanent?**
A: Yes! You only need to do this once.

---

## ⏱️ Time Breakdown

- Create buckets: 3 minutes
- Run SQL script: 2 minutes
- Create Auth user: 2 minutes
- Verification: 1 minute
- **Total: 8-10 minutes**

---

## 🏆 Success Criteria

You're ready when:
- ✅ All 6 storage buckets created
- ✅ SQL script ran successfully
- ✅ Dean user exists in database
- ✅ Dean auth user created
- ✅ Can see ~100 faculty in database
- ✅ Can see ~1,560 students in database

---

**Status:** 🎯 Ready to build Dean Dashboard!  
**Next:** Tell me "Supabase setup complete!"  
**Result:** Award-winning project! 🏆✨

---

## 📋 Quick Reference

### Supabase Dashboard URLs:
- **Main:** https://supabase.com/dashboard
- **Storage:** .../storage/buckets
- **SQL Editor:** .../sql
- **Authentication:** .../auth/users
- **Table Editor:** .../editor

### Login Credentials (After Setup):
- **Dean:** dean@nriit.ac.in / Dean@123
- **Faculty:** faccse001@nriit.ac.in / (no password in demo)
- **Student:** 24CSE001 / (no password in demo)

---

**Let's make this LEGENDARY!** 🚀
