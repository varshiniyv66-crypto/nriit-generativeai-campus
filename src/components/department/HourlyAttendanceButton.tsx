"use client";

import Link from "next/link";
import { Clock } from "lucide-react";
import { Button } from "@/components/ui/button";

interface HourlyAttendanceButtonProps {
    department: string;
}

export function HourlyAttendanceButton({ department }: HourlyAttendanceButtonProps) {
    return (
        <Link href={`/departments/${department}/hourly-attendance`}>
            <Button
                className="group relative overflow-hidden bg-gradient-to-r from-blue-600 to-indigo-600 text-white font-black px-8 py-6 rounded-2xl shadow-xl hover:shadow-2xl hover:shadow-blue-500/30 transition-all duration-500 scale-100 hover:scale-105 active:scale-95 border border-white/10"
            >
                <div className="absolute inset-0 bg-white/20 translate-y-full group-hover:translate-y-0 transition-transform duration-500" />
                <span className="relative flex items-center gap-3">
                    <Clock className="w-6 h-6 text-blue-200 group-hover:text-white transition-colors" />
                    HOURLY ATTENDANCE
                </span>
            </Button>
        </Link>
    );
}
