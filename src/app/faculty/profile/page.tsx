"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Separator } from "@/components/ui/separator";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Mail, Phone, MapPin, Award, BookOpen, GraduationCap, Link2 } from "lucide-react";
import { Textarea } from "@/components/ui/textarea";

export default function FacultyProfilePage() {
    const [user, setUser] = useState<any>({
        name: "Faculty Name",
        id: "FAC000",
        email: "faculty@nriit.ac.in",
        role: "Faculty"
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

    const profile = {
        ...user,
        designation: "Associate Professor",
        department: "Computer Science & Engineering",
        qualification: "Ph.D. in Machine Learning, M.Tech (CSE)",
        experience: "12 Years",
        specialization: "AI/ML, Data Mining, Cloud Computing",
        phone: "+91 91234 56789",
        publications: [
            "A Novel Approach to Data Mining in Healthcare (IEEE, 2023)",
            "Cloud Security Protocols: A Survey (Springer, 2022)",
            "Deep Learning for Image Recognition (Elsevier, 2021)"
        ]
    };

    return (
        <div className="space-y-6 animate-fade-in-up p-6">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Faculty Profile</h1>
                    <p className="text-gray-500">Manage your professional details and academic records</p>
                </div>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                {/* Profile Card */}
                <Card className="lg:col-span-1 h-fit border-t-4 border-t-indigo-600">
                    <CardHeader className="text-center">
                        <div className="mx-auto w-24 h-24 mb-4">
                            <Avatar className="w-24 h-24 border-4 border-indigo-50">
                                <AvatarFallback className="text-2xl bg-indigo-700 text-white font-bold">
                                    {profile.name?.charAt(0)}
                                </AvatarFallback>
                            </Avatar>
                        </div>
                        <CardTitle>{profile.name}</CardTitle>
                        <CardDescription className="text-indigo-600 font-medium">
                            {profile.designation}
                        </CardDescription>
                        <Badge variant="outline" className="w-fit mx-auto mt-2 text-xs">{profile.id}</Badge>
                    </CardHeader>
                    <CardContent className="space-y-4 pt-4">
                        <div className="flex items-center gap-3 text-sm text-gray-600">
                            <Mail className="w-4 h-4 text-indigo-500" />
                            <span>{profile.email}</span>
                        </div>
                        <div className="flex items-center gap-3 text-sm text-gray-600">
                            <Phone className="w-4 h-4 text-green-500" />
                            <span>{profile.phone}</span>
                        </div>
                        <div className="flex items-center gap-3 text-sm text-gray-600">
                            <GraduationCap className="w-4 h-4 text-orange-500" />
                            <span>{profile.qualification}</span>
                        </div>

                        <Separator />

                        <div className="space-y-2">
                            <Label className="text-xs font-semibold text-gray-500 uppercase">Specialization</Label>
                            <div className="flex flex-wrap gap-2">
                                {profile.specialization.split(', ').map((spec: string, i: number) => (
                                    <Badge key={i} variant="secondary" className="text-xs bg-gray-100 text-gray-700">
                                        {spec}
                                    </Badge>
                                ))}
                            </div>
                        </div>
                    </CardContent>
                </Card>

                {/* Professional Info */}
                <Card className="lg:col-span-2">
                    <CardHeader>
                        <CardTitle>Professional Details</CardTitle>
                        <CardDescription>Update your academic achievements and publications</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-6">
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <Label>Designation</Label>
                                <Input defaultValue={profile.designation} />
                            </div>
                            <div className="space-y-2">
                                <Label>Department</Label>
                                <Select defaultValue="cse">
                                    <SelectTrigger>
                                        <SelectValue />
                                    </SelectTrigger>
                                </Select>
                            </div>
                            <div className="space-y-2">
                                <Label>Total Experience</Label>
                                <Input defaultValue={profile.experience} />
                            </div>
                            <div className="space-y-2">
                                <Label>Research Area</Label>
                                <Input defaultValue="Artificial Intelligence" />
                            </div>
                        </div>

                        <div className="space-y-2">
                            <Label>Publications</Label>
                            <div className="border rounded-md divide-y">
                                {profile.publications.map((pub: string, i: number) => (
                                    <div key={i} className="p-3 text-sm flex items-start gap-3 bg-gray-50/50">
                                        <BookOpen className="w-4 h-4 text-indigo-600 mt-0.5 shrink-0" />
                                        <span>{pub}</span>
                                        <Button variant="ghost" size="icon" className="ml-auto h-6 w-6 text-gray-400">
                                            <Link2 className="w-3 h-3" />
                                        </Button>
                                    </div>
                                ))}
                            </div>
                            <Button variant="outline" size="sm" className="mt-2 w-full border-dashed">
                                + Add Publication
                            </Button>
                        </div>

                        <div className="flex justify-end gap-3 mt-4">
                            <Button variant="secondary">Cancel</Button>
                            <Button className="bg-indigo-600 hover:bg-indigo-700">Save Changes</Button>
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
