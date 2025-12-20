"use client";

import React, { useState } from "react";
import Link from "next/link";
import {
    FileText,
    Download,
    ShieldAlert,
    Users,
    Award,
    Scale,
    Heart,
    DollarSign,
    ChevronDown,
    ChevronRight,
    BookOpen,
    Target,
    Building2,
    GraduationCap,
    Briefcase,
    ArrowLeft,
    ExternalLink
} from "lucide-react";

const disclosureCards = [
    {
        title: "Anti-Ragging Policy",
        description: "Zero tolerance towards ragging. Download the affidavit.",
        icon: ShieldAlert,
        color: "from-red-500 to-rose-600",
        pdfLink: "#"
    },
    {
        title: "Grievance Redressal",
        description: "Mechanism for students and staff to lodge complaints.",
        icon: Users,
        color: "from-blue-500 to-indigo-600",
        pdfLink: "#"
    },
    {
        title: "IQAC Cell",
        description: "Internal Quality Assurance Cell reports and minutes.",
        icon: Award,
        color: "from-emerald-500 to-teal-600",
        pdfLink: "#"
    },
    {
        title: "RTI Act",
        description: "Information under Right to Information Act, 2005.",
        icon: Scale,
        color: "from-amber-500 to-orange-600",
        pdfLink: "#"
    },
    {
        title: "Women Empowerment",
        description: "Committee for safety and welfare of women on campus.",
        icon: Heart,
        color: "from-pink-500 to-rose-600",
        pdfLink: "#"
    },
    {
        title: "Audited Balance Sheets",
        description: "Audited balance sheets and income expenditure statements.",
        icon: DollarSign,
        color: "from-violet-500 to-purple-600",
        pdfLink: "#"
    }
];

const codeOfConductSections = [
    {
        id: "principal",
        title: "Code of Conduct for Principal",
        content: [
            "The Principal should always be honest, fair, objective, supportive, protective, and law abiding.",
            "Should implement new ideas and plans to execute the college's vision and mission.",
            "Should promote democratic values on campus and make the campus a liberatory and emancipatory space.",
            "Listen to staff and student's ideas and set a supportive tone.",
            "Ensure that the staff and students are aware of the rules, policies, and procedures laid down by the college.",
            "Should be just and fair in interactions with staff and students.",
            "Should establish effective channels of communication and ensure ease of access to staff and students."
        ]
    },
    {
        id: "teachers",
        title: "Code of Conduct for Teachers",
        content: [
            "Adhere to a responsible pattern of conduct and demeanor expected of them by the academic community.",
            "Seek professional growth through study and research.",
            "Contribute to knowledge building through meaningful participation at professional meetings, seminars, conferences.",
            "Maintain active membership of professional associations and organizations.",
            "Perform their duties in the form of teaching, tutorial, practical, and seminar work.",
            "Participate in extension, co-curricular, and extra-curricular activities, including community service.",
            "Accord dignity and respect to all students across gender, caste, class, religious, and ethnic locations.",
            "Be fair and impartial to all students, regardless of religion, caste, political, economic, or social status."
        ]
    },
    {
        id: "non-teaching",
        title: "Code of Conduct for Non-Teaching Staff",
        content: [
            "All institute employees must perform their duties efficiently and diligently in accordance with the college's rules.",
            "All staff members should display the highest possible standards of professional behaviour.",
            "Punctuality and discipline are of utmost importance.",
            "Every staff member shall maintain appropriate levels of confidentiality with respect to student and staff records.",
            "Every staff member should be respectful and dignified in interactions with students, teachers, and colleagues.",
            "Staff members must refrain from any form of harassment or discrimination."
        ]
    },
    {
        id: "students",
        title: "Code of Conduct for Students",
        content: [
            "Students must attend all classes regularly and punctually.",
            "Maintain discipline and decorum on campus premises.",
            "Respect teachers, staff, and fellow students.",
            "Refrain from any form of ragging, harassment, or misconduct.",
            "Follow dress code and maintain cleanliness.",
            "Take proper care of institutional property and equipment.",
            "Participate actively in academic and co-curricular activities."
        ]
    }
];

