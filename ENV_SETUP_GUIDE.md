# 🔑 SUPABASE CREDENTIALS SETUP GUIDE

## ⚠️ CRITICAL: This is why Faculty Management shows "No data"!

Your `.env.local` file is missing! This file contains your Supabase connection credentials.

---

## 🚀 QUICK FIX (2 minutes):

### Step 1: Get Your Supabase Credentials

1. Go to: **https://supabase.com/dashboard**
2. Select your project (varshiniyv66-crypto's Project)
3. Click **"Settings"** (gear icon ⚙️) in the left sidebar
4. Click **"API"** under Project Settings
5. You'll see two important values:

**Copy these:**
- **Project URL**: `https://xxxxxxxxxxxxx.supabase.co`
- **anon public key**: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` (very long string)

### Step 2: Create `.env.local` File

1. In your project folder: `c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus`
2. Create a new file named: `.env.local` (exactly this name, with the dot at the start)
3. Paste this content:

```
NEXT_PUBLIC_SUPABASE_URL=https://YOUR_PROJECT_ID.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.YOUR_LONG_KEY_HERE
```

4. Replace `YOUR_PROJECT_ID` with your actual project URL
5. Replace `YOUR_LONG_KEY_HERE` with your actual anon key
6. **Save the file**

### Step 3: Restart Dev Server

1. In the terminal, press **Ctrl + C** to stop the server
2. Run: `npm run dev`
3. Wait for it to start
4. Refresh the Faculty Management page

---

## 📋 EXAMPLE `.env.local` FILE:

```env
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=https://abcdefghijklmnop.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprbG1ub3AiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTYyMzg3NjU0MywiZXhwIjoxOTM5NDUyNTQzfQ.abcdefghijklmnopqrstuvwxyz1234567890
```

(This is just an example - use YOUR actual values!)

---

## ✅ HOW TO VERIFY IT WORKS:

After creating `.env.local` and restarting:

1. Go to: http://localhost:3000/dean/faculty
2. You should see:
   - **Total Faculty**: 244
   - **Professors**: (some number)
   - **Departments**: 9
   - **Faculty table** with all 244 faculty members

---

## 🆘 NEED HELP?

If you're unsure how to create the file:

### Option 1: Use Notepad
1. Open Notepad
2. Paste the content with your credentials
3. Click "File" → "Save As"
4. Navigate to: `c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus`
5. File name: `.env.local` (include the quotes!)
6. Save as type: "All Files"
7. Click Save

### Option 2: Use VS Code
1. In VS Code, click "File" → "New File"
2. Paste the content with your credentials
3. Click "File" → "Save"
4. Name it: `.env.local`
5. Save in the project root folder

---

## 🎯 AFTER FIXING:

Once you add the `.env.local` file and restart:
- ✅ Faculty Management will load all 244 faculty
- ✅ Dean Dashboard will show real data
- ✅ File uploads will work
- ✅ All Supabase features will work

---

**This is the ONLY thing blocking your Faculty Management page!**

Let me know once you've created the file and I'll help you verify it works! 🚀
