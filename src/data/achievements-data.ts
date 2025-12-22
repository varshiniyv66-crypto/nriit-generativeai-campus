
import { Trophy, Medal, Star, Target, Crown, Award, BookOpen, User, Zap } from 'lucide-react';

export interface Achievement {
    id: string;
    title: string;
    description: string;
    category: 'Academic' | 'Innovation' | 'Sports' | 'Cultural';
    date: string;
    recipient: string; // Student or Faculty Name
    image?: string; // Optional image URL
    icon: any;
    color: string;
}

export const DEPARTMENT_ACHIEVEMENTS: Record<string, Achievement[]> = {
    'cse': [
        {
            id: 'cse-1',
            title: "First Prize - Sustainable Development",
            description: "Gold Medal in Paper Presentation on Sustainable Development Goals at SRM University.",
            category: 'Academic',
            date: "2023-24",
            recipient: "Allu Vara Lakshmi",
            icon: Medal,
            color: "yellow"
        },
        {
            id: 'cse-2',
            title: "Cricket Championship Winners",
            description: "Medal and Trophy winners at 'Seven Squares' Institute Level Cricket Tournament.",
            category: 'Sports',
            date: "2024-25",
            recipient: "Koduri Syam Kumar",
            icon: Trophy,
            color: "blue"
        },
        {
            id: 'cse-3',
            title: "Invincible of Soiree",
            description: "Secured Third Prize in Inter-Institute Cultural Event at RVR & JC College of Engineering.",
            category: 'Cultural',
            date: "2024-25",
            recipient: "Guddeti Ramcharan Teja",
            icon: Star,
            color: "purple"
        },
        {
            id: 'cse-4',
            title: "National Employability Test - AIR 42",
            description: "Secured All India Rank 42 in Wheebox National Employability Test.",
            category: 'Academic',
            date: "2022-23",
            recipient: "Bommu Mounika",
            icon: Target,
            color: "emerald"
        },
        {
            id: 'cse-5',
            title: "RPA Hackathon - Rank 92",
            description: "Rank 92 in National Level RPA Hackathon Contest on Techgig Platform.",
            category: 'Innovation',
            date: "2022-23",
            recipient: "Pamidimalla Shanmukha Sai",
            icon: Crown,
            color: "orange"
        },
        {
            id: 'cse-6',
            title: "AP CM Cup - Netball",
            description: "Participated in AP CM Cup at State Level Netball Tournament.",
            category: 'Sports',
            date: "2022-23",
            recipient: "Kasimkota Pranathi",
            icon: Trophy,
            color: "pink"
        },
        {
            id: 'cse-7',
            title: "AI Hackathon - VR Siddhartha",
            description: "Participated in AI Hackathon at VR Siddhartha Engineering College.",
            category: 'Innovation',
            date: "2024-25",
            recipient: "Koppula Dinesh, Golla Gopi Chand, Chilka Sravani, Kutala Naga Ajay",
            icon: Zap,
            color: "cyan"
        },
        {
            id: 'cse-8',
            title: "Microsoft WISE Mentorship",
            description: "Selected for Microsoft WISE Mentorship Program at Hyderabad.",
            category: 'Academic',
            date: "2023-24",
            recipient: "Gadikoyya Lokesh Reddy",
            icon: Award,
            color: "blue"
        },
        {
            id: 'cse-9',
            title: "Accenture Digital Skills - AI",
            description: "Completed Accenture Digital Skills: Artificial Intelligence Program.",
            category: 'Academic',
            date: "2023-24",
            recipient: "Potla Raja Rajeswari",
            icon: Target,
            color: "purple"
        },
        {
            id: 'cse-10',
            title: "COLORIDO Cultural Event",
            description: "Participated in COLORIDO Inter-Institute Cultural Event at RVR & JC College.",
            category: 'Cultural',
            date: "2024-25",
            recipient: "Shaik Reshma, Thota Venkatalakshmi, Mukku Prathyusha",
            icon: Star,
            color: "pink"
        },
        {
            id: 'cse-11',
            title: "Raspberry Pi3 Level-1 Competition",
            description: "Participated in State Level Raspberry Pi3 Level-1 Contest by HMI Engineering Services.",
            category: 'Innovation',
            date: "2022-23",
            recipient: "Koduri Gnana Hari Krishna, Busani Sandhya",
            icon: Zap,
            color: "green"
        },
        {
            id: 'cse-12',
            title: "200m Track - Runner Up",
            description: "Secured Runner Up position in 200 mts Track event at Vizag.",
            category: 'Sports',
            date: "2022-23",
            recipient: "Chatharajupalli Nandini",
            icon: Medal,
            color: "orange"
        }
    ],
    'ece': [
        {
            id: 'ece-1',
            title: "International Journal Publication",
            description: "Research paper published in International Journal of Scientific Research.",
            category: 'Academic',
            date: "2023-24",
            recipient: "Ramisetty Sri Nikhitha, Patibandla Mona",
            icon: BookOpen,
            color: "blue"
        },
        {
            id: 'ece-2',
            title: "NPTEL Certified - IoT",
            description: "Successfully completed NPTEL Certification in 'Introduction to IoT'.",
            category: 'Academic',
            date: "2023-24",
            recipient: "Bollimuntha Anusha",
            icon: Award,
            color: "green"
        },
        {
            id: 'ece-3',
            title: "Paper Published - Accident Avoidance",
            description: "Published paper on 'Intelligent Arduino Train Accident Avoidance System'.",
            category: 'Innovation',
            date: "2021-22",
            recipient: "T. Dinesh Sai",
            icon: Zap,
            color: "yellow"
        },
        {
            id: 'ece-4',
            title: "Paper Published - Security System",
            description: "Published paper on 'GSM Based Security System'.",
            category: 'Innovation',
            date: "2021-22",
            recipient: "G. Tejaswi",
            icon: BookOpen,
            color: "purple"
        }
    ],
    'it': [
        {
            id: 'it-1',
            title: "Cricket Championship - Medal",
            description: "Won Medal and Trophy in Institute Level Cricket Tournament.",
            category: 'Sports',
            date: "2024-25",
            recipient: "Nimmagadda Naga Phanimdra",
            icon: Trophy,
            color: "blue"
        },
        {
            id: 'it-2',
            title: "Invincible of Soiree - Third Prize",
            description: "Secured Third Prize in Inter-Institute Cultural Event.",
            category: 'Cultural',
            date: "2024-25",
            recipient: "Pagidipalli Rajesh",
            icon: Star,
            color: "purple"
        },
        {
            id: 'it-3',
            title: "State Level Raspberry Pi3",
            description: "Participation in State Level Raspberry Pi3 Level-1 Contest.",
            category: 'Innovation',
            date: "2022-23",
            recipient: "Koduri Gnana Hari Krishna",
            icon: Zap,
            color: "orange"
        }
    ],
    'civil': [
        {
            id: 'civil-1',
            title: "Best Project - Green Building",
            description: "First Prize for Eco-friendly sustainable building model.",
            category: 'Innovation',
            date: "2024",
            recipient: "Team GreenStruct",
            icon: Trophy,
            color: "green"
        },
        {
            id: 'civil-2',
            title: "AutoCAD Design Challenge",
            description: "Winner of State Level AutoCAD Design Competition.",
            category: 'Academic',
            date: "2023",
            recipient: "K. Ravi Kumar",
            icon: Award,
            color: "blue"
        }
    ]
};
