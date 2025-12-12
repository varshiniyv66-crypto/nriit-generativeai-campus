"use client";

import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { FileText, Upload, Trash2, Eye, MoreHorizontal, Plus } from "lucide-react";
import { toast } from "sonner";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";

// Mock Uploaded Files
const FILES = [
    { id: 1, title: "Unit 1: Introduction to DM", subject: "Data Mining", class: "III-CSE-A", type: "PDF", size: "2.4 MB", date: "2024-08-10", downloads: 45 },
    { id: 2, title: "Unit 2: Preprocessing", subject: "Data Mining", class: "III-CSE-A", type: "PDF", size: "1.8 MB", date: "2024-08-25", downloads: 42 },
    { id: 3, title: "Assignment 1 Question Bank", subject: "Data Mining", class: "III-CSE-B", type: "PDF", size: "0.5 MB", date: "2024-08-30", downloads: 50 },
    { id: 4, title: "Lab Manual Cycle 1", subject: "DM Lab", class: "III-CSE-A", type: "DOCX", size: "3.5 MB", date: "2024-08-01", downloads: 60 },
];

export default function FacultyMaterialsPage() {
    const [isUploading, setIsUploading] = useState(false);

    const handleUpload = (e: React.FormEvent) => {
        e.preventDefault();
        setIsUploading(true);
        setTimeout(() => {
            setIsUploading(false);
            toast.success("File uploaded successfully");
        }, 1500);
    };

    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Course Materials</h1>
                    <p className="text-gray-500">Upload and manage learning resources for your classes</p>
                </div>
                <Button className="bg-indigo-600 hover:bg-indigo-700">
                    <Plus className="w-4 h-4 mr-2" /> Upload New Material
                </Button>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                {/* Upload Form */}
                <Card className="lg:col-span-1 h-fit">
                    <CardHeader>
                        <CardTitle>Quick Upload</CardTitle>
                        <CardDescription>Share resources with students</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <form onSubmit={handleUpload} className="space-y-4">
                            <div className="space-y-2">
                                <Label htmlFor="title">Title</Label>
                                <Input id="title" placeholder="e.g. Unit 1 Notes" required />
                            </div>

                            <div className="grid grid-cols-2 gap-4">
                                <div className="space-y-2">
                                    <Label>Class</Label>
                                    <Select defaultValue="iii-a">
                                        <SelectTrigger>
                                            <SelectValue />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectItem value="iii-a">III-CSE-A</SelectItem>
                                            <SelectItem value="iii-b">III-CSE-B</SelectItem>
                                        </SelectContent>
                                    </Select>
                                </div>
                                <div className="space-y-2">
                                    <Label>Subject</Label>
                                    <Select defaultValue="dm">
                                        <SelectTrigger>
                                            <SelectValue />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectItem value="dm">Data Mining</SelectItem>
                                            <SelectItem value="cn">Networks</SelectItem>
                                        </SelectContent>
                                    </Select>
                                </div>
                            </div>

                            <div className="border-2 border-dashed border-gray-200 rounded-lg p-6 text-center hover:bg-gray-50 transition-colors cursor-pointer">
                                <Upload className="w-8 h-8 text-gray-400 mx-auto mb-2" />
                                <div className="text-sm font-medium text-gray-900">Click to upload</div>
                                <div className="text-xs text-gray-500">PDF, DOCX, PPT (Max 10MB)</div>
                            </div>

                            <Button type="submit" className="w-full" disabled={isUploading}>
                                {isUploading ? "Uploading..." : "Publish Material"}
                            </Button>
                        </form>
                    </CardContent>
                </Card>

                {/* Files List */}
                <Card className="lg:col-span-2">
                    <CardHeader>
                        <CardTitle>Managed Resources</CardTitle>
                        <CardDescription>Recent uploads and engagement stats</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <Table>
                            <TableHeader>
                                <TableRow>
                                    <TableHead>Resource Details</TableHead>
                                    <TableHead>Target Class</TableHead>
                                    <TableHead className="text-center">Downloads</TableHead>
                                    <TableHead className="text-right">Actions</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {FILES.map((file) => (
                                    <TableRow key={file.id}>
                                        <TableCell>
                                            <div className="flex items-center gap-3">
                                                <div className="p-2 bg-indigo-50 rounded text-indigo-600">
                                                    <FileText className="w-5 h-5" />
                                                </div>
                                                <div>
                                                    <div className="font-medium text-gray-900">{file.title}</div>
                                                    <div className="text-xs text-gray-500">{file.date} • {file.size}</div>
                                                </div>
                                            </div>
                                        </TableCell>
                                        <TableCell>
                                            <Badge variant="secondary">{file.class}</Badge>
                                        </TableCell>
                                        <TableCell className="text-center font-medium text-gray-700">
                                            {file.downloads}
                                        </TableCell>
                                        <TableCell className="text-right">
                                            <Button variant="ghost" size="icon">
                                                <Trash2 className="w-4 h-4 text-red-500" />
                                            </Button>
                                        </TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
