"use client";

import { useParams } from "next/navigation";
import { User, Award, Quote, Mail, Phone, Calendar, Briefcase, CheckCircle2, GraduationCap, BookOpen, Lightbulb, FileText, Globe, Medal, Cloud, Cpu } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";

export default function DeanPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();

    // Only for Computing Departments for now
    if (!['CSE', 'IT', 'CSE-DS', 'CSE-AI'].includes(deptCode)) {
        return (
            <div className="flex flex-col items-center justify-center min-h-[50vh] text-center p-8 text-slate-500">
                <User className="w-16 h-16 mb-4 opacity-20" />
                <h2 className="text-xl font-semibold">Dean's Message Not Available</h2>
                <p>This section is currently available for CSE & Allied Branches.</p>
            </div>
        );
    }

    return (
        <div className="container mx-auto p-6 max-w-6xl space-y-12 animate-in fade-in duration-500">
            {/* Header Section */}
            <div className="space-y-2 text-center md:text-left">
                <h1 className="text-4xl font-bold tracking-tight text-[#1E3A8A]">Dean's Profile</h1>
                <p className="text-slate-500 text-lg">Leadership, Innovation & Academic Excellence</p>
            </div>

            {/* Main Profile Card - Horizontal Layout */}
            <Card className="border-t-4 border-t-[#D4AF37] shadow-xl bg-white overflow-hidden">
                <div className="flex flex-col md:flex-row">
                    {/* Left Column: Photo & Quick Info */}
                    <div className="md:w-64 bg-slate-50 border-r border-slate-100 flex flex-col shrink-0">
                        <div className="aspect-[3/4] relative overflow-hidden group">
                            <img
                                src="https://ui-avatars.com/api/?name=Y+V+Raghava+Rao&background=1E3A8A&color=fff&size=512"
                                onError={(e) => {
                                    const target = e.currentTarget;
                                    target.onerror = null;
                                    target.src = "https://ui-avatars.com/api/?name=Y+V+Raghava+Rao&background=1E3A8A&color=fff&size=512";
                                }}
                                alt="Dr. Y.V. Raghava Rao"
                                className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-[#1E3A8A]/90 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-end justify-center pb-6">
                                <Badge variant="secondary" className="bg-white/90 text-[#1E3A8A] hover:bg-white cursor-pointer">View Full Profile</Badge>
                            </div>
                        </div>

                        <div className="p-6 space-y-6">
                            <div>
                                <h3 className="text-xl font-bold text-[#1E3A8A] leading-tight">Dr. Y.V. Raghava Rao</h3>
                                <p className="text-sm font-medium text-amber-600 mt-1">Dean & Professor</p>
                                <p className="text-xs text-slate-500 mt-0.5">CSE & Allied Branches</p>
                            </div>

                            <div className="space-y-4 pt-4 border-t border-slate-200">
                                <div className="flex items-center gap-3 text-sm text-slate-600">
                                    <div className="w-8 h-8 rounded-full bg-blue-50 flex items-center justify-center shrink-0">
                                        <Award className="w-4 h-4 text-blue-600" />
                                    </div>
                                    <div>
                                        <p className="text-xs font-semibold uppercase tracking-wider text-slate-400">Experience</p>
                                        <p className="font-medium">23+ Years</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-3 text-sm text-slate-600">
                                    <div className="w-8 h-8 rounded-full bg-amber-50 flex items-center justify-center shrink-0">
                                        <BookOpen className="w-4 h-4 text-amber-600" />
                                    </div>
                                    <div>
                                        <p className="text-xs font-semibold uppercase tracking-wider text-slate-400">Publications</p>
                                        <p className="font-medium">31+ Published</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-3 text-sm text-slate-600">
                                    <div className="w-8 h-8 rounded-full bg-green-50 flex items-center justify-center shrink-0">
                                        <GraduationCap className="w-4 h-4 text-green-600" />
                                    </div>
                                    <div>
                                        <p className="text-xs font-semibold uppercase tracking-wider text-slate-400">Ph.D Guidance</p>
                                        <p className="font-medium">4 Guiding, 1 Submitted, 1 Awarded</p>
                                    </div>
                                </div>
                            </div>

                            <div className="pt-4 space-y-2">
                                <div className="flex items-center gap-2 text-sm text-slate-600">
                                    <Phone className="w-4 h-4 text-[#1E3A8A]" />
                                    <span>+91-6281687329</span>
                                </div>
                                <div className="flex items-center gap-2 text-sm text-slate-600">
                                    <Mail className="w-4 h-4 text-[#1E3A8A]" />
                                    <span className="truncate">venkataraghavacse@gmail.com</span>
                                </div>
                            </div>

                            <div className="pt-2">
                                <Button className="w-full bg-[#1E3A8A] hover:bg-[#152C6B] text-white">
                                    Contact Dean
                                </Button>
                            </div>
                        </div>
                    </div>

                    {/* Right Column: Message & Details */}
                    <div className="flex-1 overflow-hidden flex flex-col">
                        <div className="p-8 md:p-10 bg-white border-b border-slate-100">
                            <h2 className="text-2xl font-bold text-slate-900 mb-6 flex items-center gap-3">
                                <Quote className="w-8 h-8 text-[#D4AF37]" />
                                Fostering Innovation & Holistic Growth
                            </h2>
                            <div className="prose prose-slate prose-lg text-slate-600 space-y-4">
                                <p className="italic text-lg text-slate-700 font-medium border-l-4 border-[#D4AF37] pl-4 bg-amber-50/50 py-3 rounded-r-lg">
                                    "We are dedicated to providing the best learning environment for our students and fostering a culture of innovation and research."
                                </p>
                                <p>
                                    Welcome to the School of Computing. Our focus is on holistic development, combining strong theoretical foundations with practical application. In a rapidly evolving digital landscape, we do not just impart knowledge; we encourage our students to think outside the box and innovate.
                                </p>
                                <p>
                                    My vision is to create an ecosystem where academic rigour meets creative problem-solving. We strive to empower every student to become not just a competent engineer, but a visionary leader capable of making a tangible impact.
                                </p>
                            </div>
                        </div>

                        {/* Detailed Tabs Section */}
                        <div className="flex-1 bg-slate-50/50 p-6">
                            <Tabs defaultValue="profile" className="w-full">
                                <TabsList className="grid w-full grid-cols-2 lg:grid-cols-4 mb-6">
                                    <TabsTrigger value="profile">Profile & Research</TabsTrigger>
                                    <TabsTrigger value="certifications">Certifications & Skills</TabsTrigger>
                                    <TabsTrigger value="achievements">Achievements</TabsTrigger>
                                    <TabsTrigger value="publications">Projects & Guide</TabsTrigger>
                                </TabsList>

                                <TabsContent value="profile" className="space-y-6 animate-in slide-in-from-bottom-2">
                                    <div className="grid md:grid-cols-2 gap-6">
                                        <Card>
                                            <CardHeader className="pb-2">
                                                <CardTitle className="text-lg flex items-center gap-2">
                                                    <Briefcase className="w-5 h-5 text-blue-600" /> Professional Summary
                                                </CardTitle>
                                            </CardHeader>
                                            <CardContent className="text-sm text-slate-600 space-y-2">
                                                <p>Distinguished academician with over 23 years of teaching experience and 2 years of industry experience in software development. Expert in bridging the gap between academia and industry through practical, project-based learning.</p>
                                                <p>Specialized in Artificial Intelligence with research interests in Stream-based Data Mining, Machine Learning, Deep Learning, and NLP with Transformers.</p>
                                            </CardContent>
                                        </Card>

                                        <Card>
                                            <CardHeader className="pb-2">
                                                <CardTitle className="text-lg flex items-center gap-2">
                                                    <Globe className="w-5 h-5 text-indigo-600" /> Research & Patents
                                                </CardTitle>
                                            </CardHeader>
                                            <CardContent className="space-y-2">
                                                <div className="flex flex-wrap gap-2">
                                                    {['Artificial Intelligence', 'Data Mining', 'Machine Learning', 'Deep Learning', 'Generative AI', 'Blockchain', 'IoT'].map((tag) => (
                                                        <Badge key={tag} variant="outline" className="bg-white">{tag}</Badge>
                                                    ))}
                                                </div>
                                                <div className="pt-2 text-sm text-slate-600">
                                                    <p><strong>Patents (5 Granted / 3 Applied):</strong></p>
                                                    <ul className="list-disc list-inside mt-1 pl-1 space-y-1 text-xs">
                                                        <li>Indian Patent 2024: Blockchain Security for IoT</li>
                                                        <li>UK Patent 2023: Biogas Leakage Detection</li>
                                                        <li>Australian Patent 2021: Cloud Task Scheduling</li>
                                                    </ul>
                                                </div>
                                            </CardContent>
                                        </Card>
                                    </div>
                                </TabsContent>

                                <TabsContent value="certifications" className="space-y-6 animate-in slide-in-from-bottom-2">
                                    <div className="grid md:grid-cols-2 gap-6">
                                        <Card>
                                            <CardHeader className="pb-2">
                                                <CardTitle className="text-lg flex items-center gap-2">
                                                    <Cloud className="w-5 h-5 text-blue-500" /> Global Certifications
                                                </CardTitle>
                                            </CardHeader>
                                            <CardContent className="space-y-3">
                                                {[
                                                    'Google Cloud Certified - Associate Cloud Engineer',
                                                    'Google Certified Professional Data Engineer',
                                                    'IBM Certified Blockchain Foundation Developer',
                                                    'IBM Certified Blockchain Essentials',
                                                    'Microsoft Certified: Azure AI Fundamentals',
                                                    'Sun Certified Java Programmer (96%)'
                                                ].map((cert) => (
                                                    <div key={cert} className="flex items-start gap-2 text-sm text-slate-700">
                                                        <CheckCircle2 className="w-4 h-4 text-green-600 shrink-0 mt-0.5" />
                                                        <span>{cert}</span>
                                                    </div>
                                                ))}
                                            </CardContent>
                                        </Card>
                                        <Card>
                                            <CardHeader className="pb-2">
                                                <CardTitle className="text-lg flex items-center gap-2">
                                                    <Cpu className="w-5 h-5 text-purple-600" /> Technical Expertise
                                                </CardTitle>
                                            </CardHeader>
                                            <CardContent className="space-y-4">
                                                <div>
                                                    <h4 className="text-sm font-semibold text-slate-900 mb-2">Generative AI & LLMs</h4>
                                                    <p className="text-xs text-slate-600">Extensive work in Large Language Models (LLMs), RAG Architectures, and Transformer models (BERT, GPT). Guided projects on Fine-tuning LLaMA for educational chatbots.</p>
                                                </div>
                                                <div>
                                                    <h4 className="text-sm font-semibold text-slate-900 mb-2">Cloud & DevOps</h4>
                                                    <p className="text-xs text-slate-600">Google Cloud Platform (GCP), AWS, Docker, Kubernetes deployment for ML models.</p>
                                                </div>
                                                <div>
                                                    <h4 className="text-sm font-semibold text-slate-900 mb-2">Full Stack Development</h4>
                                                    <p className="text-xs text-slate-600">Java Enterprise Edition (J2EE), Spring Boot, React.js, Node.js.</p>
                                                </div>
                                            </CardContent>
                                        </Card>
                                    </div>
                                </TabsContent>

                                <TabsContent value="achievements" className="space-y-6 animate-in slide-in-from-bottom-2">
                                    <Card>
                                        <CardContent className="pt-6">
                                            <ul className="space-y-3 text-slate-700">
                                                <li className="flex gap-3">
                                                    <Award className="w-5 h-5 text-green-600 shrink-0" />
                                                    <span>Completed Five Day FDP on <strong>"Advances in 6G Wireless Communication and Networking"</strong> (Dec 15-19, 2025).</span>
                                                </li>
                                                <li className="flex gap-3">
                                                    <Award className="w-5 h-5 text-amber-500 shrink-0" />
                                                    <span>Received the <strong>Best Teacher Award five times</strong> in academic teaching career.</span>
                                                </li>
                                                <li className="flex gap-3">
                                                    <Award className="w-5 h-5 text-blue-500 shrink-0" />
                                                    <span>Coordinator for <strong>4 FDPs sponsored by E&ICT academy, NITs and IITs</strong>.</span>
                                                </li>
                                                <li className="flex gap-3">
                                                    <Award className="w-5 h-5 text-blue-500 shrink-0" />
                                                    <span>Coordinator for ATAL FDP 2024-2025.</span>
                                                </li>
                                                <li className="flex gap-3">
                                                    <Award className="w-5 h-5 text-purple-500 shrink-0" />
                                                    <span>Successful completion of 07 MOOC Courses (NPTEL, Coursera, IBM).</span>
                                                </li>
                                                <li className="flex gap-3">
                                                    <Award className="w-5 h-5 text-slate-500 shrink-0" />
                                                    <span>Reviewer for prestigious journals: IJCSIS, IJAEGT, and IEEE Conferences.</span>
                                                </li>
                                            </ul>
                                        </CardContent>
                                    </Card>
                                </TabsContent>

                                <TabsContent value="publications" className="space-y-6 animate-in slide-in-from-bottom-2">
                                    <div className="grid sm:grid-cols-2 md:grid-cols-3 gap-4 mb-6">
                                        <Card className="bg-blue-50 border-blue-100">
                                            <CardContent className="p-6 text-center">
                                                <h3 className="text-4xl font-bold text-[#1E3A8A] mb-1">342+</h3>
                                                <p className="text-sm font-medium text-slate-600">B.Tech Projects</p>
                                            </CardContent>
                                        </Card>
                                        <Card className="bg-amber-50 border-amber-100">
                                            <CardContent className="p-6 text-center">
                                                <h3 className="text-4xl font-bold text-amber-600 mb-1">183+</h3>
                                                <p className="text-sm font-medium text-slate-600">M.Tech Projects</p>
                                            </CardContent>
                                        </Card>
                                        <Card className="bg-green-50 border-green-100">
                                            <CardContent className="p-6 text-center">
                                                <h3 className="text-4xl font-bold text-green-600 mb-1">4</h3>
                                                <p className="text-sm font-medium text-slate-600">Ph.D Scholars</p>
                                            </CardContent>
                                        </Card>
                                    </div>

                                    <div className="bg-white rounded-lg shadow-sm border p-6">
                                        <h3 className="font-semibold text-lg text-[#1E3A8A] mb-4">Significant Research & Funded Projects</h3>
                                        <div className="space-y-4 text-sm text-slate-600">
                                            <div className="flex gap-3">
                                                <Lightbulb className="w-5 h-5 text-amber-500 shrink-0" />
                                                <div>
                                                    <p className="font-medium text-slate-900">Brain Tumor Detection (Funded)</p>
                                                    <p>Research Project on "Content Based Image Retrieval for Detecting Brain Tumor", Funded by KLEF (2017-2018).</p>
                                                </div>
                                            </div>
                                            <div className="flex gap-3">
                                                <Lightbulb className="w-5 h-5 text-amber-500 shrink-0" />
                                                <div>
                                                    <p className="font-medium text-slate-900">Prostate Cancer Prediction (Funded)</p>
                                                    <p>Research Project on "Deep Learning for online Data Streams", Funded by KLEF (2018-2019).</p>
                                                </div>
                                            </div>
                                            <div className="flex gap-3">
                                                <Lightbulb className="w-5 h-5 text-amber-500 shrink-0" />
                                                <div>
                                                    <p className="font-medium text-slate-900">Big Data Initiative (Applied)</p>
                                                    <p>Project proposal worth 80 Lakhs submitted to DST under Big Data Initiative.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </TabsContent>

                            </Tabs>
                        </div>
                    </div>
                </div>
            </Card>
        </div>
    );
}
