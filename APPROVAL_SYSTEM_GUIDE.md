# 📸 FACULTY PHOTO & RESUME APPROVAL SYSTEM

## 🎯 **OVERVIEW:**

Faculty members can upload/change their own photos and resumes, but they need **Dean approval** before being published.

---

## 🔄 **WORKFLOW:**

### **For Faculty:**
1. Login to Faculty Portal
2. Go to **Profile** page
3. Click **"Upload Photo"** or **"Upload Resume"**
4. Select file and upload
5. Status shows: **"Pending Approval"**
6. Wait for Dean to review
7. Get notification when approved/rejected

### **For Dean:**
1. Login to Dean Portal
2. See **"Pending Approvals"** badge on dashboard
3. Go to **"Approvals"** section
4. Review pending photos/resumes
5. Click **"Approve"** or **"Reject"**
6. If rejecting, provide reason
7. Faculty gets notified

---

## 📊 **DATABASE STRUCTURE:**

### **Tables Created:**

#### **1. faculty_photo_approvals**
Stores pending photo uploads:
- `id` - Unique ID
- `faculty_id` - Which faculty member
- `photo_url` - URL of uploaded photo
- `status` - pending / approved / rejected
- `uploaded_at` - When uploaded
- `reviewed_at` - When Dean reviewed
- `reviewed_by` - Which Dean/Admin reviewed
- `rejection_reason` - Why rejected (if applicable)

#### **2. faculty_resume_approvals**
Same structure for resume uploads

---

## 🎨 **USER INTERFACE:**

### **Faculty Profile Page:**
```
┌─────────────────────────────────────┐
│  Faculty Profile                     │
├─────────────────────────────────────┤
│                                      │
│  [Current Photo]                     │
│  Status: Approved ✅                 │
│                                      │
│  [Upload New Photo]                  │
│  → Pending approval will show here   │
│                                      │
│  [Current Resume]                    │
│  Status: Approved ✅                 │
│                                      │
│  [Upload New Resume]                 │
│  → Pending approval will show here   │
│                                      │
└─────────────────────────────────────┘
```

### **Dean Approvals Page:**
```
┌─────────────────────────────────────┐
│  Pending Approvals (5)               │
├─────────────────────────────────────┤
│                                      │
│  Photo Approvals (3)                 │
│  ┌────────────────────────────────┐ │
│  │ Dr. Rajesh Kumar (CSE)         │ │
│  │ [Photo Preview]                │ │
│  │ Uploaded: 2 hours ago          │ │
│  │ [Approve] [Reject]             │ │
│  └────────────────────────────────┘ │
│                                      │
│  Resume Approvals (2)                │
│  ┌────────────────────────────────┐ │
│  │ Dr. Priya Sharma (ECE)         │ │
│  │ [Resume: view.pdf]             │ │
│  │ Uploaded: 1 day ago            │ │
│  │ [Approve] [Reject]             │ │
│  └────────────────────────────────┘ │
│                                      │
└─────────────────────────────────────┘
```

---

## 🚀 **IMPLEMENTATION STEPS:**

### **Step 1: Create Database Tables**
Run the SQL script:
```bash
create_approval_system.sql
```

This creates:
- ✅ `faculty_photo_approvals` table
- ✅ `faculty_resume_approvals` table
- ✅ Indexes for performance

### **Step 2: Update Faculty Profile Page**
Add photo/resume upload functionality:
- File upload button
- Preview of pending uploads
- Status indicators
- Notification system

### **Step 3: Create Dean Approvals Page**
New page at `/dean/approvals`:
- List of pending photos
- List of pending resumes
- Preview functionality
- Approve/Reject buttons
- Rejection reason input

### **Step 4: Add Notifications**
- Email notification to faculty when approved/rejected
- Badge on Dean dashboard showing pending count
- Toast notifications

---

## ✅ **FEATURES:**

### **For Faculty:**
- ✅ Upload photo from profile
- ✅ Upload resume from profile
- ✅ See pending approval status
- ✅ Get notified when approved/rejected
- ✅ Can upload new file if rejected
- ✅ See rejection reason

### **For Dean:**
- ✅ See all pending approvals
- ✅ Preview photos before approving
- ✅ View resumes before approving
- ✅ Approve with one click
- ✅ Reject with reason
- ✅ See approval history
- ✅ Bulk approve/reject

---

## 🔒 **SECURITY:**

- ✅ Faculty can only upload for themselves
- ✅ Dean can approve for anyone
- ✅ Files stored in Supabase Storage
- ✅ Old files deleted when new ones approved
- ✅ Rejected files kept for 30 days then deleted
- ✅ Audit trail of all approvals

---

## 📋 **STATUS TYPES:**

1. **Pending** 🟡
   - Just uploaded
   - Waiting for Dean review
   - Not visible to others

2. **Approved** ✅
   - Dean approved
   - Now visible to everyone
   - Replaces old photo/resume

3. **Rejected** ❌
   - Dean rejected
   - Not visible
   - Faculty can upload new one
   - Shows rejection reason

---

## 🎯 **BENEFITS:**

### **Quality Control:**
- ✅ Dean ensures professional photos
- ✅ Dean verifies resume accuracy
- ✅ Maintains institutional standards

### **Faculty Empowerment:**
- ✅ Faculty can update own profile
- ✅ No need to contact admin
- ✅ Quick and easy process

### **Transparency:**
- ✅ Clear approval status
- ✅ Rejection reasons provided
- ✅ Audit trail maintained

---

## 📊 **STATISTICS:**

Dean can see:
- Total pending approvals
- Average approval time
- Rejection rate
- Most active faculty

---

## 🔄 **NEXT STEPS:**

1. **Run SQL Script**
   ```bash
   create_approval_system.sql
   ```

2. **I'll Create:**
   - Faculty Profile page with upload
   - Dean Approvals page
   - Notification system
   - API endpoints

3. **You Test:**
   - Upload as faculty
   - Approve as dean
   - Check notifications

---

**Would you like me to create the Faculty Profile page and Dean Approvals page now?** 🚀

This will give faculty the ability to upload their own photos/resumes with Dean approval! ✅
