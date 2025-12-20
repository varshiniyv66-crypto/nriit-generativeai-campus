"use client";

import { cn } from "@/lib/utils";

// Base skeleton with shimmer animation
function Skeleton({
    className,
    ...props
}: React.HTMLAttributes<HTMLDivElement>) {
    return (
        <div
            className={cn(
                "animate-pulse rounded-md bg-gradient-to-r from-gray-200 via-gray-300 to-gray-200 dark:from-gray-700 dark:via-gray-600 dark:to-gray-700 bg-[length:200%_100%] animate-shimmer",
                className
            )}
            {...props}
        />
    );
}

// Dashboard skeleton
function DashboardSkeleton() {
    return (
        <div className="space-y-6 p-6 animate-in fade-in duration-500">
            {/* Header Skeleton */}
            <div className="rounded-2xl bg-gradient-to-r from-gray-200 to-gray-300 dark:from-gray-800 dark:to-gray-700 p-8">
                <Skeleton className="h-8 w-64 mb-2" />
                <Skeleton className="h-4 w-48" />
                <div className="flex gap-4 mt-4">
                    <Skeleton className="h-4 w-32" />
                    <Skeleton className="h-4 w-24" />
                </div>
            </div>

            {/* AI Card Skeleton */}
            <div className="rounded-xl bg-gradient-to-r from-gray-200 to-gray-300 dark:from-gray-800 dark:to-gray-700 p-6">
                <div className="flex items-center gap-3 mb-4">
                    <Skeleton className="h-10 w-10 rounded-lg" />
                    <Skeleton className="h-6 w-40" />
                </div>
                <div className="grid md:grid-cols-3 gap-4">
                    {[1, 2, 3].map((i) => (
                        <div key={i} className="p-4 rounded-xl bg-white/10">
                            <Skeleton className="h-4 w-24 mb-2" />
                            <Skeleton className="h-3 w-full mb-1" />
                            <Skeleton className="h-3 w-3/4" />
                        </div>
                    ))}
                </div>
            </div>

            {/* Stats Grid Skeleton */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                {[1, 2, 3, 4].map((i) => (
                    <div key={i} className="rounded-xl border p-4 bg-white dark:bg-gray-900">
                        <div className="flex justify-between items-start mb-4">
                            <Skeleton className="h-4 w-20" />
                            <Skeleton className="h-10 w-10 rounded-lg" />
                        </div>
                        <Skeleton className="h-8 w-16 mb-2" />
                        <Skeleton className="h-2 w-full rounded-full" />
                    </div>
                ))}
            </div>

            {/* Chart Skeletons */}
            <div className="grid lg:grid-cols-3 gap-6">
                <div className="lg:col-span-2 space-y-6">
                    {/* Chart 1 */}
                    <div className="rounded-xl border p-6 bg-white dark:bg-gray-900">
                        <div className="flex justify-between items-center mb-4">
                            <Skeleton className="h-5 w-32" />
                            <Skeleton className="h-8 w-24 rounded-lg" />
                        </div>
                        <Skeleton className="h-48 w-full rounded-lg" />
                    </div>
                    {/* Chart 2 */}
                    <div className="rounded-xl border p-6 bg-white dark:bg-gray-900">
                        <Skeleton className="h-5 w-40 mb-4" />
                        <Skeleton className="h-56 w-full rounded-lg" />
                    </div>
                </div>
                <div className="space-y-6">
                    {/* Side cards */}
                    {[1, 2, 3].map((i) => (
                        <div key={i} className="rounded-xl border p-4 bg-white dark:bg-gray-900">
                            <Skeleton className="h-5 w-28 mb-4" />
                            <div className="space-y-3">
                                {[1, 2, 3].map((j) => (
                                    <div key={j} className="flex items-center gap-3">
                                        <Skeleton className="h-10 w-10 rounded-full" />
                                        <div className="flex-1">
                                            <Skeleton className="h-4 w-24 mb-1" />
                                            <Skeleton className="h-3 w-16" />
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}

// Card skeleton
function CardSkeleton({ className }: { className?: string }) {
    return (
        <div className={cn("rounded-xl border p-4 bg-white dark:bg-gray-900", className)}>
            <div className="flex justify-between items-start mb-4">
                <Skeleton className="h-4 w-24" />
                <Skeleton className="h-8 w-8 rounded-lg" />
            </div>
            <Skeleton className="h-8 w-20 mb-2" />
            <Skeleton className="h-2 w-full rounded-full" />
            <Skeleton className="h-3 w-16 mt-2" />
        </div>
    );
}

// Chart skeleton
function ChartSkeleton({ height = 200 }: { height?: number }) {
    return (
        <div className="rounded-xl border p-6 bg-white dark:bg-gray-900">
            <div className="flex justify-between items-center mb-4">
                <Skeleton className="h-5 w-36" />
            </div>
            <Skeleton className={`w-full rounded-lg`} style={{ height }} />
        </div>
    );
}

// Table skeleton
function TableSkeleton({ rows = 5 }: { rows?: number }) {
    return (
        <div className="rounded-xl border overflow-hidden bg-white dark:bg-gray-900">
            <div className="p-4 border-b">
                <Skeleton className="h-5 w-32" />
            </div>
            <div className="divide-y">
                {Array.from({ length: rows }).map((_, i) => (
                    <div key={i} className="p-4 flex items-center gap-4">
                        <Skeleton className="h-10 w-10 rounded-full" />
                        <div className="flex-1 space-y-2">
                            <Skeleton className="h-4 w-3/4" />
                            <Skeleton className="h-3 w-1/2" />
                        </div>
                        <Skeleton className="h-6 w-16 rounded-full" />
                    </div>
                ))}
            </div>
        </div>
    );
}

export { Skeleton, DashboardSkeleton, CardSkeleton, ChartSkeleton, TableSkeleton };
