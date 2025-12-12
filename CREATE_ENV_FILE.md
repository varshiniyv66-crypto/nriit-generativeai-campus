# 🔑 CREATE YOUR .env.local FILE

## 📋 WHAT YOU SEE ON THE SUPABASE PAGE:

From your screenshot, I can see you're on the API Keys page. Perfect!

---

## 🎯 STEP-BY-STEP INSTRUCTIONS:

### Step 1: Get Project URL
1. On the Supabase API page, **scroll to the top**
2. Look for **"Project URL"** or **"API URL"**
3. It looks like: `https://xxxxxxxxxxxxx.supabase.co`
4. **Copy it**

### Step 2: Get Anon Public Key
1. On the same API page, look for **"Project API keys"** section
2. Find the key labeled **"anon"** or **"public"**
3. It's a LONG string starting with **"eyJ..."** (NOT the one starting with "sb_")
4. Click the **copy icon** next to it
5. **Copy it**

### Step 3: Create .env.local File

**Option A: Using Notepad**
1. Open **Notepad**
2. Paste this content:

```
NEXT_PUBLIC_SUPABASE_URL=https://YOUR_PROJECT_ID.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.YOUR_LONG_KEY
```

3. Replace `https://YOUR_PROJECT_ID.supabase.co` with your actual Project URL
4. Replace `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.YOUR_LONG_KEY` with your actual anon key
5. Click **File** → **Save As**
6. Navigate to: `c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus`
7. In "File name" box, type: `.env.local` (include the quotes!)
8. In "Save as type", select: **All Files**
9. Click **Save**

**Option B: Using VS Code**
1. In VS Code, create a new file
2. Paste the content above with your actual values
3. Save as: `.env.local` in the project root

---

## ✅ EXAMPLE (DO NOT COPY THIS - USE YOUR OWN VALUES):

```
NEXT_PUBLIC_SUPABASE_URL=https://abcdefghijklmnop.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprbG1ub3AiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTYyMzg3NjU0MywiZXhwIjoxOTM5NDUyNTQzfQ.abcdefghijklmnopqrstuvwxyz1234567890
```

---

## 🚀 STEP 4: Restart Dev Server

After creating the file:
1. Go to your terminal
2. Press **Ctrl + C** to stop the server
3. Run: `npm run dev`
4. Wait for it to start
5. Go to: http://localhost:3000/dean/faculty

---

## 🎉 RESULT:

You should now see:
- ✅ **244 Faculty** members loaded
- ✅ **9 Departments**
- ✅ Full faculty table with data
- ✅ Everything working!

---

## ⚠️ IMPORTANT NOTES:

1. **NO spaces** around the `=` sign
2. **NO quotes** around the values
3. The anon key should start with **"eyJ..."** NOT "sb_"
4. Make sure the file is named exactly: `.env.local` (with the dot at the start)
5. The file should be in the project root folder, NOT in any subfolder

---

## 🆘 STILL STUCK?

Take a screenshot showing:
1. The top of the Supabase API page (showing Project URL)
2. The Project API keys section (showing the anon key)

And I'll help you create the exact file content!

---

**Once you create this file and restart, EVERYTHING will work!** 🏆
