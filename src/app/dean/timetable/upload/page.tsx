'use client';

import { useState } from 'react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Upload, Download, FileSpreadsheet, CheckCircle2, AlertCircle, Loader2 } from 'lucide-react';
import { downloadTimetableTemplate, parseTimetableExcel } from '@/lib/timetable-excel-nriit';
import { toast } from 'sonner';
import { Alert, AlertDescription } from '@/components/ui/alert';

interface UploadResult {
    success: boolean;
    message: string;
    results?: {
        classSection: any;
        coursesCreated: number;
        timetableEntriesCreated: number;
        errors: string[];
    };
}

export default function TimetableUploadPage() {
    const [file, setFile] = useState<File | null>(null);
    const [uploading, setUploading] = useState(false);
    const [preview, setPreview] = useState<any>(null);
    const [result, setResult] = useState<UploadResult | null>(null);

    const handleFileSelect = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const selectedFile = e.target.files?.[0];
        if (!selectedFile) return;

        if (!selectedFile.name.endsWith('.xlsx') && !selectedFile.name.endsWith('.xls')) {
            toast.error('Please select an Excel file (.xlsx or .xls)');
            return;
        }

        setFile(selectedFile);
        setResult(null);

        // Parse and preview
        try {
            const parsed = await parseTimetableExcel(selectedFile);
            setPreview(parsed);
            toast.success('File parsed successfully! Review the preview below.');
        } catch (error: any) {
            toast.error(`Failed to parse file: ${error.message}`);
            setFile(null);
        }
    };

    const handleUpload = async () => {
        if (!preview) {
            toast.error('Please select a file first');
            return;
        }

        setUploading(true);
        setResult(null);

        try {
            const response = await fetch('/api/timetable/upload', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(preview),
            });

            const data = await response.json();

            if (response.ok) {
                setResult(data);
                toast.success(data.message);

                // Clear form after successful upload
                setFile(null);
                setPreview(null);
            } else {
                toast.error(data.error || 'Upload failed');
                setResult({ success: false, message: data.error });
            }
        } catch (error: any) {
            toast.error(`Upload failed: ${error.message}`);
            setResult({ success: false, message: error.message });
        } finally {
            setUploading(false);
        }
    };

    return (
        <div className="container mx-auto p-6 space-y-6">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold">Timetable Upload</h1>
                    <p className="text-muted-foreground mt-2">
                        Upload timetables in bulk using Excel templates
                    </p>
                </div>
            </div>

            {/* Step 1: Download Template */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Download className="h-5 w-5" />
                        Step 1: Download Template
                    </CardTitle>
                    <CardDescription>
                        Download the official NRIIT timetable template
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <Button onClick={downloadTimetableTemplate} variant="outline">
                        <FileSpreadsheet className="mr-2 h-4 w-4" />
                        Download Excel Template
                    </Button>
                    <p className="text-sm text-muted-foreground mt-4">
                        The template includes:
                    </p>
                    <ul className="list-disc list-inside text-sm text-muted-foreground mt-2 space-y-1">
                        <li>Timetable grid (6 days × 8 periods)</li>
                        <li>Subject mapping sheet</li>
                        <li>Detailed instructions</li>
                    </ul>
                </CardContent>
            </Card>

            {/* Step 2: Upload Filled Template */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Upload className="h-5 w-5" />
                        Step 2: Upload Filled Template
                    </CardTitle>
                    <CardDescription>
                        Select the Excel file with your timetable data
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center">
                        <input
                            type="file"
                            accept=".xlsx,.xls"
                            onChange={handleFileSelect}
                            className="hidden"
                            id="file-upload"
                        />
                        <label
                            htmlFor="file-upload"
                            className="cursor-pointer flex flex-col items-center gap-2"
                        >
                            <FileSpreadsheet className="h-12 w-12 text-gray-400" />
                            <p className="text-sm font-medium">
                                {file ? file.name : 'Click to select Excel file'}
                            </p>
                            <p className="text-xs text-muted-foreground">
                                Supports .xlsx and .xls formats
                            </p>
                        </label>
                    </div>

                    {preview && (
                        <div className="space-y-4">
                            <Alert>
                                <CheckCircle2 className="h-4 w-4" />
                                <AlertDescription>
                                    <strong>Preview:</strong> {preview.metadata.branch} Semester {preview.metadata.semester} Section {preview.metadata.section}
                                    <br />
                                    <span className="text-sm">
                                        {preview.subjects.length} subjects, {preview.entries.length} timetable entries
                                    </span>
                                </AlertDescription>
                            </Alert>

                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <h4 className="font-semibold mb-2">Metadata</h4>
                                    <dl className="text-sm space-y-1">
                                        <div className="flex justify-between">
                                            <dt className="text-muted-foreground">Branch:</dt>
                                            <dd className="font-medium">{preview.metadata.branch}</dd>
                                        </div>
                                        <div className="flex justify-between">
                                            <dt className="text-muted-foreground">Section:</dt>
                                            <dd className="font-medium">{preview.metadata.section}</dd>
                                        </div>
                                        <div className="flex justify-between">
                                            <dt className="text-muted-foreground">Semester:</dt>
                                            <dd className="font-medium">{preview.metadata.semester}</dd>
                                        </div>
                                        <div className="flex justify-between">
                                            <dt className="text-muted-foreground">Room:</dt>
                                            <dd className="font-medium">{preview.metadata.roomNo}</dd>
                                        </div>
                                    </dl>
                                </div>

                                <div>
                                    <h4 className="font-semibold mb-2">Subjects ({preview.subjects.length})</h4>
                                    <div className="text-sm space-y-1 max-h-32 overflow-y-auto">
                                        {preview.subjects.slice(0, 5).map((subject: any, i: number) => (
                                            <div key={i} className="flex justify-between">
                                                <span className="text-muted-foreground">{subject.code}:</span>
                                                <span className="font-medium truncate ml-2">{subject.name}</span>
                                            </div>
                                        ))}
                                        {preview.subjects.length > 5 && (
                                            <p className="text-muted-foreground italic">
                                                +{preview.subjects.length - 5} more...
                                            </p>
                                        )}
                                    </div>
                                </div>
                            </div>

                            <Button
                                onClick={handleUpload}
                                disabled={uploading}
                                className="w-full"
                                size="lg"
                            >
                                {uploading ? (
                                    <>
                                        <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                                        Uploading...
                                    </>
                                ) : (
                                    <>
                                        <Upload className="mr-2 h-4 w-4" />
                                        Upload Timetable
                                    </>
                                )}
                            </Button>
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* Step 3: Results */}
            {result && (
                <Card>
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            {result.success ? (
                                <CheckCircle2 className="h-5 w-5 text-green-600" />
                            ) : (
                                <AlertCircle className="h-5 w-5 text-red-600" />
                            )}
                            Upload Results
                        </CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <Alert variant={result.success ? 'default' : 'destructive'}>
                            <AlertDescription>{result.message}</AlertDescription>
                        </Alert>

                        {result.results && (
                            <div className="grid grid-cols-3 gap-4">
                                <div className="text-center p-4 bg-blue-50 rounded-lg">
                                    <p className="text-2xl font-bold text-blue-600">
                                        {result.results.coursesCreated}
                                    </p>
                                    <p className="text-sm text-muted-foreground">Courses Created</p>
                                </div>
                                <div className="text-center p-4 bg-green-50 rounded-lg">
                                    <p className="text-2xl font-bold text-green-600">
                                        {result.results.timetableEntriesCreated}
                                    </p>
                                    <p className="text-sm text-muted-foreground">Timetable Entries</p>
                                </div>
                                <div className="text-center p-4 bg-orange-50 rounded-lg">
                                    <p className="text-2xl font-bold text-orange-600">
                                        {result.results.errors.length}
                                    </p>
                                    <p className="text-sm text-muted-foreground">Errors/Warnings</p>
                                </div>
                            </div>
                        )}

                        {result.results?.errors && result.results.errors.length > 0 && (
                            <div>
                                <h4 className="font-semibold mb-2">Errors & Warnings:</h4>
                                <ul className="list-disc list-inside text-sm text-muted-foreground space-y-1">
                                    {result.results.errors.map((error, i) => (
                                        <li key={i}>{error}</li>
                                    ))}
                                </ul>
                            </div>
                        )}
                    </CardContent>
                </Card>
            )}
        </div>
    );
}
