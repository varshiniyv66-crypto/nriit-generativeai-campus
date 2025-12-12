"use client";

import Link from "next/link";
import {
  GraduationCap,
  Users,
  Building2,
  Award,
  ChevronRight,
  BookOpen,
  Briefcase,
  FlaskConical,
  Globe,
  Phone,
  Mail,
  MapPin,
  ArrowRight,
  Play,
  Star,
  TrendingUp,
  CheckCircle2,
  CreditCard,
  FileText,
  Home,
  Bus,
  ShieldAlert,
  Calendar,
  MessageSquare,
  ImageIcon,
  Bell,
} from "lucide-react";

// Department data
const departments = [
  { code: "CSE", name: "Computer Science & Engineering", icon: "💻", color: "from-blue-600 to-blue-800", students: 480 },
  { code: "CSE-DS", name: "CSE (Data Science)", icon: "📊", color: "from-purple-600 to-purple-800", students: 120 },
  { code: "CSE-AI", name: "CSE (AI & ML)", icon: "🤖", color: "from-pink-600 to-pink-800", students: 120 },
  { code: "IT", name: "Information Technology", icon: "🌐", color: "from-green-600 to-green-800", students: 240 },
  { code: "ECE", name: "Electronics & Communication", icon: "📡", color: "from-amber-600 to-amber-800", students: 360 },
  { code: "CIVIL", name: "Civil Engineering", icon: "🏗️", color: "from-red-600 to-red-800", students: 120 },
  { code: "MBA", name: "Master of Business Administration", icon: "📈", color: "from-cyan-600 to-cyan-800", students: 120 },
  { code: "MCA", name: "Master of Computer Applications", icon: "🎓", color: "from-violet-600 to-violet-800", students: 60 },
  { code: "BSH", name: "Basic Sciences & Humanities", icon: "📚", color: "from-slate-600 to-slate-800", students: 0 },
];

const stats = [
  { label: "Students", value: "5000+", icon: GraduationCap },
  { label: "Faculty", value: "300+", icon: Users },
  { label: "Departments", value: "9", icon: Building2 },
  { label: "Placements", value: "95%", icon: Briefcase },
];

const features = [
  {
    title: "NBA Accredited Programs",
    description: "Multiple programs accredited by National Board of Accreditation ensuring quality education",
    icon: Award,
  },
  {
    title: "State-of-the-Art Labs",
    description: "Modern laboratories equipped with latest technology and software for hands-on learning",
    icon: FlaskConical,
  },
  {
    title: "Industry Partnerships",
    description: "Strong ties with leading companies for internships, projects, and campus placements",
    icon: Briefcase,
  },
  {
    title: "Research Excellence",
    description: "Active research culture with funded projects and publications in reputed journals",
    icon: BookOpen,
  },
];

const recruiters = [
  "TCS", "Infosys", "Wipro", "HCL", "Tech Mahindra", "Cognizant",
  "Capgemini", "Accenture", "IBM", "Amazon", "Microsoft", "Google"
];

const studentServices = [
  { title: "Fee Payment", icon: CreditCard, href: "/student/fees", color: "text-blue-600", bg: "bg-blue-50" },
  { title: "Certificates", icon: FileText, href: "/student/certificates", color: "text-green-600", bg: "bg-green-50" },
  { title: "Hostel & Mess", icon: Home, href: "/hostel", color: "text-orange-600", bg: "bg-orange-50" },
  { title: "Transport", icon: Bus, href: "/transport", color: "text-purple-600", bg: "bg-purple-50" },
  { title: "Scholarships", icon: GraduationCap, href: "/scholarships", color: "text-yellow-600", bg: "bg-yellow-50" },
  { title: "Grievance", icon: ShieldAlert, href: "/grievance", color: "text-red-600", bg: "bg-red-50" },
];

const newsUpdates = [
  {
    id: 1,
    title: "NRIIT Secures NAAC A+ Accreditation",
    date: "Dec 08, 2024",
    excerpt: "We are proud to announce that NRI Institute of Technology has been accredited with NAAC A+ Grade, reflecting our commitment to quality education.",
    category: "Achievement",
    image: "/images/naac-event.jpg" // Placeholder path
  },
  {
    id: 2,
    title: "International Conference on AI (ICAI-2025)",
    date: "Jan 20, 2025",
    excerpt: "Call for papers is now open for the upcoming International Conference on Artificial Intelligence hosted by the CSE Department.",
    category: "Event",
    image: "/images/ai-conf.jpg"
  }
];

