"use client";

import Link from "next/link";
import { Construction, ArrowLeft } from "lucide-react";
import { Button } from "@/components/ui/button";

interface PlaceholderPageProps {
    title: string;
    description?: string;
    backLink?: string;
    backText?: string;
}

export default function PlaceholderPage({
    title,
    description = "This module is currently under active development. Stay tuned for updates!",
    backLink = "/",
    backText = "Return Home"
}: PlaceholderPageProps) {
    return (
        <div className="min-h-[60vh] flex flex-col items-center justify-center text-center p-8 animate-fade-in-up">
            <div className="w-20 h-20 bg-blue-50 rounded-full flex items-center justify-center mb-6">
                <Construction className="w-10 h-10 text-blue-600" />
            </div>
            <h1 className="text-3xl font-bold text-gray-900 mb-3">{title}</h1>
            <p className="text-lg text-gray-500 max-w-md mx-auto mb-8">
                {description}
            </p>
            <Link href={backLink}>
                <Button className="bg-blue-600 hover:bg-blue-700">
                    <ArrowLeft className="w-4 h-4 mr-2" />
                    {backText}
                </Button>
            </Link>
        </div>
    );
}
