"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import {
    Users, Search, Mail, Phone, Award, GraduationCap, BookOpen
} from "lucide-react";
import supabase from "@/lib/supabase";

export default function HODFacultyPage() {
    const [loading, setLoading] = useState(true);
    const [faculty, setFaculty] = useState<any[]>([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [user, setUser] = useState<any>(null);

    useEffect(() => {
        const stored = localStorage.getItem('nriit_user');
        if (stored) {
            setUser(JSON.parse(stored));
        }
        loadFaculty();
    }, []);

    const loadFaculty = async () => {
        try {
            // Get user's department
            const stored = localStorage.getItem('nriit_user');
            const currentUser = stored ? JSON.parse(stored) : null;
            const deptCode = currentUser?.dept_code || 'CSE';

            const { data } = await supabase
                .from('faculty_profiles')
                .select('*')
                .eq('dept_code', deptCode)
                .eq('is_active', true)
                .order('designation');

            setFaculty(data || []);
            setLoading(false);
        } catch (error) {
            console.error('Error loading faculty:', error);
            setLoading(false);
        }
    };

    const filteredFaculty = faculty.filter(f =>
        `${f.first_name} ${f.last_name}`.toLowerCase().includes(searchTerm.toLowerCase()) ||
        f.employee_id?.toLowerCase().includes(searchTerm.toLowerCase())
    );

    if (loading) {
        return (
            <div className="flex items-center justify-center h-[60vh]">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            </div>
        );
    }

    return (
        <div className="space-y-6">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-2xl font-bold text-gray-900">Department Faculty</h1>
                    <p className="text-gray-500">Manage faculty members in your department</p>
                </div>
                <Badge variant="secondary" className="text-lg px-4 py-2">
                    {faculty.length} Members
                </Badge>
            </div>

            {/* Search */}
            <Card>
                <CardContent className="pt-6">
                    <div className="relative">
                        <Search className="absolute left-3 top-2.5 h-4 w-4 text-gray-400" />
                        <Input
                            placeholder="Search by name or employee ID..."
                            className="pl-10"
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                        />
                    </div>
                </CardContent>
            </Card>

            {/* Faculty Grid */}
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                {filteredFaculty.map((member) => (
                    <Card key={member.id} className="hover:shadow-lg transition-shadow">
                        <CardContent className="pt-6">
                            <div className="flex items-start gap-4">
                                <div className="w-16 h-16 rounded-full bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center text-white font-bold text-xl">
                                    {member.first_name?.[0]}{member.last_name?.[0]}
                                </div>
                                <div className="flex-1">
                                    <h3 className="font-semibold text-gray-900">
                                        Dr. {member.first_name} {member.last_name}
                                    </h3>
                                    <p className="text-sm text-gray-500">{member.designation}</p>
                                    <Badge variant="outline" className="mt-2 text-xs">
                                        {member.employee_id}
                                    </Badge>
                                </div>
                            </div>

                            <div className="mt-4 space-y-2 text-sm">
                                <div className="flex items-center gap-2 text-gray-600">
                                    <GraduationCap className="w-4 h-4" />
                                    <span>{member.qualification}</span>
                                </div>
                                <div className="flex items-center gap-2 text-gray-600">
                                    <BookOpen className="w-4 h-4" />
                                    <span>{member.specialization}</span>
                                </div>
                                <div className="flex items-center gap-2 text-gray-600">
                                    <Award className="w-4 h-4" />
                                    <span>{member.experience_years} years experience</span>
                                </div>
                                <div className="flex items-center gap-2 text-gray-600">
                                    <Mail className="w-4 h-4" />
                                    <span className="truncate">{member.email}</span>
                                </div>
                            </div>

                            <div className="mt-4 flex gap-2">
                                <Button variant="outline" size="sm" className="flex-1">
                                    <Phone className="w-3 h-3 mr-1" />
                                    Contact
                                </Button>
                                <Button size="sm" className="flex-1">
                                    View Profile
                                </Button>
                            </div>
                        </CardContent>
                    </Card>
                ))}
            </div>

            {filteredFaculty.length === 0 && (
                <div className="text-center py-12 text-gray-500">
                    <Users className="w-12 h-12 mx-auto mb-4 opacity-50" />
                    <p>No faculty members found</p>
                </div>
            )}
        </div>
    );
}
