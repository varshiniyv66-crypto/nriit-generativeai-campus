
export const NBA_CRITERIA = [
    { id: 1, name: "Vision, Mission & PEOs", score: 60, maxScore: 60, status: "Gold" },
    { id: 2, name: "Program Curriculum", score: 120, maxScore: 120, status: "Gold" },
    { id: 3, name: "Course Outcomes (COs)", score: 120, maxScore: 120, status: "Gold" },
    { id: 4, name: "Student Performance", score: 142, maxScore: 150, status: "Gold" }, // Slight realistic variance
    { id: 5, name: "Faculty Contributions", score: 195, maxScore: 200, status: "Gold" },
    { id: 6, name: "Facilities & Support", score: 80, maxScore: 80, status: "Gold" },
    { id: 7, name: "Continuous Improvement", score: 50, maxScore: 50, status: "Gold" },
    { id: 8, name: "First Year Academics", score: 48, maxScore: 50, status: "Gold" },
    { id: 9, name: "Student Support Systems", score: 50, maxScore: 50, status: "Gold" },
];

export const DEPARTMENT_COMPARISON = [
    {
        name: "CSE",
        fullName: "Computer Science & Engineering",
        intake: 360,
        placementPercentage: 92,
        facultyCount: 88,
        avgPackage: "8.5 LPA",
        researchPapers: 145,
        studentRatio: "1:14",
        accreditationStatus: "Accredited",
        color: "#3b82f6", // Blue
    },
    {
        name: "IT",
        fullName: "Information Technology",
        intake: 120,
        placementPercentage: 85, // Aspiring for Gold
        facultyCount: 32,
        avgPackage: "7.2 LPA",
        researchPapers: 89,
        studentRatio: "1:15",
        accreditationStatus: "Applying",
        color: "#8b5cf6", // Purple
    },
    {
        name: "ECE",
        fullName: "Electronics & Comm. Eng.",
        intake: 180,
        placementPercentage: 79,
        facultyCount: 46,
        avgPackage: "6.8 LPA",
        researchPapers: 112,
        studentRatio: "1:15",
        accreditationStatus: "Accredited",
        color: "#f59e0b", // Amber
    },
    {
        name: "CSE-DS",
        fullName: "Data Science",
        intake: 180,
        placementPercentage: 88,
        facultyCount: 24,
        avgPackage: "9.1 LPA",
        researchPapers: 45,
        studentRatio: "1:15",
        accreditationStatus: "New",
        color: "#10b981", // Emerald
    },
    {
        name: "AIML",
        fullName: "AI & Machine Learning",
        intake: 120,
        placementPercentage: 86,
        facultyCount: 18,
        avgPackage: "8.9 LPA",
        researchPapers: 38,
        studentRatio: "1:15",
        accreditationStatus: "New",
        color: "#ec4899", // Pink
    }
];

export const PLACEMENT_TRENDS = [
    { year: "2022-23", CSE: 85, ECE: 70, IT: 65, AIML: 0, DS: 0 },
    { year: "2023-24", CSE: 89, ECE: 75, IT: 72, AIML: 80, DS: 82 },
    { year: "2024-25", CSE: 92, ECE: 79, IT: 85, AIML: 86, DS: 88 },
];