const policies = [
    {
        id: "gender",
        title: "Gender Policy",
        icon: Heart,
        objectives: [
            "Promote a nuanced understanding of gender as a social location.",
            "Ensure equitable access and use of resources.",
            "Support a zero-tolerance policy against all forms of sexual harassment.",
            "Recognize discriminatory behaviour toward marginalized positions.",
            "Strengthen institutional mechanisms for redressal of gender-based discrimination.",
            "Train and sensitise students who can champion gender awareness.",
            "Establish a Women's Studies and Research Center."
        ]
    },
    {
        id: "research",
        title: "Research Policy",
        icon: BookOpen,
        objectives: [
            "Provide a conducive and rigorous research environment in college.",
            "Enrich the teaching and learning process through empirical experiences.",
            "Encourage faculty to publish research papers in journals of repute.",
            "Organise seminars, conferences, and workshops on research methodology.",
            "Identify and share information about different research and funding opportunities.",
            "Promote collaborations with international and national institutions.",
            "Create awareness about patents and intellectual property rights.",
            "Ensure quality, integrity, and ethics in research - strictly prohibit plagiarism."
        ]
    },
    {
        id: "infrastructure",
        title: "Physical & Academic Facilities Policy",
        icon: Building2,
        objectives: [
            "Establish standard operating procedures for the use of physical and academic facilities.",
            "Optimise the utilisation and maintenance of college facilities.",
            "Periodically review the needs of infrastructure and plan for the future.",
            "Classrooms are assigned based on timetable and student population.",
            "Laboratories allotted for practical sessions based on timetable.",
            "Annual Maintenance Contracts (AMC) for equipment and software.",
            "Library open from 8 AM to 7 PM on working days, 9 AM to 4 PM on holidays."
        ]
    }
];

