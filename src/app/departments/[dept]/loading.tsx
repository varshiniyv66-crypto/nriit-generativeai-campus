import { Skeleton } from "@/components/ui/skeleton";

export default function Loading() {
    return (
        <div className="space-y-8 p-6 animate-pulse">
            {/* Banner Skeleton */}
            <div className="relative h-72 md:h-96 rounded-3xl overflow-hidden bg-slate-200 dark:bg-slate-800">
                <div className="absolute inset-0 flex flex-col justify-center px-16 space-y-4">
                    <Skeleton className="h-8 w-32 bg-slate-300/50" />
                    <Skeleton className="h-16 w-3/4 bg-slate-300/50" />
                    <Skeleton className="h-6 w-1/2 bg-slate-300/50" />
                </div>
            </div>

            {/* Tabs Skeleton */}
            <div className="flex gap-2">
                {[1, 2, 3, 4, 5, 6].map((i) => (
                    <Skeleton key={i} className="h-12 w-32 rounded-lg bg-slate-200 dark:bg-slate-800" />
                ))}
            </div>

            {/* Content Skeleton */}
            <div className="grid md:grid-cols-3 gap-8">
                <Skeleton className="h-[400px] rounded-2xl bg-slate-200 dark:bg-slate-800 md:col-span-1" />
                <div className="md:col-span-2 space-y-8">
                    <Skeleton className="h-[200px] rounded-2xl bg-slate-200 dark:bg-slate-800" />
                    <div className="grid grid-cols-2 gap-8">
                        <Skeleton className="h-[150px] rounded-2xl bg-slate-200 dark:bg-slate-800" />
                        <Skeleton className="h-[150px] rounded-2xl bg-slate-200 dark:bg-slate-800" />
                    </div>
                </div>
            </div>
        </div>
    );
}
