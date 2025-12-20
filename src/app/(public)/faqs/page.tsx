"use client";

import { useState } from "react";
import {
    HelpCircle,
    ChevronDown,
    Globe,
    MapPin,
    GraduationCap,
    Briefcase,
    Heart,
    ShieldCheck,
    Search,
    MessageCircle,
    Coffee,
    Zap
} from "lucide-react";

const faqCategories = [
    { id: "general", label: "Institutional Vision", icon: HelpCircle },
    { id: "academic", label: "Academics & AI", icon: GraduationCap },
    { id: "placements", label: "Global Careers", icon: Briefcase },
    { id: "life", label: "Andhra Pride & Life", icon: Heart },
    { id: "logistics", label: "Campus Logistics", icon: ShieldCheck },
];

const faqs = [
    {
        category: "general",
        question: "What does 'From Amaravati to Global Stage' truly mean?",
        answer: "This is our flagship vision. It represents our commitment to taking students from the heart of Andhra Pradesh's capital region (Amaravati/Guntur) and equipping them with the cutting-edge AI skills and global mindset needed to lead in top tech hubs like Silicon Valley, London, and Singapore. We bridge local talent with international excellence."
    },
    {
        category: "general",
        question: "Is NRIIT an Autonomous institution?",
        answer: "Yes, NRIIT is a prestigious Autonomous institution and NAAC A+ accredited. This status allows us to design a world-class curriculum that is always updated with the latest industry trends, particularly in Generative AI and emerging technologies."
    },
    {
        category: "life",
        question: "How is life in Guntur/Vijayawada for students from other states or countries?",
        answer: "We offer the 'Authentic Andhra Experience' with international-standard hospitality. The CRDA region is known for its warmth, relative safety, and vibrant culture. Our campus provides a cosmopolitan environment while celebrating local traditions, festivals, and world-famous Andhra cuisine."
    },
    {
        category: "life",
        question: "Are the campus facilities 'International Class'?",
        answer: "Absolutely. From our high-tech AI labs and massive central library to our sports complex and grand Visadala campus plaza, every corner of NRIIT is designed to inspire. We provide a 'Grand University' feel that rivals international campuses."
    },
    {
        category: "academic",
        question: "How is AI integrated into the curriculum?",
        answer: "As a 'Generative AI Campus', we don't just teach AI; we live it. AI is a core pillar across all 11 departments—from CSE and IT to EVT and M.Tech. Students engage in hands-on projects, industry internships, and research that placement-ready from day one."
    },
    {
        category: "placements",
        question: "Which global companies recruit from NRIIT?",
        answer: "Our students are placed in 'The Big League'—Microsoft, Google, Amazon, Amazon, TCS, Cognizant, and several international tech firms. Our placement cell works tirelessly to ensure that our 'Amaravati Tech Leaders' find their place on the world's global stage."
    },
    {
        category: "placements",
        question: "Does NRIIT support students aiming for MS or higher studies abroad?",
        answer: "Yes. Our International Affairs cell provides comprehensive support for GRE/TOEFL/IELTS coaching and helps students with documentation for top universities in the US, UK, Canada, and Germany. Many of our alumni are currently pursuing research in Ivy League and Tier-1 global institutions."
    },
    {
        category: "logistics",
        question: "Is there transportation available for day scholars?",
        answer: "We operate a massive fleet of comfortable buses connecting the campus to all corners of Vijayawada, Guntur, Tenali, and Mangalagiri. We ensure every student has a safe and punctual commute."
    },
    {
        category: "logistics",
        question: "What are the hostel facilities like for international/non-local students?",
        answer: "We offer premium residency options with high-speed Wi-Fi, modern gymnasiums, and diverse multi-cuisine dining that caters to both south-Indian palates and international tastes. Safety and comfort are our top priorities."
    }
];

