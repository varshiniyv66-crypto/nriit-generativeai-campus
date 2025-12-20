"use client";

import { useState } from "react";
import { Image as ImageIcon, Maximize2, X, Camera, Sparkles, Play, ChevronRight } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";
import Link from "next/link";

const allImages = [
    { src: "/gallery/569031081_17884096032394797_7260677632664801698_n. - Copy.png", category: "Campus", title: "Main Entrance" },
    { src: "/gallery/chaiman.png", category: "Governance", title: "Chairman's Office" },
    { src: "/gallery/naac-aplus.png", category: "Awards", title: "NAAC A+ Recognition" },
    { src: "/gallery/nriit-autonomous.png", category: "Awards", title: "Autonomous Status" },
    { src: "/gallery/569067749_17884547403394797_8801774493399912125_n. - Copy - Copy.png", category: "Events", title: "College Day Celebration" },
    { src: "/gallery/571396112_17884638273394797_4177157676786452408_n. - Copy - Copy.png", category: "Labs", title: "Computer Science Lab" },
    { src: "/gallery/571722750_17884096011394797_8998108365086871295_n.png", category: "Library", title: "Central Library" },
    { src: "/gallery/571812568_17884733409394797_8475558754309514453_n.png", category: "Sports", title: "Outdoor Sports Arena" },
    { src: "/gallery/571863107_17884733400394797_4154023143693683405_n.png", category: "Campus", title: "Evening at NRIIT" },
    { src: "/gallery/571941530_17884638282394797_6523397916169445826_n.png", category: "Events", title: "Technical Symposium" },
    { src: "/gallery/572082993_17884547502394797_4932840773585110892_n.png", category: "Labs", title: "Electronics Lab" },
    { src: "/gallery/573557495_17884638300394797_8009028679019464750_n. (1).png", category: "Events", title: "Annual Sports Meet" },
    { src: "/gallery/573564126_17884547421394797_4917545577562699784_n.png", category: "Campus", title: "Green Campus View" },
    { src: "/banners/cse.png", category: "Departments", title: "CSE Department" },
    { src: "/banners/ece.png", category: "Departments", title: "ECE Department" },
    { src: "/banners/it.png", category: "Departments", title: "IT Department" },
    { src: "/banners/global-stage.png", category: "Campus", title: "NRIIT Global Stage" },
    { src: "/gallery/CORRECT BUILDING FRO M NRIIT TO GLOBAL.png", category: "Campus", title: "Main Building" },
];

const categories = ["All", "Campus", "Labs", "Events", "Awards", "Departments", "Sports"];

const categoryColors: { [key: string]: string } = {
    "All": "from-[#D4AF37] to-[#F5A201]",
    "Campus": "from-blue-500 to-indigo-600",
    "Labs": "from-emerald-500 to-teal-600",
    "Events": "from-violet-500 to-purple-600",
    "Awards": "from-[#D4AF37] to-[#F5A201]",
    "Departments": "from-rose-500 to-pink-600",
    "Sports": "from-orange-500 to-amber-600",
};

