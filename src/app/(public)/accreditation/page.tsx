import React from "react";
import { DepartmentComparison } from "@/components/dashboard/DepartmentComparison";
import { Badge } from "lucide-react";

export const metadata = {
    title: "Accreditation & Achievements | NRIIT",
    description: "Explore the Gold Standard benchmarks of NRI Institute of Technology across all departments.",
};

export default function AccreditationPage() {
    return (
        <main className="min-h-screen bg-slate-50 dark:bg-slate-950 pb-20">

            {/* Page Header */}
            <section className="relative py-20 overflow-hidden bg-slate-900 border-b border-slate-800">
                <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10"></div>
                <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-indigo-500/20 rounded-full blur-[100px] -mr-32 -mt-32"></div>

                <div className="container mx-auto px-4 relative z-10 text-center">
                    <div className="inline-flex items-center space-x-2 bg-amber-500/10 border border-amber-500/30 rounded-full px-4 py-1.5 mb-6 backdrop-blur-md">
                        <span className="flex h-2 w-2 rounded-full bg-amber-500 animate-pulse"></span>
                        <span className="text-amber-400 font-bold text-sm tracking-wide uppercase">NBA Accredited Institution</span>
                    </div>

                    <h1 className="text-4xl md:text-6xl font-black text-white mb-6 leading-tight">
                        Setting the <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-300 via-yellow-500 to-amber-600">Gold Standard</span> in Education
                    </h1>

                    <p className="text-lg md:text-xl text-slate-400 max-w-3xl mx-auto leading-relaxed">
                        Experience our pursuit of excellence visualized. We benchmark every department against
                        <span className="text-white font-semibold"> 9 Global Performance Indicators</span>
                        to ensure world-class quality for every student.
                    </p>
                </div>
            </section>

            {/* Main Content Area */}
            <div className="container mx-auto px-4 -mt-10 relative z-20">
                <DepartmentComparison />
            </div>

        </main>
    );
}
