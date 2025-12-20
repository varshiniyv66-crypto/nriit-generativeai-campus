"use client";

import { useState, useEffect, Suspense } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { Card, CardHeader, CardTitle, CardDescription, CardContent, CardFooter } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Lock, User, GraduationCap, ArrowRight } from "lucide-react";
import { toast } from "sonner";
import { supabase } from "@/lib/supabase";

function LoginContent() {
    const router = useRouter();
    const searchParams = useSearchParams();
    const [role, setRole] = useState("student");
    const [id, setId] = useState("");
    const [password, setPassword] = useState("");
    const [isLoading, setIsLoading] = useState(false);

    // Auto-select role from query params
    useEffect(() => {
        const roleParam = searchParams.get('role');
        if (roleParam === 'dean') setRole('admin');
        else if (roleParam === 'faculty') setRole('faculty');
        else if (roleParam === 'student') setRole('student');
    }, [searchParams]);

    // Core Login Logic
    const attemptLogin = async (currentRole: string, currentId: string, currentPassword?: string) => {
        setIsLoading(true);

        try {
            // 1. Verify credentials against Supabase
            let userFound = null;
            let redirectPath = "";
            let queryId = currentId;

            if (currentRole === 'student') {
                // Look up student by roll number or email
                let { data, error } = await (supabase
                    .from('student_profiles') as any)
                    .select('id, first_name, last_name, roll_number, email')
                    .or(`roll_number.eq.${queryId.toUpperCase()},email.eq.${queryId.toLowerCase()}`)
                    .single();

                if (data) {
                    userFound = { ...data, name: `${data.first_name} ${data.last_name}`, role: 'student' };
                    redirectPath = '/student/dashboard';
                }
            } else if (currentRole === 'faculty') {
                // Try to find by employee_id first, then by email
                let { data, error } = await (supabase
                    .from('faculty_profiles') as any)
                    .select('id, first_name, last_name, employee_id, email')
                    .or(`employee_id.eq.${queryId.toUpperCase()},email.eq.${queryId.toLowerCase()}`)
                    .single();

                if (data) {
                    userFound = { ...data, name: `Dr. ${data.first_name} ${data.last_name}`, role: 'faculty' };
                    redirectPath = '/faculty/dashboard';
                }
            } else if (currentRole === 'admin') {
                // Check for Dean user in users table
                const { data, error } = await (supabase
                    .from('users') as any)
                    .select('id, email, role')
                    .eq('email', queryId.toLowerCase())
                    .eq('role', 'dean')
                    .single();

                if (data) {
                    userFound = { ...data, name: 'Dean', role: 'dean' };
                    redirectPath = '/dean/dashboard';
                } else {
                    // Fallback for generic admin
                    if (queryId.toLowerCase() === 'admin' && currentPassword === 'admin123') {
                        userFound = { name: 'Administrator', role: 'admin' };
                        redirectPath = '/admin/dashboard';
                    }
                }
            }

            if (userFound) {
                // 2. Set Session
                if (typeof window !== 'undefined') {
                    localStorage.setItem('nriit_user', JSON.stringify(userFound));
                    document.cookie = `nriit_role=${currentRole}; path=/`;
                }

                toast.success(`Welcome back, ${userFound.name}`);
                router.push(redirectPath);
            } else {
                toast.error("Invalid Credentials. Please check your ID.");
            }

        } catch (error) {
            console.error("Login Error:", error);
            toast.error("An error occurred during login.");
        } finally {
            setIsLoading(false);
        }
    };

    // Form Handlers
    const handleLogin = async (e: React.FormEvent) => {
        e.preventDefault();
        await attemptLogin(role, id, password);
    };

    return (
        <div className="min-h-screen bg-gradient-to-br from-blue-900 via-slate-900 to-black flex items-center justify-center p-4">
            {/* Background Pattern */}
            <div className="absolute inset-0 opacity-20 bg-[url('/grid-pattern.svg')]" />

            <Card className="w-full max-w-md border-white/10 bg-white/10 backdrop-blur-xl text-white shadow-2xl relative z-10">
                <CardHeader className="space-y-1 text-center">
                    <div className="w-16 h-16 bg-blue-600 rounded-2xl mx-auto flex items-center justify-center mb-4 shadow-lg shadow-blue-600/20">
                        <GraduationCap className="w-8 h-8 text-white" />
                    </div>
                    <CardTitle className="text-2xl font-bold tracking-tight text-white">Digital Campus Login</CardTitle>
                    <CardDescription className="text-gray-400">
                        Enter your credentials to access the portal
                    </CardDescription>
                </CardHeader>
                <form onSubmit={handleLogin}>
                    <CardContent className="space-y-4">
                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-300">Select Role</label>
                            <span className="text-white"> role is {role} </span>
                            <Select value={role} onValueChange={setRole}>
                                <SelectTrigger className="bg-white/5 border-white/10 text-white">
                                    <SelectValue placeholder="Select your role" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="student">Student</SelectItem>
                                    <SelectItem value="faculty">Faculty</SelectItem>
                                    <SelectItem value="admin">Administrator</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-300">
                                {role === 'student' ? 'Roll Number' : role === 'faculty' ? 'Employee ID' : 'Username'}
                            </label>
                            <div className="relative">
                                <User className="absolute left-3 top-2.5 h-5 w-5 text-gray-500" />
                                <Input
                                    type="text"
                                    placeholder={role === 'student' ? 'e.g. 24CSE001' : role === 'faculty' ? 'e.g. FACCSE001 or faccse001@nriit.ac.in' : 'Admin Email'}
                                    className="pl-10 bg-white/5 border-white/10 text-white placeholder:text-gray-600"
                                    value={id}
                                    onChange={(e) => setId(e.target.value)}
                                    required
                                />
                            </div>
                        </div>

                        <div className="space-y-2">
                            <label className="text-sm font-medium text-gray-300">Password</label>
                            <div className="relative">
                                <Lock className="absolute left-3 top-2.5 h-5 w-5 text-gray-500" />
                                <Input
                                    type="password"
                                    placeholder="••••••••"
                                    className="pl-10 bg-white/5 border-white/10 text-white placeholder:text-gray-600"
                                    value={password}
                                    onChange={(e) => setPassword(e.target.value)}
                                    required={role === 'admin'} // Password optional for student/faculty demo lookup
                                />
                            </div>
                            {role !== 'admin' && (
                                <p className="text-xs text-blue-300 italic">* Demo Mode: Password not required for students/faculty verification.</p>
                            )}
                        </div>
                    </CardContent>
                    <CardFooter className="flex flex-col gap-4">
                        <Button
                            type="submit"
                            className="w-full bg-blue-600 hover:bg-blue-500 text-white font-semibold py-6"
                            disabled={isLoading}
                        >
                            {isLoading ? "Authenticating..." : (
                                <span className="flex items-center gap-2">
                                    Sign In <ArrowRight className="w-4 h-4" />
                                </span>
                            )}
                        </Button>
                        <div className="text-center text-sm">
                            <button
                                type="button"
                                onClick={() => toast.info("Please contact the admin office at IT Cell or email helpdesk@nriit.ac.in for password reset.")}
                                className="text-blue-400 hover:text-blue-300 hover:underline"
                            >
                                Forgot Password?
                            </button>
                        </div>

                        {/* Developer Shortcuts */}
                        <div className="grid grid-cols-3 gap-2 mt-4 pt-4 border-t border-white/10">
                            <Button
                                type="button"
                                variant="outline"
                                className="text-xs h-8 bg-white/5 border-white/10 hover:bg-white/10"
                                onClick={() => attemptLogin('admin', 'dean@nriit.ac.in', 'admin123')}
                            >
                                Dev: Dean
                            </Button>
                            <Button
                                type="button"
                                variant="outline"
                                className="text-xs h-8 bg-white/5 border-white/10 hover:bg-white/10"
                                onClick={() => attemptLogin('faculty', 'FACCSE001')}
                            >
                                Dev: Fac
                            </Button>
                            <Button
                                type="button"
                                variant="outline"
                                className="text-xs h-8 bg-white/5 border-white/10 hover:bg-white/10"
                                onClick={() => attemptLogin('student', '23KP1A0101')}
                            >
                                Dev: Stu
                            </Button>
                        </div>
                    </CardFooter>
                </form>
            </Card>

            <div className="absolute bottom-6 text-center text-gray-500 text-sm">
                © 2024 NRI Institute of Technology. All rights reserved.
            </div>
        </div>
    );
}

export default function LoginPage() {
    return (
        <Suspense fallback={<div className="min-h-screen bg-slate-900 flex items-center justify-center text-white">Loading Portal...</div>}>
            <LoginContent />
        </Suspense>
    );
}
