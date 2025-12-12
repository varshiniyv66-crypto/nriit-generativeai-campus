# 🎯 STEP 1: Assign Mentors to Students

## What This Does:
- Assigns faculty mentors to students (round-robin, ~15-20 students per mentor)
- Marks faculty as mentors in the database
- Creates sample mentoring sessions (for realism)
- Creates risk flags for at-risk students (for dashboard alerts)

## How to Run:

### In Supabase SQL Editor:
1. Copy all content from `seed_mentor_assignments.sql`
2. Paste into Supabase SQL Editor
3. Click **"Run"**
4. Wait ~10-20 seconds

### Expected Output:
```
✅ MENTOR ASSIGNMENTS COMPLETE!
📊 MENTOR ASSIGNMENT SUMMARY:
   Total Students: ~1,560
   Students with Mentors: ~1,560
   Total Mentors: ~80-90
   Avg Mentees per Mentor: ~17-20
```

### Verification:
You'll also see a department-wise breakdown table showing:
- Total mentors per department
- Total mentees per department
- Average mentees per mentor

---

## What Happens:
1. ✅ Each student gets assigned a faculty mentor from their department
2. ✅ Faculty members are marked as `is_mentor = true`
3. ✅ `mentor_allocations` table is populated
4. ✅ Sample mentoring sessions created (~30% of students)
5. ✅ Risk flags created for at-risk students (~15% of students)

---

## Next Step:
After running this, we'll have **real mentoring data** to display in the dashboards!

Then I'll create the **3 AWARD-WINNING DASHBOARDS**:
1. 🎓 Student Dashboard
2. 👨‍🏫 Faculty Dashboard  
3. 🏛️ Dean Dashboard

---

**Run this file now, then let me know when it's done!** 🚀
