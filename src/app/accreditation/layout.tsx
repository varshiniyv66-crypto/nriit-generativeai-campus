import Link from "next/link";
import {
    BarChart,
    Award,
    Shield,
    TrendingUp,
    FileText,
    CheckCircle2,
    AlertCircle
} from "lucide-react";

export default function AccreditationLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    return (
        <div className="min-h-screen bg-gray-50 flex flex-col">
            {/* Accreditation Header */}
            <header className="bg-white border-b border-gray-200 sticky top-0 z-40">
                <div className="container mx-auto px-4 h-16 flex items-center justify-between">
                    <div className="flex items-center gap-3">
                        <Link href="/" className="w-8 h-8 rounded-lg bg-blue-700 text-white flex items-center justify-center font-bold">
                            N
                        </Link>
                        <div className="h-6 w-px bg-gray-200 mx-2" />
                        <span className="font-bold text-lg text-gray-900">
                            Accreditation Engine
                        </span>
                    </div>

                    <nav className="flex items-center gap-1">
                        <Link
                            href="/accreditation/nba"
                            className="px-4 py-2 rounded-lg text-sm font-medium hover:bg-gray-100 text-gray-700 flex items-center gap-2"
                        >
                            <Award className="w-4 h-4" />
                            NBA
                        </Link>
                        <Link
                            href="/accreditation/naac"
                            className="px-4 py-2 rounded-lg text-sm font-medium hover:bg-gray-100 text-gray-700 flex items-center gap-2"
                        >
                            <Shield className="w-4 h-4" />
                            NAAC
                        </Link>
                        <Link
                            href="/accreditation/nirf"
                            className="px-4 py-2 rounded-lg text-sm font-medium hover:bg-gray-100 text-gray-700 flex items-center gap-2"
                        >
                            <TrendingUp className="w-4 h-4" />
                            NIRF
                        </Link>
                    </nav>
                </div>
            </header>

            {/* Main Content */}
            <div className="flex-1 container mx-auto px-4 py-8">
                {children}
            </div>
        </div>
    );
}
