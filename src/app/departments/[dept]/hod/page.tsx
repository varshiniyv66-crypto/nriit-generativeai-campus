"use client";

import { useParams } from "next/navigation";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { departments as staticDepartments } from "@/data/departments";
import { User, Mail, Phone, Calendar, Award } from "lucide-react";

export default function HODPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const staticInfo = staticDepartments[deptCode.toLowerCase()];
    const hod = staticInfo?.hod;

    if (!hod) {
        return (
            <div className="text-center py-12">
                <p className="text-gray-500">HOD information is being updated.</p>
            </div>
        );
    }

    return (
        <div className="space-y-6">
            {/* Page Header */}
            <div className="bg-gradient-to-r from-[#1E4080] to-[#2563EB] text-white p-8 rounded-xl shadow-lg">
                <Badge className="mb-2 bg-[#E5A818] text-[#1E4080] hover:bg-[#E5A818]">Leadership</Badge>
                <h1 className="text-4xl font-bold mb-2">Head of Department</h1>
                <p className="text-blue-100">Academic Leadership & Excellence</p>
            </div>

            {/* HOD Profile */}
            <div className="grid md:grid-cols-3 gap-6">
                {/* Photo and Quick Info */}
                <Card className="md:col-span-1">
                    <CardContent className="p-0">
                        <div className="aspect-[3/4] bg-gradient-to-br from-gray-100 to-gray-200 relative overflow-hidden group">
                            <img
                                src={hod.photo || `https://ui-avatars.com/api/?name=${encodeURIComponent(hod.name)}&background=1E4080&color=fff&size=512`}
                                alt={hod.name}
                                className="w-full h-full object-cover grayscale group-hover:grayscale-0 transition-all duration-500"
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-[#1E4080] via-transparent to-transparent opacity-70" />
                            <div className="absolute bottom-4 left-4 right-4 text-white">
                                <h2 className="text-2xl font-bold">{hod.name}</h2>
                                <p className="text-sm text-blue-100">{hod.designation}</p>
                            </div>
                        </div>

                        <div className="p-6 space-y-3">
                            <div className="flex items-center gap-3 text-sm">
                                <Mail className="w-4 h-4 text-[#1E4080]" />
                                <span className="text-gray-700">{hod.email || 'hod@nriit.ac.in'}</span>
                            </div>
                            <div className="flex items-center gap-3 text-sm">
                                <Phone className="w-4 h-4 text-[#1E4080]" />
                                <span className="text-gray-700">{hod.phone || '+91 863 234 4300'}</span>
                            </div>
                            <div className="flex items-center gap-3 text-sm">
                                <Award className="w-4 h-4 text-[#1E4080]" />
                                <span className="text-gray-700">{hod.qualification || 'Ph.D'}</span>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                {/* Message and Details */}
                <div className="md:col-span-2 space-y-6">
                    <Card>
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <User className="w-5 h-5 text-[#1E4080]" />
                                Message from HOD
                            </CardTitle>
                        </CardHeader>
                        <CardContent>
                            <div className="relative">
                                <div className="absolute top-0 left-0 text-6xl text-[#E5A818] opacity-20">"</div>
                                <p className="text-gray-700 text-lg leading-relaxed italic pl-8 pt-4">
                                    {hod.message || `Welcome to the ${deptCode} department. We are committed to providing world-class education and fostering innovation. Our faculty and students work together to push the boundaries of knowledge and technology.`}
                                </p>
                                <div className="absolute bottom-0 right-0 text-6xl text-[#E5A818] opacity-20 rotate-180">"</div>
                            </div>
                        </CardContent>
                    </Card>

                    <Card>
                        <CardHeader>
                            <CardTitle>Academic Profile</CardTitle>
                        </CardHeader>
                        <CardContent>
                            <div className="grid md:grid-cols-2 gap-4">
                                <div className="p-4 bg-blue-50 rounded-lg">
                                    <p className="text-sm text-gray-600 mb-1">Qualification</p>
                                    <p className="text-lg font-bold text-[#1E4080]">{hod.qualification || 'Ph.D'}</p>
                                </div>
                                <div className="p-4 bg-green-50 rounded-lg">
                                    <p className="text-sm text-gray-600 mb-1">Experience</p>
                                    <p className="text-lg font-bold text-green-700">{hod.experience || '20+'} Years</p>
                                </div>
                                <div className="p-4 bg-purple-50 rounded-lg">
                                    <p className="text-sm text-gray-600 mb-1">Specialization</p>
                                    <p className="text-lg font-bold text-purple-700">{hod.specialization || 'Engineering'}</p>
                                </div>
                                <div className="p-4 bg-yellow-50 rounded-lg">
                                    <p className="text-sm text-gray-600 mb-1">Publications</p>
                                    <p className="text-lg font-bold text-yellow-700">{hod.publications || 25}+</p>
                                </div>
                            </div>
                        </CardContent>
                    </Card>

                    <Card>
                        <CardHeader>
                            <CardTitle>Leadership Focus Areas</CardTitle>
                        </CardHeader>
                        <CardContent>
                            <ul className="space-y-3">
                                {[
                                    'Academic Excellence & Curriculum Innovation',
                                    'Research & Industry Collaboration',
                                    'Faculty Development & Student Mentoring',
                                    'Infrastructure & Laboratory Enhancement',
                                    'Placement & Career Guidance',
                                    'Quality Assurance & Accreditation'
                                ].map((area, idx) => (
                                    <li key={idx} className="flex items-start gap-3">
                                        <div className="flex-shrink-0 w-2 h-2 rounded-full bg-[#E5A818] mt-2" />
                                        <span className="text-gray-700">{area}</span>
                                    </li>
                                ))}
                            </ul>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </div>
    );
}
