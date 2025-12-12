# Deployment Guide

## 1. Vercel (Frontend + API)
This project is optimized for Vercel.

1.  Push code to GitHub.
2.  Import project in Vercel.
3.  Add the Environment Variables from `.env.local`.
4.  Deploy.

## 2. Supabase (Database)
1.  Create a new Supabase project.
2.  Go to SQL Editor.
3.  Copy content from `supabase_schema.sql` and run it.
4.  Get project URL and Keys.

## 3. Firebase (Storage & Auth)
1.  Create Firebase project.
2.  Enable Authentication (Phone).
3.  Enable Storage.
4.  Get config keys.

## 4. First Time Setup
- The app uses Fallback JSON data if DB is empty.
- Log in as Admin (Account setup required in DB manually first or enable signup).
