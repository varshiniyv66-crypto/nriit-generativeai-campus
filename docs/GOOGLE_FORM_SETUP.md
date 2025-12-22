# Google Form Setup for Faculty Photo & Resume Collection

## Step 1: Create Google Form

Go to [forms.google.com](https://forms.google.com) and create a new form titled:
**"Faculty Profile - Photo & Resume Upload"**

## Step 2: Add These Questions

| Question | Type | Required |
|----------|------|----------|
| Full Name (as per records) | Short text | Yes |
| PAN Number | Short text | Yes |
| Department | Dropdown (CSE, ECE, IT, CIVIL, MBA, MCA) | Yes |
| Designation | Short text | Yes |
| Photo (Passport Size) | File upload (Images only, 1 file max) | Yes |
| Resume/CV (PDF only) | File upload (PDF only, 1 file max) | Yes |

## Step 3: Configure File Uploads

In Form Settings:
1. Click the **Settings** gear icon
2. Enable **"Collect email addresses"** (optional)
3. For file uploads: Click the question → Set **"Allow only specific file types"**
   - Photo: JPG, PNG (Max 5MB)
   - Resume: PDF only (Max 10MB)

## Step 4: Link to Google Sheet

1. Click **"Responses"** tab in the form
2. Click the **Google Sheets icon** (green)
3. Create a new spreadsheet: "Faculty Uploads Responses"

## Step 5: Share the Form

1. Click **"Send"** button
2. Copy the link and share with all faculty

---

## After Faculty Submit:

The Google Sheet will have columns:
- Timestamp
- Full Name  
- PAN Number
- Department
- Designation
- Photo (Google Drive link)
- Resume (Google Drive link)

**Share the Google Sheet "Published as CSV" URL with me, and I'll connect it to the website!**

---

## Form Link Format to Share:
```
https://docs.google.com/forms/d/YOUR_FORM_ID/viewform
```
