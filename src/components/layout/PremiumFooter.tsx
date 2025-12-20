"use client";

import Link from "next/link";
import { Globe, MapPin, Phone, Mail } from "lucide-react";

export default function PremiumFooter() {
    return (
        <footer className="bg-royal-rich text-slate-400 border-t border-slate-800 pt-20 pb-10">
            <div className="container mx-auto px-4">
                <div className="grid md:grid-cols-5 gap-12 mb-16">
                    <div className="col-span-1 md:col-span-2">
                        <Link href="/" className="flex items-center gap-3 mb-6">
                            <div className="w-10 h-10 rounded-lg bg-gradient-to-br from-[#D4AF37] to-[#B76E79] flex items-center justify-center text-[#0F172A] font-bold text-xl shadow-lg ring-1 ring-white/10">N</div>
                            <span className="text-2xl font-bold text-white tracking-tight">NRIIT</span>
                        </Link>
                        <p className="text-slate-400 max-w-sm leading-relaxed mb-6">
                            Empowering students with knowledge, skills, and values to become global leaders in technology and innovation.
                        </p>
                        <div className="flex gap-4">
                            {['twitter', 'facebook', 'linkedin', 'instagram'].map(social => (
                                <a key={social} href="#" className="w-10 h-10 rounded-full bg-white/5 flex items-center justify-center hover:bg-[#D4AF37] hover:text-[#0F172A] transition-all border border-white/5">
                                    <Globe className="w-4 h-4" />
                                </a>
                            ))}
                        </div>
                    </div>

                    <div>
                        <h4 className="text-white font-bold mb-6 tracking-wide">Quick Links</h4>
                        <ul className="space-y-4 text-sm">
                            <li><Link href="/admissions" className="hover:text-[#D4AF37] transition-colors">Admissions 2025</Link></li>
                            <li><Link href="/placements" className="hover:text-[#D4AF37] transition-colors">Placement Records</Link></li>
                            <li><Link href="/accreditation" className="hover:text-[#D4AF37] transition-colors">Accreditations</Link></li>
                            <li><Link href="/sitemap" className="hover:text-[#D4AF37] transition-colors font-bold text-white/50">Sitemap</Link></li>
                        </ul>
                    </div>

                    <div>
                        <h4 className="text-white font-bold mb-6 tracking-wide">Contact</h4>
                        <ul className="space-y-4 text-sm">
                            <li className="flex items-center gap-3">
                                <MapPin className="w-4 h-4 text-[#D4AF37]" /> Visadala, Guntur - 522438
                            </li>
                            <li className="flex items-center gap-3">
                                <Phone className="w-4 h-4 text-[#D4AF37]" /> 0863 234 4300
                            </li>
                            <li className="flex items-center gap-3">
                                <Mail className="w-4 h-4 text-[#D4AF37]" /> admissions@nriit.ac.in
                            </li>
                        </ul>
                    </div>

                    <div className="col-span-1 h-48 rounded-2xl overflow-hidden border border-white/10 shadow-lg">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3826.6646879207886!2d80.35416037515096!3d16.441857984285786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a4a755cb1787785%3A0x9f7999dd90f1e694!2sNRI%20Institute%20of%20Technology!5e0!3m2!1sen!2sin!4v1703080000000!5m2!1sen!2sin"
                            width="100%"
                            height="100%"
                            style={{ border: 0 }}
                            allowFullScreen
                            loading="lazy"
                            referrerPolicy="no-referrer-when-downgrade"
                        ></iframe>
                    </div>
                </div>

                <div className="border-t border-white/5 pt-8 flex flex-col md:flex-row justify-between items-center gap-4 text-xs">
                    <p>&copy; 2025 NRI Institute of Technology. All rights reserved.</p>
                    <div className="flex gap-6">
                        <Link href="/privacy" className="hover:text-[#D4AF37]">Privacy Policy</Link>
                        <Link href="/terms" className="hover:text-[#D4AF37]">Terms of Use</Link>
                        <Link href="/sitemap" className="hover:text-[#D4AF37]">Sitemap</Link>
                    </div>
                </div>
            </div>
        </footer>
    );
}
