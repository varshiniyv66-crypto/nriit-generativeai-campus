"use client";

import Link from "next/link";
import Image from "next/image";
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
  Search,
  Menu,
  ChevronLeft,
  Brain,
  Target,
  Sparkles
} from "lucide-react";
import { useState, useEffect } from "react";
import { AnimatePresence, motion } from "framer-motion";

// NEWS DATA SOURCE
const NEWS_ITEMS = [
  { category: "SYSTEM UPGRADE", text: "nriit.world Unified Ecosystem Live: Integrated ERP & LMS with Enterprise-grade DDoS Protection & RBAC Security.", color: "bg-indigo-600" },
  { category: "LEGACY ACCESS", text: "Archive Access: Old website (nriit.ac.in) remains accessible from this portal for historical records.", color: "bg-slate-600" },
  { category: "BREAKING", text: "New Digital Campus Live at nriit.world - Welcome!", color: "bg-red-500" },
  { category: "ACADEMIC", text: "Academic Calendar 2024-25 Released - Download Now", color: "bg-blue-500" },
  { category: "BREAKING", text: "NRIIT Secures NAAC 'A+' Accreditation - Nation Proud Moment!", color: "bg-red-500" },
  { category: "PLACEMENT", text: "TCS, Infosys, Wipro Placement Drive - 150+ Students Selected!", color: "bg-emerald-500" },
  { category: "ACADEMIC", text: "Admissions Open for UG/PG January 2026 Session", color: "bg-blue-500" },
  { category: "ACHIEVEMENT", text: "Smart India Hackathon 2024 - NRIIT Students Win Grand Finale!", color: "bg-purple-500" },
];

