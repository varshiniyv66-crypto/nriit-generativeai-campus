'use client';

import { useState, useCallback } from 'react';
import { useDropzone } from 'react-dropzone';
import { Upload, X, File, AlertCircle } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Progress } from '@/components/ui/progress';
import { uploadFile } from '@/lib/firebase';
import { cn } from '@/lib/utils';
import { toast } from 'sonner';

interface FileUploadProps {
    onUploadComplete: (url: string, metadata: Record<string, unknown>) => void;
    path: string;
    maxSize?: number; // in MB
    acceptedTypes?: Record<string, string[]>;
    className?: string;
    multiple?: boolean;
}

export function FileUpload({
    onUploadComplete,
    path,
    maxSize = 5,
    acceptedTypes = {
        'image/*': ['.png', '.jpg', '.jpeg', '.webp'],
        'application/pdf': ['.pdf'],
        'application/msword': ['.doc', '.docx'],
    },
    className,
    multiple = false,
}: FileUploadProps) {
    const [files, setFiles] = useState<File[]>([]);
    const [uploading, setUploading] = useState(false);
    const [progress, setProgress] = useState(0);

    const onDrop = useCallback((acceptedFiles: File[]) => {
        if (multiple) {
            setFiles(prev => [...prev, ...acceptedFiles]);
        } else {
            setFiles([acceptedFiles[0]]);
        }
    }, [multiple]);

    const { getRootProps, getInputProps, isDragActive, fileRejections } = useDropzone({
        onDrop,
        maxSize: maxSize * 1024 * 1024,
        accept: acceptedTypes,
        multiple,
    });

    const handleUpload = async () => {
        if (files.length === 0) return;

        setUploading(true);
        setProgress(0);

        try {
            // Create a unique path for each file
            const timestamp = Date.now();

            for (let i = 0; i < files.length; i++) {
                const file = files[i];
                const filePath = `${path}/${timestamp}_${file.name.replace(/\s+/g, '_')}`;

                const result = await uploadFile(file, filePath);

                onUploadComplete(result.url, {
                    name: file.name,
                    size: file.size,
                    type: file.type,
                    path: result.path,
                });

                setProgress(((i + 1) / files.length) * 100);
            }

            toast.success('File(s) uploaded successfully');
            setFiles([]);
        } catch (error) {
            console.error('Upload error:', error);
            toast.error('Failed to upload file');
        } finally {
            setUploading(false);
            setProgress(0);
        }
    };

    const removeFile = (index: number) => {
        setFiles(prev => prev.filter((_, i) => i !== index));
    };

    return (
        <div className={cn("w-full", className)}>
            <div
                {...getRootProps()}
                className={cn(
                    "border-2 border-dashed rounded-lg p-6 text-center transition-colors cursor-pointer",
                    isDragActive ? "border-blue-500 bg-blue-50" : "border-gray-200 hover:border-gray-300",
                    files.length > 0 && !multiple && "hidden" // Hide dropzone if single file selected
                )}
            >
                <input {...getInputProps()} />
                <div className="flex flex-col items-center gap-2">
                    <div className="p-3 bg-gray-100 rounded-full">
                        <Upload className="w-6 h-6 text-gray-500" />
                    </div>
                    <div className="text-sm font-medium text-gray-700">
                        {isDragActive ? "Drop the files here" : "Click or drag files to upload"}
                    </div>
                    <div className="text-xs text-gray-500">
                        Max size: {maxSize}MB
                    </div>
                </div>
            </div>

            {/* File List */}
            {files.length > 0 && (
                <div className="mt-4 space-y-3">
                    {files.map((file, index) => (
                        <div key={index} className="flex items-center justify-between p-3 bg-white border border-gray-200 rounded-lg shadow-sm">
                            <div className="flex items-center gap-3 overflow-hidden">
                                <File className="w-8 h-8 text-blue-500 flex-shrink-0" />
                                <div className="min-w-0">
                                    <div className="text-sm font-medium text-gray-700 truncate">{file.name}</div>
                                    <div className="text-xs text-gray-500">{(file.size / 1024 / 1024).toFixed(2)} MB</div>
                                </div>
                            </div>
                            <Button
                                size="icon"
                                variant="ghost"
                                className="text-gray-400 hover:text-red-500"
                                onClick={(e) => {
                                    e.stopPropagation();
                                    removeFile(index);
                                }}
                                disabled={uploading}
                            >
                                <X className="w-4 h-4" />
                            </Button>
                        </div>
                    ))}

                    {uploading && (
                        <div className="space-y-2">
                            <Progress value={progress} className="h-2" />
                            <div className="text-xs text-center text-gray-500">Uploading...</div>
                        </div>
                    )}

                    {!uploading && (
                        <div className="flex gap-3">
                            <Button onClick={handleUpload} className="w-full">
                                Upload {files.length} File{files.length > 1 ? 's' : ''}
                            </Button>
                            <Button variant="outline" onClick={() => setFiles([])} className="w-full">
                                Cancel
                            </Button>
                        </div>
                    )}
                </div>
            )}

            {/* Errors */}
            {fileRejections.length > 0 && (
                <div className="mt-2 text-sm text-red-500 flex items-center gap-2">
                    <AlertCircle className="w-4 h-4" />
                    <span>File rejected: Too large or invalid format</span>
                </div>
            )}
        </div>
    );
}
