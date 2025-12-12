import type { Metadata } from "next";
import { Inter, Outfit } from "next/font/google";
import "./globals.css";
import { Toaster } from "@/components/ui/sonner";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

const outfit = Outfit({
  subsets: ["latin"],
  variable: "--font-outfit",
});

export const metadata: Metadata = {
  title: {
    default: "NRI Institute of Technology | NRIIT Vijayawada",
    template: "%s | NRIIT",
  },
  description: "NRI Institute of Technology (NRIIT) is a premier engineering college in Vijayawada, Andhra Pradesh, offering NBA accredited B.Tech, M.Tech, MBA, and MCA programs with excellent placements and world-class infrastructure.",
  keywords: [
    "NRIIT",
    "NRI Institute of Technology",
    "Engineering College Vijayawada",
    "B.Tech Andhra Pradesh",
    "CSE",
    "IT",
    "ECE",
    "Civil Engineering",
    "MBA",
    "MCA",
    "JNTUK",
    "NBA Accredited",
    "Best Engineering College AP",
  ],
  authors: [{ name: "NRI Institute of Technology" }],
  creator: "NRIIT",
  publisher: "NRI Institute of Technology",
  formatDetection: {
    email: false,
    address: false,
    telephone: false,
  },
  metadataBase: new URL(process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000"),
  alternates: {
    canonical: "/",
  },
  openGraph: {
    title: "NRI Institute of Technology | Excellence in Technical Education",
    description: "Premier engineering college in Vijayawada offering NBA accredited programs with excellent placements and industry partnerships.",
    url: "/",
    siteName: "NRI Institute of Technology",
    images: [
      {
        url: "/og-image.jpg",
        width: 1200,
        height: 630,
        alt: "NRI Institute of Technology Campus",
      },
    ],
    locale: "en_IN",
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "NRI Institute of Technology | NRIIT",
    description: "Premier engineering college in Vijayawada, Andhra Pradesh",
    images: ["/og-image.jpg"],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
  icons: {
    icon: "/favicon.ico",
    shortcut: "/favicon-16x16.png",
    apple: "/apple-touch-icon.png",
  },
  manifest: "/site.webmanifest",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body
        className={`${inter.variable} ${outfit.variable} font-sans min-h-screen`}
      >
        {children}
        <Toaster position="top-right" richColors closeButton />
      </body>
    </html>
  );
}
