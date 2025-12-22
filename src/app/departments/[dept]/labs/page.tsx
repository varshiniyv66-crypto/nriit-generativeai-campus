"use client";

import { useParams } from "next/navigation";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { departments as staticDepartments } from "@/data/departments";
import { FlaskConical, Cpu, Network, Database, Brain, Microscope, Code, Zap, Award, Users, MapPin, Home } from "lucide-react";

const LAB_ICONS: Record<string, any> = {
    "programming": Code,
    "data": Database,
    "network": Network,
    "ai": Brain,
    "ml": Brain,
    "vlsi": Cpu,
    "electronics": Cpu,
    "circuit": Zap,
    "communication": Network,
    "civil": Microscope,
    "computer": Code,
    "tally": Database,
    "mba": Users,
    "default": FlaskConical
};

function getLabIcon(labName: string) {
    const name = labName.toLowerCase();
    for (const [key, Icon] of Object.entries(LAB_ICONS)) {
        if (name.includes(key)) return Icon;
    }
    return LAB_ICONS.default;
}

export default function LabsPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();
    const deptInfo = staticDepartments[deptCode.toLowerCase()];

    if (!deptInfo?.labs || deptInfo.labs.length === 0) {
        return (
            <div className="text-center py-20">
                <FlaskConical className="w-16 h-16 mx-auto text-gray-300 mb-4" />
                <p className="text-gray-500 text-lg">Laboratory information is being updated.</p>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-gradient-to-br from-gray-50 via-white to-blue-50/30">
            {/* Back Navigation */}
            <div className="mb-6">
                <a
                    href="/"
                    className="inline-flex items-center text-[#1E4080] hover:text-[#2563EB] font-semibold transition-colors group"
                >
                    <Home className="w-5 h-5 mr-2 group-hover:scale-110 transition-transform" />
                    Back to Home
                </a>
            </div>

            {/* Premium Header */}
            <div className="relative overflow-hidden bg-gradient-to-br from-[#1E4080] via-[#2563EB] to-[#3B82F6] text-white p-10 rounded-2xl shadow-2xl mb-8">
                <div className="absolute top-0 right-0 w-64 h-64 bg-white/5 rounded-full -translate-y-1/2 translate-x-1/2 blur-3xl" />
                <div className="absolute bottom-0 left-0 w-96 h-96 bg-[#E5A818]/10 rounded-full translate-y-1/2 -translate-x-1/2 blur-3xl" />

                <div className="relative z-10">
                    <Badge className="mb-3 bg-[#E5A818] text-[#1E4080] hover:bg-[#E5A818] px-4 py-1.5 text-sm font-bold">
                        World-Class Infrastructure
                    </Badge>

                    <h1 className="text-5xl font-black mb-3 tracking-tight">
                        State-of-the-Art Laboratories
                    </h1>
                    <p className="text-xl text-blue-100 font-light">
                        {deptInfo.name} • {deptInfo.labs.length} Specialized Labs
                    </p>

                    <div className="flex items-center gap-4 mt-6 flex-wrap">
                        <div className="flex items-center gap-2 bg-white/10 backdrop-blur-sm px-4 py-2 rounded-lg">
                            <Award className="w-5 h-5 text-[#E5A818]" />
                            <span className="font-semibold">NAAC A+</span>
                        </div>
                        <div className="flex items-center gap-2 bg-white/10 backdrop-blur-sm px-4 py-2 rounded-lg">
                            <Award className="w-5 h-5 text-[#E5A818]" />
                            <span className="font-semibold">Autonomous</span>
                        </div>
                        <div className="flex items-center gap-2 bg-white/10 backdrop-blur-sm px-4 py-2 rounded-lg">
                            <Users className="w-5 h-5 text-[#E5A818]" />
                            <span className="font-semibold">AICTE</span>
                        </div>
                    </div>
                </div>
            </div>

            {/* Labs Grid */}
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                {deptInfo.labs.map((lab, idx) => {
                    const LabIcon = getLabIcon(lab.name);
                    const gradients = [
                        "from-blue-500 to-cyan-500",
                        "from-purple-500 to-pink-500",
                        "from-green-500 to-emerald-500",
                        "from-orange-500 to-amber-500",
                        "from-red-500 to-rose-500",
                        "from-indigo-500 to-blue-500"
                    ];
                    const gradient = gradients[idx % gradients.length];

                    // Generate filename slug: "Computer Programming Lab" -> "computer-programming-lab.jpg"
                    const imageSlug = lab.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
                    const imagePath = `/images/labs/${imageSlug}.jpg`;

                    return (
                        <Card key={idx} className="group overflow-hidden border-0 shadow-lg hover:shadow-2xl transition-all duration-300 bg-white">
                            {/* Lab Image Container */}
                            <div className={`relative h-48 bg-gradient-to-br ${gradient} overflow-hidden`}>
                                {/* Real Image (Hidden if not found, requires user to add files) */}
                                <img
                                    src={imagePath}
                                    alt={lab.name}
                                    className="absolute inset-0 w-full h-full object-cover opacity-90 group-hover:scale-110 transition-transform duration-700 mix-blend-overlay group-hover:mix-blend-normal"
                                    onError={(e) => {
                                        // Hide image if not found, showing the gradient background instead
                                        (e.target as HTMLImageElement).style.display = 'none';
                                    }}
                                />

                                {/* Overlay Gradient for text readability */}
                                <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />

                                <div className="absolute inset-0 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                                    <div className="bg-white/20 backdrop-blur-md p-3 rounded-full">
                                        <LabIcon className="w-8 h-8 text-white" />
                                    </div>
                                </div>

                                <Badge className="absolute top-4 right-4 bg-white/90 text-gray-900 hover:bg-white font-bold shadow-sm z-10">
                                    Lab {idx + 1}
                                </Badge>
                            </div>

                            <CardContent className="p-6">
                                {/* Lab Name */}
                                <h3 className="text-xl font-bold text-gray-900 mb-3 group-hover:text-[#1E4080] transition-colors">
                                    {lab.name}
                                </h3>

                                {/* Location */}
                                {lab.location && (
                                    <div className="flex items-center gap-2 mb-3 text-sm text-gray-600">
                                        <MapPin className="w-4 h-4 text-[#E5A818]" />
                                        <span className="font-medium">{lab.location}</span>
                                    </div>
                                )}

                                {/* Description */}
                                <p className="text-gray-600 text-sm leading-relaxed">
                                    {lab.description}
                                </p>
                            </CardContent>
                        </Card>
                    );
                })}
            </div>

            {/* Lab Features Section */}
            <Card className="border-t-4 border-t-[#E5A818] shadow-xl bg-white">
                <CardContent className="p-8">
                    <h2 className="text-2xl font-bold text-[#1E4080] mb-6 flex items-center gap-3">
                        <Award className="w-7 h-7 text-[#E5A818]" />
                        Laboratory Excellence
                    </h2>
                    <div className="grid md:grid-cols-3 gap-6">
                        <div className="flex items-start gap-4">
                            <div className="p-3 bg-blue-100 rounded-lg">
                                <Cpu className="w-6 h-6 text-blue-600" />
                            </div>
                            <div>
                                <h3 className="font-bold text-gray-900 mb-1">Latest Equipment</h3>
                                <p className="text-sm text-gray-600">Industry-standard tools and technologies</p>
                            </div>
                        </div>
                        <div className="flex items-start gap-4">
                            <div className="p-3 bg-green-100 rounded-lg">
                                <Users className="w-6 h-6 text-green-600" />
                            </div>
                            <div>
                                <h3 className="font-bold text-gray-900 mb-1">Expert Supervision</h3>
                                <p className="text-sm text-gray-600">Qualified technical staff and faculty</p>
                            </div>
                        </div>
                        <div className="flex items-start gap-4">
                            <div className="p-3 bg-purple-100 rounded-lg">
                                <Award className="w-6 h-6 text-purple-600" />
                            </div>
                            <div>
                                <h3 className="font-bold text-gray-900 mb-1">NAAC A+ Standards</h3>
                                <p className="text-sm text-gray-600">Quality-assured autonomous infrastructure</p>
                            </div>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