export default function DisclosuresPage() {
    const [expandedSection, setExpandedSection] = useState<string | null>(null);
    const [expandedPolicy, setExpandedPolicy] = useState<string | null>(null);

    return (
        <>

            {/* Hero Section */}
            <section className="pt-32 pb-16 bg-gradient-to-br from-[#0F172A] via-[#1e293b] to-[#0F172A] relative overflow-hidden">
                <div className="absolute inset-0 bg-[url('/pattern.svg')] opacity-5" />
                <div className="absolute top-0 right-0 w-96 h-96 bg-violet-500/20 rounded-full blur-[100px]" />
                <div className="absolute bottom-0 left-0 w-96 h-96 bg-amber-500/20 rounded-full blur-[100px]" />

                <div className="container mx-auto px-4 relative z-10">
                    <Link href="/" className="inline-flex items-center gap-2 text-slate-400 hover:text-white transition-colors mb-8 font-medium">
                        <ArrowLeft className="w-4 h-4" />
                        Back to Home
                    </Link>

                    <div className="max-w-3xl">
                        <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-violet-500/20 border border-violet-500/30 text-violet-300 text-sm font-bold tracking-wide mb-6">
                            <FileText className="w-4 h-4" />
                            Transparency & Compliance
                        </div>
                        <h1 className="text-4xl md:text-6xl font-black text-white mb-6">
                            Mandatory Disclosures <span className="text-transparent bg-clip-text bg-gradient-to-r from-violet-400 to-purple-400">& Policies</span>
                        </h1>
                        <p className="text-xl text-slate-300">
                            Transparency is our core value. Access all regulatory documents, committee details, and campus policies here.
                        </p>
                    </div>
                </div>
            </section>

            {/* Disclosure Cards */}
            <section className="py-16">
                <div className="container mx-auto px-4">
                    <h2 className="text-3xl font-black text-[#0F172A] mb-8">📋 Key Documents</h2>
                    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {disclosureCards.map((card, idx) => (
                            <div
                                key={idx}
                                className="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-xl transition-all group"
                            >
                                <div className={`w-14 h-14 rounded-2xl bg-gradient-to-br ${card.color} flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}>
                                    <card.icon className="w-7 h-7 text-white" />
                                </div>
                                <h3 className="text-xl font-bold text-[#0F172A] mb-2">{card.title}</h3>
                                <p className="text-slate-500 text-sm mb-4">{card.description}</p>
                                <Link
                                    href={card.pdfLink}
                                    className="inline-flex items-center gap-2 text-violet-600 font-bold text-sm hover:gap-4 transition-all"
                                >
                                    <Download className="w-4 h-4" />
                                    Download PDF
                                </Link>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Code of Conduct */}
            <section className="py-16 bg-white">
                <div className="container mx-auto px-4">
                    <div className="flex items-center gap-4 mb-8">
                        <div className="w-12 h-12 rounded-2xl bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center">
                            <GraduationCap className="w-6 h-6 text-white" />
                        </div>
                        <div>
                            <h2 className="text-3xl font-black text-[#0F172A]">Code of Conduct</h2>
                            <p className="text-slate-500">For Principal, Teachers, Non-Teaching Staff & Students</p>
                        </div>
                    </div>

                    <div className="space-y-4">
                        {codeOfConductSections.map((section) => (
                            <div key={section.id} className="border border-slate-200 rounded-2xl overflow-hidden">
                                <button
                                    onClick={() => setExpandedSection(expandedSection === section.id ? null : section.id)}
                                    className="w-full flex items-center justify-between p-6 bg-slate-50 hover:bg-slate-100 transition-colors text-left"
                                >
                                    <h3 className="text-lg font-bold text-[#0F172A]">{section.title}</h3>
                                    {expandedSection === section.id ? (
                                        <ChevronDown className="w-5 h-5 text-slate-500" />
                                    ) : (
                                        <ChevronRight className="w-5 h-5 text-slate-500" />
                                    )}
                                </button>
                                {expandedSection === section.id && (
                                    <div className="p-6 bg-white">
                                        <ul className="space-y-3">
                                            {section.content.map((item, i) => (
                                                <li key={i} className="flex gap-3 text-slate-600">
                                                    <span className="w-6 h-6 rounded-full bg-violet-100 text-violet-600 flex-shrink-0 flex items-center justify-center text-xs font-bold">
                                                        {i + 1}
                                                    </span>
                                                    {item}
                                                </li>
                                            ))}
                                        </ul>
                                    </div>
                                )}
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Policies Section */}
            <section className="py-16 bg-gradient-to-br from-[#F8F7FF] to-[#FFF8F0]">
                <div className="container mx-auto px-4">
                    <div className="flex items-center gap-4 mb-8">
                        <div className="w-12 h-12 rounded-2xl bg-gradient-to-br from-amber-500 to-orange-600 flex items-center justify-center">
                            <Target className="w-6 h-6 text-white" />
                        </div>
                        <div>
                            <h2 className="text-3xl font-black text-[#0F172A]">Institutional Policies</h2>
                            <p className="text-slate-500">Gender, Research & Infrastructure Policies</p>
                        </div>
                    </div>

                    <div className="grid md:grid-cols-3 gap-6">
                        {policies.map((policy) => (
                            <div key={policy.id} className="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm">
                                <div className="flex items-center gap-3 mb-4">
                                    <policy.icon className="w-6 h-6 text-violet-600" />
                                    <h3 className="text-xl font-bold text-[#0F172A]">{policy.title}</h3>
                                </div>
                                <button
                                    onClick={() => setExpandedPolicy(expandedPolicy === policy.id ? null : policy.id)}
                                    className="text-violet-600 font-bold text-sm flex items-center gap-2 mb-4"
                                >
                                    {expandedPolicy === policy.id ? "Hide" : "View"} Objectives
                                    {expandedPolicy === policy.id ? (
                                        <ChevronDown className="w-4 h-4" />
                                    ) : (
                                        <ChevronRight className="w-4 h-4" />
                                    )}
                                </button>
                                {expandedPolicy === policy.id && (
                                    <ul className="space-y-2 border-t border-slate-100 pt-4">
                                        {policy.objectives.map((obj, i) => (
                                            <li key={i} className="flex gap-2 text-sm text-slate-600">
                                                <span className="text-violet-500">•</span>
                                                {obj}
                                            </li>
                                        ))}
                                    </ul>
                                )}
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Contact Section */}
            <section className="py-16 bg-[#0F172A]">
                <div className="container mx-auto px-4">
                    <div className="grid md:grid-cols-3 gap-8 text-center md:text-left">
                        <div>
                            <h3 className="text-lg font-bold text-white mb-4">📍 Address</h3>
                            <p className="text-slate-400">Visadala, Guntur</p>
                        </div>
                        <div>
                            <h3 className="text-lg font-bold text-white mb-4">📧 Email</h3>
                            <a href="mailto:nriit.guntur@gmail.com" className="text-violet-400 hover:text-violet-300">
                                nriit.guntur@gmail.com
                            </a>
                        </div>
                        <div>
                            <h3 className="text-lg font-bold text-white mb-4">📞 Phone</h3>
                            <a href="tel:08632344300" className="text-violet-400 hover:text-violet-300">
                                0863 234 4300
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </>
    );
}
