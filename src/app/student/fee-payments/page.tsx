"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import {
    CreditCard, Calendar, CheckCircle2, Clock, AlertTriangle,
    Download, Wallet, TrendingUp, Receipt
} from "lucide-react";
import supabase from "@/lib/supabase";
import { toast } from "sonner";

export default function StudentFeePaymentsPage() {
    const [loading, setLoading] = useState(true);
    const [user, setUser] = useState<any>(null);
    const [feeStructure, setFeeStructure] = useState<any[]>([]);
    const [transactions, setTransactions] = useState<any[]>([]);
    const [stats, setStats] = useState({
        totalFee: 0,
        paidAmount: 0,
        pendingAmount: 0,
        nextDueDate: ''
    });

    useEffect(() => {
        loadFeeData();
    }, []);

    const loadFeeData = async () => {
        try {
            const stored = localStorage.getItem('nriit_user');
            if (!stored) return;

            const parsedUser = JSON.parse(stored);
            setUser(parsedUser);

            // Get student profile
            const { data: profile } = await supabase
                .from('student_profiles')
                .select('id, dept_code')
                .eq('roll_number', parsedUser.roll_number)
                .single();

            if (profile) {
                // Fetch fee structure
                const { data: fees } = await supabase
                    .from('fee_master')
                    .select('*')
                    .eq('dept_code', profile.dept_code)
                    .eq('academic_year', '2024-25')
                    .eq('is_active', true);

                if (fees) {
                    setFeeStructure(fees);
                    const totalFee = fees.reduce((sum: number, f: any) => sum + parseFloat(f.amount), 0);

                    // Fetch transactions
                    const { data: trans } = await supabase
                        .from('fee_transactions')
                        .select('*, fee_master(*)')
                        .eq('student_id', profile.id)
                        .order('payment_date', { ascending: false });

                    if (trans) {
                        setTransactions(trans);
                        const paidAmount = trans
                            .filter((t: any) => t.status === 'completed')
                            .reduce((sum: number, t: any) => sum + parseFloat(t.total_amount), 0);

                        const nextDue = fees.find((f: any) => new Date(f.due_date) > new Date());

                        setStats({
                            totalFee,
                            paidAmount,
                            pendingAmount: totalFee - paidAmount,
                            nextDueDate: nextDue?.due_date || ''
                        });
                    }
                }
            }

            setLoading(false);
        } catch (error) {
            console.error('Error loading fee data:', error);
            setLoading(false);
        }
    };

    const handlePayNow = () => {
        toast.info("Payment gateway integration coming soon! Please visit the accounts office for now.");
    };

    if (loading) {
        return (
            <div className="flex items-center justify-center h-[60vh]">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            </div>
        );
    }

    const paidPercentage = stats.totalFee > 0 ? Math.round((stats.paidAmount / stats.totalFee) * 100) : 0;

    return (
        <div className="space-y-6 animate-fade-in-up">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Fee Payments</h1>
                    <p className="text-gray-500">View fee structure, pay fees online, and download receipts</p>
                </div>
                <Button onClick={handlePayNow} className="gap-2 bg-gradient-to-r from-green-600 to-emerald-600">
                    <CreditCard className="w-4 h-4" />
                    Pay Now
                </Button>
            </div>

            {/* Stats Cards */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                <Card className="bg-gradient-to-br from-blue-600 to-indigo-700 text-white border-none">
                    <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-blue-100 text-sm">Total Fees</p>
                                <p className="text-3xl font-bold mt-1">₹{stats.totalFee.toLocaleString()}</p>
                            </div>
                            <Wallet className="w-10 h-10 text-blue-200" />
                        </div>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-green-500">
                    <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-gray-500 text-sm">Paid Amount</p>
                                <p className="text-3xl font-bold text-green-600 mt-1">₹{stats.paidAmount.toLocaleString()}</p>
                            </div>
                            <CheckCircle2 className="w-10 h-10 text-green-500" />
                        </div>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-red-500">
                    <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-gray-500 text-sm">Pending Amount</p>
                                <p className="text-3xl font-bold text-red-600 mt-1">₹{stats.pendingAmount.toLocaleString()}</p>
                            </div>
                            <AlertTriangle className="w-10 h-10 text-red-500" />
                        </div>
                    </CardContent>
                </Card>

                <Card className="border-l-4 border-l-amber-500">
                    <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <p className="text-gray-500 text-sm">Next Due Date</p>
                                <p className="text-xl font-bold mt-1">
                                    {stats.nextDueDate || 'No pending dues'}
                                </p>
                            </div>
                            <Calendar className="w-10 h-10 text-amber-500" />
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Payment Progress */}
            <Card>
                <CardContent className="p-6">
                    <div className="flex items-center justify-between mb-4">
                        <h3 className="font-semibold text-gray-900">Payment Progress</h3>
                        <Badge className="bg-blue-100 text-blue-700">{paidPercentage}% Completed</Badge>
                    </div>
                    <Progress value={paidPercentage} className="h-3" />
                    <div className="flex justify-between mt-2 text-sm text-gray-500">
                        <span>₹{stats.paidAmount.toLocaleString()} paid</span>
                        <span>₹{stats.pendingAmount.toLocaleString()} remaining</span>
                    </div>
                </CardContent>
            </Card>

            {/* Fee Structure */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Receipt className="w-5 h-5 text-blue-600" />
                        Fee Structure - 2024-25
                    </CardTitle>
                    <CardDescription>Academic year fee breakdown</CardDescription>
                </CardHeader>
                <CardContent>
                    {feeStructure.length > 0 ? (
                        <Table>
                            <TableHeader>
                                <TableRow>
                                    <TableHead>Fee Type</TableHead>
                                    <TableHead>Category</TableHead>
                                    <TableHead className="text-right">Amount</TableHead>
                                    <TableHead className="text-center">Due Date</TableHead>
                                    <TableHead className="text-center">Status</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {feeStructure.map((fee: any) => {
                                    const isPaid = transactions.some(
                                        (t: any) => t.fee_master_id === fee.id && t.status === 'completed'
                                    );
                                    const isOverdue = new Date(fee.due_date) < new Date() && !isPaid;

                                    return (
                                        <TableRow key={fee.id}>
                                            <TableCell className="font-medium">{fee.fee_name}</TableCell>
                                            <TableCell>
                                                <Badge variant="outline" className="capitalize">
                                                    {fee.category.replace('_', ' ')}
                                                </Badge>
                                            </TableCell>
                                            <TableCell className="text-right font-mono">
                                                ₹{parseFloat(fee.amount).toLocaleString()}
                                            </TableCell>
                                            <TableCell className="text-center">{fee.due_date}</TableCell>
                                            <TableCell className="text-center">
                                                {isPaid ? (
                                                    <Badge className="bg-green-100 text-green-700">
                                                        <CheckCircle2 className="w-3 h-3 mr-1" />
                                                        Paid
                                                    </Badge>
                                                ) : isOverdue ? (
                                                    <Badge className="bg-red-100 text-red-700">
                                                        <AlertTriangle className="w-3 h-3 mr-1" />
                                                        Overdue
                                                    </Badge>
                                                ) : (
                                                    <Badge className="bg-amber-100 text-amber-700">
                                                        <Clock className="w-3 h-3 mr-1" />
                                                        Pending
                                                    </Badge>
                                                )}
                                            </TableCell>
                                        </TableRow>
                                    );
                                })}
                            </TableBody>
                        </Table>
                    ) : (
                        <div className="text-center py-12 text-gray-500">
                            <Receipt className="w-12 h-12 mx-auto mb-4 opacity-50" />
                            <p>No fee structure available</p>
                            <p className="text-sm">Please contact the accounts office</p>
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* Transaction History */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <TrendingUp className="w-5 h-5 text-green-600" />
                        Payment History
                    </CardTitle>
                    <CardDescription>Recent transactions</CardDescription>
                </CardHeader>
                <CardContent>
                    {transactions.length > 0 ? (
                        <Table>
                            <TableHeader>
                                <TableRow>
                                    <TableHead>Date</TableHead>
                                    <TableHead>Description</TableHead>
                                    <TableHead>Method</TableHead>
                                    <TableHead className="text-right">Amount</TableHead>
                                    <TableHead className="text-center">Status</TableHead>
                                    <TableHead className="text-center">Receipt</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {transactions.map((trans: any) => (
                                    <TableRow key={trans.id}>
                                        <TableCell className="font-medium">
                                            {new Date(trans.payment_date).toLocaleDateString()}
                                        </TableCell>
                                        <TableCell>{trans.fee_master?.fee_name || 'Fee Payment'}</TableCell>
                                        <TableCell className="capitalize">{trans.payment_method || 'Online'}</TableCell>
                                        <TableCell className="text-right font-mono">
                                            ₹{parseFloat(trans.total_amount).toLocaleString()}
                                        </TableCell>
                                        <TableCell className="text-center">
                                            <Badge className={
                                                trans.status === 'completed'
                                                    ? 'bg-green-100 text-green-700'
                                                    : 'bg-amber-100 text-amber-700'
                                            }>
                                                {trans.status}
                                            </Badge>
                                        </TableCell>
                                        <TableCell className="text-center">
                                            {trans.status === 'completed' && (
                                                <Button variant="ghost" size="sm">
                                                    <Download className="w-4 h-4" />
                                                </Button>
                                            )}
                                        </TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    ) : (
                        <div className="text-center py-8 text-gray-500">
                            <CreditCard className="w-12 h-12 mx-auto mb-4 opacity-50" />
                            <p>No payment history yet</p>
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
