import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle
} from "@/components/ui/card";
import { Users, GraduationCap, Building2, CreditCard, Activity, ArrowUp, ArrowDown } from "lucide-react";
import { Progress } from "@/components/ui/progress";

export default function AdminDashboard() {
    return (
        <div className="space-y-8 animate-fade-in-up">
            <div>
                <h1 className="text-2xl font-bold text-gray-900">Admin Dashboard</h1>
                <p className="text-gray-500">Overview of institute performance and metrics.</p>
            </div>

            {/* KPI Cards */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <Card className="border-l-4 border-l-blue-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-500">Total Students</CardTitle>
                        <GraduationCap className="h-4 w-4 text-blue-500" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-gray-900">4,250</div>
                        <p className="text-xs text-green-600 mt-2 flex items-center gap-1">
                            <ArrowUp className="w-3 h-3" /> +12% from last year
                        </p>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-indigo-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-500">Faculty Strength</CardTitle>
                        <Users className="h-4 w-4 text-indigo-500" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-gray-900">328</div>
                        <p className="text-xs text-green-600 mt-2 flex items-center gap-1">
                            <ArrowUp className="w-3 h-3" /> +5% new joiners
                        </p>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-green-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-500">Fee Collection</CardTitle>
                        <CreditCard className="h-4 w-4 text-green-500" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-gray-900">₹8.4 Cr</div>
                        <div className="flex items-center justify-between text-xs mt-2">
                            <span className="text-gray-500">Target: ₹10 Cr</span>
                            <span className="text-blue-600 font-medium">84%</span>
                        </div>
                        <Progress value={84} className="h-1 mt-1 bg-green-100" />
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-amber-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-gray-500">Avg Attendance</CardTitle>
                        <Activity className="h-4 w-4 text-amber-500" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-gray-900">78.2%</div>
                        <p className="text-xs text-red-600 mt-2 flex items-center gap-1">
                            <ArrowDown className="w-3 h-3" /> -2% from last week
                        </p>
                    </CardContent>
                </Card>
            </div>

            {/* Charts Section Placeholder */}
            <div className="grid lg:grid-cols-2 gap-8">
                <Card>
                    <CardHeader>
                        <CardTitle>Department Performance</CardTitle>
                        <CardDescription>Average pass percentage by department</CardDescription>
                    </CardHeader>
                    <CardContent className="h-[300px] flex items-center justify-center bg-gray-50 rounded-lg">
                        <p className="text-gray-400">Chart Component Placeholder</p>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader>
                        <CardTitle>Recent Activities</CardTitle>
                        <CardDescription>System-wide logs and events</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-4">
                            {[
                                { user: 'Dr. Smith', action: 'Uploaded Marks', target: 'CSE-III-A', time: '10 mins ago' },
                                { user: 'Admin User', action: 'Approved Leave', target: 'J. Doe', time: '1 hour ago' },
                                { user: 'System', action: 'Sent SMS Alerts', target: 'Low Attendance', time: '2 hours ago' },
                                { user: 'Accounts', action: 'Generated Report', target: 'Fee Dues', time: '4 hours ago' },
                            ].map((log, i) => (
                                <div key={i} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg text-sm">
                                    <div>
                                        <span className="font-semibold text-gray-900">{log.user}</span>
                                        <span className="text-gray-600"> {log.action} </span>
                                        for <span className="font-medium text-blue-600">{log.target}</span>
                                    </div>
                                    <div className="text-xs text-gray-400">{log.time}</div>
                                </div>
                            ))}
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