const notices = [
  { id: 1, title: "I B.Tech I Sem Regular Exams Notification", date: "Today", type: "Exam" },
  { id: 2, title: "Pongal Holidays Circular 2025", date: "Yesterday", type: "General" },
  { id: 3, title: "CRT Training Schedule for III Year", date: "2 days ago", type: "Training" },
  { id: 4, title: "Fee Payment Last Date Extended", date: "Dec 05", type: "Fee" },
];

const testimonials = [
  {
    name: "S. Rajesh",
    role: "Software Engineer at Microsoft",
    batch: "2019-2023",
    content: "NRIIT provided me with the tools and mentorship to crack a job at Microsoft. The labs are world-class and the faculty is incredibly supportive.",
    image: "https://i.pravatar.cc/150?u=1"
  },
  {
    name: "P. Priya",
    role: "Data Scientist at Amazon",
    batch: "2018-2022",
    content: "The specialized training in Data Science and the hands-on projects helped me build a strong portfolio. Forever grateful to my dept.",
    image: "https://i.pravatar.cc/150?u=2"
  },
  {
    name: "K. Vamsi",
    role: "System Engineer at TCS",
    batch: "2020-2024",
    content: "The campus life and technical clubs at NRIIT are amazing. They helped me develop leadership skills along with technical knowledge.",
    image: "https://i.pravatar.cc/150?u=3"
  },
  {
    name: "M. Kavya",
    role: "MBA Graduate",
    batch: "2021-2023",
    content: "The MBA program gave me a new perspective on management. The case studies and industry interactions were the highlight.",
    image: "https://i.pravatar.cc/150?u=4"
  }
];

const galleryImages = [
  "https://images.unsplash.com/photo-1562774053-701939374585?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
  "https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
  "https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
  "https://images.unsplash.com/photo-1592280771800-bcf291d0a63c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
  "https://images.unsplash.com/photo-1524178232363-1fb2b075b955?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
  "https://images.unsplash.com/photo-1564981797816-1043664bf78d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
];

