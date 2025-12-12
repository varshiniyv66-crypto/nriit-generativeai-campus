-- ===========================================
-- NRIIT Digital University Platform
-- Complete Supabase Schema
-- ===========================================
-- Data Ownership Rule:
-- Supabase = ERP DATA + CMS DATA + Accreditation DATA + Analytics
-- Firebase = LOGIN (OTP) + ALERTS + FILES + REALTIME
-- ===========================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ===========================================
-- SECTION 1: CORE ENUMS
-- ===========================================

CREATE TYPE user_role AS ENUM (
  'student',
  'faculty',
  'hod',
  'dean',
  'principal',
  'admin',
  'dean_content_admin',
  'exam_cell',
  'accounts',
  'librarian',
  'transport',
  'hostel_warden'
);

CREATE TYPE department_code AS ENUM (
  'CSE',
  'CSE-DS',
  'CSE-AI',
  'IT',
  'ECE',
  'CIVIL',
  'MBA',
  'MCA',
  'BSH'
);

CREATE TYPE gender_type AS ENUM ('male', 'female', 'other');

CREATE TYPE blood_group AS ENUM ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-');

CREATE TYPE file_purpose AS ENUM (
  'faculty_photo',
  'student_photo',
  'circular',
  'timetable',
  'hall_ticket',
  'certificate',
  'receipt',
  'material',
  'accreditation_evidence',
  'post_attachment',
  'gallery_image',
  'banner_image',
  'lab_photo',
  'event_photo',
  'achievement_proof'
);

CREATE TYPE fee_category AS ENUM (
  'tuition',
  'hostel',
  'transport',
  'library',
  'regular_exam',
  'backlog_exam',
  'revaluation',
  'late_fee',
  'misc'
);

CREATE TYPE payment_status AS ENUM (
  'pending',
  'completed',
  'failed',
  'refunded',
  'cancelled'
);

CREATE TYPE attendance_status AS ENUM (
  'present',
  'absent',
  'late',
  'on_duty',
  'medical_leave'
);

CREATE TYPE certificate_type AS ENUM (
  'bonafide',
  'conduct',
  'bus_pass',
  'fee_receipt',
  'tc',
  'migration',
  'study',
  'character'
);

CREATE TYPE certificate_status AS ENUM (
  'requested',
  'processing',
  'approved',
  'rejected',
  'issued',
  'collected'
);

CREATE TYPE risk_level AS ENUM ('low', 'medium', 'high', 'critical');

CREATE TYPE semester_type AS ENUM ('odd', 'even');

CREATE TYPE exam_type AS ENUM ('internal_1', 'internal_2', 'mid_1', 'mid_2', 'external', 'supplementary');

-- ===========================================
-- SECTION 2: AUTHENTICATION & USER MANAGEMENT
-- ===========================================

-- Firebase UID to ERP User mapping (MANDATORY as per requirements)
CREATE TABLE firebase_user_mapping (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  firebase_uid VARCHAR(128) UNIQUE NOT NULL,
  erp_user_id UUID NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_firebase_mapping_uid ON firebase_user_mapping(firebase_uid);
CREATE INDEX idx_firebase_mapping_erp ON firebase_user_mapping(erp_user_id);

-- Main users table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email VARCHAR(255) UNIQUE,
  phone VARCHAR(15) UNIQUE,
  role user_role NOT NULL,
  is_active BOOLEAN DEFAULT true,
  email_verified BOOLEAN DEFAULT false,
  phone_verified BOOLEAN DEFAULT false,
  last_login TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_phone ON users(phone);
CREATE INDEX idx_users_role ON users(role);

-- ===========================================
-- SECTION 3: DEPARTMENTS
-- ===========================================

CREATE TABLE departments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  code department_code UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  short_name VARCHAR(50) NOT NULL,
  description TEXT,
  vision TEXT,
  mission TEXT,
  established_year INTEGER,
  hod_id UUID REFERENCES users(id),
  dean_id UUID REFERENCES users(id),
  banner_image_path VARCHAR(500),
  logo_path VARCHAR(500),
  contact_email VARCHAR(255),
  contact_phone VARCHAR(15),
  location VARCHAR(255),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Program Educational Objectives (PEOs)
CREATE TABLE department_peos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code NOT NULL,
  peo_number INTEGER NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(dept_code, peo_number)
);

-- Program Specific Outcomes (PSOs)
CREATE TABLE department_psos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code NOT NULL,
  pso_number INTEGER NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(dept_code, pso_number)
);

-- Program Outcomes (POs) - Standard NBA POs
CREATE TABLE program_outcomes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  po_number INTEGER UNIQUE NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insert standard 12 POs
INSERT INTO program_outcomes (po_number, title, description) VALUES
(1, 'Engineering Knowledge', 'Apply knowledge of mathematics, science, engineering fundamentals and engineering specialization to the solution of complex engineering problems.'),
(2, 'Problem Analysis', 'Identify, formulate, research literature and analyze complex engineering problems reaching substantiated conclusions using first principles of mathematics, natural sciences and engineering sciences.'),
(3, 'Design/Development of Solutions', 'Design solutions for complex engineering problems and design system components or processes that meet specified needs with appropriate consideration for public health and safety, cultural, societal and environmental considerations.'),
(4, 'Conduct Investigations', 'Use research-based knowledge and research methods including design of experiments, analysis and interpretation of data and synthesis of information to provide valid conclusions.'),
(5, 'Modern Tool Usage', 'Create, select and apply appropriate techniques, resources and modern engineering and IT tools to complex engineering activities with an understanding of the limitations.'),
(6, 'Engineer and Society', 'Apply reasoning informed by contextual knowledge to assess societal, health, safety, legal and cultural issues and the consequent responsibilities relevant to professional engineering practice.'),
(7, 'Environment and Sustainability', 'Understand the impact of professional engineering solutions in societal and environmental contexts and demonstrate knowledge of and need for sustainable development.'),
(8, 'Ethics', 'Apply ethical principles and commit to professional ethics and responsibilities and norms of engineering practice.'),
(9, 'Individual and Team Work', 'Function effectively as an individual, and as a member or leader in diverse teams and in multi-disciplinary settings.'),
(10, 'Communication', 'Communicate effectively on complex engineering activities with the engineering community and with society at large.'),
(11, 'Project Management and Finance', 'Demonstrate knowledge and understanding of engineering and management principles and apply these to one''s own work, as a member and leader in a team.'),
(12, 'Life-long Learning', 'Recognize the need for and have the preparation and ability to engage in independent and life-long learning in the broadest context of technological change.');

