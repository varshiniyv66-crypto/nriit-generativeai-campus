"use client";

import { useParams } from "next/navigation";
import { User, Award, Quote, Mail, Phone, Calendar, Briefcase, CheckCircle2, Building } from "lucide-react";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";

export default function ExecutiveDirectorPage() {
    const params = useParams();

    return (
        <div className="container mx-auto p-6 max-w-5xl space-y-8 animate-in fade-in duration-500">
            {/* Header Section */}
            <div className="space-y-2">
                <h1 className="text-3xl font-bold tracking-tight text-[#1E3A8A]">Executive Director's Message</h1>
                <p className="text-slate-500">Leadership & Institutional Development</p>
            </div>

            {/* Main Profile Card */}
            <Card className="border-t-4 border-t-[#D4AF37] shadow-xl bg-white overflow-hidden">
                <div className="flex flex-col md:flex-row">
                    {/* Left Column: Photo & Quick Info */}
                    <div className="md:w-64 bg-slate-50 border-r border-slate-100 flex flex-col shrink-0">
                        <div className="aspect-[3/4] relative overflow-hidden group">
                             <img
                                src="https://ui-avatars.com/api/?name=P+Tilak+Babu&background=1E3A8A&color=fff&size=512"
                                alt="Mr. P. Tilak Babu"
                                className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-[#1E3A8A]/90 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-end justify-center pb-6">
                                <Badge variant="secondary" className="bg-white/90 text-[#1E3A8A] hover:bg-white cursor-pointer">View Full Profile</Badge>
                            </div>
                        </div>
                        
                        <div className="p-6 space-y-6">
                            <div>
                                <h3 className="text-lg font-bold text-[#1E3A8A] leading-tight">Mr. P. Tilak Babu</h3>
                                <p className="text-sm font-medium text-amber-600 mt-1">Executive Director</p>
                                <p className="text-xs text-slate-500 mt-0.5">NRI Institute of Technology</p>
                            </div>

                            <div className="pt-4 space-y-2 border-t border-slate-200 text-sm md:text-xs lg:text-sm text-slate-600">
                                <p>Mr. P. Tilak Babu is a dynamic administrator committed to providing world-class infrastructure and facilities to the students and faculty.</p>
                            </div>

                            <div className="pt-4">
                                <Button className="w-full bg-[#1E3A8A] hover:bg-[#152C6B] text-white">
                                    <Mail className="w-4 h-4 mr-2" /> Contact Office
                                </Button>
                            </div>
                        </div>
                    </div>

                    {/* Right Column: Message Content */}
                    <div className="flex-1 p-8 md:p-10 bg-white">
                        <div className="max-w-3xl">
                             <Quote className="w-12 h-12 text-[#D4AF37]/20 mb-6" />
                             
                             <h2 className="text-2xl font-bold text-slate-900 mb-6">Building a Foundation for Excellence</h2>
                             
                             <div className="prose prose-slate prose-lg text-slate-600 space-y-6">
                                <p className="italic text-xl text-slate-700 font-medium border-l-4 border-[#D4AF37] pl-4 bg-amber-50/50 py-3 rounded-r-lg">
                                    "Our goal is to create an environment where every student has access to the best resources to achieve their dreams."
                                </p>
                                
                                <p>
                                    As the Executive Director of NRIIT, my focus is on ensuring that our institution rests on a solid foundation of state-of-the-art infrastructure and robust administrative systems. We believe that a conducive physical and digital environment is crucial for academic and research excellence.
                                </p>
                                
                                <p>
                                    We are constantly upgrading our laboratories, libraries, and campus facilities to meet international standards. From high-speed internet connectivity across the campus to modern recreational facilities, every aspect of student life is curated to support their holistic growth.
                                </p>

                                <div className="grid sm:grid-cols-2 gap-4 my-8">
                                    <Card className="bg-slate-50 border-none shadow-sm hover:bg-slate-100 transition-colors">
                                        <CardContent className="p-4 flex items-start gap-3">
                                            <Building className="w-5 h-5 text-blue-600 shrink-0 mt-0.5" />
                                            <div>
                                                <h4 className="font-semibold text-slate-900 text-sm">Infrastructure</h4>
                                                <p className="text-xs text-slate-500 mt-1">Continuous expansion and modernization of campus facilities.</p>
                                            </div>
                                        </CardContent>
                                    </Card>
                                    <Card className="bg-slate-50 border-none shadow-sm hover:bg-slate-100 transition-colors">
                                        <CardContent className="p-4 flex items-start gap-3">
                                            <CheckCircle2 className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
                                            <div>
                                                <h4 className="font-semibold text-slate-900 text-sm">Student Welfare</h4>
                                                <p className="text-xs text-slate-500 mt-1">Ensuring a safe, comfortable, and vibrant campus life.</p>
                                            </div>
                                        </CardContent>
                                    </Card>
                                </div>

                                <div className="pt-8 mt-8 border-t border-slate-100 flex items-center justify-between">
                                    <div>
                                        <p className="font-signature text-3xl text-[#1E3A8A]">P. Tilak Babu</p>
                                        <p className="text-sm text-slate-500 mt-1">Executive Director</p>
                                    </div>
                                    <img src="/logo.png" alt="NRIIT" className="h-12 opacity-20 grayscale" />
                                </div>
                             </div>
                        </div>
                    </div>
                </div>
            </Card>
        </div>
    );
}
