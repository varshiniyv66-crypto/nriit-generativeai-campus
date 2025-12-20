"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Separator } from "@/components/ui/separator";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Mail, Phone, MapPin, Award, BookOpen, GraduationCap, Link2, Calendar, Briefcase, CreditCard } from "lucide-react";
import { Textarea } from "@/components/ui/textarea";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { supabase } from "@/lib/supabase";
import { FacultyProfile } from "@/types";

export default function FacultyProfilePage() {
    const [user, setUser] = useState<any>({
        name: "Faculty Name",
        id: "FAC000",
        email: "faculty@nriit.ac.in",
        role: "Faculty"
    });
    const [facultyProfile, setFacultyProfile] = useState<FacultyProfile | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchProfile = async () => {
            const storedUser = localStorage.getItem("nriit_user");
            if (storedUser) {
                try {
                    const parsedUser = JSON.parse(storedUser);
                    setUser(parsedUser);

                    if (parsedUser.email) {
                        const { data, error } = await supabase
                            .from('faculty_profiles')
                            .select('*')
                            .eq('email', parsedUser.email)
                            .single();

                        if (data) {
                            console.log("Fetched NBA Profile Data:", data);
                            setFacultyProfile(data);
                        }
                    }
                } catch (e) {
                    console.error("Failed to parse user data or fetch profile", e);
                } finally {
                    setLoading(false);
                }
            }
        };
        fetchProfile();
    }, []);

    const profile = {
        name: facultyProfile ? `${facultyProfile.first_name} ${facultyProfile.last_name}` : user.name,
        id: facultyProfile?.employee_id || user.id,
        email: facultyProfile?.email || user.email,
        designation: facultyProfile?.designation || "Associate Professor",
        department: facultyProfile?.dept_code || "Computer Science & Engineering",
        qualification: facultyProfile?.qualification || "Ph.D. in Machine Learning, M.Tech (CSE)",
        experience: facultyProfile?.experience_years ? `${facultyProfile.experience_years} Years` : "12 Years",
        specialization: facultyProfile?.specialization || "AI/ML, Data Mining, Cloud Computing",
        phone: facultyProfile?.phone || "+91 91234 56789",
        joining_date: facultyProfile?.date_of_joining,
        nature: facultyProfile?.nature_of_association || "Regular",
        pan: facultyProfile?.pan_number,
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
                        {profile.pan && <Badge variant="secondary" className="w-fit mx-auto mt-1 text-[10px] text-gray-500">NBA Verified</Badge>}
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

                        {/* New NBA Fields */}
                        {profile.joining_date && (
                            <div className="flex items-center gap-3 text-sm text-gray-600">
                                <Calendar className="w-4 h-4 text-blue-500" />
                                <span>Joined: {new Date(profile.joining_date).toLocaleDateString()}</span>
                            </div>
                        )}
                        {profile.nature && (
                            <div className="flex items-center gap-3 text-sm text-gray-600">
                                <Briefcase className="w-4 h-4 text-purple-500" />
                                <span>{profile.nature}</span>
                            </div>
                        )}
                        {profile.pan && (
                            <div className="flex items-center gap-3 text-sm text-gray-600">
                                <CreditCard className="w-4 h-4 text-pink-500" />
                                <span>PAN: <span className="font-mono bg-gray-100 px-1 rounded">{profile.pan}</span></span>
                            </div>
                        )}

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
                                    <SelectContent>
                                        <SelectItem value="cse">CSE</SelectItem>
                                        <SelectItem value="ece">ECE</SelectItem>
                                        <SelectItem value="it">IT</SelectItem>
                                    </SelectContent>
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
