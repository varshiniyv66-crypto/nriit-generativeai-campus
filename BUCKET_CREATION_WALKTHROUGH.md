# 🎯 SUPABASE BUCKET CREATION - VISUAL WALKTHROUGH
## Follow these exact steps (5 minutes total!)

---

## 🚀 STEP-BY-STEP GUIDE

### **STEP 1: Open Supabase** (30 seconds)

1. Open your browser
2. Go to: **https://supabase.com/dashboard**
3. You should see your project listed
4. Click on your project name

---

### **STEP 2: Navigate to Storage** (10 seconds)

1. Look at the **left sidebar**
2. Find and click on **"Storage"** (it has a folder icon 📁)
3. You'll see the Storage page

---

### **STEP 3: Create Bucket #1 - faculty-photos** (1 minute)

1. Click the **"New bucket"** button (top right, green button)
2. A form will appear. Fill it in:

```
Bucket name: faculty-photos
Public bucket: ✅ CHECK THIS BOX (toggle ON)
File size limit: 2097152
Allowed MIME types: image/jpeg,image/png,image/webp
```

3. Click **"Create bucket"**
4. ✅ You should see "faculty-photos" in the list!

---

### **STEP 4: Create Bucket #2 - faculty-resumes** (1 minute)

1. Click **"New bucket"** again
2. Fill in:

```
Bucket name: faculty-resumes
Public bucket: ❌ LEAVE UNCHECKED (toggle OFF)
File size limit: 5242880
Allowed MIME types: application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document
```

3. Click **"Create bucket"**
4. ✅ You should see "faculty-resumes" in the list!

---

### **STEP 5: Create Bucket #3 - student-photos** (1 minute)

1. Click **"New bucket"** again
2. Fill in:

```
Bucket name: student-photos
Public bucket: ✅ CHECK THIS BOX (toggle ON)
File size limit: 2097152
Allowed MIME types: image/jpeg,image/png,image/webp
```

3. Click **"Create bucket"**
4. ✅ You should see "student-photos" in the list!

---

### **STEP 6: Create Bucket #4 - circulars** (1 minute)

1. Click **"New bucket"** again
2. Fill in:

```
Bucket name: circulars
Public bucket: ✅ CHECK THIS BOX (toggle ON)
File size limit: 10485760
Allowed MIME types: application/pdf
```

3. Click **"Create bucket"**
4. ✅ You should see "circulars" in the list!

---

### **STEP 7: Verify Buckets Created** (30 seconds)

You should now see **4 buckets** in your Storage page:

- ✅ **circulars** (public)
- ✅ **faculty-photos** (public)
- ✅ **faculty-resumes** (private - no public badge)
- ✅ **student-photos** (public)

**Screenshot this page!** 📸

---

### **STEP 8: Run SQL Script** (1 minute)

1. Click **"SQL Editor"** in the left sidebar
2. Click **"New query"**
3. Open the file: `setup_supabase_complete.sql`
4. Copy ALL the content
5. Paste it into the SQL Editor
6. Click **"Run"** (or press Ctrl+Enter)
7. Wait for it to complete (you'll see success messages)

---

### **STEP 9: Create Dean User in Authentication** (1 minute)

1. Click **"Authentication"** in the left sidebar
2. Click **"Users"** tab
3. Click **"Add user"** or **"Invite user"** button
4. Fill in:

```
Email: dean@nriit.ac.in
Password: Dean@123
Auto Confirm User: ✅ CHECK THIS BOX
```

5. Click **"Create user"** or **"Send invite"**
6. ✅ You should see dean@nriit.ac.in in the users list!

---

### **STEP 10: Verify Everything** (1 minute)

1. Go back to **SQL Editor**
2. Click **"New query"**
3. Open the file: `verify_supabase_setup.sql`
4. Copy ALL the content
5. Paste it into the SQL Editor
6. Click **"Run"**
7. Check the results - you should see:

```
✅ ✅ ✅ ALL CHECKS PASSED! ✅ ✅ ✅
🏆 Ready for Faculty Management!
```

---

## 🎉 DONE! Tell the AI:

Once you see "ALL CHECKS PASSED", come back here and type:

**"All buckets created successfully!"**

Then I'll create the Faculty Management page with file uploads! 🚀

---

## 📸 SCREENSHOTS TO TAKE (for documentation)

1. Storage page showing all 4 buckets
2. SQL Editor showing "ALL CHECKS PASSED"
3. Authentication page showing dean@nriit.ac.in user

---

## 🆘 TROUBLESHOOTING

### Issue: "Bucket name already exists"
**Solution**: That bucket is already created! Skip to the next one.

### Issue: Can't find "New bucket" button
**Solution**: Make sure you're on the Storage page, not inside a bucket.

### Issue: MIME types field not showing
**Solution**: Some Supabase versions don't have this field. That's OK, skip it!

### Issue: SQL script has errors
**Solution**: 
- Make sure all 4 buckets are created first
- Try running the script in smaller sections
- Share the error message with me

### Issue: Can't create Dean user
**Solution**:
- Make sure you're in Authentication → Users
- Try "Invite user" instead of "Add user"
- Make sure email is exactly: dean@nriit.ac.in

---

## ⏱️ TOTAL TIME: ~7 minutes

You've got this! It's easier than it looks! 💪

---

**Created**: 2025-12-11
**Status**: Ready to follow
**Next**: Tell AI when complete!
