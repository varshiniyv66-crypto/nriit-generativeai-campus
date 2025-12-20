import { ReactNode } from "react";
import PremiumHeader from "./PremiumHeader";
import PremiumFooter from "./PremiumFooter";

interface PremiumLayoutProps {
    children: ReactNode;
}

export default function PremiumLayout({ children }: PremiumLayoutProps) {
    return (
        <div className="flex flex-col min-h-screen relative overflow-hidden text-slate-900 bg-noise hero-bg-premium">
            {/* Cinematic Background Effects - White Gold */}
            <div className="fixed inset-0 z-0 pointer-events-none">
                <div className="absolute top-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#0EA5E9]/5 rounded-full blur-[150px] animate-pulse-slow"></div>
                <div className="absolute bottom-[-10%] right-[-10%] w-[50%] h-[50%] bg-[#D4AF37]/5 rounded-full blur-[150px]"></div>
            </div>

            <PremiumHeader />

            {/* Main Content with Padding for Fixed Header */}
            <main className="flex-grow pt-24 relative z-10">
                {children}
            </main>

            <PremiumFooter />
        </div>
    );
}
