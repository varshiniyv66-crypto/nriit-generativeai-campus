// Department Vision/Mission Data
// Source: NBA SAR files (2024-25) - Real extracted data

export interface DepartmentData {
    name: string;
    code: string;
    vision: string;
    mission: string[];
    about?: string;
    established?: number;
    intake?: number;
    hod?: {
        name: string;
        designation: string;
        photo?: string;
        message?: string;
    };
    labs?: {
        name: string;
        location?: string;
        description?: string;
    }[];
    mentoring?: {
        objectives: string[];
        process: string[];
    };
}

export const departments: Record<string, DepartmentData> = {
    // =====================================================================
    // IT Department - Extracted from sar-it.csv (Lines 503-515)
    // =====================================================================
    it: {
        name: "Information Technology",
        code: "IT",
        vision: "To produce innovative IT professionals who can develop globally competitive and socially useful Information Technology enabled solutions by providing leading technologies in Information Technology.",
        mission: [
            "The Department of IT is dedicated to produce software engineers with basic knowledge in problem-solving skills necessary for career advancement in IT and allied disciplines.",
            "Produce engineers with strong practical and theoretical exposure in the relevant disciplines, who are able to contribute to society through innovation.",
            "Produce engineers with teamwork, communication and interpersonal skills.",
            "To strengthen industry–academia partnerships with global relevance."
        ],
        established: 2008,
        intake: 120,
        hod: {
            name: "BATTULA SOWJANYA",
            designation: "Assistant Professor & HOD",
            message: "Welcome to the Department of Information Technology. Our goal is to empower students with cutting-edge IT skills and a strong foundation in software engineering to solve real-world problems."
        },
        labs: [
            { name: "Basic Programming Lab", location: "B-Block", description: "Equipped with latest Dell G6 MT Desktops for foundational programming courses." },
            { name: "Networks Lab", location: "B-Block", description: "Hardware and software resources for computer networking and security experiments." },
            { name: "Advanced Computing Lab 1", location: "B-Block", description: "High-performance systems for advanced algorithms and data structures." },
            { name: "Advanced Computing Lab 2", location: "B-Block", description: "Dedicated for database management and system software development." },
            { name: "Advanced Computing Lab 3", location: "B-Block", description: "Focuses on emerging technologies and web development." },
            { name: "Projects Lab", location: "B-Block", description: "Specialized lab for final year project development and research." }
        ],
        mentoring: {
            objectives: [
                "To monitor and enhance the student's regularity & discipline",
                "To monitor and enhance the student's academic/curricular performance",
                "To counsel the students and provide confidence to improve their quality of life",
                "To engage the parents in the continual improvement of their ward's performance"
            ],
            process: [
                "Weekly informal meetings between mentors and mentees for counseling",
                "Identifying and resolving academic or personal issues",
                "Recommendations for scholarships and merit awards",
                "Special counseling for psychological or health issues via specialized cells"
            ]
        }
    },

    // =====================================================================
    // ECE Department - Extracted from sar-ece updated.csv (Lines 547-561)
    // =====================================================================
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
        ],
        established: 2008,
        intake: 180,
        hod: {
            name: "Dr. SRIHARI RAO KOMATINENI",
            designation: "Professor & HOD",
            message: "The Department of ECE is committed to excellence in education and research. We prepare our students for the dynamic world of electronics and telecommunications through rigorous academic training and hands-on laboratory experience."
        },
        labs: [
            { name: "EDC Lab", location: "B-Block: 214", description: "Electronic Devices and Circuits laboratory with advanced CROs and testing equipment." },
            { name: "IC & PDC Lab", location: "B-Block: 315", description: "Integrated Circuits and Pulse Digital Circuits lab for analog and digital design." },
            { name: "COMMUNICATION Lab", location: "B-Block: 316", description: "Equipped for analog and digital communication experiments." },
            { name: "ECAD Lab", location: "B-Block: 212", description: "CAD tools for electronics design, DSP, and IOT applications." },
            { name: "MICRO WAVE LAB", location: "B-Block: 213", description: "Microwave engineering and microcontroller applications lab." },
            { name: "VLSI LAB", location: "B-Block: 211", description: "Advanced VLSI design tools including Mentor Graphics." },
            { name: "M.Tech LAB", location: "B-Block: 309", description: "Dedicated lab for postgraduate research and specialized courses." },
            { name: "PROJECT LAB", location: "B-Block: 317", description: "Dedicated space for mini and major student projects." }
        ],
        mentoring: {
            objectives: [
                "To monitor and enhance regularity & discipline",
                "To improve academic performance through personal guidance",
                "To address personal, health, and economic issues of students",
                "To involve parents in student development"
            ],
            process: [
                "Regular weekly mentoring sessions",
                "Performance tracking in Mentoring Books",
                "Parent-Teacher interactions for consistent feedback",
                "Counseling for career guidance and placements"
            ]
        }
    },

    // =====================================================================
    // CSE Department - Extracted from sar-cse updated.csv (Lines 505-517)
    // =====================================================================
    cse: {
        name: "Computer Science and Engineering",
        code: "CSE",
        vision: "To develop globally competent and ethically guided Computer Science professionals, excelling in technological leadership, research-driven innovation, and transformative contributions to society.",
        mission: [
            "Facilitate transformative foundations in computing, software engineering, and real-world experience.",
            "Drive innovation and leadership through industry–academia collaborations.",
            "Provide advanced infrastructure and mentorship for research and entrepreneurship.",
            "Foster ethics, teamwork, sustainability, and lifelong learning."
        ],
        established: 2008,
        intake: 360,
        hod: {
            name: "Dr. K. Nageswara Rao",
            designation: "Professor & HOD",
            message: "Welcome to the CSE Department. We are dedicated to fostering innovation, research, and technical excellence to prepare students for global challenges."
        },
        labs: [
            { name: "Computer Programming Lab", location: "C-Block", description: "Fully equipped with latest Dell G6 MT Desktops for C, C++ and foundational programming courses." },
            { name: "Data Structures Lab", location: "C-Block", description: "Workstations with Visual Studio, Code::Blocks, and Eclipse for data structures implementation." },
            { name: "Database Management Lab", location: "C-Block", description: "Oracle 11g, MySQL, MongoDB and PostgreSQL for database design and implementation." },
            { name: "Software Engineering Lab", location: "C-Block", description: "CASE Tools, Rational Rose, MS Project for software development lifecycle projects." },
            { name: "Computer Networks Lab", location: "C-Block", description: "Cisco Switches, Routers, Network Simulators for TCP/IP and network security experiments." },
            { name: "AI & Machine Learning Lab", location: "C-Block", description: "GPU Workstations, TensorFlow, PyTorch, Scikit-learn for AI/ML projects." },
            { name: "Web Technologies Lab", location: "C-Block", description: "HTML5, CSS3, JavaScript, React, Angular, Node.js for full-stack development." },
            { name: "Cloud Computing Lab", location: "C-Block", description: "AWS, Azure, GCP environments for cloud applications and DevOps practices." }
        ]
    },

    // =====================================================================
    // CSE-DS (Data Science) Department
    // =====================================================================
    "cse-ds": {
        name: "CSE (Data Science)",
        code: "CSE-DS",
        vision: "To emerge as a premier department producing data science professionals capable of extracting insights from data to drive innovation and decision-making.",
        mission: [
            "To provide comprehensive education in data science, machine learning and analytics.",
            "To develop skills in data processing, visualization and interpretation.",
            "To foster industry partnerships for real-world data science applications.",
            "To encourage research in emerging areas of big data and artificial intelligence."
        ],
        established: 2020,
        intake: 180,
        labs: [
            { name: "Data Science Lab", location: "C-Block", description: "Equipped with Python, R, and data analytics tools for statistical computing and visualization." },
            { name: "Machine Learning Lab", location: "C-Block", description: "Advanced ML frameworks including TensorFlow, Scikit-learn, and Keras." },
            { name: "Big Data Analytics Lab", location: "C-Block", description: "Hadoop, Spark, and distributed computing platforms for big data processing." },
            { name: "Programming Lab", location: "C-Block", description: "Foundation programming lab with Python, R, and SQL." },
            { name: "Deep Learning Lab", location: "C-Block", description: "GPU-enabled systems for deep learning and neural network training." },
            { name: "Projects Lab", location: "C-Block", description: "Dedicated space for data science projects and research." }
        ],
        hod: {
            name: "Dr. B. Bhavani",
            designation: "Associate Professor & HOD",
            message: "Data Science is the future. We empower students with the skills to extract insights and drive innovation in the data-driven world."
        }
    },

    // =====================================================================
    // CSE-AI (AI & ML) Department
    // =====================================================================
    "cse-ai": {
        name: "CSE (AI & Machine Learning)",
        code: "CSE-AI",
        vision: "To be a leading department in AI and Machine Learning education producing innovative professionals driving technological advancement.",
        mission: [
            "To provide cutting-edge education in artificial intelligence and machine learning.",
            "To develop skills in neural networks, deep learning and intelligent systems.",
            "To foster research and innovation in AI applications.",
            "To prepare students for careers in AI-driven industries."
        ],
        established: 2021,
        intake: 120,
        labs: [
            { name: "AI & ML Lab", location: "C-Block", description: "State-of-the-art lab with TensorFlow, PyTorch, and advanced ML frameworks." },
            { name: "Deep Learning Lab", location: "C-Block", description: "GPU workstations for neural network training and computer vision." },
            { name: "Natural Language Processing Lab", location: "C-Block", description: "Tools for NLP, text analytics, and language models." },
            { name: "Robotics & AI Lab", location: "C-Block", description: "Robotic kits and AI integration for autonomous systems." },
            { name: "Computer Vision Lab", location: "C-Block", description: "Image processing and computer vision applications." },
            { name: "AI Projects Lab", location: "C-Block", description: "Innovation lab for AI-based projects and research." }
        ],
        hod: {
            name: "Dr. K. Venkata Ramana",
            designation: "Associate Professor & HOD",
            message: "Our vision is to lead in AI education and research, creating intelligent solutions for tomorrow's challenges."
        }
    },

    // =====================================================================
    // EVT (Electronics & VLSI Technology) Department
    // =====================================================================
    evt: {
        name: "Electronics & VLSI Technology",
        code: "EVT",
        vision: "To become a center of excellence in VLSI design and electronics technology producing industry-ready professionals.",
        mission: [
            "To provide quality education in VLSI design and embedded systems.",
            "To develop skills in chip design, verification and testing.",
            "To foster industry collaboration for practical exposure.",
            "To encourage innovation in semiconductor and electronics technology."
        ],
        established: 2023,
        intake: 60,
        hod: {
            name: "Dr. Srihari Rao Komatineni",
            designation: "Professor & HOD",
            message: "Welcome to the EVT Department. We focus on VLSI design and electronics technology to prepare industry-ready professionals with cutting-edge skills in semiconductor and embedded systems."
        },
        labs: [
            { name: "EDC Lab", location: "B-Block: 214", description: "Electronic Devices and Circuits laboratory with advanced CROs and testing equipment." },
            { name: "IC & PDC Lab", location: "B-Block: 315", description: "Integrated Circuits and Pulse Digital Circuits lab for analog and digital design." },
            { name: "COMMUNICATION Lab", location: "B-Block: 316", description: "Equipped for analog and digital communication experiments." },
            { name: "ECAD Lab", location: "B-Block: 212", description: "CAD tools for electronics design, DSP, and IOT applications." },
            { name: "MICRO WAVE LAB", location: "B-Block: 213", description: "Microwave engineering and microcontroller applications lab." },
            { name: "VLSI LAB", location: "B-Block: 211", description: "Advanced VLSI design tools including Mentor Graphics." },
            { name: "M.Tech LAB", location: "B-Block: 309", description: "Dedicated lab for postgraduate research and specialized courses." },
            { name: "PROJECT LAB", location: "B-Block: 317", description: "Dedicated space for mini and major student projects." }
        ]
    },

    // =====================================================================
    // Civil Engineering Department
    // =====================================================================
    civil: {
        name: "Civil Engineering",
        code: "CIVIL",
        vision: "To become a recognized center of civil engineering education for quality professionals contributing to nation building.",
        mission: [
            "DM1: Develop, implement qualitative teaching and learning practices meeting industry needs.",
            "DM2: Develop Professional knowledge, values for the fast changing industry, research needs in the field of concrete and allied technologies",
            "DM3: Promote innovative and original thinking in the minds of budding engineers to face future challenges.",
            "DM4: Conduct trainings, activities that impart social responsibility, leadership and inter-personnel skills.",
            "DM5: Provide the state of art facility that promotes continuous learning and industry interaction."
        ],
        established: 2009,
        intake: 30,
        hod: {
            name: "Dr. K. Chandra Mouli",
            designation: "Professor & Head of Department",
            photo: "/faculty/civil-hod.jpg",
            message: "Welcome to the Department of Civil Engineering. We are committed to producing skilled civil engineers who contribute to infrastructure development and nation building through sustainable engineering practices."
        },
        labs: [
            { name: "Surveying Lab", location: "A-Block", description: "Equipped with total stations, theodolites, levels, and GPS instruments for field surveying." },
            { name: "CAD Lab", location: "A-Block", description: "AutoCAD, Revit, and structural design software for engineering drawings." },
            { name: "Concrete & Materials Testing Lab", location: "A-Block", description: "Universal testing machine, compression testing, and material property analysis." },
            { name: "Geotechnical Engineering Lab", location: "A-Block", description: "Soil testing equipment for foundation design and soil mechanics experiments." }
        ]
    },

    // =====================================================================
    // MBA Department
    // =====================================================================
    mba: {
        name: "Master of Business Administration",
        code: "MBA",
        vision: "To become a top-notch management institute, acknowledged for its excellence in creation of an intellectual management professionals.",
        mission: [
            "DM1: To nurture the future business leaders through imparting high quality value-based teaching, research and practical based training that meets corporate expectations.",
            "DM2: To cultivate a passion for learning and creative philosophy among the management student and teaching community.",
            "DM3: To prepare management professionals with corporate mindset having high professional competence, outstanding leadership qualities."
        ],
        established: 2009,
        intake: 120,
        hod: {
            name: "Dr. Zia Rehman",
            designation: "HOD & Professor",
            photo: "/faculty/mba-hod.jpg",
            message: "Welcome to the MBA Department at NRIIT. We strive to nurture future business leaders with high-quality management education, practical training, and professional competence to excel in the dynamic corporate world."
        },
        labs: [
            { name: "MBA Lab", location: "MBA Block", description: "Dedicated management lab for case studies, presentations, and business simulations." },
            { name: "Tally Lab", location: "MBA Block", description: "Equipped with Tally ERP software for accounting, inventory management, and financial operations." },
            { name: "R Programming Lab", location: "MBA Block", description: "Statistical computing and analytics using R, RStudio for business intelligence and data analysis." },
            { name: "IT Lab", location: "MBA Block", description: "Computer lab with latest systems for business analytics, MS Office, and enterprise software applications." }
        ]
    },

    // =====================================================================
    // MCA Department
    // =====================================================================
    mca: {
        name: "Master of Computer Applications",
        code: "MCA",
        vision: "To be the source of bringing out globally competent pioneering computing professionals, researchers, innovators and entrepreneurs and thereby succeed and contribute value to the knowledge-based economy and society.",
        mission: [
            "To provide comprehensive education in computer applications, software engineering and emerging technologies.",
            "To develop programming, analytical and problem-solving skills for industry-ready professionals.",
            "To foster research culture and innovation in computing applications.",
            "To prepare students with professional ethics, teamwork and effective communication skills for global competence."
        ],
        established: 2005,
        intake: 180,
        hod: {
            name: "Mr. Thallam Hanumantha Rao",
            designation: "Professor & HOD",
            photo: "/faculty/mca-hod.jpg",
            message: "Welcome to the MCA Department. We focus on producing globally competent computing professionals with strong foundations in software development, emerging technologies, and research to contribute to the knowledge-based economy."
        },
        labs: [
            { name: "C Programming Lab", location: "MCA Block", description: "Foundation programming lab with C compilers and debugging tools." },
            { name: "Java Programming Lab", location: "MCA Block", description: "Object-oriented programming with Java, Eclipse, and NetBeans IDE." },
            { name: "Python Programming Lab", location: "MCA Block", description: "Python development environment for scripting, web development, and data science." },
            { name: "R Programming & Analytics Lab", location: "MCA Block", description: "Statistical computing and data visualization using R and RStudio." },
            { name: "Advanced Programming Lab", location: "MCA Block", description: "Advanced technologies including web frameworks, databases, and cloud computing." }
        ]
    },

    // =====================================================================
    // BSH (Basic Sciences & Humanities) - Supporting Department
    // =====================================================================
    bsh: {
        name: "Basic Sciences & Humanities",
        code: "BSH",
        vision: "To provide strong foundation in basic sciences and humanities for engineering students.",
        mission: [
            "To impart fundamental knowledge in mathematics, physics, chemistry and English.",
            "To develop analytical thinking and communication skills.",
            "To support engineering programs with quality science education."
        ],
        established: 2008,
        intake: 0 // Supporting department, no direct intake
    }
};
