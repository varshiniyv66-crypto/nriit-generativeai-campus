
"use client";

import { useParams } from "next/navigation";
import { Home, Image as ImageIcon, ZoomIn, Info } from "lucide-react";
import { motion } from "framer-motion";
import { useState } from "react";

export default function GalleryPage() {
    const params = useParams();
    const deptCode = (params.dept as string || '').toUpperCase();

    // Placeholder images - using gradients/patterns as placeholders for now to simulate "Stunning"
    const images = Array.from({ length: 9 }).map((_, i) => ({
        id: i,
        src: `https://source.unsplash.com/random/800x600?tech,campus,sig=${i}`, // Using placeholder service for demo
        title: `Campus Highlight ${i + 1}`,
        category: i % 2 === 0 ? "Labs" : "Events"
    }));

    // Since actual unsplash links might be blocked or random, let's use colored blocks for visual mock if needed, 
    // but the code structure supports real images.

    return (
        <div className="min-h-screen bg-[#FDFCF8] text-slate-900 font-sans pb-20 selection:bg-fuchsia-100">
            {/* 1. HERO SECTION: Aesthetic Light Theme */}
            <div className="relative pt-24 pb-16 px-6 overflow-hidden">
                {/* Luminous Background Mesh */}
                <div className="absolute top-[-20%] right-[-10%] w-[800px] h-[800px] bg-gradient-to-b from-fuchsia-100/40 via-purple-50/20 to-transparent rounded-full blur-[120px] opacity-60 pointer-events-none" />
                <div className="absolute top-[20%] left-[-10%] w-[600px] h-[600px] bg-gradient-to-r from-pink-50/50 to-rose-50/30 rounded-full blur-[100px] opacity-50 pointer-events-none" />

                <div className="container mx-auto relative z-10 text-center">
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="inline-flex items-center gap-2 mb-6"
                    >
                        <div className="px-4 py-1.5 bg-white/80 backdrop-blur-md rounded-full border border-slate-200 shadow-sm text-slate-500 font-bold tracking-widest uppercase text-[10px] flex items-center gap-2">
                            Visual Exhibit
                        </div>
                        <span className="w-1 h-1 bg-slate-300 rounded-full" />
                        <span className="text-xs font-bold text-fuchsia-600 uppercase tracking-widest">Campus Life</span>
                    </motion.div>

                    <motion.h1
                        initial={{ opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        className="text-5xl md:text-7xl font-black text-slate-900 tracking-tighter mb-4"
                    >
                        Visual <span className="text-transparent bg-clip-text bg-gradient-to-r from-fuchsia-500 to-pink-500">Exhibit</span>
                    </motion.h1>
                    <p className="text-xl text-slate-500 font-medium tracking-wide">A Glimpse into our world</p>
                </div>
            </div>

            {/* 2. MASONRY GRID */}
            <div className="container mx-auto px-6 max-w-7xl">
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {images.map((img, i) => (
                        <motion.div
                            key={i}
                            initial={{ opacity: 0, y: 30 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true }}
                            transition={{ delay: i * 0.1 }}
                            className="group relative aspect-video bg-gray-900 rounded-2xl overflow-hidden cursor-pointer"
                        >
                            {/* Placeholder for Image - In production this is <img src... /> */}
                            <div className="absolute inset-0 bg-gradient-to-br from-gray-800 to-gray-900 group-hover:scale-110 transition-transform duration-700" />
                            <div className="absolute inset-0 flex items-center justify-center">
                                <ImageIcon className="w-10 h-10 text-gray-700 group-hover:text-white transition-colors" />
                            </div>

                            {/* Hover Overlay */}
                            <div className="absolute inset-0 bg-black/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col justify-end p-6">
                                <span className="text-fuchsia-400 text-xs font-bold uppercase tracking-widest mb-1">{img.category}</span>
                                <h3 className="text-xl font-bold text-white">{img.title}</h3>
                            </div>
                        </motion.div>
                    ))}
                </div>

                <div className="mt-12 text-center">
                    <p className="text-gray-500 text-sm flex items-center justify-center gap-2">
                        <Info className="w-4 h-4" /> Images above are placeholders for the new design system.
                    </p>
                </div>
            </div>
        </div>
    );
}
