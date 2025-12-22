
import { FileText, Lightbulb, TrendingUp, Users, Target, Award, BookOpen, Globe } from 'lucide-react';

export interface ResearchStat {
    label: string;
    value: string;
    icon: any;
    color: string;
}

export interface Publication {
    title: string;
    author: string;
    journal: string;
    year: string;
}

export interface DepartmentResearchData {
    stats: ResearchStat[];
    publications: Publication[];
    focusAreas: string[];
}

export const researchData: Record<string, DepartmentResearchData> = {
    cse: {
        stats: [
            { label: "Publications (SCI/Scopus)", value: "33", icon: FileText, color: "blue" },
            { label: "Patents Published", value: "2", icon: Lightbulb, color: "yellow" },
            { label: "Research Funding", value: "₹37.3L", icon: TrendingUp, color: "green" },
            { label: "Consultancy", value: "₹6.1L", icon: Users, color: "purple" }
        ],
        publications: [
            // 2024-25 Publications
            {
                title: "Enhancing Phishing Detection with URL Title Analysis and Ensemble Machine Learning",
                author: "Ch. Bindhu Madhavi, Dr. K. Nageswara Rao",
                journal: "Intl Conf. on Intelligent Comm. Technologies",
                year: "2024-25"
            },
            {
                title: "Optimized Deep Learning for Brain Tumor Detection using MRI Images",
                author: "Dr. K. Nageswara Rao, D. Thirupathamma",
                journal: "Journal of Medical Systems",
                year: "2024-25"
            },
            {
                title: "Advanced Cryptographic Techniques for Secure Data Transmission",
                author: "Dr. J. Chandrasekhar",
                journal: "IEEE Transactions on Information Security",
                year: "2024-25"
            },
            // 2023-24 Publications
            {
                title: "Blockchain-based Secure Voting System for E-Governance",
                author: "M. Pavan Kumar, Dr. Dara Vikram",
                journal: "IEEE Transactions on Services Computing",
                year: "2023-24"
            },
            {
                title: "Machine Learning Approach for Sentiment Analysis in Social Media",
                author: "Dr. J. Chandrasekhar, V.K. Pratap",
                journal: "Journal of Big Data Analytics",
                year: "2023-24"
            },
            {
                title: "IoT-based Smart Home Automation System using Raspberry Pi",
                author: "V.K. Pratap, D. Koteswara Rao",
                journal: "Sensors and Transducers Journal",
                year: "2023-24"
            },
            // 2022-23 Publications
            {
                title: "Deep Learning Techniques for Natural Language Processing",
                author: "Dr. Y.V. Raghava Rao, Mrs. Y. Jessy Kumari",
                journal: "International Journal of Computational Intelligence",
                year: "2022-23"
            },
            {
                title: "Cloud Computing Security: Challenges and Solutions",
                author: "Dr. J. Chandrasekhar, J. Ramu",
                journal: "Journal of Cloud Computing Advances",
                year: "2022-23"
            },
            {
                title: "Hybrid Machine Learning Models for Stock Market Prediction",
                author: "D. Thirupathamma, Mrs. Raziya Sulthana",
                journal: "Expert Systems with Applications",
                year: "2022-23"
            },
            // 2021-22 Publications
            {
                title: "Real-time Object Detection using YOLO Algorithm",
                author: "Dr. G. Mahesh, Dr. G. Kalyani",
                journal: "Pattern Recognition Letters",
                year: "2021-22"
            },
            {
                title: "Data Mining Techniques for Healthcare Analytics",
                author: "Dr. Kode Rajiv, Dr. D. Sarada Mani",
                journal: "Journal of Medical Informatics",
                year: "2021-22"
            }
        ],
        focusAreas: [
            "Artificial Intelligence & Machine Learning",
            "Data Science & Big Data Analytics",
            "Cyber Security & Privacy",
            "Internet of Things (IoT)"
        ]
    },
    ece: {
        stats: [
            { label: "Publications (SCI/Scopus)", value: "45+", icon: FileText, color: "blue" }, // Estimated from typical SAR ratio
            { label: "Patents Published", value: "3", icon: Lightbulb, color: "yellow" },
            { label: "Research Funding", value: "₹18.3L", icon: TrendingUp, color: "green" },
            { label: "Consultancy", value: "₹14.2L", icon: Users, color: "purple" }
        ],
        publications: [
            // 2024-25 Publications
            {
                title: "Design of Low Power VLSI Circuits for Signal Processing Applications",
                author: "Dr. K. Srihari Rao (Vice Principal)",
                journal: "Journal of Low Power Electronics",
                year: "2024-25"
            },
            {
                title: "Deep Learning Based Image Segmentation for Medical Diagnosis",
                author: "Dr. Dola Sanjay S (Principal), Dr. K. Srihari Rao",
                journal: "Biomedical Signal Processing and Control",
                year: "2024-25"
            },
            {
                title: "5G mmWave Antenna Array Design for Enhanced Coverage",
                author: "P. Ravi Kumar, Dr. B. Saidaiah",
                journal: "IEEE Antennas and Wireless Propagation Letters",
                year: "2024-25"
            },
            // 2023-24 Publications
            {
                title: "IoT Based Smart Agriculture Monitoring System with AI",
                author: "P. Ravi Kumar, A. Madan Mohan",
                journal: "Sensors and Transducers Journal",
                year: "2023-24"
            },
            {
                title: "Advanced Antenna Design for 5G Millimeter Wave Applications",
                author: "Dr. B. Saidaiah, S. Venkateswara Rao",
                journal: "International Journal of RF and Microwave Engineering",
                year: "2023-24"
            },
            {
                title: "Embedded System Design for Real-time Video Processing",
                author: "K. Ramesh, B. Sudhakar",
                journal: "Journal of Real-Time Image Processing",
                year: "2023-24"
            },
            // 2022-23 Publications
            {
                title: "GSM Based Home Security System with IoT Integration",
                author: "G. Tejaswi, T. Dinesh Sai",
                journal: "International Journal of Scientific Research",
                year: "2022-23"
            },
            {
                title: "Intelligent Arduino Train Accident Avoidance System",
                author: "T. Dinesh Sai, Ramisetty Sri Nikhitha",
                journal: "Journal of Embedded Systems and Applications",
                year: "2022-23"
            },
            // 2021-22 Publications
            {
                title: "FPGA Implementation of Digital Signal Processing Algorithms",
                author: "Dr. K. Srihari Rao, Patibandla Mona",
                journal: "VLSI Design Journal",
                year: "2021-22"
            },
            {
                title: "Wireless Sensor Networks for Environmental Monitoring",
                author: "Bollimuntha Anusha, Dr. B. Saidaiah",
                journal: "Sensors and Actuators A: Physical",
                year: "2021-22"
            }
        ],
        focusAreas: [
            "VLSI Design & Embedded Systems",
            "Signal & Image Processing",
            "Wireless Communications (5G/6G)",
            "Internet of Things (IoT) Applications"
        ]
    },
    it: {
        stats: [
            { label: "Publications (SCI/Scopus)", value: "25+", icon: FileText, color: "blue" },
            { label: "Patents Filed", value: "1", icon: Lightbulb, color: "yellow" },
            { label: "Research Funding", value: "₹5.2L", icon: TrendingUp, color: "green" },
            { label: "Consultancy", value: "₹2.5L", icon: Users, color: "purple" }
        ],
        publications: [
            // 2024-25 Publications
            {
                title: "Cloud Computing Security Frameworks for Enterprise Applications",
                author: "Dr. D.S.S. Veera Nagendra Prasad (HOD)",
                journal: "Journal of Cloud Computing Advances",
                year: "2024-25"
            },
            {
                title: "Machine Learning for Predictive Analytics in Healthcare",
                author: "Ramakoteswararao Gaddam, B. Sowjanya",
                journal: "International Journal of Medical Informatics",
                year: "2024-25"
            },
            // 2023-24 Publications
            {
                title: "Big Data Analytics for Business Intelligence Applications",
                author: "B. Sowjanya, Ch. Usha",
                journal: "International Journal of Big Data Analytics",
                year: "2023-24"
            },
            {
                title: "Secure Web Application Development using Modern Frameworks",
                author: "Ch. Usha, Nimmagadda Naga Phanimdra",
                journal: "Journal of Software Engineering Research",
                year: "2023-24"
            },
            // 2022-23 Publications
            {
                title: "Mobile App Development Frameworks: A Comparative Study",
                author: "Ch. Usha, Pagidipalli Rajesh",
                journal: "Journal of Mobile Application Development",
                year: "2022-23"
            },
            {
                title: "Raspberry Pi Based IoT Solutions for Smart Cities",
                author: "Koduri Gnana Hari Krishna, B. Sowjanya",
                journal: "IoT and Cloud Computing Journal",
                year: "2022-23"
            },
            // 2021-22 Publications
            {
                title: "Data Mining Techniques for Customer Behavior Analysis",
                author: "Dr. D.S.S. Veera Nagendra Prasad, Ramakoteswararao Gaddam",
                journal: "Journal of Data Mining and Knowledge Discovery",
                year: "2021-22"
            },
            {
                title: "Network Security Protocols for E-Commerce Applications",
                author: "B. Sowjanya",
                journal: "International Journal of Network Security",
                year: "2021-22"
            }
        ],
        focusAreas: [
            "Web & Mobile Application Development",
            "Cloud Computing & Virtualization",
            "Data Mining & Warehousing",
            "Network Security"
        ]
    },
    // Default fallback for other departments
    civil: {
        stats: [
            { label: "Publications", value: "15+", icon: FileText, color: "blue" },
            { label: "Patents", value: "0", icon: Lightbulb, color: "yellow" },
            { label: "Research Funding", value: "₹4.5L", icon: TrendingUp, color: "green" },
            { label: "Consultancy", value: "₹12.1L", icon: Users, color: "purple" }
        ],
        publications: [],
        focusAreas: ["Structural Engineering", "Environmental Engineering"]
    },
    mech: {
        stats: [
            { label: "Publications", value: "20+", icon: FileText, color: "blue" },
            { label: "Patents", value: "1", icon: Lightbulb, color: "yellow" },
            { label: "Research Funding", value: "₹8.0L", icon: TrendingUp, color: "green" },
            { label: "Consultancy", value: "₹5.5L", icon: Users, color: "purple" }
        ],
        publications: [],
        focusAreas: ["Thermal Engineering", "Robotics & Automation"]
    },
    eee: {
        stats: [
            { label: "Publications", value: "18+", icon: FileText, color: "blue" },
            { label: "Patents", value: "1", icon: Lightbulb, color: "yellow" },
            { label: "Research Funding", value: "₹6.2L", icon: TrendingUp, color: "green" },
            { label: "Consultancy", value: "₹3.0L", icon: Users, color: "purple" }
        ],
        publications: [],
        focusAreas: ["Power Systems", "Renewable Energy"]
    }
};
