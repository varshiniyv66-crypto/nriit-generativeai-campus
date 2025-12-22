---
description: Deploy the NRIIT Campus Application to Vercel
---

# Deploying to Vercel

Since the application is built successfully locally, you are ready to deploy.

## Prerequisite: Push Code to GitHub

I have committed all your changes locally. You need to push them to your GitHub repository.
Open your terminal and run:

```bash
git push --set-upstream origin main
```

If prompted, sign in to GitHub to authorize the push.

## Step 1: Vercel Dashboard

1.  Go to [Vercel Dashboard](https://vercel.com/dashboard).
2.  Click **"Add New..."** -> **"Project"**.

## Step 2: Import Repository

1.  In the "Import Git Repository" section, you should see `nriit-generativeai-campus` (ensure your GitHub account is connected).
2.  Click **"Import"**.

## Step 3: Configure Project

1.  **Framework Preset**: It should auto-detect **Next.js**.
2.  **Root Directory**: `./` (Default is fine).
3.  **Environment Variables**:
    *   If you have Supabase or other keys in `.env.local`, copy them into the **Environment Variables** section on Vercel.
    *   (Variables like `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`).

## Step 4: Deploy

1.  Click **"Deploy"**.
2.  Vercel will build the project (this takes 1-2 minutes).
3.  Once complete, you will get a live URL (e.g., `nriit-campus.vercel.app`).
4.  Share this URL with management!