-- ===========================================
-- SECTION 4: FACULTY PROFILES
-- ===========================================

CREATE TABLE faculty_profiles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  employee_id VARCHAR(50) UNIQUE NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  dept_code department_code NOT NULL,
  designation VARCHAR(100) NOT NULL,
  qualification VARCHAR(255),
  specialization VARCHAR(255),
  experience_years DECIMAL(4,1),
  date_of_joining DATE,
  date_of_birth DATE,
  gender gender_type,
  blood_group blood_group,
  phone VARCHAR(15),
  email VARCHAR(255),
  personal_email VARCHAR(255),
  address TEXT,
  city VARCHAR(100),
  state VARCHAR(100),
  pincode VARCHAR(10),
  photo_path VARCHAR(500), -- 1:1 ratio as per requirements
  resume_path VARCHAR(500),
  aadhar_number VARCHAR(12),
  pan_number VARCHAR(10),
  google_scholar_id VARCHAR(100),
  orcid_id VARCHAR(50),
  research_gate_id VARCHAR(100),
  scopus_id VARCHAR(50),
  publications_count INTEGER DEFAULT 0,
  patents_count INTEGER DEFAULT 0,
  projects_count INTEGER DEFAULT 0,
  is_mentor BOOLEAN DEFAULT false,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_faculty_dept ON faculty_profiles(dept_code);
CREATE INDEX idx_faculty_user ON faculty_profiles(user_id);
CREATE INDEX idx_faculty_emp_id ON faculty_profiles(employee_id);

-- ===========================================
-- SECTION 5: STUDENT PROFILES
-- ===========================================

