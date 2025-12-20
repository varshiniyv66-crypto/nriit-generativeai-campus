"use client";

import { useEffect, useState } from "react";

interface Sparkle {
    id: number;
    x: number;
    y: number;
    size: number;
    color: string;
}

export function MouseSparkles() {
    const [sparkles, setSparkles] = useState<Sparkle[]>([]);

    useEffect(() => {
        let count = 0;
        const colors = ["#FFD700", "#F5A201", "#00537A", "#0EA5E9"];

        const handleMouseMove = (e: MouseEvent) => {
            // Create a sparkle occasionally (reduced frequency)
            if (Math.random() < 0.90) return; // Only 10% chance to run

            const newSparkle: Sparkle = {
                id: count++,
                x: e.clientX,
                y: e.clientY + window.scrollY, // Account for scroll
                size: Math.random() * 5 + 2,
                color: colors[Math.floor(Math.random() * colors.length)]
            };

            setSparkles(prev => [...prev, newSparkle]);

            // Remove sparkle after 1s
            setTimeout(() => {
                setSparkles(prev => prev.filter(s => s.id !== newSparkle.id));
            }, 800);
        };

        const handleClick = (e: MouseEvent) => {
            // Burst of sparkles
            const burst = Array.from({ length: 8 }).map((_, i) => ({
                id: count++,
                x: e.clientX + (Math.random() - 0.5) * 20,
                y: e.clientY + window.scrollY + (Math.random() - 0.5) * 20,
                size: Math.random() * 8 + 4,
                color: colors[Math.floor(Math.random() * colors.length)]
            }));

            setSparkles(prev => [...prev, ...burst]);
            setTimeout(() => {
                setSparkles(prev => prev.filter(s => !burst.find(b => b.id === s.id)));
            }, 800);
        };

        window.addEventListener("mousemove", handleMouseMove);
        window.addEventListener("click", handleClick);

        return () => {
            window.removeEventListener("mousemove", handleMouseMove);
            window.removeEventListener("click", handleClick);
        };
    }, []);

    return (
        <div className="pointer-events-none fixed inset-0 z-[9999] overflow-hidden">
            {sparkles.map(s => (
                <span
                    key={s.id}
                    style={{
                        left: s.x,
                        top: s.y - window.scrollY, // Fixed position relative to viewport
                        width: s.size,
                        height: s.size,
                        backgroundColor: s.color,
                    }}
                    className="absolute rounded-full animate-ping opacity-75"
                />
            ))}
        </div>
    );
}
