
export const DEPARTMENT_PLACEMENTS = {
    'cse': {
        trend: [
            { year: '2020-21', placed: 80, offers: 92, avgPackage: 3.6, highestPackage: 7.5 },
            { year: '2021-22', placed: 70, offers: 76, avgPackage: 3.2, highestPackage: 7.0 },
            { year: '2022-23', placed: 77, offers: 85, avgPackage: 3.4, highestPackage: 7.3 },
        ],
        package: [
            { year: '2020-21', avg: 3.6, highest: 7.5 },
            { year: '2021-22', avg: 3.2, highest: 7.0 },
            { year: '2022-23', avg: 3.4, highest: 7.3 },
        ],
        internships: {
            '2022-23': [
                { company: "Codegnan IT Solutions", students: 15, duration: "6 weeks", domain: "Full Stack Development" },
                { company: "Wipro TalentNext", students: 12, duration: "8 weeks", domain: "Cloud Computing" },
                { company: "SMARTBRAINS", students: 18, duration: "4 weeks", domain: "Data Analytics" },
            ],
            '2023-24': [
                { company: "TCS iON", students: 20, duration: "10 weeks", domain: "AI & ML" },
                { company: "Infosys Springboard", students: 15, duration: "8 weeks", domain: "Python Development" },
                { company: "QSPIDERS", students: 22, duration: "6 weeks", domain: "Software Testing" },
            ],
            '2024-25': [
                { company: "Google Cloud", students: 10, duration: "12 weeks", domain: "Cloud Architecture" },
                { company: "Microsoft Learn", students: 18, duration: "8 weeks", domain: "Azure DevOps" },
                { company: "Amazon AWS", students: 14, duration: "10 weeks", domain: "Cloud Solutions" },
            ],
        },
        training: {
            '2022-23': [
                { topic: "Data Science using Python", duration: "5 days", trainer: "Dr. Buddha Chandra Shekhar, AICTE", date: "20-05-2022", students: 97 },
                { topic: "Web Development using Django", duration: "5 days", trainer: "Dr. A Swapna Priya, VVIT", date: "01-08-2022", students: 96 },
                { topic: "Android Application Development", duration: "2 days", trainer: "Mr. T. Pavan Kumar Reddy, Accenture", date: "08-12-2022", students: 93 },
            ],
            '2023-24': [
                { topic: "Designing Deep Learning Models", duration: "1 day", trainer: "Braino Vision Solutions", date: "30-09-2023", students: 93 },
                { topic: "Robotics (Robotrix)", duration: "2 days", trainer: "SRM University", date: "05-09-2023", students: 90 },
                { topic: "Career Guidance & Counselling", duration: "1 day", trainer: "Er. Y.V.D. Chandra Sekar, CS CODENZ", date: "28-07-2023", students: 95 },
            ],
            '2024-25': [
                { topic: "AI Integration in Hardware", duration: "2 days", trainer: "Mr. Sai Satish, CEO Indian Servers", date: "30-12-2024", students: 94 },
                { topic: "AWS Hackathon", duration: "6 days", trainer: "Braino Vision Solutions", date: "24-01-2024", students: 93 },
                { topic: "Artificial Intelligence & Cloud Computing", duration: "1 day", trainer: "E. Narendra, Edunet Foundation", date: "22-01-2024", students: 94 },
            ],
        },
        tutorialsAndGuestLectures: {
            '2024-25': [
                { title: "AI Integration in Hardware", date: "30-12-2024", resourcePerson: "Mr Sai Satish, CEO Indian Servers", type: "Workshop" },
                { title: "Identifying Key Influencers in Social Networks", date: "27-12-2024", resourcePerson: "Dr. Murali Krishna Enduri, SRM-AP", type: "Guest Lecture" },
                { title: "Hackathon on AWS", date: "24-01-2024", resourcePerson: "Braino Vision Solutions", type: "Workshop" },
                { title: "Artificial Intelligence & Cloud Computing", date: "22-01-2024", resourcePerson: "E. Narendra, Edunet Foundation", type: "Workshop" },
            ],
            '2023-24': [
                { title: "Designing Deep Learning Models", date: "30-09-2023", resourcePerson: "Braino Vision Solutions", type: "Workshop" },
                { title: "Robotics (Robotrix)", date: "05-09-2023", resourcePerson: "SRM University", type: "Workshop" },
                { title: "Career Guidance & Counselling", date: "28-07-2023", resourcePerson: "Er. Y.V.D. Chandra Sekar", type: "Awareness Program" },
                { title: "Business Technology Incubators", date: "26-07-2023", resourcePerson: "Mr. Abdul Riyaz", type: "Awareness Program" },
                { title: "Mastering Data Processing for ML", date: "22-05-2023", resourcePerson: "Ms. Ruthumma, APSSDC", type: "Workshop" }
            ],
            '2022-23': [
                { title: "Sustainable Development", date: "01-03-2023", resourcePerson: "Burisetty Sri Lakshmi Ramya Krishna", type: "Workshop" },
                { title: "Digital Transformation of India", date: "15-02-2023", resourcePerson: "Sri Akhilesh Srivastava", type: "Seminar" },
                { title: "Har Ghar Dhyan", date: "10-02-2023", resourcePerson: "Mrs. Mani Are, Art of Living", type: "Awareness Program" },
                { title: "Android Application Development", date: "08-12-2022", resourcePerson: "Mr. T. Pavan Kumar Reddy", type: "Hands-on Session" },
            ]
        },
        studentAchievements: {
            '2024-25': [
                { student: "KODURI SYAM KUMAR", event: "Cricket (Seven Squares)", prize: "Medal+Trophy", level: "Institute" },
                { student: "GUDDETI RAMCHARAN TEJA", event: "Invincible of Soiree", prize: "Third", level: "Inter-Institute" },
                { student: "KOPPULA DINESH, GOLLA GOPI CHAND", event: "AI Hackathon (VR Siddartha)", prize: "Participants", level: "Inter-Institute" },
                { student: "SHAIK RESHMA, THOTA VENKATALAKSHMI", event: "Colorido (RVR & JC)", prize: "Participants", level: "Inter-Institute" }
            ],
            '2023-24': [
                { student: "ALLU VARA LAKSHMI", event: "Paper Presentation (Sustainable Development)", prize: "First (Gold Medal)", level: "National" },
                { student: "INTURI TRIVENI", event: "Paper Presentation", prize: "Participant", level: "National" },
                { student: "KASIREDDY SAI SANDEEP REDDY", event: "Paper Presentation", prize: "Participant", level: "National" }
            ],
            '2022-23': [
                { student: "KODURI GNANA HARI KRISHNA", event: "Raspberry Pi3 Level-1", prize: "Participation", level: "State" },
                { student: "CHATHARAJUPALLI NANDINI", event: "200 mts Track", prize: "Runner", level: "District" },
                { student: "KASIMKOTA PRANATHI", event: "Netball (AP CM Cup)", prize: "Participated", level: "State" },
                { student: "BOMMU MOUNIKA", event: "Wheebox National Employability Test", prize: "Rank 42", level: "National" },
                { student: "PAMIDIMALLA SHANMUKHA SAI", event: "RPA Hackathon Contest", prize: "Rank 92", level: "National" }
            ]
        },
        events: {
            '2024-25': [
                { name: "NRIIT TECH FEST 2K24", type: "Technical Fest", date: "15-09-2024", description: "Annual technical symposium featuring coding contests and paper presentations." }
            ],
            '2023-24': [
                { name: "Engineers Day Celebrations", type: "Celebration", date: "15-09-2023", description: "Celebrating the contributions of engineers with technical expo." }
            ]
        },
        mouByYear: {
            '2020-21': [
                { name: "L4G Solutions Pvt Ltd", date: "07-04-2020", loc: "Hyderabad", type: "Placement & Training" },
                { name: "Oracle Academy", date: "15-08-2020", loc: "Virtual", type: "Curriculum Partnership" },
            ],
            '2021-22': [
                { name: "Wipro TalentNext", date: "22-08-2021", loc: "Bangalore", type: "Campus Recruitment" },
                { name: "AWS Educate", date: "10-11-2021", loc: "Virtual", type: "Cloud Training" },
            ],
            '2022-23': [
                { name: "Innovative Technologies", date: "15-11-2022", loc: "Vijayawada", type: "Internship & Placement" },
                { name: "Cisco Networking Academy", date: "20-12-2022", loc: "Virtual", type: "Certification Program" },
            ],
            '2023-24': [
                { name: "Palo Alto Networks", date: "10-08-2023", loc: "Virtual", type: "Cybersecurity Academy" },
                { name: "Blackbucks Group", date: "05-11-2023", loc: "Hyderabad", type: "Data Science Training" },
                { name: "Celonis", date: "20-01-2024", loc: "Virtual", type: "Process Mining Center of Excellence" }
            ],
            '2024-25': [
                { name: "Salesforce Academy", date: "15-07-2024", loc: "Virtual", type: "CRM Training" },
                { name: "ServiceNow", date: "22-09-2024", loc: "Bangalore", type: "Developer Program" }
            ]
        },
        mou: [
            { name: "L4G Solutions Pvt Ltd", date: "07-04-2020", loc: "Hyderabad" },
            { name: "Innovative Technologies", date: "15-11-2022", loc: "Vijayawada" },
        ]
    },
    'ece': {
        trend: [
            { year: '2021-22', placed: 67, offers: 75, avgPackage: 4.0, highestPackage: 8.5 },
            { year: '2022-23', placed: 79, offers: 90, avgPackage: 4.2, highestPackage: 9.0 },
            { year: '2023-24', placed: 60, offers: 70, avgPackage: 4.5, highestPackage: 11.0 },
        ],
        package: [
            { year: '2021-22', avg: 4.0, highest: 8.5 },
            { year: '2022-23', avg: 4.2, highest: 9.0 },
            { year: '2023-24', avg: 4.5, highest: 11.0 },
        ],
        internships: {
            '2021-22': [
                { company: "Texas Instruments", students: 8, duration: "12 weeks", domain: "Embedded Systems" },
                { company: "Efftronics", students: 12, duration: "8 weeks", domain: "IoT Solutions" },
            ],
            '2022-23': [
                { company: "Intel FPGA", students: 10, duration: "10 weeks", domain: "FPGA Design" },
                { company: "Qualcomm", students: 6, duration: "12 weeks", domain: "5G Technology" },
                { company: "BSNL", students: 15, duration: "6 weeks", domain: "Telecom Networks" },
            ],
            '2023-24': [
                { company: "HackBoats", students: 20, duration: "5 days", domain: "Robotics & IoT" },
                { company: "MRK Technologies", students: 18, duration: "3 days", domain: "PCB Design" },
            ],
        },
        training: {
            '2021-22': [
                { topic: "Digital Signal Processing", duration: "1 day", trainer: "Dr. Mallikarjuna Reddy, VVIT", date: "27-10-2021", students: 90 },
                { topic: "5G Networks Resource Allocation", duration: "1 day", trainer: "Mr. B. Subbarao, BSNL", date: "23-12-2021", students: 95 },
                { topic: "Python Programming", duration: "1 day", trainer: "Dr. K. Giri Babu, VVIT", date: "24-04-2022", students: 70 },
            ],
            '2022-23': [
                { topic: "Introduction to IoT", duration: "1 day", trainer: "Dr. N. Adinarayana, KITS", date: "25-07-2022", students: 85 },
                { topic: "Advanced Microcontroller", duration: "3 days", trainer: "Dr. P. Ammi Reddy, VVIT", date: "07-09-2022", students: 74 },
                { topic: "Low Power VLSI Design", duration: "1 day", trainer: "Mr. Uma Manikanta, Anitha Technologies", date: "16-02-2023", students: 90 },
            ],
            '2023-24': [
                { topic: "Robotics Workshop", duration: "5 days", trainer: "Mr. Mahan RK, HackBoats", date: "24-07-2023", students: 80 },
                { topic: "PCB Design", duration: "3 days", trainer: "Mr. Rajesh, MRK Technologies", date: "19-08-2023", students: 82 },
                { topic: "IoT & AI Workshop", duration: "2 days", trainer: "Mr. Mahan RK, HackBoats", date: "26-02-2024", students: 74 },
            ],
        },
        tutorialsAndGuestLectures: {
            '2023-24': [
                { title: "Robotics Workshop", date: "24-07-2023", resourcePerson: "Mr. Mahan RK, HackBoats", type: "Workshop" },
                { title: "PCB Design Workshop", date: "19-08-2023", resourcePerson: "Mr. Rajesh, MRK Technologies", type: "Workshop" },
                { title: "Skills for Success", date: "11-11-2023", resourcePerson: "Dr. K. Giri Babu, VVIT", type: "Guest Lecture" },
                { title: "Embedded System Design for IoT", date: "13-03-2024", resourcePerson: "Mr. Likhith, HackBoats", type: "Workshop" }
            ],
            '2022-23': [
                { title: "Introduction to IoT", date: "25-07-2022", resourcePerson: "Dr. N. Adinarayana", type: "Workshop" },
                { title: "Advanced Microcontroller", date: "07-09-2022", resourcePerson: "Dr. P. Ammi Reddy", type: "Workshop" },
                { title: "Low Power VLSI design", date: "16-02-2023", resourcePerson: "Mr. Uma Manikanta", type: "Guest Lecture" },
                { title: "5G antenna technology", date: "24-04-2023", resourcePerson: "Dr. K. Ramanjaneyulu", type: "Guest Lecture" }
            ],
            '2021-22': [
                { title: "Digital signal processing", date: "27-10-2021", resourcePerson: "Dr. Mallikarjuna Reddy", type: "Guest Lecture" },
                { title: "Resource Allocation in 5G", date: "23-12-2021", resourcePerson: "Mr. B. Subbarao", type: "Guest Lecture" },
                { title: "Personality Development", date: "30-03-2022", resourcePerson: "Mr. G. Nageswara Rao", type: "Guest Lecture" },
                { title: "Environmental Impact Assessment", date: "23-04-2022", resourcePerson: "Dr. Kota Srinivasu", type: "Guest Lecture" }
            ]
        },
        studentAchievements: {
            '2023-24': [
                { student: "Ramisetty Sri Nikhitha, Patibandla Mona", event: "Paper Published", prize: "Published", level: "International Journal" },
                { student: "BOLLIMUNTHA ANUSHA", event: "NPTEL: Intro to IoT", prize: "Certified", level: "National" }
            ],
            '2021-22': [
                { student: "T.Dinesh Sai", event: "Paper: Intelligent Arduino Train Accident Avoidance", prize: "Published", level: "Journal" },
                { student: "G.Tejaswi", event: "Paper: GSM Based Security System", prize: "Published", level: "Journal" }
            ]
        },
        events: {
            '2023-24': [
                { name: "National Sports Day", type: "Celebration", date: "29-08-2023", description: "Sports and games for students." },
                { name: "NSS Activity", type: "Social Service", date: "24-01-2024", description: "Community service event." }
            ]
        },
        mouByYear: {
            '2021-22': [
                { name: "Texas Instruments", date: "10-02-2021", loc: "Bangalore", type: "Industry Collaboration" },
                { name: "BSNL Training Center", date: "15-06-2021", loc: "Guntur", type: "Technical Training" },
            ],
            '2022-23': [
                { name: "Intel FPGA University", date: "05-06-2022", loc: "USA / Virtual", type: "Academic Partnership" },
                { name: "MRK Technologies", date: "20-08-2022", loc: "Vijayawada", type: "Skill Development" },
            ],
            '2023-24': [
                { name: "Qualcomm Academy", date: "12-11-2023", loc: "Hyderabad", type: "Research & Training" },
                { name: "HackBoats", date: "15-07-2023", loc: "Bangalore", type: "Robotics Training" },
            ],
            '2024-25': [
                { name: "Veda IIT", date: "10-09-2024", loc: "Hyderabad", type: "VLSI Training" },
                { name: "MosChip Technologies", date: "05-12-2024", loc: "Hyderabad", type: "Semiconductor Design" }
            ]
        },
        mou: [
            { name: "Texas Instruments", date: "10-02-2021", loc: "Bangalore" },
            { name: "Intel FPGA University", date: "05-06-2022", loc: "USA / Virtual" },
            { name: "Qualcomm Academy", date: "12-11-2023", loc: "Hyderabad" },
        ]
    },
    'it': {
        trend: [
            { year: '2022-23', placed: 28, offers: 35, avgPackage: 4.0, highestPackage: 8.5 },
            { year: '2023-24', placed: 32, offers: 38, avgPackage: 4.5, highestPackage: 12.0 },
            { year: '2024-25', placed: 33, offers: 39, avgPackage: 4.8, highestPackage: 14.0 },
        ],
        package: [
            { year: '2022-23', avg: 4.0, highest: 8.5 },
            { year: '2023-24', avg: 4.5, highest: 12.0 },
            { year: '2024-25', avg: 4.8, highest: 14.0 },
        ],
        internships: {
            '2022-23': [
                { company: "SMARTBRAINS", students: 10, duration: "6 weeks", domain: "Web Development" },
                { company: "QSPIDERS", students: 8, duration: "8 weeks", domain: "Software Testing" },
                { company: "Codegnan", students: 12, duration: "4 weeks", domain: "Python & ML" },
            ],
            '2023-24': [
                { company: "TCS iON", students: 15, duration: "10 weeks", domain: "Digital Technologies" },
                { company: "Braino Vision Solutions", students: 12, duration: "6 weeks", domain: "Deep Learning" },
                { company: "APSSDC", students: 18, duration: "5 days", domain: "Data Analytics" },
            ],
            '2024-25': [
                { company: "Indian Servers", students: 14, duration: "2 days", domain: "AI in Hardware" },
                { company: "Edunet Foundation", students: 16, duration: "1 day", domain: "Cloud Computing" },
                { company: "SRM University", students: 12, duration: "2 days", domain: "Robotics" },
            ],
        },
        training: {
            '2022-23': [
                { topic: "Data Science using Python", duration: "1 day", trainer: "Dr. Buddha Chandra Shekhar, AICTE", date: "20-05-2022", students: 97 },
                { topic: "Ethical Hacking & Cyber Security", duration: "1 day", trainer: "Santosh Chaluvadi, Supraja Technologies", date: "11-05-2022", students: 95 },
                { topic: "Web Development using Django", duration: "5 days", trainer: "Dr. A Swapna Priya, VVIT", date: "01-08-2022", students: 96 },
            ],
            '2023-24': [
                { topic: "Designing Deep Learning Models", duration: "1 day", trainer: "Braino Vision Solutions", date: "30-09-2023", students: 93 },
                { topic: "Robotics Workshop", duration: "2 days", trainer: "SRM University", date: "05-09-2023", students: 90 },
                { topic: "Mastering Data Processing for ML", duration: "6 days", trainer: "Ms. Ruthumma, APSSDC", date: "22-05-2023", students: 93 },
            ],
            '2024-25': [
                { topic: "AI Integration in Hardware", duration: "2 days", trainer: "Mr. Sai Satish, Indian Servers", date: "30-12-2024", students: 94 },
                { topic: "Social Networks Analysis", duration: "1 day", trainer: "Dr. Murali Krishna Enduri, SRM-AP", date: "27-12-2024", students: 93 },
                { topic: "AWS Workshop & Hackathon", duration: "6 days", trainer: "Braino Vision Solutions", date: "24-01-2024", students: 93 },
            ],
        },
        tutorialsAndGuestLectures: {
            '2024-25': [
                { title: "AI Integration in Hardware", date: "30-12-2024", resourcePerson: "Mr Sai Satish", type: "Workshop" },
                { title: "Identifying Key Influencers", date: "27-12-2024", resourcePerson: "Dr. Murali Krishna Enduri", type: "Guest Lecture" },
                { title: "Hackathon on AWS", date: "24-01-2024", resourcePerson: "Braino Vision Solutions", type: "Workshop" }
            ],
            '2023-24': [
                { title: "Deep Learning Models", date: "30-09-2023", resourcePerson: "Braino Vision", type: "Workshop" },
                { title: "Robotics (Robotrix)", date: "05-09-2023", resourcePerson: "SRM University", type: "Workshop" },
                { title: "Career Guidance", date: "28-07-2023", resourcePerson: "Er. Y.V.D. Chandra Sekar", type: "Awareness" }
            ],
            '2022-23': [
                { title: "Sustainable Development", date: "01-03-2023", resourcePerson: "Burisetty Sri Lakshmi", type: "Workshop" },
                { title: "Digital Transformation", date: "15-02-2023", resourcePerson: "Sri Akhilesh Srivastava", type: "Seminar" },
                { title: "Har Ghar Dhyan", date: "10-02-2023", resourcePerson: "Mrs. Mani Are", type: "Awareness" }
            ]
        },
        studentAchievements: {
            '2024-25': [
                { student: "NIMMAGADDA NAGA PHANIMDRA", event: "Cricket", prize: "Medal+Trophy", level: "Institute" },
                { student: "PAGIDIPALLI RAJESH", event: "Invincible of Soiree", prize: "Third", level: "Inter-Institute" }
            ],
            '2022-23': [
                { student: "KODURI GNANA HARI KRISHNA (IT also)", event: "Raspberry Pi3", prize: "Participation", level: "State" }
            ]
        },
        events: {
            '2024-25': [
                { name: "IT TECH FEST", type: "Technical Fest", date: "10-10-2024", description: "Department fest with coding challenges." }
            ]
        },
        mouByYear: {
            '2020-21': [
                { name: "TCS iON", date: "15-01-2020", loc: "Mumbai", type: "Digital Learning Platform" },
            ],
            '2021-22': [
                { name: "Wipro TalentNext", date: "22-08-2021", loc: "Bangalore", type: "Talent Development" },
            ],
            '2022-23': [
                { name: "RedHat Academy", date: "15-10-2022", loc: "Virtual", type: "Linux Certification" },
                { name: "BluePrism", date: "20-02-2023", loc: "Virtual", type: "RPA Training" }
            ],
            '2023-24': [
                { name: "Cisco Networking Academy", date: "30-10-2023", loc: "Virtual", type: "Networking Certification" },
                { name: "Oracle Academy", date: "15-11-2023", loc: "Virtual", type: "Database Training" },
            ],
            '2024-25': [
                { name: "Juniper Networks", date: "10-08-2024", loc: "Virtual", type: "Cloud & Networking" }
            ]
        },
        mou: [
            { name: "TCS iON", date: "15-01-2020", loc: "Mumbai" },
            { name: "Wipro TalentNext", date: "22-08-2021", loc: "Bangalore" },
            { name: "Cisco Networking Academy", date: "30-10-2023", loc: "Virtual" },
        ]
    },

    // =====================================================================
    // PLACEHOLDERS FOR NEW DEPARTMENTS
    // =====================================================================
    'civil': {
        trend: [
            { year: '2022-23', placed: 40, offers: 45, avgPackage: 3.2, highestPackage: 5.5 },
        ],
        package: [
            { year: '2022-23', avg: 3.2, highest: 5.5 },
        ],
        internships: {
            '2023-24': [{ company: "L&T Construction", students: 8, duration: "6 weeks", domain: "Site Engineering" }]
        },
        training: {
            '2023-24': [{ topic: "Revit Architecture", duration: "1 week", trainer: "Canter CADD", date: "15-09-2023", students: 30 }]
        },
        mouByYear: {
            '2022-23': [{ name: "National Highway Authority", date: "10-02-2022", loc: "Delhi", type: "Internship" }]
        },
        mou: [{ name: "National Highway Authority", date: "10-02-2022", loc: "Delhi" }],
        tutorialsAndGuestLectures: {}, studentAchievements: {}, events: {}
    },
    'cse-ds': {
        trend: [], package: [], internships: {}, training: {}, mouByYear: {}, mou: [], tutorialsAndGuestLectures: {}, studentAchievements: {}, events: {}
    },
    'cse-ai': {
        trend: [], package: [], internships: {}, training: {}, mouByYear: {}, mou: [], tutorialsAndGuestLectures: {}, studentAchievements: {}, events: {}
    },
    'evt': {
        trend: [], package: [], internships: {}, training: {}, mouByYear: {}, mou: [], tutorialsAndGuestLectures: {}, studentAchievements: {}, events: {}
    },
    'mba': {
        trend: [], package: [], internships: {}, training: {}, mouByYear: {}, mou: [], tutorialsAndGuestLectures: {}, studentAchievements: {}, events: {}
    },
    'mca': {
        trend: [], package: [], internships: {}, training: {}, mouByYear: {}, mou: [], tutorialsAndGuestLectures: {}, studentAchievements: {}, events: {}
    },
    'bsh': {
        trend: [], package: [], internships: {}, training: {}, mouByYear: {}, mou: [], tutorialsAndGuestLectures: {}, studentAchievements: {}, events: {}
    }
}
