import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle
} from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow
} from "@/components/ui/table";
import { FileText, Upload, Link as LinkIcon, AlertCircle, CheckCircle2 } from "lucide-react";

// Mock Data representing the state of NBA accreditation for a department
const criteria = [
    { id: 1, name: "Vision, Mission & PEOs", marks: 60, status: "completed", progress: 100 },
    { id: 2, name: "Program Curriculum & Teaching-Learning", marks: 120, status: "in_progress", progress: 65 },
    { id: 3, name: "Course Outcomes & Program Outcomes", marks: 150, status: "attention", progress: 40 },
    { id: 4, name: "Students' Performance", marks: 150, status: "in_progress", progress: 80 },
    { id: 5, name: "Faculty Information & Contributions", marks: 100, status: "attention", progress: 30 },
    { id: 6, name: "Facilities & Technical Support", marks: 60, status: "completed", progress: 95 },
    { id: 7, name: "Continuous Improvement", marks: 50, status: "pending", progress: 0 },
    { id: 8, name: "First Year Academics", marks: 50, status: "in_progress", progress: 50 },
    { id: 9, name: "Student Support Systems", marks: 50, status: "in_progress", progress: 70 },
    { id: 10, name: "Governance, Institutional Support", marks: 110, status: "completed", progress: 100 },
];

export default function NBADashboard() {
    return (
        <div className="space-y-8">
            <div>
                <h1 className="text-3xl font-bold text-gray-900">NBA Accreditation Dashboard</h1>
                <p className="text-gray-500">Track and manage self-assessment report (SAR) progress</p>
            </div>

            {/* Overall Status Cards */}
            <div className="grid md:grid-cols-4 gap-6">
                <Card>
                    <CardHeader className="pb-2">
                        <CardTitle className="text-sm font-medium text-gray-500">Overall Progress</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-blue-600">63%</div>
                        <Progress value={63} className="mt-2 h-2" />
                        <p className="text-xs text-gray-500 mt-2">Target: Jan 2025</p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="pb-2">
                        <CardTitle className="text-sm font-medium text-gray-500">Evidence Files</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-gray-900">1,248</div>
                        <p className="text-xs text-gray-500 mt-1">Uploaded across 10 criteria</p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="pb-2">
                        <CardTitle className="text-sm font-medium text-gray-500">Pending Actions</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-amber-500">14</div>
                        <p className="text-xs text-gray-500 mt-1">Require immediate attention</p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="pb-2">
                        <CardTitle className="text-sm font-medium text-gray-500">Predicted Score</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold text-green-600">742<span className="text-sm text-gray-400 font-normal">/1000</span></div>
                        <p className="text-xs text-gray-500 mt-1">Based on AI analysis</p>
                    </CardContent>
                </Card>
            </div>

            {/* Criteria List */}
            <Card>
                <CardHeader>
                    <CardTitle>Criteria Status</CardTitle>
                    <CardDescription>Detailed breakdown of progress by criteria</CardDescription>
                </CardHeader>
                <CardContent>
                    <Table>
                        <TableHeader>
                            <TableRow>
                                <TableHead className="w-[80px]">Cr. No</TableHead>
                                <TableHead>Criteria Name</TableHead>
                                <TableHead className="text-right">Max Marks</TableHead>
                                <TableHead className="w-[200px]">Progress</TableHead>
                                <TableHead className="w-[120px]">Status</TableHead>
                                <TableHead className="text-right">Action</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {criteria.map((cr) => (
                                <TableRow key={cr.id} className="cursor-pointer hover:bg-gray-50">
                                    <TableCell className="font-medium">#{cr.id}</TableCell>
                                    <TableCell>{cr.name}</TableCell>
                                    <TableCell className="text-right">{cr.marks}</TableCell>
                                    <TableCell>
                                        <div className="flex items-center gap-2">
                                            <Progress value={cr.progress} className="h-2" />
                                            <span className="text-xs text-gray-500 w-8">{cr.progress}%</span>
                                        </div>
                                    </TableCell>
                                    <TableCell>
                                        {cr.status === 'completed' && <Badge className="bg-green-100 text-green-700 hover:bg-green-100">Completed</Badge>}
                                        {cr.status === 'in_progress' && <Badge className="bg-blue-100 text-blue-700 hover:bg-blue-100">In Progress</Badge>}
                                        {cr.status === 'attention' && <Badge className="bg-red-100 text-red-700 hover:bg-red-100">Needs Action</Badge>}
                                        {cr.status === 'pending' && <Badge variant="secondary">Pending</Badge>}
                                    </TableCell>
                                    <TableCell className="text-right">
                                        <Button variant="ghost" size="sm">View Details</Button>
                                    </TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>

            {/* Evidence Mapping Quick Access */}
            <div className="grid md:grid-cols-2 gap-6">
                <Card className="bg-gradient-to-br from-blue-50 to-white border-blue-100">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2 text-blue-700">
                            <LinkIcon className="w-5 h-5" />
                            Evidence-to-Claim Mapping
                        </CardTitle>
                        <CardDescription>
                            Link uploaded files and database records to specific NBA claims.
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-4">
                            <div className="bg-white p-4 rounded-lg border border-blue-100 shadow-sm flex items-center justify-between">
                                <div className="flex items-center gap-3">
                                    <div className="p-2 bg-blue-100 rounded-md">
                                        <Upload className="w-4 h-4 text-blue-600" />
                                    </div>
                                    <div>
                                        <div className="font-medium text-gray-900">Upload New Evidence</div>
                                        <div className="text-xs text-gray-500">Supports PDF, Images, Excel</div>
                                    </div>
                                </div>
                                <Button size="sm" variant="outline">Upload</Button>
                            </div>
                            <Button className="w-full bg-blue-600 hover:bg-blue-700">Go to Mapping Tool</Button>
                        </div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-green-50 to-white border-green-100">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2 text-green-700">
                            <FileText className="w-5 h-5" />
                            SAR Generation
                        </CardTitle>
                        <CardDescription>
                            Generate Self Assessment Report based on current data.
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-4">
                            <div className="bg-white p-4 rounded-lg border border-green-100 shadow-sm">
                                <div className="flex justify-between text-sm mb-2">
                                    <span className="text-gray-600">Completeness</span>
                                    <span className="font-medium">85%</span>
                                </div>
                                <Progress value={85} className="h-1 bg-green-100" />
                            </div>
                            <Button variant="outline" className="w-full text-green-700 border-green-200 hover:bg-green-50">Preview SAR PDF</Button>
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
