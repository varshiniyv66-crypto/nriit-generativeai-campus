-- ============================================
-- FACULTY PHOTO APPROVAL SYSTEM
-- ============================================
-- This creates a system where faculty can upload photos
-- but they need Dean approval before being published

-- Create table for pending photo uploads
CREATE TABLE IF NOT EXISTS faculty_photo_approvals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    photo_url TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'pending', -- pending, approved, rejected
    uploaded_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    reviewed_at TIMESTAMP WITH TIME ZONE,
    reviewed_by UUID REFERENCES users(id),
    rejection_reason TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_photo_approvals_faculty ON faculty_photo_approvals(faculty_id);
CREATE INDEX IF NOT EXISTS idx_photo_approvals_status ON faculty_photo_approvals(status);

-- Add comment
COMMENT ON TABLE faculty_photo_approvals IS 'Stores pending faculty photo uploads awaiting Dean approval';

-- Create similar table for resume approvals
CREATE TABLE IF NOT EXISTS faculty_resume_approvals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    resume_url TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'pending', -- pending, approved, rejected
    uploaded_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    reviewed_at TIMESTAMP WITH TIME ZONE,
    reviewed_by UUID REFERENCES users(id),
    rejection_reason TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_resume_approvals_faculty ON faculty_resume_approvals(faculty_id);
CREATE INDEX IF NOT EXISTS idx_resume_approvals_status ON faculty_resume_approvals(status);

-- Add comment
COMMENT ON TABLE faculty_resume_approvals IS 'Stores pending faculty resume uploads awaiting Dean approval';

-- Success message
DO $$
BEGIN
    RAISE NOTICE '============================================';
    RAISE NOTICE '✅ APPROVAL SYSTEM CREATED SUCCESSFULLY!';
    RAISE NOTICE '============================================';
    RAISE NOTICE 'Tables created:';
    RAISE NOTICE '  - faculty_photo_approvals';
    RAISE NOTICE '  - faculty_resume_approvals';
    RAISE NOTICE '';
    RAISE NOTICE 'Workflow:';
    RAISE NOTICE '  1. Faculty uploads photo/resume';
    RAISE NOTICE '  2. Status: PENDING';
    RAISE NOTICE '  3. Dean reviews and approves/rejects';
    RAISE NOTICE '  4. If approved: Photo/resume becomes visible';
    RAISE NOTICE '  5. If rejected: Faculty can upload new one';
    RAISE NOTICE '============================================';
END $$;
