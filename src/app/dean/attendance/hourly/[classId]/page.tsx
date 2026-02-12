"use client";

import HourlyAttendanceReport from "@/components/attendance/HourlyAttendanceReport";
import { use } from "react";

export default function ClassHourlyAttendancePage({ params }: { params: Promise<{ classId: string }> }) {
    const resolvedParams = use(params);

    return (
        <HourlyAttendanceReport
            classId={resolvedParams.classId}
            backLink="/dean/attendance/hourly"
        />
    );
}
