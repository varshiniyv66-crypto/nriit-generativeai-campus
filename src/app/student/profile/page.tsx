"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Separator } from "@/components/ui/separator";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { User, Mail, Phone, MapPin, Book, Calendar, ShieldCheck } from "lucide-react";

export default function StudentProfilePage() {
    const [user, setUser] = useState<any>({
        name: "Student Name",
        id: "21KN1A0500",
        email: "student@nriit.ac.in",
        role: "Student"
    });

    useEffect(() => {
        const storedUser = localStorage.getItem("nriit_user");
        if (storedUser) {
            try {
                setUser(JSON.parse(storedUser));
            } catch (e) {
                console.error("Failed to parse user data");
            }
        }
    }, []);

    // Extended Mock Details (combining with stored basic info)
    const profile = {
        ...user,
        phone: "+91 98765 43210",
        dob: "2003-05-15",
        branch: "Computer Science & Engineering",
        year: "III Year",
        section: "A",
        address: "D.No 5-21, Gandhi Nagar, Vijayawada, Andhra Pradesh - 520001",
        bloodGroup: "O+"
    };

    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">My Profile</h1>
                    <p className="text-gray-500">Manage your personal information and account settings</p>
                </div>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                {/* Profile Card */}
                <Card className="lg:col-span-1 h-fit">
                    <CardHeader className="text-center pb-2">
                        <div className="mx-auto w-24 h-24 mb-4 relative">
                            <Avatar className="w-24 h-24 border-4 border-blue-50">
                                <AvatarFallback className="text-2xl bg-blue-600 text-white font-bold">
                                    {profile.name?.charAt(0)}
                                </AvatarFallback>
                            </Avatar>
                            <div className="absolute bottom-0 right-0 p-1 bg-green-500 rounded-full border-2 border-white" title="Verified Student">
                                <ShieldCheck className="w-4 h-4 text-white" />
                            </div>
                        </div>
                        <CardTitle>{profile.name}</CardTitle>
                        <CardDescription className="font-mono text-xs bg-gray-100 px-2 py-1 rounded-full mx-auto w-fit mt-1">
                            {profile.id || "ID NOT FOUND"}
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4 pt-4">
                        <div className="flex items-center gap-3 text-sm text-gray-600">
                            <Mail className="w-4 h-4 text-blue-500" />
                            <span>{profile.email}</span>
                        </div>
                        <div className="flex items-center gap-3 text-sm text-gray-600">
                            <Phone className="w-4 h-4 text-green-500" />
                            <span>{profile.phone}</span>
                        </div>
                        <div className="flex items-center gap-3 text-sm text-gray-600">
                            <MapPin className="w-4 h-4 text-red-500" />
                            <span className="line-clamp-2">{profile.address}</span>
                        </div>
                        <Button className="w-full mt-4" variant="outline">Edit Contact Info</Button>
                    </CardContent>
                </Card>

                {/* Academic Details */}
                <Card className="lg:col-span-2">
                    <CardHeader>
                        <CardTitle>Academic Information</CardTitle>
                        <CardDescription>Official records - Contact admin for corrections</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-6">
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <Label className="text-gray-500">Full Name</Label>
                                <Input value={profile.name} readOnly className="bg-gray-50 font-medium" />
                            </div>
                            <div className="space-y-2">
                                <Label className="text-gray-500">Roll Number</Label>
                                <Input value={profile.id} readOnly className="bg-gray-50 font-medium font-mono" />
                            </div>
                            <div className="space-y-2">
                                <Label className="text-gray-500">Branch / Department</Label>
                                <Input value={profile.branch} readOnly className="bg-gray-50 font-medium" />
                            </div>
                            <div className="space-y-2">
                                <Label className="text-gray-500">Current Year / Semester</Label>
                                <Input value={profile.year} readOnly className="bg-gray-50 font-medium" />
                            </div>
                            <div className="space-y-2">
                                <Label className="text-gray-500">Section</Label>
                                <Input value={profile.section} readOnly className="bg-gray-50 font-medium" />
                            </div>
                            <div className="space-y-2">
                                <Label className="text-gray-500">Date of Birth</Label>
                                <div className="relative">
                                    <Input value={profile.dob} readOnly className="bg-gray-50 font-medium pl-10" />
                                    <Calendar className="w-4 h-4 absolute left-3 top-3 text-gray-400" />
                                </div>
                            </div>
                        </div>

                        <Separator />

                        <div>
                            <h3 className="text-sm font-medium text-gray-900 mb-4">Mentor Details</h3>
                            <div className="flex items-center gap-4 p-4 border rounded-lg bg-indigo-50/50 border-indigo-100">
                                <Avatar className="w-10 h-10">
                                    <AvatarFallback className="bg-indigo-600 text-white">AS</AvatarFallback>
                                </Avatar>
                                <div>
                                    <div className="font-medium text-indigo-900">Dr. Amit Sharma</div>
                                    <div className="text-xs text-indigo-600">Assoc. Professor, CSE</div>
                                </div>
                                <Button variant="ghost" size="sm" className="ml-auto text-indigo-700 hover:bg-indigo-100">
                                    Contact Mentor
                                </Button>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
