"use client";

import { Users, BookOpen, ClipboardCheck, TrendingUp, Calendar, Award, FileText, UserCheck } from "lucide-react";

const stats = [
    { title: "Total Faculty", value: "18", change: "+2", icon: Users, color: "blue" },
    { title: "Students", value: "420", change: "+15", icon: UserCheck, color: "green" },
    { title: "Courses", value: "24", change: "0", icon: BookOpen, color: "purple" },
    { title: "Attendance", value: "87%", change: "+3%", icon: ClipboardCheck, color: "amber" },
];

const recentActivities = [
    { title: "Faculty meeting scheduled", time: "2 hours ago", type: "meeting" },
    { title: "Result verification pending - III Year", time: "4 hours ago", type: "result" },
    { title: "Dr. Kumar submitted leave application", time: "5 hours ago", type: "leave" },
    { title: "New syllabus uploaded for DSA", time: "Yesterday", type: "syllabus" },
    { title: "Industry visit approval pending", time: "Yesterday", type: "approval" },
];

const pendingTasks = [
    { title: "Review faculty performance reports", deadline: "Dec 10", priority: "high" },
    { title: "Submit NBA criterion 3 data", deadline: "Dec 15", priority: "high" },
    { title: "Approve lab equipment requisition", deadline: "Dec 12", priority: "medium" },
    { title: "Sign student bonafide certificates", deadline: "Dec 20", priority: "low" },
];

export default function HODDashboardPage() {
    return (
        <div className="space-y-6">
            {/* Header */}
            <div>
                <h1 className="text-2xl font-bold text-gray-900">HOD Dashboard</h1>
                <p className="text-gray-600">Computer Science & Engineering Department</p>
            </div>

            {/* Stats Grid */}
            <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
                {stats.map((stat) => (
                    <div
                        key={stat.title}
                        className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100"
                    >
                        <div className="flex items-center justify-between mb-4">
                            <div className={`w-12 h-12 rounded-xl flex items-center justify-center ${stat.color === "blue" ? "bg-blue-100 text-blue-600" :
                                    stat.color === "green" ? "bg-green-100 text-green-600" :
                                        stat.color === "purple" ? "bg-purple-100 text-purple-600" :
                                            "bg-amber-100 text-amber-600"
                                }`}>
                                <stat.icon className="w-6 h-6" />
                            </div>
                            <span className="text-sm font-medium text-green-600 bg-green-50 px-2 py-1 rounded-full">
                                {stat.change}
                            </span>
                        </div>
                        <div className="text-3xl font-bold text-gray-900 mb-1">{stat.value}</div>
                        <div className="text-sm text-gray-500">{stat.title}</div>
                    </div>
                ))}
            </div>

            {/* Content Grid */}
            <div className="grid lg:grid-cols-2 gap-6">
                {/* Recent Activities */}
                <div className="bg-white rounded-2xl shadow-sm border border-gray-100">
                    <div className="p-6 border-b border-gray-100">
                        <h2 className="text-lg font-semibold text-gray-900 flex items-center gap-2">
                            <Calendar className="w-5 h-5 text-blue-600" />
                            Recent Activities
                        </h2>
                    </div>
                    <div className="p-4">
                        <div className="space-y-3">
                            {recentActivities.map((activity, index) => (
                                <div
                                    key={index}
                                    className="flex items-center gap-4 p-3 rounded-xl hover:bg-gray-50 transition-colors"
                                >
                                    <div className={`w-2 h-2 rounded-full ${activity.type === "meeting" ? "bg-blue-500" :
                                            activity.type === "result" ? "bg-purple-500" :
                                                activity.type === "leave" ? "bg-amber-500" :
                                                    activity.type === "syllabus" ? "bg-green-500" :
                                                        "bg-red-500"
                                        }`} />
                                    <div className="flex-1">
                                        <p className="text-sm font-medium text-gray-900">{activity.title}</p>
                                        <p className="text-xs text-gray-500">{activity.time}</p>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>

                {/* Pending Tasks */}
                <div className="bg-white rounded-2xl shadow-sm border border-gray-100">
                    <div className="p-6 border-b border-gray-100">
                        <h2 className="text-lg font-semibold text-gray-900 flex items-center gap-2">
                            <FileText className="w-5 h-5 text-blue-600" />
                            Pending Tasks
                        </h2>
                    </div>
                    <div className="p-4">
                        <div className="space-y-3">
                            {pendingTasks.map((task, index) => (
                                <div
                                    key={index}
                                    className="flex items-center gap-4 p-3 rounded-xl hover:bg-gray-50 transition-colors"
                                >
                                    <div className={`px-2 py-1 rounded text-xs font-medium ${task.priority === "high" ? "bg-red-100 text-red-700" :
                                            task.priority === "medium" ? "bg-amber-100 text-amber-700" :
                                                "bg-green-100 text-green-700"
                                        }`}>
                                        {task.priority}
                                    </div>
                                    <div className="flex-1">
                                        <p className="text-sm font-medium text-gray-900">{task.title}</p>
                                        <p className="text-xs text-gray-500">Due: {task.deadline}</p>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </div>

            {/* Quick Actions */}
            <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
                <h2 className="text-lg font-semibold text-gray-900 mb-4">Quick Actions</h2>
                <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4">
                    {[
                        { label: "View Faculty", icon: Users, href: "/hod/faculty" },
                        { label: "Manage Courses", icon: BookOpen, href: "/hod/courses" },
                        { label: "Check Attendance", icon: ClipboardCheck, href: "/hod/attendance" },
                        { label: "Generate Reports", icon: TrendingUp, href: "/hod/reports" },
                    ].map((action) => (
                        <a
                            key={action.label}
                            href={action.href}
                            className="flex items-center gap-3 p-4 rounded-xl border border-gray-200 hover:border-blue-500 hover:bg-blue-50 transition-all group"
                        >
                            <action.icon className="w-5 h-5 text-gray-400 group-hover:text-blue-600" />
                            <span className="text-sm font-medium text-gray-700 group-hover:text-blue-700">
                                {action.label}
                            </span>
                        </a>
                    ))}
                </div>
            </div>
        </div>
    );
}