function NewsSlider() {
  const [index, setIndex] = useState(0);

  useEffect(() => {
    const timer = setInterval(() => {
      setIndex((prev) => (prev + 1) % NEWS_ITEMS.length);
    }, 4000); // Change every 4 seconds
    return () => clearInterval(timer);
  }, []);

  const item = NEWS_ITEMS[index];

  return (
    <AnimatePresence mode="wait">
      <motion.div
        key={index}
        initial={{ y: 20, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        exit={{ y: -20, opacity: 0 }}
        transition={{ duration: 0.5 }}
        className="absolute inset-0 flex items-center gap-3"
      >
        <span className={`px-2 py-0.5 rounded text-[10px] font-black text-white ${item.color}`}>
          {item.category}
        </span>
        <span className="text-sm font-medium text-slate-200 truncate">
          {item.text}
        </span>
      </motion.div>
    </AnimatePresence>
  );
}

// Premium Department Data with Flagship Colors
// Premium Department Data with Flagship Colors
const departments = [
  {
    code: "CSE", name: "Computer Science & Engineering", icon: "💻",
    accent: "hover:!border-blue-500 hover:shadow-2xl hover:shadow-blue-500/40",
    textAccent: "group-hover:text-blue-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-blue-600",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-blue-50",
    gradient: "from-blue-500 to-blue-600",
    students: 360,
    image: "https://images.unsplash.com/photo-1571171637578-41bc2dd41cd2?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "CSE-DS", name: "CSE (Data Science)", icon: "📊",
    accent: "hover:!border-purple-500 hover:shadow-2xl hover:shadow-purple-500/40",
    textAccent: "group-hover:text-purple-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-purple-600",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-purple-50",
    gradient: "from-purple-500 to-purple-600",
    students: 180,
    image: "https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "CSE-AI", name: "CSE (AI & ML)", icon: "🤖",
    accent: "hover:!border-pink-500 hover:shadow-2xl hover:shadow-pink-500/40",
    textAccent: "group-hover:text-pink-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-pink-600",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-pink-50",
    gradient: "from-pink-500 to-pink-600",
    students: 120,
    image: "https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "IT", name: "Information Technology", icon: "🌐",
    accent: "hover:!border-emerald-500 hover:shadow-2xl hover:shadow-emerald-500/40",
    textAccent: "group-hover:text-emerald-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-emerald-600",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-emerald-50",
    gradient: "from-emerald-500 to-emerald-600",
    students: 120,
    image: "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "ECE", name: "Electronics & Communication Engineering", icon: "📡",
    accent: "hover:!border-amber-500 hover:shadow-2xl hover:shadow-amber-500/40",
    textAccent: "group-hover:text-amber-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-amber-600",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-amber-50",
    gradient: "from-amber-500 to-amber-600",
    students: 180,
    image: "https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "EVT", name: "Electronics & VLSI Technology", icon: "⚡",
    accent: "hover:!border-yellow-500 hover:shadow-2xl hover:shadow-yellow-500/40",
    textAccent: "group-hover:text-yellow-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-yellow-500",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-yellow-50",
    gradient: "from-yellow-400 to-yellow-600",
    students: 60,
    image: "https://images.unsplash.com/photo-1593941707882-a5bba14938c7?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "MTECH", name: "Master of Technology", icon: "🎓",
    accent: "hover:!border-orange-600 hover:shadow-2xl hover:shadow-orange-600/40",
    textAccent: "group-hover:text-orange-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-orange-600",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-orange-50",
    gradient: "from-orange-500 to-orange-700",
    students: 72,
    image: "https://images.unsplash.com/photo-1523050854058-8df90110c9f1?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "CIVIL", name: "Civil Engineering", icon: "🏗️",
    accent: "hover:!border-red-500 hover:shadow-2xl hover:shadow-red-500/40",
    textAccent: "group-hover:text-red-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-red-500",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-red-50",
    gradient: "from-red-500 to-red-600",
    students: 30,
    image: "https://images.unsplash.com/photo-1541888946425-d81bb19240f5?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "MBA", name: "Master of Business Administration", icon: "📈",
    accent: "hover:!border-cyan-500 hover:shadow-2xl hover:shadow-cyan-500/40",
    textAccent: "group-hover:text-cyan-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-cyan-500",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-cyan-50",
    gradient: "from-cyan-500 to-cyan-600",
    students: 120,
    image: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "MCA", name: "Master of Computer Applications", icon: "💻",
    accent: "hover:!border-violet-500 hover:shadow-2xl hover:shadow-violet-500/40",
    textAccent: "group-hover:text-violet-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-violet-500",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-violet-50",
    gradient: "from-violet-500 to-violet-600",
    students: 180,
    image: "https://images.unsplash.com/photo-1531482615713-2afd69097998?q=80&w=800&auto=format&fit=crop"
  },
  {
    code: "FED", name: "Basic Sciences & Humanities", icon: "⚛️",
    accent: "hover:!border-teal-500 hover:shadow-2xl hover:shadow-teal-500/40",
    textAccent: "group-hover:text-teal-600",
    bgAccent: "group-hover:bg-gradient-to-r group-hover:from-[#D4AF37] group-hover:to-teal-500",
    cardBgAccent: "hover:bg-gradient-to-br hover:from-white hover:to-teal-50",
    gradient: "from-teal-400 to-emerald-600",
    students: 600,
    image: "https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=800&auto=format&fit=crop"
  }
];

// Helper Component for Counting Animation
function CountUp({ end, duration = 2000, suffix = "" }: { end: number, duration?: number, suffix?: string }) {
  const [count, setCount] = useState(0);

  useEffect(() => {
    let startTime: number | null = null;
    const textEnd = end;

    const animate = (currentTime: number) => {
      if (!startTime) startTime = currentTime;
      const progress = Math.min((currentTime - startTime) / duration, 1);

      setCount(Math.floor(progress * textEnd));

      if (progress < 1) {
        requestAnimationFrame(animate);
      }
    };

    requestAnimationFrame(animate);
  }, [end, duration]);

  return <span>{count.toLocaleString()}{suffix}</span>;
}

const stats = [
  { label: "Active Students", value: 5000, suffix: "+", icon: GraduationCap, color: "text-blue-400", bg: "bg-blue-500/10 border-blue-500/20" },
  { label: "Expert Faculty", value: 300, suffix: "+", icon: Users, color: "text-purple-400", bg: "bg-purple-500/10 border-purple-500/20" },
  { label: "Global Partners", value: 45, suffix: "+", icon: Globe, color: "text-emerald-400", bg: "bg-emerald-500/10 border-emerald-500/20" },
  { label: "Placement Rate", value: 95, suffix: "%", icon: TrendingUp, color: "text-yellow-400", bg: "bg-yellow-500/10 border-yellow-500/20" },
];

import PremiumHeader from "@/components/layout/PremiumHeader";
import PremiumFooter from "@/components/layout/PremiumFooter";
import { VisionaryAssistant } from "@/components/ai/VisionaryAssistant";
import { PlacementPulse } from "@/components/dashboard/PlacementPulse";
import AcademicAffairs from "@/components/home/AcademicAffairs";
import { UnrivaledPlacements } from "@/components/home/UnrivaledPlacements";
import dynamic from "next/dynamic";

// Dynamic loading for heavy 3D components
const DigitalTwin = dynamic(() => import("@/components/campus/DigitalTwin"), {
  ssr: false,
  loading: () => (
    <div className="w-full h-[600px] bg-slate-900 rounded-[3rem] animate-pulse flex items-center justify-center">
      <div className="text-[#D4AF37] font-bold animate-bounce">Initializing Digital Twin...</div>
    </div>
  )
});

export default function HomePage() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [cycleCount, setCycleCount] = useState(0);

  useEffect(() => {
    // Stop after 3 complete cycles
    if (cycleCount >= 3) return;

    const duration = currentSlide === 0 ? 35000 : 5000;

    const timer = setTimeout(() => {
      // Loop sequence: 0 -> 1 -> 2 -> 3 -> 0 (repeat 3 times)
      if (currentSlide === 3) {
        setCurrentSlide(0);
        setCycleCount((prev) => prev + 1);
      } else {
        setCurrentSlide((prev) => prev + 1);
      }
    }, duration);

    return () => clearTimeout(timer);
  }, [currentSlide, cycleCount]);

  return (
    <main className="min-h-screen bg-[#F8FAFC] overflow-x-hidden selection:bg-[#FFBA42] selection:text-[#013C58]">
      <PremiumHeader />

      {/* 🚀 CINEMA-LEVEL HERO SECTION - AURORA FLAGSHIP */}
      {/* 🔮 HERO SECTION - VIBRANT MESH GRADIENT SLIDER */}
      {/* 🌊 HERO SECTION - OPTION A: OCEAN SUNRISE */}
      <section className="relative min-h-screen flex items-center justify-center overflow-hidden bg-gradient-to-br from-[#013C58] via-[#00537A] to-[#013C58] transition-all duration-1000">
        {/* Premium Mesh Gradient Overlay */}
        <div className="absolute inset-0 bg-gradient-to-t from-black/20 to-transparent"></div>
        <div className="absolute inset-0 hero-dots opacity-30"></div>
        {/* Animated Glows - Ocean Gold Theme */}
        <div className="absolute top-[-20%] right-[-10%] w-[800px] h-[800px] bg-[#00537A]/40 rounded-full blur-[120px] animate-pulse-slow"></div>
        <div className="absolute bottom-[-20%] left-[-10%] w-[800px] h-[800px] bg-[#F5A201]/20 rounded-full blur-[120px] animate-float-slow"></div>

        {/* 🚨 FLOATING SIDEBAR - OCEAN GOLD THEME */}
        <div className="fixed right-0 top-1/2 -translate-y-1/2 z-50 flex flex-col gap-1 shadow-2xl">
          <Link
            href="/admissions"
            className="bg-[#00537A] text-white px-3 py-6 writing-vertical-rl font-bold tracking-wide rounded-l-lg hover:bg-[#013C58] transition-colors shadow-lg border-l-2 border-[#F5A201] text-xs uppercase text-center"
          >
            Admissions 2026
          </Link>
          <Link
            href="/news-events"
            className="bg-[#FFBA42] text-[#013C58] px-3 py-6 writing-vertical-rl font-bold tracking-wide rounded-l-lg hover:bg-[#F5A201] transition-colors shadow-lg border-l-2 border-[#013C58] text-xs uppercase text-center"
          >
            Latest News & Events
          </Link>
        </div>


        {/* 🎓 ADMISSIONS BADGE - GOLD HIGHLIGHT */}
        <div className="absolute top-32 right-0 hidden lg:block animate-fade-in-left z-40">
          <div className="bg-gradient-to-r from-[#F5A201] to-[#FFBA42] text-[#013C58] px-6 py-3 font-bold text-lg shadow-2xl rounded-l-xl border-l-4 border-white flex flex-col items-center">
            <span className="text-xs uppercase tracking-widest opacity-80">Admissions Open for</span>
            <span className="text-base">UG/PG January 2026 Session</span>
          </div>
        </div>

        {/* SLIDER CONTENT */}
        <div className="relative z-10 w-full h-full flex items-center">
          <button onClick={() => setCurrentSlide((prev) => (prev === 0 ? 3 : prev - 1))} className="absolute left-2 top-1/2 -translate-y-1/2 lg:left-10 p-2 lg:p-4 rounded-full bg-slate-900/20 hover:bg-slate-900/40 backdrop-blur-md text-slate-700 dark:text-white border border-slate-200 dark:border-white/20 z-50 transition-all hover:scale-110">
            <ChevronLeft className="w-6 h-6 lg:w-8 lg:h-8" />
          </button>

          <div className="container mx-auto px-4 grid lg:grid-cols-2 gap-12 items-center min-h-[600px]">

            {/* SLIDE 1: NBA WELCOME BANNER (Moved) */}
            {currentSlide === 1 && (
              <>
                {/* Light Background Override */}
                <div className="absolute inset-0 bg-gradient-to-br from-[#F0F9FF] via-[#E0F2FE] to-[#F0FDFA] dark:from-slate-950 dark:via-slate-900 dark:to-slate-950 z-0" />

                <div className="text-left space-y-6 animate-fade-in-up relative z-10 lg:pl-20">
                  <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-600/10 border border-blue-600/30 text-blue-700 text-sm font-bold tracking-wide">
                    <span className="w-2 h-2 rounded-full bg-blue-600 animate-pulse" />
                    World Class Accreditation Inspection
                  </div>

                  <h1 className="text-5xl md:text-6xl lg:text-7xl font-black text-[#0F172A] dark:text-white leading-[1.1]">
                    A Grand Welcome to <br />
                    <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-700 to-indigo-600">NBA Expert Team</span>
                  </h1>

                  <p className="text-lg text-slate-600 dark:text-slate-300 max-w-lg leading-relaxed">
                    NRI Institute of Technology is honored to host the distinguished National Board of Accreditation team. We proudly showcase our commitment to global standards in technical education.
                  </p>

                  <div className="flex flex-wrap gap-4 pt-4">
                    <Link href="/accreditation/nba" className="group px-8 py-4 bg-blue-700 text-white font-bold rounded-xl shadow-lg hover:shadow-xl hover:bg-blue-800 transition-all hover:-translate-y-1 flex items-center gap-2">
                      View SAR Reports
                      <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                    </Link>
                  </div>

                  {/* Impact Stats */}
                  <div className="flex flex-wrap gap-8 pt-8 border-t border-slate-200 mt-8">
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">Outcome Based</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Education Model</div>
                    </div>
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">Global</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Standards</div>
                    </div>
                  </div>
                </div>

                {/* Right Side - Grand Image */}
                <div className="relative animate-fade-in-up delay-100 z-10 mt-8 lg:mt-0">
                  <div className="relative overflow-hidden rounded-3xl shadow-2xl border-4 border-white group h-[300px] lg:h-[450px]">
                    <img
                      src="https://images.unsplash.com/photo-1541339907198-e08756dedf3f?q=80&w=1600&auto=format&fit=crop"
                      alt="Grand Welcome"
                      className="w-full h-full object-cover transform transition-transform duration-[3000ms] group-hover:scale-110"
                    />
                    <div className="absolute inset-0 bg-gradient-to-t from-blue-900/60 via-transparent to-transparent" />

                    {/* Welcome Badge */}
                    <div className="absolute top-6 right-6 bg-white/95 backdrop-blur-md px-6 py-4 rounded-xl shadow-xl border-l-4 border-blue-600">
                      <div className="text-xs font-bold text-slate-500 uppercase tracking-wider">Distinguished Visit</div>
                      <div className="text-xl font-black text-slate-800">NBA Inspection</div>
                      <div className="text-xs text-blue-600 font-bold mt-1">December 2024</div>
                    </div>

                    <div className="absolute bottom-0 left-0 right-0 p-8 text-white">
                      <div className="text-3xl font-bold">Welcome</div>
                      <div className="text-sm text-blue-100">To Our Center of Excellence</div>
                    </div>
                  </div>
                </div>
              </>
            )}

            {/* SLIDE 0: HYBRID LIGHT THEME (AI STUDIO INSPIRED) */}
            {currentSlide === 0 && (
              <>
                {/* Light Background Override */}
                <div className="absolute inset-0 bg-gradient-to-br from-[#F8F7FF] via-[#EEF0FF] to-[#F5F3FF] dark:from-slate-950 dark:via-slate-900 dark:to-slate-950 z-0" />

                <div className="text-left space-y-6 animate-fade-in-up relative z-10 lg:pl-20">
                  <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-emerald-600 text-sm font-bold tracking-wide">
                    <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse" />
                    Admissions Open 2025
                  </div>

                  <h1 className="text-5xl md:text-6xl lg:text-7xl font-black text-[#0F172A] dark:text-white leading-[1.1]">
                    NRI Institute of <br />
                    <span className="text-transparent bg-clip-text bg-gradient-to-r from-violet-600 to-purple-600">Technology</span>
                  </h1>

                  <p className="text-lg text-slate-600 dark:text-slate-300 max-w-lg leading-relaxed">
                    Autonomous Institution, Guntur. Accredited with NAAC &apos;A+&apos; Grade and AICTE. Affiliated to JNTUK, Kakinada. Empowering students to be competitive, ethical, and socially responsible professionals.
                  </p>

                  <div className="flex flex-wrap gap-4 pt-4">
                    <Link href="/admissions" className="group px-8 py-4 bg-[#0F172A] text-white font-bold rounded-xl shadow-lg hover:shadow-xl transition-all hover:-translate-y-1 flex items-center gap-2">
                      Explore Programs
                      <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                    </Link>
                    <Link href="/virtual-tour" className="px-8 py-4 bg-white border-2 border-slate-200 text-slate-700 font-bold rounded-xl hover:border-slate-300 hover:bg-slate-50 transition-all flex items-center gap-2">
                      <Play className="w-5 h-5" />
                      Virtual Tour
                    </Link>
                  </div>

                  {/* Accreditation Badges - Bottom */}
                  <div className="flex flex-wrap gap-8 pt-8 border-t border-slate-200 mt-8">
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">NAAC A+</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Accredited</div>
                    </div>
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">AICTE</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Accredited</div>
                    </div>
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">Autonomous</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">JNTUK Affiliated</div>
                    </div>
                  </div>
                </div>

                {/* Right Side - Animated Campus Image */}
                <div className="relative animate-fade-in-up delay-100 z-10 mt-8 lg:mt-0">
                  {/* Floating NAAC Badge */}
                  <div className="absolute -top-4 left-1/3 z-20 bg-white px-4 py-2 rounded-xl shadow-xl border border-slate-100 flex items-center gap-2 animate-float">
                    <div className="w-8 h-8 bg-amber-100 rounded-full flex items-center justify-center">
                      <Award className="w-5 h-5 text-amber-600" />
                    </div>
                    <div>
                      <div className="text-[10px] text-slate-400 uppercase tracking-wider font-bold">Ranking</div>
                      <div className="text-sm font-black text-[#0F172A]">NAAC A+</div>
                    </div>
                  </div>

                  {/* Main Image Container */}
                  <div className="relative overflow-hidden rounded-3xl shadow-2xl border-4 border-white group h-[300px] lg:h-[450px]">
                    <Image
                      src="/gallery/nriit-vibrant-campus.png"
                      alt="NRIIT Vibrant Campus Life"
                      fill
                      className="object-cover transform transition-transform duration-[3000ms] group-hover:scale-110"
                      priority
                    />
                    {/* Overlay */}
                    <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent" />
                    <div className="absolute bottom-0 left-0 right-0 p-6 text-white">
                      <div className="text-2xl font-bold">Vibrant Campus Life</div>
                      <div className="text-sm text-white/80">Experience excellence in education</div>
                    </div>

                    {/* Alumni Badge */}
                    <div className="absolute bottom-6 right-6 bg-white/90 backdrop-blur-sm px-4 py-2 rounded-xl shadow-lg flex items-center gap-2">
                      <div className="flex -space-x-2">
                        <div className="w-8 h-8 rounded-full bg-blue-500 border-2 border-white flex items-center justify-center text-white text-xs font-bold">A</div>
                        <div className="w-8 h-8 rounded-full bg-green-500 border-2 border-white flex items-center justify-center text-white text-xs font-bold">B</div>
                        <div className="w-8 h-8 rounded-full bg-purple-500 border-2 border-white flex items-center justify-center text-white text-xs font-bold">C</div>
                      </div>
                      <div>
                        <div className="text-xs font-bold text-slate-800">Alumni Network</div>
                        <div className="text-[10px] text-emerald-600 font-bold">+5k</div>
                      </div>
                    </div>
                  </div>

                  {/* NRIIT Voice Button */}
                  <div className="absolute -bottom-4 right-4 bg-[#0F172A] text-white px-4 py-2 rounded-xl shadow-lg flex items-center gap-2 text-sm font-bold">
                    NRIIT Voice
                    <Sparkles className="w-4 h-4 text-amber-400" />
                  </div>
                </div>
              </>
            )}

            {/* SLIDE 2: RESEARCH & INNOVATION - LIGHT THEME */}
            {currentSlide === 2 && (
              <>
                {/* Light Background Override */}
                <div className="absolute inset-0 bg-gradient-to-br from-[#FFF8F0] via-[#FFF5EB] to-[#FFFAF5] dark:from-slate-950 dark:via-slate-900 dark:to-slate-950 z-0" />

                <div className="text-left space-y-6 animate-fade-in-up relative z-10 lg:pl-20">
                  <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-amber-500/10 border border-amber-500/30 text-amber-600 text-sm font-bold tracking-wide">
                    <span className="w-2 h-2 rounded-full bg-amber-500 animate-pulse" />
                    Centers of Excellence
                  </div>

                  <h1 className="text-5xl md:text-6xl lg:text-7xl font-black text-[#0F172A] dark:text-white leading-[1.1]">
                    Leading the Way in <br />
                    <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-500 to-orange-600">Global Innovation</span>
                  </h1>

                  <p className="text-lg text-slate-600 dark:text-slate-300 max-w-lg leading-relaxed">
                    Our research centers are at the forefront of AI, sustainable energy, and biotechnology. Collaborating with industry leaders to solve real-world problems.
                  </p>

                  <div className="flex flex-wrap gap-4 pt-4">
                    <Link href="/research" className="group px-8 py-4 bg-amber-500 text-white font-bold rounded-xl shadow-lg hover:shadow-xl hover:bg-amber-600 transition-all hover:-translate-y-1 flex items-center gap-2">
                      Explore Research
                      <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                    </Link>
                    <Link href="/departments" className="px-8 py-4 bg-white border-2 border-slate-200 text-slate-700 font-bold rounded-xl hover:border-slate-300 hover:bg-slate-50 transition-all flex items-center gap-2">
                      <FlaskConical className="w-5 h-5" />
                      View Labs
                    </Link>
                  </div>

                  {/* Research Stats */}
                  <div className="flex flex-wrap gap-8 pt-8 border-t border-slate-200 mt-8">
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">15+</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Research Labs</div>
                    </div>
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">50+</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Publications</div>
                    </div>
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">₹2Cr+</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Research Grants</div>
                    </div>
                  </div>
                </div>

                {/* Right Side - Research Card */}
                <div className="relative animate-fade-in-up delay-100 z-10 mt-8 lg:mt-0">
                  <div className="bg-white dark:bg-slate-900 p-10 rounded-3xl shadow-2xl border border-slate-100 dark:border-slate-800">
                    <div className="w-20 h-20 bg-gradient-to-br from-amber-500 to-orange-600 rounded-2xl flex items-center justify-center mx-auto mb-6">
                      <Brain className="w-10 h-10 text-white" />
                    </div>
                    <h3 className="text-2xl font-black text-[#0F172A] dark:text-white text-center mb-3">Centers of Excellence</h3>
                    <p className="text-slate-500 dark:text-slate-400 text-center mb-6">Driving innovation through dedicated research facilities and industry partnerships.</p>
                    <div className="grid grid-cols-2 gap-4">
                      {["AI & ML Lab", "IoT Center", "VLSI Lab", "Data Science"].map((lab, i) => (
                        <div key={i} className="bg-amber-50 p-3 rounded-xl text-center">
                          <span className="text-sm font-bold text-amber-700">{lab}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              </>
            )}

            {/* SLIDE 3: VISADALA CAMPUS - LIGHT THEME */}
            {currentSlide === 3 && (
              <>
                {/* Light Background Override */}
                <div className="absolute inset-0 bg-gradient-to-br from-[#F0FDF4] via-[#ECFDF5] to-[#F0FDF9] dark:from-slate-950 dark:via-slate-900 dark:to-slate-950 z-0" />

                <div className="text-left space-y-6 animate-fade-in-up relative z-10 lg:pl-20">
                  <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-emerald-600 text-sm font-bold tracking-wide">
                    <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse" />
                    Visit Guntur Visadala Campus
                  </div>

                  <h1 className="text-5xl md:text-6xl lg:text-7xl font-black text-[#0F172A] dark:text-white leading-[1.1]">
                    From Amaravathi <br />
                    <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-500 to-teal-600">to Global Stage</span>
                  </h1>

                  <p className="text-lg text-slate-600 dark:text-slate-300 max-w-lg leading-relaxed">
                    Preparing the next generation of engineers for global excellence at our state-of-the-art Visadala campus in Guntur District.
                  </p>

                  <div className="flex flex-wrap gap-4 pt-4">
                    <Link href="/admissions" className="group px-8 py-4 bg-emerald-500 text-white font-bold rounded-xl shadow-lg hover:shadow-xl hover:bg-emerald-600 transition-all hover:-translate-y-1 flex items-center gap-2">
                      Apply Now
                      <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                    </Link>
                    <Link href="/contact" className="px-8 py-4 bg-white border-2 border-slate-200 text-slate-700 font-bold rounded-xl hover:border-slate-300 hover:bg-slate-50 transition-all flex items-center gap-2">
                      <MapPin className="w-5 h-5" />
                      Get Directions
                    </Link>
                  </div>

                  {/* Campus Features */}
                  <div className="flex flex-wrap gap-8 pt-8 border-t border-slate-200 mt-8">
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">25 Acres</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Campus Area</div>
                    </div>
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">Wi-Fi</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Enabled Campus</div>
                    </div>
                    <div>
                      <div className="text-2xl font-black text-[#0F172A] dark:text-white">Modern</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">Infrastructure</div>
                    </div>
                  </div>
                </div>

                {/* Right Side - Campus Image */}
                <div className="relative animate-fade-in-up delay-100 z-10 mt-8 lg:mt-0">
                  <div className="relative overflow-hidden rounded-3xl shadow-2xl border-4 border-white group h-[300px] lg:h-[450px]">
                    <img
                      src="/banners/global-stage.png"
                      alt="NRIIT Visadala Campus"
                      className="w-full h-[450px] object-cover transform transition-transform duration-[3000ms] group-hover:scale-110"
                    />
                    <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent" />
                    <div className="absolute bottom-0 left-0 right-0 p-6 text-white">
                      <div className="text-2xl font-bold">Visadala Campus</div>
                      <div className="text-sm text-emerald-400">Guntur District, AP</div>
                    </div>

                    {/* Location Badge */}
                    <div className="absolute top-4 right-4 bg-white/90 backdrop-blur-sm px-4 py-2 rounded-xl shadow-lg flex items-center gap-2">
                      <MapPin className="w-5 h-5 text-emerald-600" />
                      <div className="text-sm font-bold text-slate-800">Near Amaravathi</div>
                    </div>
                  </div>
                </div>
              </>
            )}
          </div>

          <button onClick={() => setCurrentSlide((prev) => (prev === 3 ? 0 : prev + 1))} className="absolute right-2 top-1/2 -translate-y-1/2 lg:right-10 p-2 lg:p-4 rounded-full bg-slate-900/20 hover:bg-slate-900/40 backdrop-blur-md text-slate-700 dark:text-white border border-slate-200 dark:border-white/20 z-50 transition-all hover:scale-110">
            <ChevronRight className="w-8 h-8" />
          </button>

          {/* Dots - Light Theme */}
          <div className="absolute bottom-10 left-1/2 -translate-x-1/2 flex gap-3 z-20">
            {[0, 1, 2, 3].map(i => (
              <button key={i} onClick={() => setCurrentSlide(i)} className={`h- 3 rounded - full transition - all ${currentSlide === i ? 'bg-blue-600 w-10' : 'bg-slate-300 w-3'}`} />
            ))}
          </div>
        </div>
      </section>

      {/* 📰 ANIMATED NEWS TICKER - CATEGORIZED ONE BY ONE */}
      <div className="relative bg-[#0F172A] border-y border-slate-800 py-3 overflow-hidden">
        <div className="container mx-auto px-4 flex items-center gap-4">
          <div className="flex items-center gap-3 shrink-0">
            <div className="px-4 py-1.5 bg-purple-600 text-white text-xs font-bold uppercase tracking-widest rounded-full flex items-center gap-2 shadow-lg shadow-purple-500/20">
              <span className="w-2 h-2 rounded-full bg-white animate-pulse"></span>
              LIVE UPDATES
            </div>
            <div className="h-4 w-[1px] bg-slate-700 mx-2"></div>
          </div>

          {/* One-by-One Slider */}
          <div className="flex-1 relative h-8 overflow-hidden">
            <NewsSlider />
          </div>
        </div>
      </div>

      {/* 🏛️ CORE INSTITUTIONAL VALUES - VISION & MISSION */}
      <section className="py-24 relative overflow-hidden bg-slate-50">
        <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-blue-100/30 rounded-full blur-[100px] -translate-y-1/2 translate-x-1/2"></div>
        <div className="absolute bottom-0 left-0 w-[500px] h-[500px] bg-gold-100/20 rounded-full blur-[100px] translate-y-1/2 -translate-x-1/2"></div>

        <div className="container mx-auto px-4 relative z-10">
          <div className="grid lg:grid-cols-2 gap-12 items-stretch">
            {/* VISION CARD */}
            <div className="group bg-white rounded-[2.5rem] p-10 border border-slate-200 shadow-xl hover:shadow-2xl transition-all duration-500 relative overflow-hidden">
              <div className="absolute top-0 right-0 w-32 h-32 bg-gradient-to-bl from-blue-500/10 to-transparent rounded-bl-full" />
              <div className="flex items-center gap-4 mb-8">
                <div className="w-16 h-16 rounded-2xl bg-gradient-to-br from-blue-600 to-indigo-700 flex items-center justify-center shadow-lg shadow-blue-600/20 group-hover:rotate-6 transition-transform">
                  <Globe className="w-8 h-8 text-white" />
                </div>
                <div>
                  <span className="text-blue-600 font-bold text-xs uppercase tracking-widest block mb-1">Our Core Vision</span>
                  <h3 className="text-3xl font-black text-[#013C58]">Institutional Excellence</h3>
                </div>
              </div>
              <p className="text-xl text-slate-600 leading-relaxed font-medium italic border-l-4 border-blue-500 pl-6 py-2">
                "To become reputed institution of Engineering & Management programs, Producing competitive, ethical & socially responsible professionals."
              </p>
            </div>

            {/* MISSION CARD */}
            <div className="group bg-white rounded-[2.5rem] p-10 border border-slate-200 shadow-xl hover:shadow-2xl transition-all duration-500 relative overflow-hidden">
              <div className="absolute top-0 right-0 w-32 h-32 bg-gradient-to-bl from-amber-500/10 to-transparent rounded-bl-full" />
              <div className="flex items-center gap-4 mb-8">
                <div className="w-16 h-16 rounded-2xl bg-gradient-to-br from-[#F5A201] to-[#FFBA42] flex items-center justify-center shadow-lg shadow-[#F5A201]/20 group-hover:-rotate-6 transition-transform">
                  <Target className="w-8 h-8 text-white" />
                </div>
                <div>
                  <span className="text-[#F5A201] font-bold text-xs uppercase tracking-widest block mb-1">Our Core Mission</span>
                  <h3 className="text-3xl font-black text-[#013C58]">Strategic Objectives</h3>
                </div>
              </div>
              <div className="space-y-4">
                {[
                  "Provide quality education through best teaching and learning practices of committed staff.",
                  "Establish a continuous interaction, participation and collaboration with industry to provide solutions.",
                  "Provide the facilities that motivate/encourage faculty and students in research and development activities.",
                  "Develop human values, professional ethics and interpersonal skills amongst the individuals."
                ].map((mission, i) => (
                  <div key={i} className="flex gap-4 p-3 rounded-2xl hover:bg-slate-50 transition-colors border border-transparent hover:border-slate-100">
                    <div className="w-6 h-6 rounded-full bg-emerald-100 text-emerald-600 flex-shrink-0 flex items-center justify-center mt-1">
                      <CheckCircle2 className="w-4 h-4" />
                    </div>
                    <p className="text-slate-600 font-semibold text-sm leading-normal">{mission}</p>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* 📸 CAMPUS GALLERY MARQUEE - Two Row Sliding */}
      <section className="py-20 bg-gradient-to-br from-[#0F172A] via-[#1a2744] to-[#0F172A] relative overflow-hidden">
        {/* Decorative Elements */}
        <div className="absolute top-0 left-0 w-96 h-96 bg-[#D4AF37]/10 rounded-full blur-[150px]" />
        <div className="absolute bottom-0 right-0 w-96 h-96 bg-blue-500/10 rounded-full blur-[150px]" />

        <div className="container mx-auto px-4 mb-12 relative z-10">
          <div className="flex flex-col md:flex-row items-center justify-between gap-6">
            <div>
              <span className="text-[#D4AF37] font-bold text-xs uppercase tracking-[0.2em] mb-2 block">Campus Life</span>
              <h2 className="text-4xl md:text-5xl font-black text-white">
                Life at <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#FFE082]">NRIIT</span>
              </h2>
            </div>
            <Link
              href="/gallery"
              className="px-6 py-3 bg-[#D4AF37] hover:bg-[#FFE082] text-[#0F172A] font-bold rounded-xl transition-all hover:scale-105 flex items-center gap-2"
            >
              <ImageIcon className="w-5 h-5" />
              View Full Gallery
              <ChevronRight className="w-4 h-4" />
            </Link>
          </div>
        </div>

        {/* ROW 1 - Slides LEFT */}
        <div className="relative mb-6 overflow-hidden">
          <div className="flex animate-marquee-gallery gap-6 hover:[animation-play-state:paused]">
            {[
              { src: "/gallery/CORRECT BUILDING FRO M NRIIT TO GLOBAL.png", title: "NRIIT - Global Stage", category: "Campus" },
              { src: "/banners/global-stage.png", title: "World Class Campus", category: "Campus" },
              { src: "/gallery/571722750_17884096011394797_8998108365086871295_n (1).png", title: "Campus Event", category: "Events" },
              { src: "/gallery/569031081_17884096032394797_7260677632664801698_n. - Copy.png", title: "Student Activities", category: "Campus Life" },
              { src: "/gallery/571396112_17884638273394797_4177157676786452408_n..png", title: "Campus Day", category: "Events" },
              { src: "/gallery/571438824_17884096068394797_7726673159106898094_n. - Copy - Copy.png", title: "NRI Campus", category: "Campus" },
              // Duplicates for seamless loop
              { src: "/gallery/CORRECT BUILDING FRO M NRIIT TO GLOBAL.png", title: "NRIIT - Global Stage", category: "Campus" },
              { src: "/banners/global-stage.png", title: "World Class Campus", category: "Campus" },
              { src: "/gallery/571722750_17884096011394797_8998108365086871295_n (1).png", title: "Campus Event", category: "Events" },
              { src: "/gallery/569031081_17884096032394797_7260677632664801698_n. - Copy.png", title: "Student Activities", category: "Campus Life" },
              { src: "/gallery/571396112_17884638273394797_4177157676786452408_n..png", title: "Campus Day", category: "Events" },
              { src: "/gallery/571438824_17884096068394797_7726673159106898094_n. - Copy - Copy.png", title: "NRI Campus", category: "Campus" },
            ].map((img, idx) => (
              <div key={idx} className="relative flex-shrink-0 w-[320px] h-[200px] rounded-2xl overflow-hidden group cursor-pointer border-2 border-[#D4AF37]/20 shadow-lg shadow-[#D4AF37]/10">
                <img src={img.src} alt={img.title} className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute inset-0 bg-gradient-to-t from-[#0F172A]/90 via-[#0F172A]/30 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
                <div className="absolute bottom-0 left-0 right-0 p-4 translate-y-full group-hover:translate-y-0 transition-transform duration-300">
                  <span className="text-[#D4AF37] text-xs font-bold uppercase tracking-wider">{img.category}</span>
                  <h4 className="text-white font-bold text-lg">{img.title}</h4>
                </div>
                {/* NAAC Badge */}
                <div className="absolute top-3 left-3 px-2 py-1 bg-[#D4AF37] rounded-lg text-xs font-bold text-[#0F172A] shadow-lg">
                  NAAC A+
                </div>
                <div className="absolute top-3 right-3 w-8 h-8 bg-white/20 backdrop-blur-sm rounded-full flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                  <ChevronRight className="w-4 h-4 text-white" />
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* ROW 2 - Slides RIGHT (reverse) */}
        <div className="relative overflow-hidden">
          <div className="flex animate-marquee-gallery-reverse gap-6 hover:[animation-play-state:paused]">
            {[
              { src: "/gallery/571647730_17884733448394797_217842872340785337_n. - Copy - Copy.png", title: "Tech Fest", category: "Events" },
              { src: "/gallery/571656771_17884604793394797_8831772697411328282_n. (1) - Copy.png", title: "Student Achievements", category: "Achievements" },
              { src: "/gallery/571812568_17884733409394797_8475558754309514453_n..png", title: "Cultural Day", category: "Events" },
              { src: "/gallery/571863107_17884733400394797_4154023143693683405_n..png", title: "Campus Tour", category: "Campus" },
              { src: "/gallery/571941530_17884638282394797_6523397916169445826_n.png", title: "Celebrations", category: "Events" },
              { src: "/gallery/573557495_17884638300394797_8009028679019464750_n. (1).png", title: "Student Life", category: "Campus Life" },
              // Duplicates for seamless loop
              { src: "/gallery/571647730_17884733448394797_217842872340785337_n. - Copy - Copy.png", title: "Tech Fest", category: "Events" },
              { src: "/gallery/571656771_17884604793394797_8831772697411328282_n. (1) - Copy.png", title: "Student Achievements", category: "Achievements" },
              { src: "/gallery/571812568_17884733409394797_8475558754309514453_n..png", title: "Cultural Day", category: "Events" },
              { src: "/gallery/571863107_17884733400394797_4154023143693683405_n..png", title: "Campus Tour", category: "Campus" },
              { src: "/gallery/571941530_17884638282394797_6523397916169445826_n.png", title: "Celebrations", category: "Events" },
              { src: "/gallery/573557495_17884638300394797_8009028679019464750_n. (1).png", title: "Student Life", category: "Campus Life" },
            ].map((img, idx) => (
              <div key={idx} className="relative flex-shrink-0 w-[320px] h-[200px] rounded-2xl overflow-hidden group cursor-pointer border-2 border-[#D4AF37]/20 shadow-lg shadow-[#D4AF37]/10">
                <img src={img.src} alt={img.title} className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute inset-0 bg-gradient-to-t from-[#0F172A]/90 via-[#0F172A]/30 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
                <div className="absolute bottom-0 left-0 right-0 p-4 translate-y-full group-hover:translate-y-0 transition-transform duration-300">
                  <span className="text-[#D4AF37] text-xs font-bold uppercase tracking-wider">{img.category}</span>
                  <h4 className="text-white font-bold text-lg">{img.title}</h4>
                </div>
                {/* Alumni Badge */}
                <div className="absolute top-3 left-3 px-2 py-1 bg-gradient-to-r from-blue-500 to-indigo-600 rounded-lg text-xs font-bold text-white shadow-lg">
                  NRIIT
                </div>
                <div className="absolute top-3 right-3 w-8 h-8 bg-white/20 backdrop-blur-sm rounded-full flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                  <ChevronRight className="w-4 h-4 text-white" />
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* 🏆 DEPARTMENTS OF EXCELLENCE - LIGHT MODE */}
      <section className="py-28 bg-white relative">
        <div className="container mx-auto px-4">
          <div className="flex flex-col md:flex-row justify-between items-end mb-20 gap-6">
            <div>
              <span className="text-[#FFD700] font-bold text-sm uppercase tracking-[0.2em] mb-3 block">Academic Excellence</span>
              <h2 className="text-5xl md:text-6xl lg:text-7xl font-extrabold text-[#013C58] text-section">
                World-Class <span className="gradient-text-gold">Departments</span>
              </h2>
            </div>
            <Link href="/departments" className="group flex items-center gap-3 text-[#00537A] hover:text-[#FFD700] transition-colors font-bold text-lg">
              View All Programs
              <ChevronRight className="w-5 h-5 group-hover:translate-x-2 transition-transform" />
            </Link>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {departments.map((dept) => (
              <Link
                key={dept.code}
                href={`/ departments / ${dept.code.toLowerCase()} `}
                className={`group card - diamond rounded - 2xl p - 1 relative overflow - hidden ${dept.accent} `}
              >
                <div className={`h - full w - full rounded - xl p - 6 relative z - 10 bg - white ${dept.cardBgAccent} transition - all duration - 500`}>
                  <div className="flex justify-between items-start mb-6">
                    <span className="text-4xl filter drop-shadow-md group-hover:scale-110 transition-transform duration-300 block">{dept.icon}</span>
                    <div className={`w - 8 h - 8 rounded - full bg - slate - 100 flex items - center justify - center ${dept.bgAccent} group - hover: text - white transition - colors duration - 500`}>
                      <ArrowRight className="w-4 h-4 -rotate-45 group-hover:rotate-0 transition-transform duration-500" />
                    </div>
                  </div>

                  <h3 className={`text - xl font - bold text - slate - 900 mb - 2 ${dept.textAccent} transition - colors`}>{dept.name}</h3>
                  <p className="text-slate-500 text-sm mb-4">{dept.students}+ Scholars</p>

                  <div className="w-full h-1 bg-slate-100 rounded-full overflow-hidden">
                    <div className={`h - full bg - gradient - to - r ${dept.gradient} w - 3 / 4 group - hover: w - full transition - all duration - 700`}></div>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* 💼 UNRIVALED PLACEMENTS - DIAMOND STANDARD */}
      <UnrivaledPlacements />

      {/* 🌐 3D CAMPUS TWIN */}
      <div className="container mx-auto px-4">
        <DigitalTwin />
      </div>

      {/* 📚 ACADEMIC AFFAIRS QUICK LINK */}
      <section className="py-16 bg-[#F8FAFC]">
        <div className="container mx-auto px-4">
          <div className="flex flex-col md:flex-row items-center justify-between gap-8 p-8 md:p-12 bg-gradient-to-r from-[#0F172A] to-[#1e293b] rounded-3xl border border-white/10">
            <div>
              <span className="text-[#4CAF50] font-bold text-xs uppercase tracking-widest block mb-2">Excellence in Education</span>
              <h3 className="text-3xl md:text-4xl font-black text-white mb-2">Academic Affairs</h3>
              <p className="text-slate-400 text-sm max-w-lg">Programs offered, academic calendar, exam schedules, and downloadable resources.</p>
            </div>
            <Link
              href="/academics"
              className="flex-shrink-0 px-8 py-4 bg-[#4CAF50] hover:bg-[#45a049] text-white font-bold rounded-2xl transition-all hover:scale-105 shadow-lg shadow-[#4CAF50]/30 flex items-center gap-3"
            >
              <BookOpen className="w-5 h-5" />
              View Academic Affairs
              <ChevronRight className="w-5 h-5" />
            </Link>
          </div>
        </div>
      </section>

      {/* 🤝 RECRUITERS SECTION - GOLD + DIAMOND FLAGSHIP */}
      <section className="py-24 bg-[#013C58]">
        <div className="container mx-auto px-4 text-center">
          <span className="text-[#FFD700] font-bold text-sm uppercase tracking-[0.2em] mb-3 block">Industry Partners</span>
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-extrabold text-white mb-4 text-section">Our Recruiters</h2>
          <p className="text-[#A8E8F9] text-lg md:text-xl mb-16">Top companies trust our graduates</p>

          <div className="flex flex-wrap justify-center gap-5 md:gap-8">
            {["Tech Mahindra", "Cognizant", "Capgemini", "Accenture", "IBM", "Amazon", "Microsoft", "Google"].map((company, i) => (
              <div key={i} className="px-10 py-5 bg-white/10 border-2 border-[#FFD700]/30 rounded-2xl text-white font-bold text-lg hover:bg-[#FFD700] hover:text-[#013C58] transition-all cursor-default backdrop-blur-sm hover:scale-105">
                {company}
              </div>
            ))}
          </div>
        </div>
      </section >

      {/* 🏅 ACCREDITATION STRIP - PURE GOLD FLAGSHIP */}
      < section className="py-20 bg-gradient-to-r from-[#00537A] via-[#013C58] to-[#00537A] text-white relative overflow-hidden" >
        <div className="absolute inset-0 hero-dots opacity-20"></div>
        <div className="container mx-auto px-4 flex flex-col md:flex-row items-center justify-between gap-10 relative z-10">
          <div>
            <h2 className="text-4xl md:text-5xl font-extrabold mb-3 text-section">Globally Recognized Excellence</h2>
            <p className="text-[#A8E8F9] text-lg md:text-xl">Accredited by NAAC with A+ Grade, Approved by AICTE, and granted Autonomous Status.</p>
          </div>

          <div className="flex gap-8">
            {[
              { label: "NAAC A+", sub: "Accredited" },
              { label: "AICTE", sub: "Approved" },
              { label: "AUTONOMOUS", sub: "Status" }
            ].map((badge, i) => (
              <div key={i} className="bg-[#FFD700]/20 backdrop-blur-md border-2 border-[#FFD700]/50 rounded-2xl p-8 text-center min-w-[140px] hover:bg-[#FFD700] hover:text-[#013C58] transition-all hover:scale-105">
                <div className="text-3xl font-extrabold">{badge.label}</div>
                <div className="text-xs uppercase tracking-[0.15em] mt-2 opacity-80 font-semibold">{badge.sub}</div>
              </div>
            ))}
          </div>
        </div>
        {/* Abstract shapes */}
        <div className="absolute top-0 right-0 w-96 h-96 bg-[#FFD700]/10 rounded-full blur-3xl -mr-20 -mt-20"></div>
      </section >

      {/* 📅 EVENTS & NEWS GRID - DIAMOND WHITE */}
      < section className="py-28 bg-gradient-to-b from-[#F0F9FF] to-white" >
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-between mb-16">
            <div>
              <span className="text-[#FFD700] font-bold text-sm uppercase tracking-[0.2em] mb-3 block">Campus Life</span>
              <h2 className="text-4xl md:text-5xl lg:text-6xl font-extrabold text-[#013C58] text-section">Latest <span className="gradient-text-gold">Happenings</span></h2>
            </div>
            <Link href="/news" className="text-lg font-bold text-[#FFD700] hover:text-[#013C58] transition-colors">View All Updates →</Link>
          </div>

          <div className="grid md:grid-cols-3 gap-8">
            {/* News Item 1 */}
            <div className="col-span-1 md:col-span-2 relative group overflow-hidden rounded-3xl h-[400px]">
              {/* Keep Image Overlay as is (it has its own dark gradient) */}
            </div>

            {/* Notice Board - Light */}
            <div className="bg-white rounded-3xl p-8 border-2 border-[#E5E7EB] shadow-lg">
              <div className="flex items-center gap-3 mb-8 border-b border-slate-100 pb-4">
                <Bell className="w-6 h-6 text-[#FFD700]" />
                <h3 className="font-bold text-[#013C58] text-xl">Notice Board</h3>
              </div>
              <div className="space-y-4">
                {[
                  { date: "Today", title: "I B.Tech Sem I Exam Schedule Released", type: "Exam" },
                  { date: "Yesterday", title: "Campus Recruitment Drive - TCS", type: "Placement" },
                  { date: "2 days ago", title: "Pongal Holidays Circular", type: "General" }
                ].map((notice, i) => (
                  <div key={i} className="flex gap-4 group cursor-pointer">
                    <div className="flex-shrink-0 w-12 text-center">
                      <span className="block text-xs text-slate-400 uppercase">{notice.date}</span>
                    </div>
                    <div>
                      <p className="text-sm text-slate-600 group-hover:text-[#D4AF37] transition-colors font-medium">{notice.title}</p>
                      <span className="text-[10px] text-slate-500 border border-slate-200 px-1.5 rounded mt-1 inline-block">{notice.type}</span>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section >

      <PremiumFooter />
      <VisionaryAssistant />
    </main >
  );
}
