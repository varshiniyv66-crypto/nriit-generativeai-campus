"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog";
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select";
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table";
import {
    UserPlus, Search, Filter, Download, Upload, Edit, Trash2,
    Mail, Phone, Building2, Award, Calendar, FileText, Image,
    CheckCircle2, XCircle, AlertCircle, Users, BarChart3
} from "lucide-react";
import supabase from "@/lib/supabase";
import { toast } from "sonner";
import Link from "next/link";

interface Faculty {
    id: string;
    employee_id: string;
    first_name: string;
    last_name: string;
    email: string;
    phone: string;
    designation: string;
    qualification: string;
    specialization: string;
    experience_years: number;
    date_of_joining: string;
    dept_code: string;
    department_id?: string;
    is_active: boolean;
    photo_url?: string;
    resume_url?: string;
    departments?: {
        dept_name: string;
        dept_code: string;
    };
}

export default function FacultyManagement() {
    const [faculty, setFaculty] = useState<Faculty[]>([]);
    const [filteredFaculty, setFilteredFaculty] = useState<Faculty[]>([]);
    const [departments, setDepartments] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState("");
    const [filterDept, setFilterDept] = useState("all");
    const [filterDesignation, setFilterDesignation] = useState("all");
    const [isAddDialogOpen, setIsAddDialogOpen] = useState(false);
    const [isEditDialogOpen, setIsEditDialogOpen] = useState(false);
    const [selectedFaculty, setSelectedFaculty] = useState<Faculty | null>(null);
    const [uploadingPhoto, setUploadingPhoto] = useState(false);
    const [uploadingResume, setUploadingResume] = useState(false);

    // Form state
    const [formData, setFormData] = useState({
        employee_id: "",
        first_name: "",
        last_name: "",
        email: "",
        phone: "",
        designation: "Assistant Professor",
        qualification: "",
        specialization: "",
        experience_years: 0,
        date_of_joining: "",
        dept_code: "",
    });

    useEffect(() => {
        loadData();
    }, []);

    useEffect(() => {
        filterFacultyData();
    }, [searchTerm, filterDept, filterDesignation, faculty]);

    const loadData = async () => {
        try {
            // Load departments
            const { data: deptData } = await supabase
                .from('departments')
                .select('*')
                .order('name');

            setDepartments(deptData || []);

            // Load faculty - dept_code is a string field, not a foreign key
            const { data: facultyData, error } = await supabase
                .from('faculty_profiles')
                .select('*')
                .order('first_name');

            if (error) {
                console.error('Faculty query error:', error);
                throw error;
            }

            // Map dept_code to department info manually
            const facultyWithDepts = (facultyData || []).map(fac => ({
                ...fac,
                departments: {
                    dept_code: fac.dept_code,
                    dept_name: deptData?.find(d => d.code === fac.dept_code)?.name || fac.dept_code
                }
            }));

            setFaculty(facultyWithDepts);
            setFilteredFaculty(facultyWithDepts);
            setLoading(false);
        } catch (error) {
            console.error('Error loading data:', error);
            toast.error('Failed to load faculty data');
            setLoading(false);
        }
    };

    const filterFacultyData = () => {
        let filtered = [...faculty];

        // Search filter
        if (searchTerm) {
            filtered = filtered.filter(f =>
                f.first_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                f.last_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                f.employee_id.toLowerCase().includes(searchTerm.toLowerCase()) ||
                f.email.toLowerCase().includes(searchTerm.toLowerCase())
            );
        }

        // Department filter
        if (filterDept !== "all") {
            filtered = filtered.filter(f => f.dept_code === filterDept);
        }

        // Designation filter
        if (filterDesignation !== "all") {
            filtered = filtered.filter(f => f.designation === filterDesignation);
        }

        setFilteredFaculty(filtered);
    };

    const handleAddFaculty = async (e: React.FormEvent) => {
        e.preventDefault();

        try {
            // Create user first
            const { data: userData, error: userError } = await supabase
                .from('users')
                .insert({
                    email: formData.email,
                    role: 'faculty',
                    is_active: true,
                    email_verified: true
                })
                .select()
                .single();

            if (userError) throw userError;

            // Create faculty profile
            const { data: facultyData, error: facultyError } = await supabase
                .from('faculty_profiles')
                .insert({
                    ...formData,
                    user_id: userData.id,
                    is_active: true
                })
                .select()
                .single();

            if (facultyError) throw facultyError;

            toast.success('Faculty member added successfully!');
            setIsAddDialogOpen(false);
            resetForm();
            loadData();
        } catch (error: any) {
            console.error('Error adding faculty:', error);
            toast.error(error.message || 'Failed to add faculty member');
        }
    };

    const handleEditFaculty = async (e: React.FormEvent) => {
        e.preventDefault();

        if (!selectedFaculty) return;

        try {
            const { error } = await supabase
                .from('faculty_profiles')
                .update(formData)
                .eq('id', selectedFaculty.id);

            if (error) throw error;

            toast.success('Faculty member updated successfully!');
            setIsEditDialogOpen(false);
            setSelectedFaculty(null);
            resetForm();
            loadData();
        } catch (error: any) {
            console.error('Error updating faculty:', error);
            toast.error(error.message || 'Failed to update faculty member');
        }
    };

    const handleDeleteFaculty = async (facultyId: string) => {
        if (!confirm('Are you sure you want to delete this faculty member?')) return;

        try {
            const { error } = await supabase
                .from('faculty_profiles')
                .update({ is_active: false })
                .eq('id', facultyId);

            if (error) throw error;

            toast.success('Faculty member deleted successfully!');
            loadData();
        } catch (error: any) {
            console.error('Error deleting faculty:', error);
            toast.error(error.message || 'Failed to delete faculty member');
        }
    };

    const handlePhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>, facultyId: string) => {
        const file = e.target.files?.[0];
        if (!file) return;

        // Validate file
        if (!file.type.startsWith('image/')) {
            toast.error('Please upload an image file');
            return;
        }

        if (file.size > 2 * 1024 * 1024) {
            toast.error('Image size should be less than 2MB');
            return;
        }

        setUploadingPhoto(true);

        try {
            const fileExt = file.name.split('.').pop();
            const fileName = `${facultyId}-${Date.now()}.${fileExt}`;
            const filePath = `${fileName}`;

            const { error: uploadError } = await supabase.storage
                .from('faculty-photos')
                .upload(filePath, file, { upsert: true });

            if (uploadError) throw uploadError;

            const { data: { publicUrl } } = supabase.storage
                .from('faculty-photos')
                .getPublicUrl(filePath);

            const { error: updateError } = await supabase
                .from('faculty_profiles')
                .update({ photo_url: publicUrl })
                .eq('id', facultyId);

            if (updateError) throw updateError;

            toast.success('Photo uploaded successfully!');
            loadData();
        } catch (error: any) {
            console.error('Error uploading photo:', error);
            toast.error(error.message || 'Failed to upload photo');
        } finally {
            setUploadingPhoto(false);
        }
    };

    const handleResumeUpload = async (e: React.ChangeEvent<HTMLInputElement>, facultyId: string) => {
        const file = e.target.files?.[0];
        if (!file) return;

        // Validate file
        if (!file.type.includes('pdf') && !file.type.includes('document')) {
            toast.error('Please upload a PDF or Word document');
            return;
        }

        if (file.size > 5 * 1024 * 1024) {
            toast.error('File size should be less than 5MB');
            return;
        }

        setUploadingResume(true);

        try {
            const fileExt = file.name.split('.').pop();
            const fileName = `${facultyId}-resume-${Date.now()}.${fileExt}`;
            const filePath = `${fileName}`;

            const { error: uploadError } = await supabase.storage
                .from('faculty-resumes')
                .upload(filePath, file, { upsert: true });

            if (uploadError) throw uploadError;

            const { data: { publicUrl } } = supabase.storage
                .from('faculty-resumes')
                .getPublicUrl(filePath);

            const { error: updateError } = await supabase
                .from('faculty_profiles')
                .update({ resume_url: publicUrl })
                .eq('id', facultyId);

            if (updateError) throw updateError;

            toast.success('Resume uploaded successfully!');
            loadData();
        } catch (error: any) {
            console.error('Error uploading resume:', error);
            toast.error(error.message || 'Failed to upload resume');
        } finally {
            setUploadingResume(false);
        }
    };

    const openEditDialog = (fac: Faculty) => {
        setSelectedFaculty(fac);
        setFormData({
            employee_id: fac.employee_id,
            first_name: fac.first_name,
            last_name: fac.last_name,
            email: fac.email,
            phone: fac.phone,
            designation: fac.designation,
            qualification: fac.qualification,
            specialization: fac.specialization,
            experience_years: fac.experience_years,
            date_of_joining: fac.date_of_joining,
            dept_code: fac.dept_code,
        });
        setIsEditDialogOpen(true);
    };

    const resetForm = () => {
        setFormData({
            employee_id: "",
            first_name: "",
            last_name: "",
            email: "",
            phone: "",
            designation: "Assistant Professor",
            qualification: "",
            specialization: "",
            experience_years: 0,
            date_of_joining: "",
            dept_code: "",
        });
    };

    const designations = [
        "Professor",
        "Associate Professor",
        "Assistant Professor",
        "Lecturer",
        "Senior Lecturer"
    ];

    if (loading) {
        return (
            <div className="flex items-center justify-center h-screen">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600"></div>
            </div>
        );
    }

    return (
        <div className="space-y-6 pb-8">
            {/* Header */}
            <div className="relative overflow-hidden rounded-2xl bg-gradient-to-br from-indigo-600 via-purple-600 to-pink-600 p-8 text-white">
                <div className="absolute inset-0 bg-black/10"></div>
                <div className="relative z-10">
                    <div className="flex items-center justify-between">
                        <div>
                            <h1 className="text-3xl font-bold mb-2">Faculty Management 👨‍🏫</h1>
                            <p className="text-indigo-100">Manage faculty members, upload documents, and track performance</p>
                        </div>
                        <div className="flex gap-3">
                            <Link href="/dean/dashboard">
                                <Button variant="secondary" className="gap-2 bg-white/20 hover:bg-white/30 text-white border-white/30">
                                    <BarChart3 className="w-4 h-4" />
                                    Dashboard
                                </Button>
                            </Link>
                            <Dialog open={isAddDialogOpen} onOpenChange={setIsAddDialogOpen}>
                                <DialogTrigger asChild>
                                    <Button className="bg-white text-indigo-600 hover:bg-white/90 gap-2 shadow-lg">
                                        <UserPlus className="w-4 h-4" />
                                        Add Faculty
                                    </Button>
                                </DialogTrigger>
                                <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
                                    <DialogHeader>
                                        <DialogTitle>Add New Faculty Member</DialogTitle>
                                        <DialogDescription>
                                            Fill in the details to add a new faculty member
                                        </DialogDescription>
                                    </DialogHeader>
                                    <form onSubmit={handleAddFaculty} className="space-y-4">
                                        <div className="grid grid-cols-2 gap-4">
                                            <div>
                                                <Label htmlFor="employee_id">Employee ID *</Label>
                                                <Input
                                                    id="employee_id"
                                                    required
                                                    value={formData.employee_id}
                                                    onChange={(e) => setFormData({ ...formData, employee_id: e.target.value })}
                                                    placeholder="FAC001"
                                                />
                                            </div>
                                            <div>
                                                <Label htmlFor="department">Department *</Label>
                                                <Select
                                                    required
                                                    value={formData.dept_code}
                                                    onValueChange={(value) => setFormData({ ...formData, dept_code: value })}
                                                >
                                                    <SelectTrigger>
                                                        <SelectValue placeholder="Select department" />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        {departments.map((dept) => (
                                                            <SelectItem key={dept.id} value={dept.code}>
                                                                {dept.name}
                                                            </SelectItem>
                                                        ))}
                                                    </SelectContent>
                                                </Select>
                                            </div>
                                        </div>

                                        <div className="grid grid-cols-2 gap-4">
                                            <div>
                                                <Label htmlFor="first_name">First Name *</Label>
                                                <Input
                                                    id="first_name"
                                                    required
                                                    value={formData.first_name}
                                                    onChange={(e) => setFormData({ ...formData, first_name: e.target.value })}
                                                />
                                            </div>
                                            <div>
                                                <Label htmlFor="last_name">Last Name *</Label>
                                                <Input
                                                    id="last_name"
                                                    required
                                                    value={formData.last_name}
                                                    onChange={(e) => setFormData({ ...formData, last_name: e.target.value })}
                                                />
                                            </div>
                                        </div>

                                        <div className="grid grid-cols-2 gap-4">
                                            <div>
                                                <Label htmlFor="email">Email *</Label>
                                                <Input
                                                    id="email"
                                                    type="email"
                                                    required
                                                    value={formData.email}
                                                    onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                                                    placeholder="faculty@nriit.ac.in"
                                                />
                                            </div>
                                            <div>
                                                <Label htmlFor="phone">Phone *</Label>
                                                <Input
                                                    id="phone"
                                                    required
                                                    value={formData.phone}
                                                    onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                                                    placeholder="+91-XXXXXXXXXX"
                                                />
                                            </div>
                                        </div>

                                        <div className="grid grid-cols-2 gap-4">
                                            <div>
                                                <Label htmlFor="designation">Designation *</Label>
                                                <Select
                                                    required
                                                    value={formData.designation}
                                                    onValueChange={(value) => setFormData({ ...formData, designation: value })}
                                                >
                                                    <SelectTrigger>
                                                        <SelectValue />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        {designations.map((des) => (
                                                            <SelectItem key={des} value={des}>
                                                                {des}
                                                            </SelectItem>
                                                        ))}
                                                    </SelectContent>
                                                </Select>
                                            </div>
                                            <div>
                                                <Label htmlFor="qualification">Qualification *</Label>
                                                <Input
                                                    id="qualification"
                                                    required
                                                    value={formData.qualification}
                                                    onChange={(e) => setFormData({ ...formData, qualification: e.target.value })}
                                                    placeholder="Ph.D., M.Tech, etc."
                                                />
                                            </div>
                                        </div>

                                        <div className="grid grid-cols-2 gap-4">
                                            <div>
                                                <Label htmlFor="specialization">Specialization *</Label>
                                                <Input
                                                    id="specialization"
                                                    required
                                                    value={formData.specialization}
                                                    onChange={(e) => setFormData({ ...formData, specialization: e.target.value })}
                                                    placeholder="Machine Learning, VLSI, etc."
                                                />
                                            </div>
                                            <div>
                                                <Label htmlFor="experience">Experience (Years) *</Label>
                                                <Input
                                                    id="experience"
                                                    type="number"
                                                    required
                                                    min="0"
                                                    value={formData.experience_years}
                                                    onChange={(e) => setFormData({ ...formData, experience_years: parseInt(e.target.value) })}
                                                />
                                            </div>
                                        </div>

                                        <div>
                                            <Label htmlFor="date_of_joining">Date of Joining *</Label>
                                            <Input
                                                id="date_of_joining"
                                                type="date"
                                                required
                                                value={formData.date_of_joining}
                                                onChange={(e) => setFormData({ ...formData, date_of_joining: e.target.value })}
                                            />
                                        </div>

                                        <div className="flex justify-end gap-3 pt-4">
                                            <Button type="button" variant="outline" onClick={() => setIsAddDialogOpen(false)}>
                                                Cancel
                                            </Button>
                                            <Button type="submit" className="bg-indigo-600 hover:bg-indigo-700">
                                                Add Faculty
                                            </Button>
                                        </div>
                                    </form>
                                </DialogContent>
                            </Dialog>
                        </div>
                    </div>
                </div>
            </div>

            {/* Stats Cards */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                <Card className="border-l-4 border-l-indigo-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Total Faculty</CardTitle>
                        <Users className="h-4 w-4 text-indigo-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{faculty.filter(f => f.is_active).length}</div>
                        <p className="text-xs text-gray-500 mt-1">Active members</p>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-green-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Professors</CardTitle>
                        <Award className="h-4 w-4 text-green-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">
                            {faculty.filter(f => f.designation === "Professor" && f.is_active).length}
                        </div>
                        <p className="text-xs text-gray-500 mt-1">Senior faculty</p>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-purple-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Departments</CardTitle>
                        <Building2 className="h-4 w-4 text-purple-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{departments.length}</div>
                        <p className="text-xs text-gray-500 mt-1">Active departments</p>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-amber-500">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Avg Experience</CardTitle>
                        <Calendar className="h-4 w-4 text-amber-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">
                            {faculty.length > 0
                                ? Math.round(faculty.reduce((sum, f) => sum + f.experience_years, 0) / faculty.length)
                                : 0} yrs
                        </div>
                        <p className="text-xs text-gray-500 mt-1">Overall average</p>
                    </CardContent>
                </Card>
            </div>

            {/* Filters and Search */}
            <Card>
                <CardHeader>
                    <CardTitle>Faculty Directory</CardTitle>
                    <CardDescription>Search, filter, and manage faculty members</CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="flex flex-col md:flex-row gap-4 mb-6">
                        <div className="flex-1">
                            <div className="relative">
                                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-gray-400" />
                                <Input
                                    placeholder="Search by name, employee ID, or email..."
                                    value={searchTerm}
                                    onChange={(e) => setSearchTerm(e.target.value)}
                                    className="pl-10"
                                />
                            </div>
                        </div>
                        <Select value={filterDept} onValueChange={setFilterDept}>
                            <SelectTrigger className="w-full md:w-48">
                                <SelectValue placeholder="All Departments" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">All Departments</SelectItem>
                                {departments.map((dept) => (
                                    <SelectItem key={dept.id} value={dept.code}>
                                        {dept.name}
                                    </SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                        <Select value={filterDesignation} onValueChange={setFilterDesignation}>
                            <SelectTrigger className="w-full md:w-48">
                                <SelectValue placeholder="All Designations" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">All Designations</SelectItem>
                                {designations.map((des) => (
                                    <SelectItem key={des} value={des}>
                                        {des}
                                    </SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                        <Button variant="outline" className="gap-2">
                            <Download className="w-4 h-4" />
                            Export
                        </Button>
                    </div>

                    {/* Faculty Table */}
                    <div className="rounded-lg border overflow-hidden">
                        <Table>
                            <TableHeader>
                                <TableRow className="bg-gray-50">
                                    <TableHead>Photo</TableHead>
                                    <TableHead>Employee ID</TableHead>
                                    <TableHead>Name</TableHead>
                                    <TableHead>Department</TableHead>
                                    <TableHead>Designation</TableHead>
                                    <TableHead>Contact</TableHead>
                                    <TableHead>Experience</TableHead>
                                    <TableHead>Status</TableHead>
                                    <TableHead className="text-right">Actions</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {filteredFaculty.map((fac) => (
                                    <TableRow key={fac.id} className="hover:bg-gray-50">
                                        <TableCell>
                                            <div className="relative group">
                                                {fac.photo_url ? (
                                                    <img
                                                        src={fac.photo_url}
                                                        alt={`${fac.first_name} ${fac.last_name}`}
                                                        className="w-10 h-10 rounded-full object-cover"
                                                    />
                                                ) : (
                                                    <div className="w-10 h-10 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-600 font-semibold">
                                                        {fac.first_name[0]}{fac.last_name[0]}
                                                    </div>
                                                )}
                                                <label className="absolute inset-0 flex items-center justify-center bg-black/50 rounded-full opacity-0 group-hover:opacity-100 cursor-pointer transition-opacity">
                                                    <Image className="w-4 h-4 text-white" />
                                                    <input
                                                        type="file"
                                                        accept="image/*"
                                                        className="hidden"
                                                        onChange={(e) => handlePhotoUpload(e, fac.id)}
                                                        disabled={uploadingPhoto}
                                                    />
                                                </label>
                                            </div>
                                        </TableCell>
                                        <TableCell className="font-medium">{fac.employee_id}</TableCell>
                                        <TableCell>
                                            <div>
                                                <div className="font-medium">{fac.first_name} {fac.last_name}</div>
                                                <div className="text-xs text-gray-500">{fac.qualification}</div>
                                            </div>
                                        </TableCell>
                                        <TableCell>
                                            <Badge variant="secondary">{fac.departments?.dept_code}</Badge>
                                        </TableCell>
                                        <TableCell className="text-sm">{fac.designation}</TableCell>
                                        <TableCell>
                                            <div className="text-sm">
                                                <div className="flex items-center gap-1 text-gray-600">
                                                    <Mail className="w-3 h-3" />
                                                    <span className="truncate max-w-[150px]">{fac.email}</span>
                                                </div>
                                                <div className="flex items-center gap-1 text-gray-600 mt-1">
                                                    <Phone className="w-3 h-3" />
                                                    <span>{fac.phone}</span>
                                                </div>
                                            </div>
                                        </TableCell>
                                        <TableCell>{fac.experience_years} years</TableCell>
                                        <TableCell>
                                            {fac.is_active ? (
                                                <Badge className="bg-green-100 text-green-700 hover:bg-green-100">
                                                    <CheckCircle2 className="w-3 h-3 mr-1" />
                                                    Active
                                                </Badge>
                                            ) : (
                                                <Badge variant="destructive">
                                                    <XCircle className="w-3 h-3 mr-1" />
                                                    Inactive
                                                </Badge>
                                            )}
                                        </TableCell>
                                        <TableCell className="text-right">
                                            <div className="flex items-center justify-end gap-2">
                                                <label className="cursor-pointer">
                                                    <FileText className="w-4 h-4 text-blue-600 hover:text-blue-700" />
                                                    <input
                                                        type="file"
                                                        accept=".pdf,.doc,.docx"
                                                        className="hidden"
                                                        onChange={(e) => handleResumeUpload(e, fac.id)}
                                                        disabled={uploadingResume}
                                                    />
                                                </label>
                                                <Button
                                                    size="sm"
                                                    variant="ghost"
                                                    onClick={() => openEditDialog(fac)}
                                                >
                                                    <Edit className="w-4 h-4" />
                                                </Button>
                                                <Button
                                                    size="sm"
                                                    variant="ghost"
                                                    onClick={() => handleDeleteFaculty(fac.id)}
                                                    className="text-red-600 hover:text-red-700"
                                                >
                                                    <Trash2 className="w-4 h-4" />
                                                </Button>
                                            </div>
                                        </TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </div>

                    {filteredFaculty.length === 0 && (
                        <div className="text-center py-12">
                            <AlertCircle className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                            <p className="text-gray-500">No faculty members found</p>
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* Edit Dialog */}
            <Dialog open={isEditDialogOpen} onOpenChange={setIsEditDialogOpen}>
                <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
                    <DialogHeader>
                        <DialogTitle>Edit Faculty Member</DialogTitle>
                        <DialogDescription>
                            Update faculty member details
                        </DialogDescription>
                    </DialogHeader>
                    <form onSubmit={handleEditFaculty} className="space-y-4">
                        {/* Same form fields as Add Dialog */}
                        <div className="grid grid-cols-2 gap-4">
                            <div>
                                <Label htmlFor="edit_first_name">First Name *</Label>
                                <Input
                                    id="edit_first_name"
                                    required
                                    value={formData.first_name}
                                    onChange={(e) => setFormData({ ...formData, first_name: e.target.value })}
                                />
                            </div>
                            <div>
                                <Label htmlFor="edit_last_name">Last Name *</Label>
                                <Input
                                    id="edit_last_name"
                                    required
                                    value={formData.last_name}
                                    onChange={(e) => setFormData({ ...formData, last_name: e.target.value })}
                                />
                            </div>
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div>
                                <Label htmlFor="edit_phone">Phone *</Label>
                                <Input
                                    id="edit_phone"
                                    required
                                    value={formData.phone}
                                    onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                                />
                            </div>
                            <div>
                                <Label htmlFor="edit_designation">Designation *</Label>
                                <Select
                                    required
                                    value={formData.designation}
                                    onValueChange={(value) => setFormData({ ...formData, designation: value })}
                                >
                                    <SelectTrigger>
                                        <SelectValue />
                                    </SelectTrigger>
                                    <SelectContent>
                                        {designations.map((des) => (
                                            <SelectItem key={des} value={des}>
                                                {des}
                                            </SelectItem>
                                        ))}
                                    </SelectContent>
                                </Select>
                            </div>
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div>
                                <Label htmlFor="edit_qualification">Qualification *</Label>
                                <Input
                                    id="edit_qualification"
                                    required
                                    value={formData.qualification}
                                    onChange={(e) => setFormData({ ...formData, qualification: e.target.value })}
                                />
                            </div>
                            <div>
                                <Label htmlFor="edit_specialization">Specialization *</Label>
                                <Input
                                    id="edit_specialization"
                                    required
                                    value={formData.specialization}
                                    onChange={(e) => setFormData({ ...formData, specialization: e.target.value })}
                                />
                            </div>
                        </div>

                        <div className="flex justify-end gap-3 pt-4">
                            <Button type="button" variant="outline" onClick={() => setIsEditDialogOpen(false)}>
                                Cancel
                            </Button>
                            <Button type="submit" className="bg-indigo-600 hover:bg-indigo-700">
                                Update Faculty
                            </Button>
                        </div>
                    </form>
                </DialogContent>
            </Dialog>
        </div>
    );
}
