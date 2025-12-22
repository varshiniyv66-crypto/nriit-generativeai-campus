
// NBA CRITERIA SCORES - Extracted from SAR-CSE (2024-25)
// Total Score: 952/1000
export const NBA_CRITERIA = [
    { id: 1, name: "Vision, Mission & PEOs", score: 60, maxScore: 60, status: "Gold" },
    { id: 2, name: "Program Curriculum & Teaching-Learning", score: 120, maxScore: 120, status: "Gold" },
    { id: 3, name: "Course Outcomes & Program Outcomes", score: 120, maxScore: 120, status: "Gold" },
    { id: 4, name: "Students' Performance", score: 111.95, maxScore: 150, status: "Silver" },
    { id: 5, name: "Faculty Information & Contributions", score: 194.84, maxScore: 200, status: "Gold" },
    { id: 6, name: "Facilities & Technical Support", score: 80, maxScore: 80, status: "Gold" },
    { id: 7, name: "Continuous Improvement", score: 50, maxScore: 50, status: "Gold" },
    { id: 8, name: "First Year Academics", score: 44.97, maxScore: 50, status: "Silver" },
    { id: 9, name: "Student Support Systems", score: 50, maxScore: 50, status: "Gold" },
    { id: 10, name: "Governance, Institutional Support & Financial Resources", score: 120, maxScore: 120, status: "Gold" },
];

export const DEPARTMENT_COMPARISON = [
    {
        name: "CSE",
        fullName: "Computer Science & Engineering",
        intake: 360,
        placementPercentage: 92,
        facultyCount: 38,
        avgPackage: "8.5 LPA",
        researchPapers: 145,
        studentRatio: "1:10",
        accreditationStatus: "Accredited",
        color: "#3b82f6", // Blue
    },
    {
        name: "IT",
        fullName: "Information Technology",
        intake: 120,
        placementPercentage: 85,
        facultyCount: 18,
        avgPackage: "7.2 LPA",
        researchPapers: 89,
        studentRatio: "1:7",
        accreditationStatus: "Accredited",
        color: "#8b5cf6", // Purple
    },
    {
        name: "ECE",
        fullName: "Electronics & Comm. Eng.",
        intake: 180,
        placementPercentage: 79,
        facultyCount: 28,
        avgPackage: "6.8 LPA",
        researchPapers: 112,
        studentRatio: "1:7",
        accreditationStatus: "Accredited",
        color: "#f59e0b", // Amber
    },
    {
        name: "CSE-DS",
        fullName: "Data Science",
        intake: 180,
        placementPercentage: 88,
        facultyCount: 15,
        avgPackage: "9.1 LPA",
        researchPapers: 45,
        studentRatio: "1:12",
        accreditationStatus: "New",
        color: "#10b981", // Emerald
    },
    {
        name: "AIML",
        fullName: "AI & Machine Learning",
        intake: 120,
        placementPercentage: 86,
        facultyCount: 15,
        avgPackage: "8.9 LPA",
        researchPapers: 38,
        studentRatio: "1:8",
        accreditationStatus: "New",
        color: "#ec4899", // Pink
    }
];

export const PLACEMENT_TRENDS = [
    { year: "2022-23", CSE: 85, ECE: 70, IT: 65, AIML: 0, DS: 0 },
    { year: "2023-24", CSE: 89, ECE: 75, IT: 72, AIML: 80, DS: 82 },
    { year: "2024-25", CSE: 92, ECE: 79, IT: 85, AIML: 86, DS: 88 },
];
