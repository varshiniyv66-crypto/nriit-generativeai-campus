"use client";

import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { FileText, Download, Plus, Clock, CheckCircle2, XCircle } from "lucide-react";
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { toast } from "sonner";

// Mock Certificates Data
const REQUESTS = [
    { id: "REQ-001", type: "Bonafide Certificate", date: "2024-08-01", status: "Approved", feedback: "Issued" },
    { id: "REQ-002", type: "Study Conduct Certificate", date: "2024-06-15", status: "Approved", feedback: "Issued" },
    { id: "REQ-003", type: "Transfer Certificate", date: "2024-09-10", status: "Pending", feedback: "Processing" },
];

export default function StudentCertificatesPage() {
    const [isOpen, setIsOpen] = useState(false);

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        setIsOpen(false);
        toast.success("Certificate request submitted successfully", {
            description: "You will be notified once it is approved."
        });
    };

    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Certificates</h1>
                    <p className="text-gray-500">Request and download official certificates</p>
                </div>

                <Dialog open={isOpen} onOpenChange={setIsOpen}>
                    <DialogTrigger asChild>
                        <Button className="bg-blue-600 hover:bg-blue-700">
                            <Plus className="w-4 h-4 mr-2" /> Request Certificate
                        </Button>
                    </DialogTrigger>
                    <DialogContent>
                        <DialogHeader>
                            <DialogTitle>Request New Certificate</DialogTitle>
                            <DialogDescription>
                                Fill in the details below to request a certificate from the administration.
                            </DialogDescription>
                        </DialogHeader>
                        <form onSubmit={handleSubmit} className="space-y-4">
                            <div className="space-y-2">
                                <Label>Certificate Type</Label>
                                <Select required>
                                    <SelectTrigger>
                                        <SelectValue placeholder="Select type" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem value="bonafide">Bonafide Certificate</SelectItem>
                                        <SelectItem value="conduct">Conduct Certificate</SelectItem>
                                        <SelectItem value="custodian">Custodian Certificate</SelectItem>
                                    </SelectContent>
                                </Select>
                            </div>
                            <div className="space-y-2">
                                <Label>Purpose / Reason</Label>
                                <Textarea placeholder="e.g. For Passport Application" required />
                            </div>
                            <DialogFooter>
                                <Button type="submit">Submit Request</Button>
                            </DialogFooter>
                        </form>
                    </DialogContent>
                </Dialog>
            </div>

            <Card>
                <CardHeader>
                    <CardTitle>Request History</CardTitle>
                    <CardDescription>Track the status of your certificate requests</CardDescription>
                </CardHeader>
                <CardContent>
                    <Table>
                        <TableHeader>
                            <TableRow>
                                <TableHead>Request ID</TableHead>
                                <TableHead>Certificate Type</TableHead>
                                <TableHead>Date Requested</TableHead>
                                <TableHead className="text-center">Status</TableHead>
                                <TableHead className="text-right">Action</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {REQUESTS.map((req) => (
                                <TableRow key={req.id}>
                                    <TableCell className="font-mono text-xs">{req.id}</TableCell>
                                    <TableCell className="font-medium">{req.type}</TableCell>
                                    <TableCell>{req.date}</TableCell>
                                    <TableCell className="text-center">
                                        <Badge
                                            variant={req.status === 'Approved' ? 'default' : 'outline'}
                                            className={req.status === 'Approved' ? "bg-green-100 text-green-700 hover:bg-green-200" : "bg-yellow-50 text-yellow-700 border-yellow-200"}
                                        >
                                            {req.status === 'Approved' && <CheckCircle2 className="w-3 h-3 mr-1" />}
                                            {req.status === 'Pending' && <Clock className="w-3 h-3 mr-1" />}
                                            {req.status}
                                        </Badge>
                                    </TableCell>
                                    <TableCell className="text-right">
                                        {req.status === 'Approved' ? (
                                            <Button variant="ghost" size="sm" className="text-blue-600 hover:text-blue-800">
                                                <Download className="w-4 h-4 mr-2" /> Download
                                            </Button>
                                        ) : (
                                            <span className="text-xs text-gray-400 italic">Processing</span>
                                        )}
                                    </TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>
        </div>
    );
}