export default function GalleryPage() {
    const [selectedCategory, setSelectedCategory] = useState("All");
    const [selectedImage, setSelectedImage] = useState<typeof allImages[0] | null>(null);

    const filteredImages = selectedCategory === "All"
        ? allImages
        : allImages.filter(img => img.category === selectedCategory);

    return (
        <>
            {/* Hero Section - Premium Dark Navy + Gold */}
            <section className="pt-32 pb-20 bg-gradient-to-br from-[#0F172A] via-[#1e293b] to-[#0F172A] relative overflow-hidden">
                <div className="absolute inset-0 bg-[url('/pattern.svg')] opacity-5" />
                <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-[#D4AF37]/10 rounded-full blur-[150px]" />
                <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-violet-500/10 rounded-full blur-[150px]" />

                <div className="container mx-auto px-4 relative z-10">
                    <div className="max-w-3xl mx-auto text-center">
                        <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[#D4AF37]/20 border border-[#D4AF37]/30 text-[#D4AF37] text-sm font-bold tracking-wide mb-6">
                            <Camera className="w-4 h-4" />
                            Visual Journey
                        </div>
                        <h1 className="text-4xl md:text-6xl font-black text-white mb-6">
                            NRIIT <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] to-[#FFE082]">Gallery</span>
                        </h1>
                        <p className="text-xl text-slate-300 mb-8">
                            A glimpse into the life, culture, and world-class infrastructure at NRI Institute of Technology.
                        </p>
                        <div className="flex justify-center gap-4">
                            <Link
                                href="/virtual-tour"
                                className="inline-flex items-center gap-2 px-6 py-3 bg-white/10 hover:bg-white/20 text-white rounded-xl font-bold backdrop-blur-sm border border-white/20 transition-all"
                            >
                                <Play className="w-5 h-5" />
                                Virtual Tour
                            </Link>
                        </div>
                    </div>
                </div>

                {/* Decorative Images */}
                <div className="absolute bottom-0 left-0 right-0 h-20 bg-gradient-to-t from-slate-50 to-transparent" />
            </section>

            {/* Gallery Content */}
            <section className="py-16 bg-slate-50">
                <div className="container mx-auto px-4">
                    {/* Category Filters */}
                    <div className="flex flex-wrap justify-center gap-3 mb-12">
                        {categories.map((cat) => (
                            <button
                                key={cat}
                                onClick={() => setSelectedCategory(cat)}
                                className={`px-6 py-3 rounded-xl text-sm font-bold transition-all duration-300 border-2 ${selectedCategory === cat
                                        ? `bg-gradient-to-r ${categoryColors[cat]} text-white border-transparent shadow-lg`
                                        : "bg-white text-slate-600 border-slate-200 hover:border-[#D4AF37] hover:text-[#D4AF37]"
                                    }`}
                            >
                                {cat}
                            </button>
                        ))}
                    </div>

                    {/* Image Count */}
                    <div className="text-center mb-8">
                        <span className="text-slate-500">Showing <span className="font-bold text-[#D4AF37]">{filteredImages.length}</span> images</span>
                    </div>

                    {/* Grid */}
                    <motion.div
                        layout
                        className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6"
                    >
                        <AnimatePresence mode='popLayout'>
                            {filteredImages.map((image) => (
                                <motion.div
                                    key={image.src}
                                    layout
                                    initial={{ opacity: 0, scale: 0.9 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    exit={{ opacity: 0, scale: 0.9 }}
                                    transition={{ duration: 0.3 }}
                                    className="group relative aspect-square rounded-2xl overflow-hidden bg-white shadow-lg hover:shadow-2xl transition-all duration-500 cursor-zoom-in border-2 border-transparent hover:border-[#D4AF37]"
                                    onClick={() => setSelectedImage(image)}
                                >
                                    <img
                                        src={image.src}
                                        alt={image.title}
                                        className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                                        onError={(e) => {
                                            e.currentTarget.src = `https://placehold.co/600x600/0F172A/D4AF37?text=${image.category}`;
                                        }}
                                    />
                                    <div className="absolute inset-0 bg-gradient-to-t from-[#0F172A] via-black/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col justify-end p-6">
                                        <span className={`text-[#D4AF37] text-xs font-bold uppercase tracking-wider mb-1`}>{image.category}</span>
                                        <h3 className="text-white font-bold text-lg">{image.title}</h3>
                                        <div className="absolute top-4 right-4 w-10 h-10 rounded-full bg-[#D4AF37]/20 backdrop-blur-md flex items-center justify-center text-white border border-[#D4AF37]/50">
                                            <Maximize2 className="w-4 h-4" />
                                        </div>
                                    </div>
                                </motion.div>
                            ))}
                        </AnimatePresence>
                    </motion.div>
                </div>
            </section>

            {/* CTA Section */}
            <section className="py-16 bg-gradient-to-r from-[#013C58] to-[#00537A]">
                <div className="container mx-auto px-4 text-center">
                    <h2 className="text-3xl md:text-4xl font-black text-white mb-4">Experience Campus Life</h2>
                    <p className="text-slate-300 mb-8 max-w-2xl mx-auto">
                        Take a virtual tour of our world-class facilities and vibrant campus.
                    </p>
                    <Link
                        href="/virtual-tour"
                        className="inline-flex items-center gap-2 px-8 py-4 bg-[#D4AF37] hover:bg-[#FFE082] text-[#0F172A] rounded-2xl font-bold transition-all hover:scale-105"
                    >
                        <Play className="w-5 h-5" />
                        Start Virtual Tour
                    </Link>
                </div>
            </section>

            {/* Lightbox */}
            <AnimatePresence>
                {selectedImage && (
                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="fixed inset-0 z-[100] bg-[#0F172A]/95 backdrop-blur-xl flex items-center justify-center p-4 md:p-10"
                        onClick={() => setSelectedImage(null)}
                    >
                        <button
                            className="absolute top-6 right-6 w-12 h-12 rounded-full bg-[#D4AF37]/20 hover:bg-[#D4AF37]/40 text-white flex items-center justify-center transition-colors border border-[#D4AF37]/50"
                            onClick={() => setSelectedImage(null)}
                        >
                            <X className="w-6 h-6" />
                        </button>

                        <motion.div
                            initial={{ scale: 0.9, y: 20 }}
                            animate={{ scale: 1, y: 0 }}
                            exit={{ scale: 0.9, y: 20 }}
                            className="relative max-w-5xl w-full h-full flex flex-col items-center justify-center"
                            onClick={(e) => e.stopPropagation()}
                        >
                            <img
                                src={selectedImage.src}
                                alt={selectedImage.title}
                                className="max-w-full max-h-[80vh] object-contain rounded-2xl shadow-2xl border-4 border-white/10"
                                onError={(e) => {
                                    e.currentTarget.src = `https://placehold.co/1200x800/0F172A/D4AF37?text=${selectedImage.title}`;
                                }}
                            />
                            <div className="mt-8 text-center text-white">
                                <span className="text-[#D4AF37] text-sm font-bold uppercase tracking-widest block mb-2">{selectedImage.category}</span>
                                <h2 className="text-2xl md:text-3xl font-bold">{selectedImage.title}</h2>
                            </div>
                        </motion.div>
                    </motion.div>
                )}
            </AnimatePresence>
        </>
    );
}
