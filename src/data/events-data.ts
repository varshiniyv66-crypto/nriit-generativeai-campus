
export interface DepartmentEvent {
    id: string;
    title: string;
    date: string;
    category: 'Workshop' | 'Seminar' | 'Competition' | 'Guest Lecture' | 'Cultural';
    description: string;
    location: string;
    image?: string;
}

export interface SarHighlight {
    title: string;
    year: string;
    category: string;
    coordinator: string; // Or Student Winner
}

export interface SarStat {
    year: string;
    workshops: number;
    lectures: number;
    seminars: number;
}

export interface ClubStat {
    year: string;
    count: number;
    label: string;
}

interface DepartmentData {
    featuredPastEvents: SarHighlight[];
    academicStats: SarStat[];
    sportsStats: ClubStat[];
    upcomingEvents: DepartmentEvent[];
}

export const DEPARTMENT_EVENTS: Record<string, DepartmentData> = {
    'cse': {
        upcomingEvents: [
            { id: '1', title: 'AI & ML Bootcamp 2025', date: 'Feb 15, 2025', category: 'Workshop', description: 'Advanced Neural Networks training session with hands-on project.', location: 'Lab 5, CSE Block' },
            { id: '2', title: 'Cyber Security Trends', date: 'Mar 10, 2025', category: 'Seminar', description: 'Guest lecture by Industry Experts on latest cyber threats.', location: 'Auditorium' },
            { id: '3', title: 'Hackathon on AWS', date: 'Jan 24, 2025', category: 'Competition', description: 'Cloud computing hackathon powered by Braino Vision.', location: 'Cloud Lab' }
        ],
        featuredPastEvents: [
            { title: "NRIIT TECH FEST 2K24", year: "2024-25", category: "Technical Fest", coordinator: "Dept of CSE" },
            { title: "Science Quiz (Academic Club)", year: "2024-25", category: "Academic", coordinator: "B. Harshavarshini" },
            { title: "Story Writing (Academic Club)", year: "2023-24", category: "Creative", coordinator: "A.S.S. Subramanyaeswari" },
            { title: "Google It (Academic Club)", year: "2022-23", category: "Technical", coordinator: "V. Harshini Chowdary" },
            { title: "Code Hunt (Academic Club)", year: "2021-22", category: "Coding", coordinator: "K. Poornima" },
            { title: "Designing Deep Learning Models", year: "2023-24", category: "Workshop", coordinator: "Braino Vision" }
        ],
        academicStats: [
            { year: "2024-25", workshops: 10, lectures: 12, seminars: 10 },
            { year: "2023-24", workshops: 27, lectures: 16, seminars: 9 },
            { year: "2022-23", workshops: 25, lectures: 17, seminars: 8 },
            { year: "2021-22", workshops: 21, lectures: 15, seminars: 15 },
        ],
        sportsStats: [
            { year: "2024-25", count: 11, label: "Sports Club Events" },
            { year: "2023-24", count: 10, label: "Sports Club Events" },
            { year: "2022-23", count: 10, label: "Sports Club Events" },
        ]
    },
    'ece': {
        upcomingEvents: [
            { id: '1', title: 'IoT Makers Fair', date: 'Jan 28, 2025', category: 'Workshop', description: 'Hands-on IoT session with Raspberry Pi and Sensors.', location: 'IoT Lab, ECE Block' },
            { id: '2', title: '5G Technology Seminar', date: 'Feb 20, 2025', category: 'Seminar', description: 'Deep dive into 5G architecture and future trends.', location: 'Seminar Hall 2' },
        ],
        featuredPastEvents: [
            { title: "Technical Quiz (1st Prize)", year: "2024-25", category: "Technical", coordinator: "B. Srilakshmi & Sk. Sumiya" },
            { title: "Paper Presentation (1st)", year: "2024-25", category: "Research", coordinator: "P. Veera Brahmaiah" },
            { title: "Paper Presentation (2nd)", year: "2024-25", category: "Research", coordinator: "V.S.V.N Srikar" },
            { title: "Robotics Workshop", year: "2023-24", category: "Workshop", coordinator: "HackBoats" },
            { title: "PCB Design Workshop", year: "2023-24", category: "Workshop", coordinator: "MRK Technologies" }
        ],
        academicStats: [
            { year: "2024-25", workshops: 7, lectures: 5, seminars: 4 },
            { year: "2023-24", workshops: 5, lectures: 4, seminars: 3 },
            { year: "2022-23", workshops: 7, lectures: 5, seminars: 4 },
            { year: "2021-22", workshops: 4, lectures: 3, seminars: 3 },
        ],
        sportsStats: [
            { year: "2024-25", count: 10, label: "Sports Club Events" },
            { year: "2023-24", count: 10, label: "Sports Club Events" },
        ]
    },
    'it': {
        upcomingEvents: [
            { id: '1', title: 'Full Stack Dev Workshop', date: 'Mar 05, 2025', category: 'Workshop', description: 'Building scalable web apps with React and Node.js.', location: 'IT Lab 1' },
            { id: '2', title: 'Cloud Computing Guests', date: 'Apr 12, 2025', category: 'Guest Lecture', description: 'AWS Cloud Architecture patterns and best practices.', location: 'Virtual Hall' },
        ],
        featuredPastEvents: [
            { title: "Hackarena (1st Prize)", year: "2024-25", category: "Technical", coordinator: "M. Nagamani (VIIT)" },
            { title: "Pixel Run (2nd Prize)", year: "2024-25", category: "Competition", coordinator: "G. Navya (VIEW)" },
            { title: "Cyber Security Workshop", year: "2024-25", category: "Workshop", coordinator: "S. Tarun (KLU)" },
            { title: "Google IT (1st Prize)", year: "2023-24", category: "Technical", coordinator: "A. Satwik (VIIT)" },
            { title: "Kho-Kho (1st Position)", year: "2023-24", category: "Sports", coordinator: "D. Rakesh (Central Zone)" }
        ],
        academicStats: [
            { year: "2024-25", workshops: 8, lectures: 6, seminars: 5 },
            { year: "2023-24", workshops: 12, lectures: 9, seminars: 7 },
            { year: "2022-23", workshops: 10, lectures: 8, seminars: 6 },
            { year: "2021-22", workshops: 9, lectures: 7, seminars: 5 },
        ],
        sportsStats: [
            { year: "2024-25", count: 12, label: "Sports Club Events" },
            { year: "2023-24", count: 10, label: "Sports Club Events" },
        ]
    },
    'civil': {
        upcomingEvents: [
            { id: '1', title: 'Green Building Summit', date: 'Feb 25, 2025', category: 'Seminar', description: 'Innovations in sustainable construction.', location: 'Civil Seminar Hall' }
        ],
        featuredPastEvents: [
            { title: "Concrete Day", year: "2024-25", category: "Celebration", coordinator: "ICI Chapter" },
            { title: "Surveying Camp", year: "2023-24", category: "Field Work", coordinator: "Dept of Civil" }
        ],
        academicStats: [
            { year: "2024-25", workshops: 5, lectures: 4, seminars: 3 }
        ],
        sportsStats: []
    }
};
