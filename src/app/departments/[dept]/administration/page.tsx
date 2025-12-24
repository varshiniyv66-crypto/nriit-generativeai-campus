"use client";

import { useParams } from "next/navigation";
import { User, Quote, Mail, Award, Building, BookOpen, ShieldCheck } from "lucide-react";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";

interface AdminProfile {
    name: string;
    role: string;
    message: string;
    icon: any;
    quoteHeader: string;
    color: string;
}

export default function AdministrationPage() {
    const params = useParams();

    const profiles: AdminProfile[] = [
        {
            name: "Mr. P. Tilak Babu",
            role: "Executive Director",
            message: "Our goal is to create an environment where every student has access to the best resources to achieve their dreams. We are constantly upgrading our laboratories, libraries, and campus facilities to meet international standards.",
            icon: Building,
            quoteHeader: "Building a Foundation for Excellence",
            color: "#1E3A8A" // Dark Blue
        },
        {
            name: "Dr. Kota Srinivas",
            role: "Director (Academics)",
            message: "Academic excellence is the cornerstone of NRIIT. We strive to provide a curriculum that is not only rigorous but also relevant to industry needs. Our focus is on outcome-based education that fosters critical thinking and innovation.",
            icon: BookOpen,
            quoteHeader: "Excellence in Education",
            color: "#D4AF37" // Gold
        },
        {
            name: "Sri Seetharamaiah",
            role: "Administrative Officer",
            message: "Discipline and smooth operations are vital for any institution. We ensure that the campus environment is safe, organized, and conducing to learning. We are here to support the students and faculty in all their administrative needs.",
            icon: ShieldCheck,
            quoteHeader: "Commitment to Service",
            color: "#059669" // Emerald Green
        }
    ];

    return (
        <div className="container mx-auto p-6 max-w-5xl space-y-12 animate-in fade-in duration-500">
            {/* Header Section */}
            <div className="space-y-2 text-center">
                <h1 className="text-4xl font-bold tracking-tight text-[#1E3A8A]">Administration</h1>
                <p className="text-slate-500 text-lg">The Leadership Team Driving NRIIT Forward</p>
            </div>

            <div className="space-y-12">
                {profiles.map((profile, index) => (
                    <Card key={index} className={`border-t-4 shadow-xl bg-white overflow-hidden`} style={{ borderTopColor: profile.color }}>
                        <div className="flex flex-col md:flex-row">
                            {/* Left Column: Photo & Quick Info */}
                            <div className="md:w-64 bg-slate-50 border-r border-slate-100 flex flex-col shrink-0">
                                <div className="aspect-[3/4] relative overflow-hidden group">
                                    <img
                                        src={`https://ui-avatars.com/api/?name=${encodeURIComponent(profile.name)}&background=${profile.color.replace('#', '')}&color=fff&size=512`}
                                        alt={profile.name}
                                        className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                                    />
                                    <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-end justify-center pb-6">
                                        <Badge variant="secondary" className="bg-white/90 text-slate-900 hover:bg-white cursor-pointer">View Details</Badge>
                                    </div>
                                </div>

                                <div className="p-6 space-y-4">
                                    <div>
                                        <h3 className="text-lg font-bold text-slate-900 leading-tight">{profile.name}</h3>
                                        <p className="text-sm font-medium opacity-80" style={{ color: profile.color }}>{profile.role}</p>
                                    </div>
                                    <Button className="w-full text-white hover:opacity-90 transition-opacity" style={{ backgroundColor: profile.color }}>
                                        <Mail className="w-4 h-4 mr-2" /> Contact
                                    </Button>
                                </div>
                            </div>

                            {/* Right Column: Message Content */}
                            <div className="flex-1 p-8 md:p-10 bg-white">
                                <div className="max-w-3xl">
                                    <Quote className="w-12 h-12 opacity-20 mb-6" style={{ color: profile.color }} />

                                    <h2 className="text-2xl font-bold text-slate-900 mb-4">{profile.quoteHeader}</h2>

                                    <div className="prose prose-slate prose-lg text-slate-600">
                                        <p className="italic text-lg text-slate-700 font-medium border-l-4 pl-4 bg-slate-50 py-3 rounded-r-lg" style={{ borderLeftColor: profile.color }}>
                                            "{profile.message}"
                                        </p>
                                        <div className="mt-6 flex items-start gap-4">
                                            <div className="p-3 rounded-full bg-slate-50">
                                                <profile.icon className="w-6 h-6" style={{ color: profile.color }} />
                                            </div>
                                            <div>
                                                <h4 className="font-semibold text-slate-900">Key Focus</h4>
                                                <p className="text-sm text-slate-500 mt-1">Driving institutional growth through dedicated leadership and student-centric policies.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </Card>
                ))}
            </div>
        </div>
    );
}