export default function FAQPage() {
    const [activeCategory, setActiveCategory] = useState("general");
    const [searchTerm, setSearchTerm] = useState("");
    const [openIndex, setOpenIndex] = useState<number | null>(null);

    const filteredFaqs = faqs.filter(faq =>
        (faq.category === activeCategory || searchTerm !== "") &&
        (faq.question.toLowerCase().includes(searchTerm.toLowerCase()) ||
            faq.answer.toLowerCase().includes(searchTerm.toLowerCase()))
    );

    return (
        <div className="min-h-screen bg-[#F8FAFC]">
            {/* 🌅 HERO SECTION - ANDHRA SUNSET VIBE */}
            <section className="relative py-24 md:py-32 overflow-hidden bg-gradient-to-br from-[#013C58] via-[#00537A] to-[#013C58]">
                {/* Decorative Elements */}
                <div className="absolute inset-0 opacity-10">
                    <div className="absolute top-0 left-0 w-full h-full bg-[url('/pattern.svg')] bg-repeat" />
                </div>
                <div className="absolute top-[-20%] right-[-10%] w-[600px] h-[600px] bg-[#F5A201]/10 rounded-full blur-[120px] animate-pulse-slow" />

                <div className="container mx-auto px-4 relative z-10 text-center">
                    <div className="inline-flex items-center gap-2 px-5 py-2 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white mb-8 animate-fade-in shadow-xl">
                        <Globe className="w-5 h-5 text-[#FFD700]" />
                        <span className="text-sm font-bold uppercase tracking-widest">Global Support Center</span>
                    </div>

                    <h1 className="text-5xl md:text-7xl font-black text-white mb-6 drop-shadow-2xl">
                        How can we <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#FFD700] via-[#F5C84C] to-[#FFD700]">Help You?</span>
                    </h1>

                    <p className="text-xl text-[#A8E8F9] max-w-2xl mx-auto mb-12 leading-relaxed">
                        Find answers to everything NRIIT—from our <span className="text-white font-bold">Andhra Roots</span> to your <span className="text-white font-bold">Global Future</span>.
                    </p>

                    {/* 🔍 SEARCH BAR */}
                    <div className="max-w-3xl mx-auto relative group">
                        <div className="absolute inset-0 bg-gradient-to-r from-[#FFD700] to-[#F5A201] rounded-2xl blur group-hover:blur-md transition-all opacity-40"></div>
                        <div className="relative flex items-center bg-white rounded-2xl shadow-2xl overflow-hidden p-2">
                            <Search className="w-6 h-6 text-slate-400 ml-4" />
                            <input
                                type="text"
                                placeholder="Search for questions about admissions, life at NRIIT, placements..."
                                className="w-full px-4 py-4 text-slate-700 font-medium focus:outline-none"
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                            />
                            <button className="hidden md:block bg-gradient-to-r from-[#013C58] to-[#00537A] text-white px-8 py-4 rounded-xl font-bold hover:scale-105 transition-transform">
                                Search
                            </button>
                        </div>
                    </div>
                </div>
            </section>

            {/* 📊 CONTENT SECTION */}
            <section className="py-20 -mt-10 relative z-20">
                <div className="container mx-auto px-4">
                    <div className="flex flex-col lg:flex-row gap-12">

                        {/* 🔘 CATEGORY SIDEBAR */}
                        <div className="lg:w-1/3 space-y-4">
                            <div className="bg-white p-8 rounded-3xl shadow-xl border border-slate-200 sticky top-32">
                                <h3 className="text-2xl font-black text-[#013C58] mb-8">Categories</h3>
                                <div className="space-y-2">
                                    {faqCategories.map((cat) => (
                                        <button
                                            key={cat.id}
                                            onClick={() => {
                                                setActiveCategory(cat.id);
                                                setSearchTerm("");
                                            }}
                                            className={`w-full flex items-center gap-4 p-4 rounded-2xl font-bold transition-all ${activeCategory === cat.id
                                                ? "bg-gradient-to-r from-[#013C58] to-[#00537A] text-white shadow-lg scale-105"
                                                : "text-slate-600 hover:bg-slate-50 hover:text-[#013C58]"
                                                }`}
                                        >
                                            <cat.icon className={`w-6 h-6 ${activeCategory === cat.id ? "text-[#FFD700]" : "text-slate-400"}`} />
                                            {cat.label}
                                        </button>
                                    ))}
                                </div>

                                <div className="mt-12 p-6 rounded-2xl bg-gradient-to-br from-slate-50 to-slate-100 border border-slate-200">
                                    <div className="flex items-center gap-3 mb-4">
                                        <MessageCircle className="w-6 h-6 text-[#F5A201]" />
                                        <span className="font-black text-[#013C58]">Need more help?</span>
                                    </div>
                                    <p className="text-sm text-slate-500 mb-6 font-medium">Have a specific question? Our admission experts are ready to chat.</p>
                                    <Link href="/contact" className="w-full block text-center py-3 bg-white border-2 border-[#013C58] text-[#013C58] font-bold rounded-xl hover:bg-[#013C58] hover:text-white transition-all">
                                        Contact Support
                                    </Link>
                                </div>
                            </div>
                        </div>

                        {/* 📝 FAQ ACCORDION */}
                        <div className="lg:w-2/3 space-y-4">
                            {filteredFaqs.length > 0 ? (
                                filteredFaqs.map((faq, idx) => (
                                    <div
                                        key={idx}
                                        className="group bg-white rounded-3xl border border-slate-200 shadow-sm hover:shadow-xl transition-all duration-300 overflow-hidden"
                                    >
                                        <button
                                            onClick={() => setOpenIndex(openIndex === idx ? null : idx)}
                                            className="w-full flex items-center justify-between p-8 text-left"
                                        >
                                            <span className={`text-xl font-bold transition-colors ${openIndex === idx ? "text-[#D4AF37]" : "text-[#013C58] group-hover:text-[#D4AF37]"}`}>
                                                {faq.question}
                                            </span>
                                            <div className={`p-2 rounded-full transition-all ${openIndex === idx ? "bg-[#D4AF37] text-white rotate-180" : "bg-slate-100 text-slate-400 group-hover:bg-slate-200"}`}>
                                                <ChevronDown className="w-6 h-6" />
                                            </div>
                                        </button>
                                        <div className={`px-8 transition-all duration-500 ease-in-out ${openIndex === idx ? "max-h-[500px] pb-8 opacity-100" : "max-h-0 opacity-0"}`}>
                                            <div className="h-px bg-slate-100 mb-6" />
                                            <p className="text-lg text-slate-600 leading-relaxed font-medium">
                                                {faq.answer}
                                            </p>
                                        </div>
                                    </div>
                                ))
                            ) : (
                                <div className="text-center py-20 bg-white rounded-3xl border border-dashed border-slate-300">
                                    <Zap className="w-16 h-16 text-slate-200 mx-auto mb-4" />
                                    <p className="text-xl font-bold text-slate-400">No matching questions found.</p>
                                    <button
                                        onClick={() => setSearchTerm("")}
                                        className="mt-4 text-[#D4AF37] font-bold hover:underline"
                                    >
                                        Clear all search terms
                                    </button>
                                </div>
                            )}

                            {/* 🇦🇳 ANDHRA HUB BANNER */}
                            <div className="mt-12 p-10 rounded-[2.5rem] bg-gradient-to-r from-[#013C58] to-[#00537A] relative overflow-hidden group">
                                <div className="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1600673882311-160864284b60?q=80&w=1200&auto=format')] opacity-20 group-hover:scale-110 transition-transform duration-1000 bg-cover bg-center" />
                                <div className="absolute inset-0 bg-gradient-to-r from-[#013C58] via-[#013C58]/80 to-transparent" />

                                <div className="relative z-10 max-w-lg">
                                    <div className="flex items-center gap-3 text-[#FFD700] mb-4">
                                        <MapPin className="w-6 h-6" />
                                        <span className="font-black tracking-widest uppercase text-sm">Heart of Andhra</span>
                                    </div>
                                    <h3 className="text-3xl font-black text-white mb-4">Strategic Choice for <br />Global Education</h3>
                                    <p className="text-[#A8E8F9] font-medium leading-relaxed mb-8">
                                        Located in the burgeoning Amaravati region, NRIIT offers students proximity to the new capital's hub while maintaining a peaceful, scholarly environment at Guntur/Visadala.
                                    </p>
                                    <div className="flex flex-wrap gap-4">
                                        <div className="flex items-center gap-2 px-4 py-2 rounded-full bg-white/10 backdrop-blur-md text-white text-sm font-bold border border-white/20">
                                            <Coffee className="w-4 h-4 text-[#FFD700]" />
                                            Local Hospitality
                                        </div>
                                        <div className="flex items-center gap-2 px-4 py-2 rounded-full bg-white/10 backdrop-blur-md text-white text-sm font-bold border border-white/20">
                                            <ShieldCheck className="w-4 h-4 text-[#FFD700]" />
                                            Global Safety
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}

import Link from "next/link";
