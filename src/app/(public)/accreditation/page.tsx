import React from "react";
import { DepartmentComparison } from "@/components/dashboard/DepartmentComparison";
import { Badge } from "@/components/ui/badge";
import { Award, ShieldCheck, TrendingUp, ArrowRight, ChevronRight, Star } from "lucide-react";
import Link from "next/link";

export const metadata = {
    title: "Accreditation & Achievements | NRIIT",
    description: "Explore the Gold Standard benchmarks of NRI Institute of Technology across all departments.",
};

const accreditationCards = [
    {
        title: "NAAC A+",
        desc: "Highest institutional quality rating in India. NRIIT is recognized for its academic excellence.",
        href: "/accreditation/naac",
        icon: ShieldCheck,
        color: "text-blue-500",
        bg: "bg-blue-500/10",
        badge: "Diamond Grade"
    },
    {
        title: "Autonomous",
        desc: "UGC Granted Autonomous Status, providing academic freedom and industry-aligned curriculum.",
        href: "/about", // Link to about for now, or a dedicated autonomous section
        icon: Award,
        color: "text-amber-500",
        bg: "bg-amber-500/10",
        badge: "UGC Granted"
    },
    {
        title: "NIRF 2024",
        desc: "National Institutional Ranking Framework rankings, placing NRIIT among top institutions.",
        href: "/accreditation/nirf",
        icon: TrendingUp,
        color: "text-emerald-500",
        bg: "bg-emerald-500/10",
        badge: "Nationally Ranked"
    }
];

export default function AccreditationPage() {
    return (
        <main className="min-h-screen bg-[#F8FAFC] pb-20">

            {/* Premium Header */}
            <section className="relative py-24 md:py-32 overflow-hidden bg-slate-950">
                <div className="absolute inset-0 bg-gradient-to-br from-blue-600/20 via-transparent to-indigo-600/20" />
                <div className="absolute inset-0 hero-dots opacity-20" />

                <div className="container mx-auto px-4 relative z-10 text-center">
                    <div className="inline-flex items-center space-x-2 bg-amber-500/10 border border-amber-500/30 rounded-full px-4 py-1.5 mb-8 backdrop-blur-md">
                        <Star className="h-4 w-4 text-amber-500 fill-amber-500 animate-pulse" />
                        <span className="text-amber-400 font-black text-xs tracking-widest uppercase">Benchmark Excellence</span>
                    </div>

                    <h1 className="text-5xl md:text-7xl font-black text-white mb-8 tracking-tighter leading-tight">
                        Our <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-300 via-yellow-500 to-amber-600">Accreditations</span>
                    </h1>

                    <p className="text-xl md:text-2xl text-slate-400 max-w-4xl mx-auto leading-relaxed">
                        NRIIT maintains the <span className="text-white font-bold">Gold Standard</span> in academic delivery, infrastructure, and outcomes. Explore our national and international quality certifications.
                    </p>
                </div>
            </section>

            {/* Navigation Cards */}
            <section className="container mx-auto px-4 -mt-16 relative z-30 pb-20">
                <div className="grid md:grid-cols-3 gap-8">
                    {accreditationCards.map((card) => (
                        <Link
                            key={card.title}
                            href={card.href}
                            className="group bg-white rounded-[2.5rem] p-10 border border-slate-200 shadow-2xl hover:shadow-[0_40px_80px_rgba(0,0,0,0.1)] transition-all duration-500 hover:-translate-y-4"
                        >
                            <div className={`w-16 h-16 rounded-2xl ${card.bg} flex items-center justify-center mb-8 group-hover:scale-110 transition-transform`}>
                                <card.icon className={`w-8 h-8 ${card.color}`} />
                            </div>
                            <div className="space-y-4">
                                <div className="flex justify-between items-center">
                                    <h3 className="text-2xl font-black text-slate-900">{card.title}</h3>
                                    <Badge variant="outline" className="text-[10px] font-black uppercase tracking-widest border-slate-200">{card.badge}</Badge>
                                </div>
                                <p className="text-slate-500 font-medium leading-relaxed">
                                    {card.desc}
                                </p>
                                <div className="pt-4 flex items-center gap-2 text-blue-600 font-black text-xs uppercase tracking-widest opacity-0 group-hover:opacity-100 transition-opacity">
                                    Explore Details <ChevronRight className="w-4 h-4" />
                                </div>
                            </div>
                        </Link>
                    ))}
                </div>
            </section>

            {/* Department Comparison Dashboard */}
            <section className="container mx-auto px-4 pt-12">
                <div className="bg-white rounded-[3rem] p-8 md:p-16 border border-slate-200 shadow-xl">
                    <div className="mb-12 text-center md:text-left">
                        <h2 className="text-3xl md:text-5xl font-black text-slate-900 mb-4 tracking-tight">Performance Comparison</h2>
                        <p className="text-slate-500 text-lg font-medium">Real-time data mapping across all 10 departments.</p>
                    </div>
                    <DepartmentComparison />
                </div>
            </section>

        </main>
    );
}
