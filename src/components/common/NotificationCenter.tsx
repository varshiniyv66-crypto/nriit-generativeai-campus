import { useState } from 'react';
import { Bell, Check, Clock, AlertTriangle, Info } from 'lucide-react';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuTrigger,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator
} from '@/components/ui/dropdown-menu';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { cn } from '@/lib/utils';

interface Notification {
    id: string;
    title: string;
    message: string;
    time: string;
    type: 'info' | 'warning' | 'success' | 'alert';
    read: boolean;
}

interface NotificationCenterProps {
    role: 'dean' | 'faculty' | 'student';
}

export function NotificationCenter({ role }: NotificationCenterProps) {
    // Simulated Real-Time Data based on Role
    const initialNotifications: Notification[] = role === 'dean'
        ? [
            { id: '1', title: 'Critical Alert', message: 'CSE attendance dropped below 65% today.', time: '10 min ago', type: 'alert', read: false },
            { id: '2', title: 'New Registration', message: 'Dr. Rajesh Kumar (ECE) completed onboarding.', time: '2 hours ago', type: 'success', read: false },
            { id: '3', title: 'System Update', message: 'Q3 Analytics Report is ready for review.', time: '5 hours ago', type: 'info', read: true },
            { id: '4', title: 'Budget Request', message: 'MECH Dept requested lab equipment approval.', time: '1 day ago', type: 'warning', read: true },
        ]
        : role === 'faculty'
            ? [
                { id: '1', title: 'Detention Risk', message: '3 students in CSE-B have low attendance.', time: '5 min ago', type: 'alert', read: false },
                { id: '2', title: 'Class Reminder', message: 'Computer Networks (CSE-A) starts in 15 mins.', time: '15 min ago', type: 'info', read: false },
                { id: '3', title: 'Assignment Submission', message: '45/60 students submitted Assignment #2.', time: '3 hours ago', type: 'success', read: true },
            ]
            : [
                { id: '1', title: 'Attendance Warning', message: 'Your attendance in Web Tech is 71%.', time: '2 hours ago', type: 'alert', read: false },
                { id: '2', title: 'Exam Schedule', message: 'Mid-2 timetable has been released.', time: '4 hours ago', type: 'info', read: false },
                { id: '3', title: 'Fee Due', message: 'Tuition fee deadline is approaching (15th Dec).', time: '1 day ago', type: 'warning', read: true },
                { id: '4', title: 'Great Job!', message: 'You topped the class in Data Mining Quiz.', time: '2 days ago', type: 'success', read: true },
            ];

    const [notifications, setNotifications] = useState<Notification[]>(initialNotifications);
    const unreadCount = notifications.filter(n => !n.read).length;

    const markAsRead = (id: string, e: React.MouseEvent) => {
        e.preventDefault();
        setNotifications(notifications.map(n => n.id === id ? { ...n, read: true } : n));
    };

    const markAllRead = () => {
        setNotifications(notifications.map(n => ({ ...n, read: true })));
    };

    const getIcon = (type: Notification['type']) => {
        switch (type) {
            case 'alert': return <AlertTriangle className="h-4 w-4 text-red-500" />;
            case 'warning': return <Clock className="h-4 w-4 text-amber-500" />;
            case 'success': return <Check className="h-4 w-4 text-green-500" />;
            default: return <Info className="h-4 w-4 text-blue-500" />;
        }
    };

    return (
        <DropdownMenu>
            <DropdownMenuTrigger asChild>
                <button className="relative p-2 rounded-full hover:bg-slate-800 transition-colors focus:outline-none ring-offset-slate-900 focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    <Bell className="h-5 w-5 text-slate-300" />
                    {unreadCount > 0 && (
                        <span className="absolute top-1.5 right-1.5 flex h-2.5 w-2.5">
                            <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
                            <span className="relative inline-flex rounded-full h-2.5 w-2.5 bg-red-500 border-2 border-slate-900"></span>
                        </span>
                    )}
                </button>
            </DropdownMenuTrigger>
            <DropdownMenuContent className="w-80 bg-slate-900 border-slate-700 text-slate-200 shadow-xl mr-4" align="end">
                <DropdownMenuLabel className="flex items-center justify-between p-4 pb-2">
                    <span>Notifications</span>
                    {unreadCount > 0 && (
                        <span
                            onClick={markAllRead}
                            className="text-xs text-indigo-400 hover:text-indigo-300 cursor-pointer"
                        >
                            Mark all read
                        </span>
                    )}
                </DropdownMenuLabel>
                <DropdownMenuSeparator className="bg-slate-800" />

                <div className="h-[350px] overflow-y-auto">
                    {notifications.length === 0 ? (
                        <div className="flex flex-col items-center justify-center h-40 text-slate-500">
                            <Bell className="h-8 w-8 mb-2 opacity-50" />
                            <p className="text-sm">No new notifications</p>
                        </div>
                    ) : (
                        <>
                            {notifications.map((notification) => (
                                <div
                                    key={notification.id}
                                    className={cn(
                                        "p-4 hover:bg-slate-800/50 transition-colors cursor-pointer relative border-b border-slate-800 last:border-0",
                                        !notification.read && "bg-slate-800/30"
                                    )}
                                    onClick={(e) => markAsRead(notification.id, e)}
                                >
                                    <div className="flex gap-3">
                                        <div className={cn(
                                            "mt-1 h-8 w-8 rounded-full flex items-center justify-center shrink-0",
                                            notification.type === 'alert' && "bg-red-500/10",
                                            notification.type === 'warning' && "bg-amber-500/10",
                                            notification.type === 'success' && "bg-green-500/10",
                                            notification.type === 'info' && "bg-blue-500/10",
                                        )}>
                                            {getIcon(notification.type)}
                                        </div>
                                        <div className="flex-1 space-y-1">
                                            <p className={cn("text-sm font-medium leading-none", !notification.read ? "text-slate-100" : "text-slate-400")}>
                                                {notification.title}
                                            </p>
                                            <p className="text-xs text-slate-400 leading-snug">
                                                {notification.message}
                                            </p>
                                            <p className="text-[10px] text-slate-500 pt-1">
                                                {notification.time}
                                            </p>
                                        </div>
                                        {!notification.read && (
                                            <div className="mt-2 h-2 w-2 rounded-full bg-indigo-500 shrink-0" />
                                        )}
                                    </div>
                                </div>
                            ))}
                        </>
                    )}
                </div>

                <DropdownMenuSeparator className="bg-slate-800" />
                <div className="p-2 text-center">
                    <Button variant="ghost" size="sm" className="w-full text-xs text-slate-400 hover:text-white h-8">
                        View All History
                    </Button>
                </div>
            </DropdownMenuContent>
        </DropdownMenu>
    );
}
