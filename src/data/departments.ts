
export interface DepartmentData {
    name: string;
    code: string;
    vision: string;
    mission: string[];
    about?: string;
}

export const departments: Record<string, DepartmentData> = {
    it: {
        name: "Information Technology",
        code: "IT",
        vision: "To create global IT professionals who design technology with purpose, enhance lives, and shape a sustainable future for technology and society.",
        mission: [
            "To Foster future-ready IT education and innovation in intelligent systems through creativity",
            "To Advance research and innovation in digital technologies.",
            "To Shape ethical, adaptable, and entrepreneurial graduates.",
            "To Strengthen industry–academia partnerships with global relevance."
        ]
    },
    ece: {
        name: "Electronics and Communication Engineering",
        code: "ECE",
        vision: "To become a center of excellence by bringing out the professional competence in the core areas of electronics and communication engineering.",
        mission: [
            "To provide conductive environment that impart electronics and communication knowledge through quality teaching & self-learning.",
            "To serve the needs of electronics, telecommunication and allied industries through industry interaction.",
            "To encourage innovative thinking, continuous learning among the stake holders and create new techniques in IOT, VLSI.",
            "To groom students in communication and interpersonal skills.",
            "To inculcate human values and ethics to make learners sensitive towards social issues."
        ]
    },
    cse: {
        name: "Computer Science and Engineering",
        code: "CSE",
        vision: "To empower students with cutting-edge computer science education, fostering innovation and leadership to solve global challenges.",
        mission: [
            "To provide a strong theoretical and practical foundation in computer science.",
            "To promote research and development in emerging technologies.",
            "To cultivate ethical values and social responsibility in future computing professionals.",
            "To strengthen collaboration with industry for real-world exposure and opportunities."
        ]
    },
    eee: {
        name: "Electrical and Electronics Engineering",
        code: "EEE",
        vision: "To be a leader in electrical and electronics engineering education and research, serving society through innovation.",
        mission: [
            "To provide quality education in electrical engineering fundamentals and applications.",
            "To foster research in renewable energy and power systems.",
            "To develop technically competent and ethical professionals."
        ]
    },
    mech: {
        name: "Mechanical Engineering",
        code: "MECH",
        vision: "To create competent mechanical engineers capable of addressing societal and industrial challenges with sustainable solutions.",
        mission: [
            "To offer a curriculum that balances theory and practice in mechanical engineering.",
            "To encourage innovation in design, manufacturing, and thermal sciences.",
            "To promote professional ethics and lifelong learning."
        ]
    },
    civil: {
        name: "Civil Engineering",
        code: "CIVIL",
        vision: "To develop globally competent civil engineers committed to sustainable infrastructure development and societal growth.",
        mission: [
            "To impart knowledge in structural, transportation, and environmental engineering.",
            "To foster practical skills through fieldwork and industry internships.",
            "To serve the community through sustainable engineering practices."
        ]
    },
    aiml: {
        name: "Artificial Intelligence and Machine Learning",
        code: "AIML",
        vision: "To be a center of excellence in AI and ML education, driving innovation and intelligent solutions for the future.",
        mission: [
            "To provide a robust foundation in AI algorithms and data science.",
            "To encourage cross-disciplinary research and application of AI.",
            "To prepare students for leadership roles in the AI-driven economy."
        ]
    },
    ds: {
        name: "Data Science",
        code: "DS",
        vision: "To empower students to unlock insights from data, driving decision-making and innovation across industries.",
        mission: [
            "To teach advanced statistical and computational techniques for data analysis.",
            "To foster skills in big data technologies and visualization.",
            "To promote the ethical use of data for societal benefit."
        ]
    },
    iot: {
        name: "Internet of Things",
        code: "IOT",
        vision: "To lead in IoT education and research, connecting the physical and digital worlds for a smarter future.",
        mission: [
            "To provide hands-on experience with sensor networks and embedded systems.",
            "To drive innovation in smart city and industrial IoT applications.",
            "To develop skilled professionals ready for the connected world."
        ]
    }
};
