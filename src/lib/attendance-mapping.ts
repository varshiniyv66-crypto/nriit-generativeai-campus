export const ATTENDANCE_SHEET_IDS: Record<string, string> = {
    // 4th Year (Batch 2022)
    "4-2-CSE-A": "1YPXxPc3Wo2gTQFPwDupMykfW701Mm505iJDR87FZ7SM",
    "4-2-CSE-B": "1prrQEtD1UyJ7lBuFft5p7Crc9oIonsiQ1_nDyv5K2so",

    // 3rd Year (Batch 2023)
    "3-2-CSE-A": "1bXgKj-3b1uvV3uxcQRKzMIsla0fWvLoiz4HbxQCVojI",
    "3-2-CSE-B": "1OxOxWC2LZYt7ATI92J4pcwRb3Hv3i1m00z2kBJYVG6A",
    "3-2-CSE-C": "1B63J6PBmqgjTcR3p-7kJyDjTzfzb7cVQOXRrsgjcnIQ",

    // 2nd Year (Batch 2024)
    "2-2-CSE-A": "1OnhHjbRgj-QHUwr2SdZOh_Ha3BQrn_DoH-aKBLnNZek",
    "2-2-CSE-B": "1Zq6YLGyFQ35t-AAyGCm4FBBaOfRxxlVSyRl30wYHzBM",

    // PLACEHOLDERS for the missing 2 sheets (Total 9 requested)
    // Please update these IDs when available
    "2-2-CSE-C": "",
    "2-2-CSE-D": ""
};

export const getSheetUrl = (classId: string) => {
    // Normalize classId (e.g., "4-2 CSE A" -> "4-2-CSE-A") to match keys
    const normalizedKey = classId.replace(/ /g, '-').toUpperCase();
    const id = ATTENDANCE_SHEET_IDS[normalizedKey];
    if (!id) return null;
    return `https://docs.google.com/spreadsheets/d/${id}/export?format=csv`;
};