export default function HomePage() {
  return (
    <main className="min-h-screen">
      {/* Header/Navigation */}
      <header className="fixed top-0 left-0 right-0 z-50 glass border-b border-white/10">
        <div className="container mx-auto px-4">
          <nav className="flex items-center justify-between h-16 lg:h-20">
            {/* Logo */}
            <Link href="/" className="flex items-center gap-3">
              <div className="w-10 h-10 lg:w-12 lg:h-12 rounded-xl gradient-bg flex items-center justify-center text-white font-bold text-lg lg:text-xl">
                N
              </div>
              <div className="hidden sm:block">
                <h1 className="font-bold text-lg lg:text-xl text-gray-900">NRIIT</h1>
                <p className="text-xs text-gray-600">Excellence in Education</p>
              </div>
            </Link>

            {/* Desktop Navigation */}
            <div className="hidden lg:flex items-center gap-8">
              <Link href="/about" className="text-gray-700 hover:text-blue-700 font-medium transition-colors">About</Link>
              <Link href="/departments" className="text-gray-700 hover:text-blue-700 font-medium transition-colors">Departments</Link>
              <Link href="/admissions" className="text-gray-700 hover:text-blue-700 font-medium transition-colors">Admissions</Link>
              <Link href="/placements" className="text-gray-700 hover:text-blue-700 font-medium transition-colors">Placements</Link>
              <Link href="/research" className="text-gray-700 hover:text-blue-700 font-medium transition-colors">Research</Link>
              <Link href="/contact" className="text-gray-700 hover:text-blue-700 font-medium transition-colors">Contact</Link>
            </div>

            {/* CTA Buttons */}
            <div className="flex items-center gap-3">
              <Link
                href="/login"
                className="hidden sm:inline-flex px-4 py-2 text-sm font-medium text-gray-700 hover:text-blue-700 transition-colors"
              >
                Login
              </Link>
              <Link
                href="/apply"
                className="px-4 lg:px-6 py-2 lg:py-2.5 text-sm font-semibold text-white gradient-bg rounded-full hover:shadow-lg hover:shadow-blue-500/25 transition-all btn-glow"
              >
                Apply Now
              </Link>
            </div>
          </nav>
        </div>
      </header>

      {/* Hero Section */}
      <section className="relative min-h-screen flex items-center justify-center overflow-hidden hero-pattern">
        {/* Animated Background */}
        <div className="absolute inset-0 gradient-bg-animated opacity-90" />
        <div className="absolute inset-0 hero-dots opacity-30" />

        {/* Floating Elements */}
        <div className="absolute top-20 left-10 w-72 h-72 bg-purple-500/30 rounded-full blur-3xl animate-float" />
        <div className="absolute bottom-20 right-10 w-96 h-96 bg-blue-500/30 rounded-full blur-3xl animate-float delay-200" />
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-pink-500/20 rounded-full blur-3xl" />

        <div className="relative z-10 container mx-auto px-4 pt-24 pb-16 text-center">
          {/* Badge */}
          <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/10 backdrop-blur-sm border border-white/20 text-white text-sm mb-8 animate-fade-in-down">
            <Star className="w-4 h-4 text-yellow-400 fill-yellow-400" />
            <span>NAAC Accredited | NBA Approved Programs</span>
          </div>

          {/* Main Heading */}
          <h1 className="text-4xl sm:text-5xl md:text-6xl lg:text-7xl font-bold text-white mb-6 animate-fade-in-up">
            <span className="block">Shaping Tomorrow&apos;s</span>
            <span className="block mt-2 bg-gradient-to-r from-yellow-300 via-pink-300 to-cyan-300 bg-clip-text text-transparent">
              Tech Leaders
            </span>
          </h1>

          {/* Subtitle */}
          <p className="text-lg sm:text-xl text-white/80 max-w-2xl mx-auto mb-10 animate-fade-in-up delay-200">
            NRI Institute of Technology - Where innovation meets excellence.
            Join a community of future engineers, innovators, and entrepreneurs.
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4 animate-fade-in-up delay-300">
            <Link
              href="/admissions"
              className="group px-8 py-4 bg-white text-blue-700 rounded-full font-semibold hover:shadow-2xl hover:shadow-white/25 transition-all flex items-center gap-2"
            >
              Start Your Journey
              <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
            </Link>
            <Link
              href="/virtual-tour"
              className="group px-8 py-4 bg-white/10 backdrop-blur-sm border border-white/30 text-white rounded-full font-semibold hover:bg-white/20 transition-all flex items-center gap-2"
            >
              <Play className="w-5 h-5" />
              Virtual Tour
            </Link>
          </div>

          {/* Stats in Hero */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 md:gap-8 mt-16 max-w-4xl mx-auto animate-fade-in-up delay-400">
            {stats.map((stat, index) => (
              <div
                key={stat.label}
                className="glass-card rounded-2xl p-4 md:p-6 text-center"
              >
                <stat.icon className="w-8 h-8 text-white/80 mx-auto mb-2" />
                <div className="text-2xl md:text-3xl font-bold text-white">{stat.value}</div>
                <div className="text-sm text-white/70">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>

        {/* Scroll Indicator */}
        <div className="absolute bottom-8 left-1/2 -translate-x-1/2 animate-bounce">
          <div className="w-6 h-10 rounded-full border-2 border-white/50 flex justify-center pt-2">
            <div className="w-1.5 h-3 bg-white/70 rounded-full animate-pulse" />
          </div>
        </div>
      </section>

      {/* Departments Section */}
      <section className="py-20 md:py-28 bg-gray-50">
        <div className="container mx-auto px-4">
          {/* Section Header */}
          <div className="text-center max-w-3xl mx-auto mb-16">
            <span className="inline-block px-4 py-1.5 bg-blue-100 text-blue-700 rounded-full text-sm font-semibold mb-4">
              Our Departments
            </span>
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-gray-900 mb-4">
              9 Departments of <span className="gradient-text">Excellence</span>
            </h2>
            <p className="text-gray-600 text-lg">
              Explore our diverse range of undergraduate and postgraduate programs
              designed to prepare you for a successful career.
            </p>
          </div>

          {/* Departments Grid */}
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {departments.filter(d => d.code !== 'BSH').map((dept, index) => (
              <Link
                key={dept.code}
                href={`/departments/${dept.code.toLowerCase()}`}
                className="group relative overflow-hidden rounded-2xl bg-white shadow-lg hover:shadow-2xl transition-all duration-300 card-hover"
              >
                <div className={`absolute inset-0 bg-gradient-to-br ${dept.color} opacity-0 group-hover:opacity-100 transition-opacity duration-300`} />
                <div className="relative p-6 md:p-8">
                  <div className="flex items-start justify-between mb-4">
                    <span className="text-4xl">{dept.icon}</span>
                    <ChevronRight className="w-5 h-5 text-gray-400 group-hover:text-white group-hover:translate-x-1 transition-all" />
                  </div>
                  <h3 className="text-xl font-bold text-gray-900 group-hover:text-white transition-colors mb-2">
                    {dept.name}
                  </h3>
                  <p className="text-sm text-gray-500 group-hover:text-white/80 transition-colors">
                    {dept.students > 0 ? `${dept.students}+ Students` : 'Foundation Department'}
                  </p>
                  <div className="mt-4 pt-4 border-t border-gray-100 group-hover:border-white/20 transition-colors">
                    <span className="text-sm font-medium text-blue-600 group-hover:text-white transition-colors">
                      Explore Programs →
                    </span>
                  </div>
                </div>
              </Link>
            ))}
          </div>

          <div className="text-center mt-12">
            <Link
              href="/departments"
              className="inline-flex items-center gap-2 px-8 py-4 border-2 border-gray-900 text-gray-900 rounded-full font-semibold hover:bg-gray-900 hover:text-white transition-all"
            >
              View All Departments
              <ArrowRight className="w-5 h-5" />
            </Link>
          </div>
        </div>
      </section>

      <section className="py-20 bg-white">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-between mb-12">
            <div>
              <span className="text-blue-600 font-semibold text-sm uppercase tracking-wider">Quick Access</span>
              <h2 className="text-3xl font-bold text-gray-900 mt-1">Student Services</h2>
            </div>
            <Link href="/student/dashboard" className="text-blue-600 text-sm font-medium hover:underline flex items-center gap-1">
              View Portal <ArrowRight className="w-4 h-4" />
            </Link>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-6">
            {studentServices.map((service, index) => (
              <Link key={index} href={service.href} className="flex flex-col items-center p-6 rounded-2xl bg-white border border-gray-100 shadow-sm hover:shadow-lg hover:-translate-y-1 transition-all group">
                <div className={`w-14 h-14 rounded-full ${service.bg} flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}>
                  <service.icon className={`w-7 h-7 ${service.color}`} />
                </div>
                <span className="text-gray-900 font-medium text-center text-sm">{service.title}</span>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* Latest Updates Section */}
      <section className="py-20 bg-gray-50">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-gray-900 mb-12">Latest Updates</h2>
          <div className="grid lg:grid-cols-3 gap-8">
            {/* News Cards (2 Columns) */}
            <div className="lg:col-span-2 space-y-8">
              <div className="grid md:grid-cols-2 gap-6">
                {newsUpdates.map((news) => (
                  <div key={news.id} className="bg-white rounded-2xl overflow-hidden shadow-sm hover:shadow-md transition-shadow group">
                    <div className="h-48 bg-gray-200 relative overflow-hidden">
                      <div className="absolute top-4 left-4 px-3 py-1 bg-white/90 backdrop-blur-sm rounded-full text-xs font-semibold text-gray-900 z-10">
                        {news.category}
                      </div>
                      {/* Placeholder Image Gradient */}
                      <div className="absolute inset-0 bg-gradient-to-br from-blue-100 to-purple-100 group-hover:scale-105 transition-transform duration-500" />
                    </div>
                    <div className="p-6">
                      <div className="text-xs text-gray-500 mb-2">{news.date}</div>
                      <h3 className="text-lg font-bold text-gray-900 mb-3 line-clamp-2 group-hover:text-blue-600 transition-colors">
                        {news.title}
                      </h3>
                      <p className="text-sm text-gray-600 mb-4 line-clamp-2">
                        {news.excerpt}
                      </p>
                      <Link href={`/news/${news.id}`} className="text-blue-600 text-sm font-semibold flex items-center gap-1 group/link">
                        Read More <ArrowRight className="w-4 h-4 group-hover/link:translate-x-1 transition-transform" />
                      </Link>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Notice Board (1 Column) */}
            <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 h-fit">
              <div className="flex items-center gap-2 mb-6">
                <div className="p-2 bg-red-50 rounded-lg">
                  <Bell className="w-5 h-5 text-red-500" />
                </div>
                <h3 className="text-xl font-bold text-gray-900">Notice Board</h3>
              </div>
              <div className="space-y-4">
                {notices.map((notice) => (
                  <div key={notice.id} className="flex gap-4 p-3 rounded-xl hover:bg-gray-50 transition-colors">
                    <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-lg flex flex-col items-center justify-center text-xs font-semibold text-gray-600 uppercase">
                      <span>{notice.date.split(' ')[0].substring(0, 3)}</span>
                      <span className="text-gray-900 font-bold">{notice.date.includes('Dec') ? notice.date.split(' ')[1] : 'NOW'}</span>
                    </div>
                    <div>
                      <h4 className="text-sm font-semibold text-gray-900 line-clamp-2 mb-1">
                        {notice.title}
                      </h4>
                      <span className="text-xs text-blue-600 bg-blue-50 px-2 py-0.5 rounded-full">
                        {notice.type}
                      </span>
                    </div>
                  </div>
                ))}
              </div>
              <div className="mt-6 pt-6 border-t border-gray-100 text-center">
                <Link href="/notices" className="text-sm font-semibold text-gray-600 hover:text-blue-600 transition-colors">
                  View All Notices
                </Link>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Student Voices */}
      <section className="py-20 bg-white">
        <div className="container mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="text-3xl font-bold text-gray-900 mb-2">Student Voices</h2>
            <p className="text-gray-600">Hear from our alumni and current students</p>
          </div>
          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
            {testimonials.map((item, index) => (
              <div key={index} className="bg-gray-50 p-6 rounded-2xl hover:bg-white hover:shadow-xl transition-all duration-300 border border-transparent hover:border-gray-100">
                <div className="flex gap-1 mb-4">
                  {[...Array(5)].map((_, i) => (
                    <Star key={i} className="w-4 h-4 text-yellow-400 fill-yellow-400" />
                  ))}
                </div>
                <p className="text-sm text-gray-600 mb-6 italic min-h-[80px]">
                  &quot;{item.content}&quot;
                </p>
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-full bg-gradient-to-br from-blue-400 to-purple-400 flex-shrink-0" />
                  <div>
                    <h4 className="text-sm font-bold text-gray-900">{item.name}</h4>
                    <p className="text-xs text-blue-600">{item.role}</p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Campus Gallery */}
      <section className="py-20 bg-gray-50 overflow-hidden">
        <div className="container mx-auto px-4">
          <div className="text-center mb-12">
            <span className="text-blue-600 font-semibold text-sm uppercase tracking-wider">Visual Tour</span>
            <h2 className="text-3xl font-bold text-gray-900 mt-1">Campus Gallery</h2>
          </div>
          <div className="columns-1 md:columns-2 lg:columns-3 gap-6 space-y-6">
            {galleryImages.map((src, index) => (
              <div key={index} className="break-inside-avoid relative rounded-2xl overflow-hidden group">
                <img
                  src={src}
                  alt={`Campus Gallery ${index + 1}`}
                  className="w-full h-auto object-cover hover:scale-110 transition-transform duration-700"
                  loading="lazy"
                />
                <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
                  <div className="w-12 h-12 rounded-full bg-white/20 backdrop-blur-md flex items-center justify-center text-white">
                    <ImageIcon className="w-6 h-6" />
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Why Choose Us Section */}
      <section className="py-20 md:py-28 relative overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-b from-white to-blue-50" />
        <div className="absolute top-0 right-0 w-96 h-96 bg-purple-200/50 rounded-full blur-3xl" />
        <div className="absolute bottom-0 left-0 w-96 h-96 bg-blue-200/50 rounded-full blur-3xl" />

        <div className="relative container mx-auto px-4">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            {/* Left Content */}
            <div>
              <span className="inline-block px-4 py-1.5 bg-purple-100 text-purple-700 rounded-full text-sm font-semibold mb-4">
                Why NRIIT?
              </span>
              <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-gray-900 mb-6">
                Your Path to <span className="gradient-text">Success</span> Starts Here
              </h2>
              <p className="text-gray-600 text-lg mb-8">
                At NRIIT, we believe in nurturing talent, fostering innovation, and preparing
                students for the challenges of tomorrow. Our commitment to excellence has made
                us one of the premier engineering institutions in Andhra Pradesh.
              </p>

              {/* Feature List */}
              <div className="space-y-6">
                {features.map((feature, index) => (
                  <div key={feature.title} className="flex gap-4 group">
                    <div className="flex-shrink-0 w-12 h-12 rounded-xl gradient-bg flex items-center justify-center group-hover:scale-110 transition-transform">
                      <feature.icon className="w-6 h-6 text-white" />
                    </div>
                    <div>
                      <h3 className="font-semibold text-gray-900 mb-1">{feature.title}</h3>
                      <p className="text-gray-600 text-sm">{feature.description}</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Right - Visual Element */}
            <div className="relative">
              <div className="relative aspect-square max-w-lg mx-auto">
                {/* Main Circle */}
                <div className="absolute inset-8 rounded-full gradient-bg opacity-20 animate-pulse-glow" />
                <div className="absolute inset-16 rounded-full bg-white shadow-2xl flex items-center justify-center">
                  <div className="text-center p-8">
                    <div className="text-6xl md:text-7xl font-bold gradient-text mb-2">95%</div>
                    <div className="text-gray-600 font-medium">Placement Rate</div>
                    <div className="text-sm text-gray-500 mt-2">Industry-Ready Graduates</div>
                  </div>
                </div>

                {/* Floating Elements */}
                <div className="absolute top-4 left-4 w-20 h-20 rounded-2xl bg-white shadow-lg flex items-center justify-center animate-float">
                  <Award className="w-10 h-10 text-purple-600" />
                </div>
                <div className="absolute top-4 right-4 w-20 h-20 rounded-2xl bg-white shadow-lg flex items-center justify-center animate-float delay-200">
                  <TrendingUp className="w-10 h-10 text-green-600" />
                </div>
                <div className="absolute bottom-4 left-4 w-20 h-20 rounded-2xl bg-white shadow-lg flex items-center justify-center animate-float delay-400">
                  <Globe className="w-10 h-10 text-blue-600" />
                </div>
                <div className="absolute bottom-4 right-4 w-20 h-20 rounded-2xl bg-white shadow-lg flex items-center justify-center animate-float delay-300">
                  <GraduationCap className="w-10 h-10 text-amber-600" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Recruiters Section */}
      <section className="py-16 bg-gray-900">
        <div className="container mx-auto px-4">
          <div className="text-center mb-12">
            <h2 className="text-2xl md:text-3xl font-bold text-white mb-2">Our Recruiters</h2>
            <p className="text-gray-400">Top companies trust our graduates</p>
          </div>

          {/* Logo Carousel */}
          <div className="relative overflow-hidden">
            <div className="flex gap-12 animate-scroll">
              {[...recruiters, ...recruiters].map((company, index) => (
                <div
                  key={`${company}-${index}`}
                  className="flex-shrink-0 px-8 py-4 bg-white/5 rounded-xl backdrop-blur-sm border border-white/10"
                >
                  <span className="text-white/80 font-semibold text-lg whitespace-nowrap">
                    {company}
                  </span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Accreditation Banner */}
      <section className="py-16 gradient-bg">
        <div className="container mx-auto px-4">
          <div className="flex flex-col md:flex-row items-center justify-between gap-8">
            <div className="text-center md:text-left">
              <h2 className="text-2xl md:text-3xl font-bold text-white mb-2">
                Nationally Accredited Programs
              </h2>
              <p className="text-white/80">
                Multiple programs accredited by NBA (National Board of Accreditation)
              </p>
            </div>
            <div className="flex items-center gap-6">
              <div className="text-center px-6 py-4 bg-white/10 backdrop-blur-sm rounded-xl">
                <div className="text-3xl font-bold text-white">NBA</div>
                <div className="text-sm text-white/70">Accredited</div>
              </div>
              <div className="text-center px-6 py-4 bg-white/10 backdrop-blur-sm rounded-xl">
                <div className="text-3xl font-bold text-white">NAAC</div>
                <div className="text-sm text-white/70">Accredited</div>
              </div>
              <div className="text-center px-6 py-4 bg-white/10 backdrop-blur-sm rounded-xl">
                <div className="text-3xl font-bold text-white">AICTE</div>
                <div className="text-sm text-white/70">Approved</div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 md:py-28 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="relative overflow-hidden rounded-3xl gradient-bg p-8 md:p-16">
            <div className="absolute inset-0 hero-dots opacity-10" />
            <div className="absolute top-0 right-0 w-96 h-96 bg-white/10 rounded-full blur-3xl" />

            <div className="relative text-center max-w-3xl mx-auto">
              <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-white mb-6">
                Ready to Begin Your Journey?
              </h2>
              <p className="text-lg text-white/80 mb-10">
                Join thousands of successful alumni who started their career at NRIIT.
                Applications are now open for the upcoming academic session.
              </p>
              <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
                <Link
                  href="/apply"
                  className="group px-10 py-4 bg-white text-blue-700 rounded-full font-semibold hover:shadow-2xl hover:shadow-white/25 transition-all flex items-center gap-2"
                >
                  Apply for Admission
                  <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                </Link>
                <Link
                  href="/contact"
                  className="px-10 py-4 bg-white/10 backdrop-blur-sm border border-white/30 text-white rounded-full font-semibold hover:bg-white/20 transition-all"
                >
                  Contact Us
                </Link>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-gray-300">
        <div className="container mx-auto px-4 py-16">
          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-12">
            {/* Brand */}
            <div>
              <Link href="/" className="flex items-center gap-3 mb-6">
                <div className="w-12 h-12 rounded-xl gradient-bg flex items-center justify-center text-white font-bold text-xl">
                  N
                </div>
                <div>
                  <h3 className="font-bold text-xl text-white">NRIIT</h3>
                  <p className="text-xs text-gray-400">Est. 2001</p>
                </div>
              </Link>
              <p className="text-gray-400 text-sm mb-6">
                NRI Institute of Technology is committed to providing quality technical
                education and producing industry-ready professionals.
              </p>
              <div className="flex gap-4">
                {['facebook', 'twitter', 'linkedin', 'youtube', 'instagram'].map((social) => (
                  <a
                    key={social}
                    href={`https://${social}.com/nriit`}
                    className="w-10 h-10 rounded-full bg-white/10 flex items-center justify-center hover:bg-white/20 transition-colors"
                    target="_blank"
                    rel="noopener noreferrer"
                  >
                    <Globe className="w-5 h-5" />
                  </a>
                ))}
              </div>
            </div>

            {/* Quick Links */}
            <div>
              <h4 className="font-semibold text-white mb-6">Quick Links</h4>
              <ul className="space-y-3">
                {['About Us', 'Admissions', 'Departments', 'Placements', 'Research', 'Events'].map((link) => (
                  <li key={link}>
                    <Link href={`/${link.toLowerCase().replace(' ', '-')}`} className="hover:text-white transition-colors">
                      {link}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>

            {/* Departments */}
            <div>
              <h4 className="font-semibold text-white mb-6">Departments</h4>
              <ul className="space-y-3">
                {['CSE', 'CSE (Data Science)', 'CSE (AI & ML)', 'IT', 'ECE', 'Civil'].map((dept) => (
                  <li key={dept}>
                    <Link href={`/departments/${dept.toLowerCase().replace(/[^a-z]/g, '-')}`} className="hover:text-white transition-colors">
                      {dept}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>

            {/* Contact */}
            <div>
              <h4 className="font-semibold text-white mb-6">Contact Us</h4>
              <ul className="space-y-4">
                <li className="flex gap-3">
                  <MapPin className="w-5 h-5 text-purple-400 flex-shrink-0 mt-0.5" />
                  <span className="text-sm">
                    Visadala, Guntur
                  </span>
                </li>
                <li className="flex gap-3">
                  <Phone className="w-5 h-5 text-purple-400 flex-shrink-0" />
                  <span className="text-sm">0863 234 4300</span>
                </li>
                <li className="flex gap-3">
                  <Mail className="w-5 h-5 text-purple-400 flex-shrink-0" />
                  <span className="text-sm">nriit.guntur@gmail.com</span>
                </li>
              </ul>
            </div>
          </div>

          {/* Bottom Bar */}
          <div className="border-t border-gray-800 mt-12 pt-8 flex flex-col md:flex-row items-center justify-between gap-4">
            <p className="text-sm text-gray-500">
              © {new Date().getFullYear()} NRI Institute of Technology. All rights reserved.
            </p>
            <div className="flex gap-6 text-sm">
              <Link href="/privacy" className="hover:text-white transition-colors">Privacy Policy</Link>
              <Link href="/terms" className="hover:text-white transition-colors">Terms of Service</Link>
              <Link href="/sitemap" className="hover:text-white transition-colors">Sitemap</Link>
            </div>
          </div>
        </div>
      </footer>

    </main>
  );
}