CREATE TABLE academic_batches (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  batch_year INTEGER NOT NULL,
  batch_name VARCHAR(50),
  start_date DATE,
  end_date DATE,
  is_current BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE student_profiles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  roll_number VARCHAR(20) UNIQUE NOT NULL,
  registration_number VARCHAR(30) UNIQUE,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  dept_code department_code NOT NULL,
  batch_id UUID REFERENCES academic_batches(id),
  current_semester INTEGER DEFAULT 1,
  section VARCHAR(10),
  date_of_birth DATE,
  gender gender_type,
  blood_group blood_group,
  phone VARCHAR(15),
  email VARCHAR(255),
  personal_email VARCHAR(255),
  father_name VARCHAR(200),
  father_phone VARCHAR(15),
  father_occupation VARCHAR(100),
  mother_name VARCHAR(200),
  mother_phone VARCHAR(15),
  mother_occupation VARCHAR(100),
  guardian_name VARCHAR(200),
  guardian_phone VARCHAR(15),
  guardian_relation VARCHAR(50),
  permanent_address TEXT,
  current_address TEXT,
  city VARCHAR(100),
  state VARCHAR(100),
  pincode VARCHAR(10),
  nationality VARCHAR(50) DEFAULT 'Indian',
  category VARCHAR(50), -- General, OBC, SC, ST, etc.
  aadhar_number VARCHAR(12),
  photo_path VARCHAR(500), -- 1:1 ratio as per requirements
  admission_date DATE,
  admission_type VARCHAR(50), -- EAMCET, Management, Lateral Entry
  previous_institution VARCHAR(255),
  previous_marks DECIMAL(5,2),
  is_hosteler BOOLEAN DEFAULT false,
  hostel_room VARCHAR(50),
  is_transport_user BOOLEAN DEFAULT false,
  transport_route VARCHAR(100),
  mentor_id UUID REFERENCES faculty_profiles(id),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_student_dept ON student_profiles(dept_code);
CREATE INDEX idx_student_batch ON student_profiles(batch_id);
CREATE INDEX idx_student_roll ON student_profiles(roll_number);
CREATE INDEX idx_student_mentor ON student_profiles(mentor_id);

-- ===========================================
-- SECTION 6: COURSES & SUBJECTS
-- ===========================================

CREATE TABLE courses (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  course_code VARCHAR(20) UNIQUE NOT NULL,
  course_name VARCHAR(255) NOT NULL,
  dept_code department_code NOT NULL,
  semester INTEGER NOT NULL,
  credits INTEGER NOT NULL,
  lecture_hours INTEGER DEFAULT 0,
  tutorial_hours INTEGER DEFAULT 0,
  practical_hours INTEGER DEFAULT 0,
  course_type VARCHAR(50), -- Theory, Lab, Project, etc.
  is_elective BOOLEAN DEFAULT false,
  syllabus_path VARCHAR(500),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_courses_dept ON courses(dept_code);
CREATE INDEX idx_courses_semester ON courses(semester);

-- Course Outcomes (COs)
CREATE TABLE course_outcomes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  co_number INTEGER NOT NULL,
  description TEXT NOT NULL,
  bloom_level VARCHAR(50), -- Remember, Understand, Apply, Analyze, Evaluate, Create
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(course_id, co_number)
);

-- CO-PO Mapping for NBA
CREATE TABLE co_po_mapping (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  co_number INTEGER NOT NULL,
  po_number INTEGER NOT NULL,
  correlation_level INTEGER CHECK (correlation_level BETWEEN 1 AND 3), -- 1=Low, 2=Medium, 3=High
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(course_id, co_number, po_number)
);

-- CO-PSO Mapping for NBA
CREATE TABLE co_pso_mapping (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  dept_code department_code NOT NULL,
  co_number INTEGER NOT NULL,
  pso_number INTEGER NOT NULL,
  correlation_level INTEGER CHECK (correlation_level BETWEEN 1 AND 3),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(course_id, co_number, pso_number)
);

-- Faculty-Subject Assignment
CREATE TABLE faculty_subjects (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  faculty_id UUID REFERENCES faculty_profiles(id) ON DELETE CASCADE,
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  academic_year VARCHAR(10) NOT NULL, -- 2024-25
  semester_type semester_type NOT NULL,
  section VARCHAR(10),
  is_primary BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(faculty_id, course_id, academic_year, semester_type, section)
);

-- ===========================================
-- SECTION 7: ATTENDANCE MODULE
-- ===========================================
-- Assumption: 8 periods per day as per requirements

CREATE TABLE class_sections (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code NOT NULL,
  batch_id UUID REFERENCES academic_batches(id),
  semester INTEGER NOT NULL,
  section VARCHAR(10) NOT NULL,
  academic_year VARCHAR(10) NOT NULL,
  class_teacher_id UUID REFERENCES faculty_profiles(id),
  strength INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(dept_code, batch_id, semester, section, academic_year)
);

CREATE TABLE timetable (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  class_section_id UUID REFERENCES class_sections(id) ON DELETE CASCADE,
  day_of_week INTEGER CHECK (day_of_week BETWEEN 1 AND 6), -- 1=Monday, 6=Saturday
  period_number INTEGER CHECK (period_number BETWEEN 1 AND 8), -- 8 periods as per requirements
  course_id UUID REFERENCES courses(id),
  faculty_id UUID REFERENCES faculty_profiles(id),
  room_number VARCHAR(50),
  is_lab BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(class_section_id, day_of_week, period_number)
);

-- Period-wise attendance as per requirements
CREATE TABLE period_attendance (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  faculty_id UUID REFERENCES faculty_profiles(id),
  class_section_id UUID REFERENCES class_sections(id),
  attendance_date DATE NOT NULL,
  period_number INTEGER CHECK (period_number BETWEEN 1 AND 8),
  status attendance_status NOT NULL DEFAULT 'absent',
  remarks TEXT,
  marked_by UUID REFERENCES users(id),
  marked_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(student_id, course_id, attendance_date, period_number)
);

CREATE INDEX idx_attendance_student ON period_attendance(student_id);
CREATE INDEX idx_attendance_date ON period_attendance(attendance_date);
CREATE INDEX idx_attendance_course ON period_attendance(course_id);
CREATE INDEX idx_attendance_section ON period_attendance(class_section_id);

-- Attendance alerts (triggered after 2 consecutive absences as per requirements)
CREATE TABLE attendance_alerts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  course_id UUID REFERENCES courses(id),
  alert_type VARCHAR(50) NOT NULL, -- consecutive_absence, low_attendance, critical_attendance
  consecutive_absences INTEGER,
  current_percentage DECIMAL(5,2),
  message TEXT NOT NULL,
  is_sent BOOLEAN DEFAULT false,
  sent_via VARCHAR(50), -- firebase_push, sms, email
  sent_at TIMESTAMPTZ,
  acknowledged BOOLEAN DEFAULT false,
  acknowledged_by UUID REFERENCES users(id),
  acknowledged_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_alerts_student ON attendance_alerts(student_id);
CREATE INDEX idx_alerts_sent ON attendance_alerts(is_sent);

-- ===========================================
-- SECTION 8: EXAMINATIONS MODULE
-- ===========================================
-- Assumption: 2 internals per semester as per requirements

CREATE TABLE exam_schedule (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  exam_type exam_type NOT NULL,
  academic_year VARCHAR(10) NOT NULL,
  semester_type semester_type NOT NULL,
  exam_date DATE NOT NULL,
  start_time TIME,
  end_time TIME,
  venue VARCHAR(255),
  max_marks INTEGER NOT NULL,
  passing_marks INTEGER,
  is_published BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE internal_marks (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  exam_type exam_type NOT NULL,
  academic_year VARCHAR(10) NOT NULL,
  semester_type semester_type NOT NULL,
  marks_obtained DECIMAL(5,2),
  max_marks DECIMAL(5,2),
  is_absent BOOLEAN DEFAULT false,
  remarks TEXT,
  entered_by UUID REFERENCES users(id),
  entered_at TIMESTAMPTZ DEFAULT NOW(),
  verified_by UUID REFERENCES users(id),
  verified_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(student_id, course_id, exam_type, academic_year, semester_type)
);

CREATE TABLE external_marks (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  academic_year VARCHAR(10) NOT NULL,
  semester_type semester_type NOT NULL,
  theory_marks DECIMAL(5,2),
  practical_marks DECIMAL(5,2),
  total_marks DECIMAL(5,2),
  max_marks DECIMAL(5,2),
  grade VARCHAR(5),
  grade_points DECIMAL(3,1),
  credits_earned DECIMAL(3,1),
  is_passed BOOLEAN,
  attempt_number INTEGER DEFAULT 1,
  result_date DATE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(student_id, course_id, academic_year, semester_type, attempt_number)
);

CREATE TABLE hall_tickets (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  exam_type exam_type NOT NULL,
  academic_year VARCHAR(10) NOT NULL,
  semester_type semester_type NOT NULL,
  hall_ticket_number VARCHAR(50) UNIQUE,
  is_eligible BOOLEAN DEFAULT true,
  ineligibility_reason TEXT,
  generated_at TIMESTAMPTZ,
  downloaded_at TIMESTAMPTZ,
  file_path VARCHAR(500),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE revaluation_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  external_mark_id UUID REFERENCES external_marks(id),
  request_date DATE DEFAULT CURRENT_DATE,
  reason TEXT,
  payment_id UUID,
  status VARCHAR(50) DEFAULT 'pending', -- pending, processing, completed, rejected
  original_marks DECIMAL(5,2),
  revised_marks DECIMAL(5,2),
  processed_by UUID REFERENCES users(id),
  processed_at TIMESTAMPTZ,
  remarks TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ===========================================
-- SECTION 9: FEES MODULE (NO EMI as per requirements)
-- ===========================================

CREATE TABLE fee_master (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  academic_year VARCHAR(10) NOT NULL,
  dept_code department_code,
  category fee_category NOT NULL,
  fee_name VARCHAR(255) NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  due_date DATE,
  late_fee_per_day DECIMAL(8,2) DEFAULT 0,
  max_late_fee DECIMAL(10,2) DEFAULT 0,
  is_mandatory BOOLEAN DEFAULT true,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE fee_transactions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  fee_master_id UUID REFERENCES fee_master(id),
  academic_year VARCHAR(10) NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  late_fee DECIMAL(8,2) DEFAULT 0,
  total_amount DECIMAL(10,2) NOT NULL,
  payment_method VARCHAR(50), -- online, cash, cheque, dd
  gateway VARCHAR(50), -- razorpay, cashfree
  gateway_order_id VARCHAR(100),
  gateway_payment_id VARCHAR(100),
  gateway_signature VARCHAR(255),
  status payment_status DEFAULT 'pending',
  payment_date TIMESTAMPTZ,
  remarks TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_transactions_student ON fee_transactions(student_id);
CREATE INDEX idx_transactions_status ON fee_transactions(status);

CREATE TABLE fee_receipts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  transaction_id UUID REFERENCES fee_transactions(id) ON DELETE CASCADE,
  receipt_number VARCHAR(50) UNIQUE NOT NULL,
  receipt_date DATE DEFAULT CURRENT_DATE,
  file_path VARCHAR(500),
  generated_at TIMESTAMPTZ DEFAULT NOW(),
  downloaded_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ===========================================
-- SECTION 10: MENTORING MODULE
-- ===========================================

CREATE TABLE mentor_allocations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  mentor_id UUID REFERENCES faculty_profiles(id) ON DELETE CASCADE,
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  academic_year VARCHAR(10) NOT NULL,
  is_active BOOLEAN DEFAULT true,
  allocated_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(mentor_id, student_id, academic_year)
);

CREATE TABLE mentoring_sessions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  mentor_id UUID REFERENCES faculty_profiles(id) ON DELETE CASCADE,
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  session_date DATE NOT NULL,
  session_type VARCHAR(50), -- academic, personal, career, disciplinary
  discussion_points TEXT,
  action_items TEXT,
  student_feedback TEXT,
  mentor_remarks TEXT,
  next_session_date DATE,
  attendance_discussed BOOLEAN DEFAULT false,
  academics_discussed BOOLEAN DEFAULT false,
  career_discussed BOOLEAN DEFAULT false,
  personal_issues_discussed BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE student_risk_flags (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  risk_type VARCHAR(50) NOT NULL, -- attendance, academic, behavioral, personal
  risk_level risk_level NOT NULL,
  description TEXT NOT NULL,
  identified_by UUID REFERENCES users(id),
  identified_at TIMESTAMPTZ DEFAULT NOW(),
  intervention_plan TEXT,
  is_resolved BOOLEAN DEFAULT false,
  resolved_by UUID REFERENCES users(id),
  resolved_at TIMESTAMPTZ,
  resolution_notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_risk_student ON student_risk_flags(student_id);
CREATE INDEX idx_risk_level ON student_risk_flags(risk_level);

-- ===========================================
-- SECTION 11: CRT (Campus Recruitment Training) MODULE
-- ===========================================

CREATE TABLE crt_materials (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title VARCHAR(255) NOT NULL,
  description TEXT,
  category VARCHAR(100), -- aptitude, reasoning, verbal, technical, soft_skills
  sub_category VARCHAR(100),
  file_path VARCHAR(500),
  content_type VARCHAR(50), -- pdf, video, ppt, doc
  duration_minutes INTEGER,
  difficulty_level VARCHAR(50), -- beginner, intermediate, advanced
  uploaded_by UUID REFERENCES users(id),
  is_published BOOLEAN DEFAULT false,
  view_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE crt_tests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title VARCHAR(255) NOT NULL,
  description TEXT,
  category VARCHAR(100),
  total_questions INTEGER NOT NULL,
  total_marks INTEGER NOT NULL,
  duration_minutes INTEGER NOT NULL,
  passing_percentage INTEGER DEFAULT 40,
  instructions TEXT,
  is_published BOOLEAN DEFAULT false,
  start_date TIMESTAMPTZ,
  end_date TIMESTAMPTZ,
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE crt_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  test_id UUID REFERENCES crt_tests(id) ON DELETE CASCADE,
  question_text TEXT NOT NULL,
  question_type VARCHAR(50), -- mcq, msq, numerical, descriptive
  options JSONB, -- for MCQ: [{option: "A", text: "...", is_correct: true}]
  correct_answer TEXT,
  marks INTEGER DEFAULT 1,
  negative_marks DECIMAL(3,1) DEFAULT 0,
  explanation TEXT,
  difficulty_level VARCHAR(50),
  topic VARCHAR(100),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE crt_test_attempts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  test_id UUID REFERENCES crt_tests(id) ON DELETE CASCADE,
  start_time TIMESTAMPTZ NOT NULL,
  end_time TIMESTAMPTZ,
  answers JSONB, -- {question_id: answer}
  score DECIMAL(6,2),
  percentage DECIMAL(5,2),
  is_passed BOOLEAN,
  time_taken_seconds INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE placement_companies (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  company_name VARCHAR(255) NOT NULL,
  company_type VARCHAR(100), -- IT, Core, Analytics, Consulting
  website VARCHAR(255),
  logo_path VARCHAR(500),
  description TEXT,
  ctc_range VARCHAR(100),
  eligibility_criteria JSONB,
  visit_date DATE,
  registration_deadline DATE,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE student_placements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  company_id UUID REFERENCES placement_companies(id),
  offer_type VARCHAR(50), -- full_time, internship, ppo
  package_lpa DECIMAL(6,2),
  offer_date DATE,
  joining_date DATE,
  offer_letter_path VARCHAR(500),
  status VARCHAR(50), -- offered, accepted, rejected, joined
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ===========================================
-- SECTION 12: CERTIFICATES MODULE
-- ===========================================

CREATE TABLE certificate_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
  certificate_type certificate_type NOT NULL,
  purpose TEXT,
  copies_required INTEGER DEFAULT 1,
  urgency VARCHAR(50) DEFAULT 'normal', -- normal, urgent
  status certificate_status DEFAULT 'requested',
  requested_at TIMESTAMPTZ DEFAULT NOW(),
  processed_by UUID REFERENCES users(id),
  processed_at TIMESTAMPTZ,
  approved_by UUID REFERENCES users(id),
  approved_at TIMESTAMPTZ,
  rejection_reason TEXT,
  file_path VARCHAR(500),
  certificate_number VARCHAR(50),
  issued_date DATE,
  collected_at TIMESTAMPTZ,
  payment_id UUID REFERENCES fee_transactions(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ===========================================
-- SECTION 13: CMS MODULE (Department Website Content)
-- ===========================================

CREATE TABLE department_pages (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code NOT NULL,
  slug VARCHAR(100) NOT NULL, -- home, about, vision-mission, peos-psos, etc.
  title VARCHAR(255) NOT NULL,
  subtitle VARCHAR(255),
  body_json JSONB, -- Block-based content: [{type: 'heading', content: ''}, {type: 'paragraph', content: ''}, etc.]
  banner_image_path VARCHAR(500), -- 16:6 ratio as per requirements
  meta_title VARCHAR(255),
  meta_description TEXT,
  is_published BOOLEAN DEFAULT false,
  published_at TIMESTAMPTZ,
  updated_by UUID REFERENCES users(id),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(dept_code, slug)
);

CREATE INDEX idx_dept_pages_dept ON department_pages(dept_code);
CREATE INDEX idx_dept_pages_published ON department_pages(is_published);

CREATE TABLE department_posts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code NOT NULL,
  category VARCHAR(100) NOT NULL, -- news, events, achievements, circular, notice
  title VARCHAR(255) NOT NULL,
  summary TEXT,
  content_json JSONB,
  cover_image_path VARCHAR(500), -- 16:9 ratio for events
  attachments JSONB, -- [{name: '', path: '', type: ''}]
  tags VARCHAR(255)[],
  is_pinned BOOLEAN DEFAULT false,
  is_published BOOLEAN DEFAULT false,
  published_at TIMESTAMPTZ,
  event_date DATE,
  event_end_date DATE,
  event_venue VARCHAR(255),
  author_id UUID REFERENCES users(id),
  updated_by UUID REFERENCES users(id),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_dept_posts_dept ON department_posts(dept_code);
CREATE INDEX idx_dept_posts_category ON department_posts(category);
CREATE INDEX idx_dept_posts_published ON department_posts(is_published);
CREATE INDEX idx_dept_posts_pinned ON department_posts(is_pinned);

CREATE TABLE department_galleries (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  images JSONB NOT NULL, -- [{path: '', caption: '', sort_order: 0}] -- 16:9 ratio
  event_date DATE,
  category VARCHAR(100),
  is_published BOOLEAN DEFAULT false,
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ===========================================
-- SECTION 14: LABS & INFRASTRUCTURE
-- ===========================================

CREATE TABLE department_labs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code NOT NULL,
  lab_name VARCHAR(255) NOT NULL,
  lab_code VARCHAR(50),
  description TEXT,
  location VARCHAR(255),
  area_sqft INTEGER,
  capacity INTEGER,
  incharge_id UUID REFERENCES faculty_profiles(id),
  established_year INTEGER,
  equipment_list JSONB, -- [{name: '', quantity: 0, value: 0, working: true}]
  software_list JSONB, -- [{name: '', version: '', license: ''}]
  images JSONB, -- 16:9 ratio
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE lab_equipment (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  lab_id UUID REFERENCES department_labs(id) ON DELETE CASCADE,
  equipment_name VARCHAR(255) NOT NULL,
  model VARCHAR(255),
  manufacturer VARCHAR(255),
  serial_number VARCHAR(100),
  quantity INTEGER DEFAULT 1,
  purchase_date DATE,
  purchase_value DECIMAL(12,2),
  current_value DECIMAL(12,2),
  warranty_end_date DATE,
  is_working BOOLEAN DEFAULT true,
  maintenance_due_date DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ===========================================
-- SECTION 15: FILE ASSETS (Universal Gateway)
-- ===========================================

CREATE TABLE file_assets (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code,
  owner_role user_role,
  owner_user_id UUID REFERENCES users(id),
  file_name VARCHAR(255) NOT NULL,
  original_name VARCHAR(255) NOT NULL,
  file_type VARCHAR(100) NOT NULL, -- image/jpeg, application/pdf, etc.
  file_size INTEGER, -- bytes
  storage_path VARCHAR(500) NOT NULL, -- Firebase Storage path
  purpose file_purpose NOT NULL,
  tags VARCHAR(100)[],
  linked_entity_type VARCHAR(50), -- student, faculty, course, post, accreditation
  linked_entity_id UUID,
  thumbnail_path VARCHAR(500),
  is_public BOOLEAN DEFAULT false,
  upload_status VARCHAR(50) DEFAULT 'completed', -- uploading, completed, failed
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_files_dept ON file_assets(dept_code);
CREATE INDEX idx_files_purpose ON file_assets(purpose);
CREATE INDEX idx_files_entity ON file_assets(linked_entity_type, linked_entity_id);

-- ===========================================
-- SECTION 16: ACCREDITATION ENGINE
-- ===========================================

-- NBA Criteria structure
CREATE TABLE nba_criteria (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  criterion_number INTEGER NOT NULL,
  criterion_name VARCHAR(255) NOT NULL,
  max_marks INTEGER NOT NULL,
  description TEXT,
  weightage DECIMAL(5,2),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO nba_criteria (criterion_number, criterion_name, max_marks, description) VALUES
(1, 'Vision, Mission and Program Educational Objectives', 60, 'Establishment and dissemination of Vision, Mission and PEOs'),
(2, 'Program Curriculum and Teaching-Learning Processes', 120, 'Curriculum design and implementation'),
(3, 'Course Outcomes and Program Outcomes', 150, 'CO-PO mapping and attainment'),
(4, 'Students'' Performance', 150, 'Student academic performance and success'),
(5, 'Faculty Information and Contributions', 100, 'Faculty qualifications, research and contributions'),
(6, 'Facilities and Technical Support', 60, 'Infrastructure and support systems'),
(7, 'Continuous Improvement', 50, 'Quality enhancement initiatives'),
(8, 'First Year Academics', 60, 'First year student performance'),
(9, 'Student Support Systems', 50, 'Support mechanisms for students'),
(10, 'Governance, Institutional Support and Financial Resources', 50, 'Administrative support');

CREATE TABLE nba_claims (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code NOT NULL,
  criterion_id UUID REFERENCES nba_criteria(id),
  academic_year VARCHAR(10) NOT NULL,
  claim_title VARCHAR(255) NOT NULL,
  claim_description TEXT,
  target_value DECIMAL(10,2),
  achieved_value DECIMAL(10,2),
  supporting_data JSONB,
  status VARCHAR(50) DEFAULT 'draft', -- draft, under_review, approved, rejected
  created_by UUID REFERENCES users(id),
  reviewed_by UUID REFERENCES users(id),
  reviewed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Evidence-to-Claim Mapping (KILLER FEATURE as per requirements)
CREATE TABLE nba_claim_evidence (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  claim_id UUID REFERENCES nba_claims(id) ON DELETE CASCADE,
  evidence_type VARCHAR(100), -- file, data_record, external_link
  file_asset_id UUID REFERENCES file_assets(id),
  linked_table VARCHAR(100), -- Reference to source table
  linked_record_id UUID, -- Reference to source record
  external_url VARCHAR(500),
  description TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- CO Attainment calculation
CREATE TABLE co_attainment (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  co_number INTEGER NOT NULL,
  academic_year VARCHAR(10) NOT NULL,
  semester_type semester_type NOT NULL,
  section VARCHAR(10),
  direct_attainment DECIMAL(5,2),
  indirect_attainment DECIMAL(5,2),
  overall_attainment DECIMAL(5,2),
  target_attainment DECIMAL(5,2) DEFAULT 60,
  is_target_achieved BOOLEAN,
  calculation_method VARCHAR(100),
  calculation_data JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- PO Attainment
CREATE TABLE po_attainment (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dept_code department_code NOT NULL,
  po_number INTEGER NOT NULL,
  academic_year VARCHAR(10) NOT NULL,
  batch_id UUID REFERENCES academic_batches(id),
  attainment_value DECIMAL(5,2),
  target_value DECIMAL(5,2) DEFAULT 60,
  is_target_achieved BOOLEAN,
  calculation_data JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- NAAC Structure (7 Criteria)
CREATE TABLE naac_criteria (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  criterion_number INTEGER NOT NULL,
  criterion_name VARCHAR(255) NOT NULL,
  max_marks INTEGER NOT NULL,
  key_indicators JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO naac_criteria (criterion_number, criterion_name, max_marks) VALUES
(1, 'Curricular Aspects', 150),
(2, 'Teaching-Learning and Evaluation', 200),
(3, 'Research, Innovations and Extension', 120),
(4, 'Infrastructure and Learning Resources', 100),
(5, 'Student Support and Progression', 140),
(6, 'Governance, Leadership and Management', 100),
(7, 'Institutional Values and Best Practices', 100);

CREATE TABLE naac_data (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  criterion_id UUID REFERENCES naac_criteria(id),
  academic_year VARCHAR(10) NOT NULL,
  key_indicator VARCHAR(50),
  metric_id VARCHAR(20),
  metric_name VARCHAR(255),
  metric_value TEXT,
  supporting_docs JSONB,
  status VARCHAR(50) DEFAULT 'pending',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- NIRF Metrics
CREATE TABLE nirf_parameters (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  parameter_code VARCHAR(20) NOT NULL,
  parameter_name VARCHAR(255) NOT NULL,
  category VARCHAR(100), -- TLR, RP, GO, OI, PR
  max_marks INTEGER,
  weightage DECIMAL(5,2),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO nirf_parameters (parameter_code, parameter_name, category, max_marks, weightage) VALUES
('TLR', 'Teaching, Learning & Resources', 'TLR', 100, 30),
('RP', 'Research and Professional Practice', 'RP', 100, 30),
('GO', 'Graduation Outcomes', 'GO', 100, 20),
('OI', 'Outreach and Inclusivity', 'OI', 100, 10),
('PR', 'Peer Perception', 'PR', 100, 10);

CREATE TABLE nirf_data (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  parameter_id UUID REFERENCES nirf_parameters(id),
  academic_year VARCHAR(10) NOT NULL,
  sub_parameter VARCHAR(100),
  value DECIMAL(12,2),
  supporting_data JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ===========================================
-- SECTION 17: AUDIT TRAIL (MANDATORY)
-- ===========================================

CREATE TABLE audit_events (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  actor_id UUID REFERENCES users(id),
  actor_role user_role,
  entity_type VARCHAR(100) NOT NULL,
  entity_id UUID,
  action VARCHAR(50) NOT NULL, -- create, update, delete, view, export
  old_value_json JSONB,
  new_value_json JSONB,
  ip_address INET,
  user_agent TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_audit_actor ON audit_events(actor_id);
CREATE INDEX idx_audit_entity ON audit_events(entity_type, entity_id);
CREATE INDEX idx_audit_action ON audit_events(action);
CREATE INDEX idx_audit_created ON audit_events(created_at);

-- ===========================================
-- SECTION 18: AI INSIGHTS
-- ===========================================

CREATE TABLE ai_insights (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  insight_type VARCHAR(100) NOT NULL, -- student_performance, department_analysis, risk_prediction
  target_type VARCHAR(100), -- student, faculty, department, institution
  target_id UUID,
  dept_code department_code,
  insight_data JSONB NOT NULL,
  confidence_score DECIMAL(5,2),
  generated_by VARCHAR(50), -- gemini, openai
  model_version VARCHAR(50),
  is_actionable BOOLEAN DEFAULT false,
  action_taken BOOLEAN DEFAULT false,
  action_details TEXT,
  generated_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_insights_type ON ai_insights(insight_type);
CREATE INDEX idx_insights_target ON ai_insights(target_type, target_id);

-- ===========================================
-- SECTION 19: NOTIFICATIONS
-- ===========================================

CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  notification_type VARCHAR(50), -- info, warning, success, error
  category VARCHAR(50), -- attendance, exam, fee, mentoring, placement
  related_entity_type VARCHAR(100),
  related_entity_id UUID,
  is_read BOOLEAN DEFAULT false,
  read_at TIMESTAMPTZ,
  is_sent_push BOOLEAN DEFAULT false,
  push_sent_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_notifications_user ON notifications(user_id);
CREATE INDEX idx_notifications_read ON notifications(is_read);

-- ===========================================
-- SECTION 20: ROW LEVEL SECURITY (RLS)
-- ===========================================

-- Enable RLS on all tables
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE firebase_user_mapping ENABLE ROW LEVEL SECURITY;
ALTER TABLE departments ENABLE ROW LEVEL SECURITY;
ALTER TABLE faculty_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE student_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE period_attendance ENABLE ROW LEVEL SECURITY;
ALTER TABLE fee_transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE department_pages ENABLE ROW LEVEL SECURITY;
ALTER TABLE department_posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE file_assets ENABLE ROW LEVEL SECURITY;
ALTER TABLE nba_claims ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_events ENABLE ROW LEVEL SECURITY;

-- RLS Policies

-- Users can view their own profile
CREATE POLICY "Users can view own profile" ON users
  FOR SELECT USING (auth.uid()::text = id::text);

-- Students can view their own data
CREATE POLICY "Students view own attendance" ON period_attendance
  FOR SELECT USING (
    student_id IN (
      SELECT id FROM student_profiles WHERE user_id::text = auth.uid()::text
    )
  );

-- Faculty can view/edit attendance for their classes
CREATE POLICY "Faculty manage attendance" ON period_attendance
  FOR ALL USING (
    faculty_id IN (
      SELECT id FROM faculty_profiles WHERE user_id::text = auth.uid()::text
    )
  );

-- HOD can view all department data
CREATE POLICY "HOD view department data" ON student_profiles
  FOR SELECT USING (
    dept_code IN (
      SELECT code FROM departments WHERE hod_id::text = auth.uid()::text
    )
  );

-- Dean Content Admin can manage all CMS
CREATE POLICY "Dean Content Admin manage CMS" ON department_pages
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM users WHERE id::text = auth.uid()::text AND role = 'dean_content_admin'
    )
  );

-- Public can view published content
CREATE POLICY "Public view published pages" ON department_pages
  FOR SELECT USING (is_published = true);

CREATE POLICY "Public view published posts" ON department_posts
  FOR SELECT USING (is_published = true);

-- ===========================================
-- SECTION 21: FUNCTIONS & TRIGGERS
-- ===========================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply trigger to all tables with updated_at
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
  
CREATE TRIGGER update_faculty_updated_at BEFORE UPDATE ON faculty_profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
  
CREATE TRIGGER update_student_updated_at BEFORE UPDATE ON student_profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Function to check consecutive absences (triggers after 2 as per requirements)
CREATE OR REPLACE FUNCTION check_consecutive_absences()
RETURNS TRIGGER AS $$
DECLARE
  consecutive_count INTEGER;
  student_name TEXT;
BEGIN
  IF NEW.status = 'absent' THEN
    SELECT COUNT(*) INTO consecutive_count
    FROM period_attendance
    WHERE student_id = NEW.student_id
      AND course_id = NEW.course_id
      AND status = 'absent'
      AND attendance_date >= (NEW.attendance_date - INTERVAL '7 days')
    ORDER BY attendance_date DESC, period_number DESC
    LIMIT 10;
    
    -- If 2 or more consecutive absences, create alert
    IF consecutive_count >= 2 THEN
      SELECT first_name || ' ' || last_name INTO student_name
      FROM student_profiles WHERE id = NEW.student_id;
      
      INSERT INTO attendance_alerts (
        student_id,
        course_id,
        alert_type,
        consecutive_absences,
        message
      ) VALUES (
        NEW.student_id,
        NEW.course_id,
        'consecutive_absence',
        consecutive_count,
        'Student ' || student_name || ' has ' || consecutive_count || ' consecutive absences'
      );
    END IF;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_absences
  AFTER INSERT ON period_attendance
  FOR EACH ROW EXECUTE FUNCTION check_consecutive_absences();

-- Function to create audit log
CREATE OR REPLACE FUNCTION create_audit_log()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO audit_events (
    actor_id,
    entity_type,
    entity_id,
    action,
    old_value_json,
    new_value_json
  ) VALUES (
    auth.uid(),
    TG_TABLE_NAME,
    COALESCE(NEW.id, OLD.id),
    TG_OP,
    CASE WHEN TG_OP = 'DELETE' OR TG_OP = 'UPDATE' THEN row_to_json(OLD) END,
    CASE WHEN TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN row_to_json(NEW) END
  );
  RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- Apply audit triggers to important tables
CREATE TRIGGER audit_department_pages AFTER INSERT OR UPDATE OR DELETE ON department_pages
  FOR EACH ROW EXECUTE FUNCTION create_audit_log();
  
CREATE TRIGGER audit_faculty_profiles AFTER INSERT OR UPDATE OR DELETE ON faculty_profiles
  FOR EACH ROW EXECUTE FUNCTION create_audit_log();
  
CREATE TRIGGER audit_nba_claims AFTER INSERT OR UPDATE OR DELETE ON nba_claims
  FOR EACH ROW EXECUTE FUNCTION create_audit_log();

-- ===========================================
-- SECTION 22: VIEWS FOR COMMON QUERIES
-- ===========================================

-- Student attendance summary view
CREATE OR REPLACE VIEW v_student_attendance_summary AS
SELECT 
  sp.id as student_id,
  sp.roll_number,
  sp.first_name || ' ' || sp.last_name as student_name,
  sp.dept_code,
  c.course_code,
  c.course_name,
  COUNT(*) as total_classes,
  COUNT(*) FILTER (WHERE pa.status = 'present') as present_count,
  COUNT(*) FILTER (WHERE pa.status = 'absent') as absent_count,
  ROUND(
    (COUNT(*) FILTER (WHERE pa.status = 'present')::DECIMAL / NULLIF(COUNT(*), 0)) * 100, 2
  ) as attendance_percentage
FROM student_profiles sp
JOIN period_attendance pa ON sp.id = pa.student_id
JOIN courses c ON pa.course_id = c.id
GROUP BY sp.id, sp.roll_number, sp.first_name, sp.last_name, sp.dept_code, c.course_code, c.course_name;

-- Faculty workload view
CREATE OR REPLACE VIEW v_faculty_workload AS
SELECT 
  fp.id as faculty_id,
  fp.employee_id,
  fp.first_name || ' ' || fp.last_name as faculty_name,
  fp.dept_code,
  fp.designation,
  COUNT(DISTINCT fs.course_id) as courses_assigned,
  COUNT(DISTINCT fs.section) as sections_handled,
  SUM(c.lecture_hours + c.tutorial_hours + c.practical_hours) as total_hours_per_week
FROM faculty_profiles fp
LEFT JOIN faculty_subjects fs ON fp.id = fs.faculty_id
LEFT JOIN courses c ON fs.course_id = c.id
WHERE fs.academic_year = TO_CHAR(CURRENT_DATE, 'YYYY') || '-' || (EXTRACT(YEAR FROM CURRENT_DATE)::INTEGER + 1 - 2000)::TEXT
GROUP BY fp.id, fp.employee_id, fp.first_name, fp.last_name, fp.dept_code, fp.designation;

-- Department statistics view
CREATE OR REPLACE VIEW v_department_stats AS
SELECT 
  d.code as dept_code,
  d.name as dept_name,
  COUNT(DISTINCT fp.id) as faculty_count,
  COUNT(DISTINCT sp.id) as student_count,
  COUNT(DISTINCT c.id) as courses_count,
  COUNT(DISTINCT dl.id) as labs_count
FROM departments d
LEFT JOIN faculty_profiles fp ON d.code = fp.dept_code AND fp.is_active = true
LEFT JOIN student_profiles sp ON d.code = sp.dept_code AND sp.is_active = true
LEFT JOIN courses c ON d.code = c.dept_code AND c.is_active = true
LEFT JOIN department_labs dl ON d.code = dl.dept_code AND dl.is_active = true
GROUP BY d.code, d.name;

-- ===========================================
-- END OF SCHEMA
-- ===========================================

-- NOTES FOR DEPLOYMENT:
-- 1. Run this schema in Supabase SQL Editor
-- 2. Configure RLS policies based on your auth setup
-- 3. Set up realtime subscriptions for required tables
-- 4. Create storage buckets in Supabase for any local file storage needs
-- 5. Firebase Storage is primary for file uploads (as per requirements)
