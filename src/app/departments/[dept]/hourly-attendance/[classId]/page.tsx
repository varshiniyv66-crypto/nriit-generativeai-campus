"use client";

import HourlyAttendanceReport from "@/components/attendance/HourlyAttendanceReport";
import { use } from "react";

export default function DepartmentClassHourlyAttendancePage({ params }: { params: Promise<{ dept: string, classId: string }> }) {
    const resolvedParams = use(params);

    return (
        <HourlyAttendanceReport
            classId={resolvedParams.classId}
            backLink={`/departments/${resolvedParams.dept}/hourly-attendance`}
            titlePrefix="Department View: "
        />
    );
}
