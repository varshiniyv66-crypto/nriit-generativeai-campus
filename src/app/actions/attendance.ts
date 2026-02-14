"use server";

import { getSheetUrl } from "@/lib/attendance-mapping";

export async function fetchAttendanceCsv(classId: string) {
    try {
        const url = getSheetUrl(classId);
        if (!url) {
            return { success: false, error: "No sheet mapped for this class." };
        }

        const response = await fetch(url, { cache: 'no-store' });
        if (!response.ok) {
            return { success: false, error: `Failed to fetch sheet: ${response.statusText}` };
        }

        const csvText = await response.text();
        return { success: true, data: csvText };
    } catch (error) {
        console.error("Sheet Fetch Error:", error);
        return { success: false, error: "Internal Server Error during fetch." };
    }
}
