// Department-wise Vision, Mission, PEOs, POs, PSOs
// Extracted from NBA SAR files (2024-25)

export interface DepartmentAcademicData {
    code: string;
    name: string;
    vision: string;
    mission: string[];
    peos: { id: string; statement: string }[];
    psos: { id: string; statement: string }[];
    poPsoMapping?: Record<string, number[]>; // Array of 12 values (PO1-PO12)
    attainments?: {
        target: number;
        actual: number;
    }[]; // For PO1-PO12 and PSOs
    dabReview?: {
        frequency: string;
        lastReview: string;
    };
}

// Standard 12 Program Outcomes (POs) - Common for all Engineering departments
// Based on Washington Accord / NBA guidelines
export const PROGRAM_OUTCOMES = [
    { id: "PO1", name: "Engineering Knowledge", description: "Apply the knowledge of mathematics, science, engineering fundamentals, and an engineering specialization to the solution of complex engineering problems." },
    { id: "PO2", name: "Problem Analysis", description: "Identify, formulate, review research literature, and analyze complex engineering problems reaching substantiated conclusions using first principles of mathematics, natural sciences, and engineering sciences." },
    { id: "PO3", name: "Design/Development of Solutions", description: "Design solutions for complex engineering problems and design system components or processes that meet the specified needs with appropriate consideration for the public health and safety, and the cultural, societal, and environmental considerations." },
    { id: "PO4", name: "Conduct Investigations", description: "Use research-based knowledge and research methods including design of experiments, analysis and interpretation of data, and synthesis of the information to provide valid conclusions." },
    { id: "PO5", name: "Modern Tool Usage", description: "Create, select, and apply appropriate techniques, resources, and modern engineering and IT tools including prediction and modeling to complex engineering activities with an understanding of the limitations." },
    { id: "PO6", name: "The Engineer and Society", description: "Apply reasoning informed by the contextual knowledge to assess societal, health, safety, legal and cultural issues and the consequent responsibilities relevant to the professional engineering practice." },
    { id: "PO7", name: "Environment and Sustainability", description: "Understand the impact of the professional engineering solutions in societal and environmental contexts, and demonstrate the knowledge of, and need for sustainable development." },
    { id: "PO8", name: "Ethics", description: "Apply ethical principles and commit to professional ethics and responsibilities and norms of the engineering practice." },
    { id: "PO9", name: "Individual and Team Work", description: "Function effectively as an individual, and as a member or leader in diverse teams, and in multidisciplinary settings." },
    { id: "PO10", name: "Communication", description: "Communicate effectively on complex engineering activities with the engineering community and with society at large, such as, being able to comprehend and write effective reports and design documentation, make effective presentations, and give and receive clear instructions." },
    { id: "PO11", name: "Project Management and Finance", description: "Demonstrate knowledge and understanding of the engineering and management principles and apply these to one's own work, as a member and leader in a team, to manage projects and in multidisciplinary environments." },
    { id: "PO12", name: "Life-long Learning", description: "Recognize the need for, and have the preparation and ability to engage in independent and life-long learning in the broadest context of technological change." },
];

// Department-specific data extracted from SAR files
export const DEPARTMENT_ACADEMIC_DATA: Record<string, DepartmentAcademicData> = {
    // =====================================================================
    // ECE Department - Extracted from sar-ece updated.csv
    // =====================================================================
    ECE: {
        code: "ECE",
        name: "Electronics & Communication Engineering",
        vision: "To become a center of excellence by bringing out the professional competence in the core areas of electronics and communication engineering.",
        mission: [
            "To provide conductive environment that impart electronics and communication knowledge through quality teaching & self-learning.",
            "To serve the needs of electronics, telecommunication and allied industries through industry interaction.",
            "To encourage innovative thinking, continuous learning among the stake holders and create new techniques in IOT, VLSI.",
            "To groom students in communication and interpersonal skills.",
            "To inculcate human values and ethics to make learners sensitive towards social issues."
        ],
        peos: [
            { id: "PEO1", statement: "Graduates with competencies in the area of electronics and communications engineering." },
            { id: "PEO2", statement: "Graduates with continuous learning ability in hardware and software systems." },
            { id: "PEO3", statement: "Graduates with successful career in industry, research with technical and interpersonal skills." },
            { id: "PEO4", statement: "Graduates with professional and ethical values." },
            { id: "PEO5", statement: "Graduates shall contribute to organization goals with individual and team work." }
        ],
        psos: [
            { id: "PSO1", statement: "Professional Knowledge: Apply the concepts of Electronics and Communications to arrive cost effective and appropriate solutions." },
            { id: "PSO2", statement: "Problem-solving skills: Apply the principles of analog, digital and Signal processing systems for Consumer electronics, medical and radar systems." },
            { id: "PSO3", statement: "Software Usage: Use VHDL, MATLAB, MULTISIM and MENTOR GRAPHICS to design integrated circuits and analyze signals." }
        ],
        poPsoMapping: {
            "PSO1": [3, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2],
            "PSO2": [2, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 2],
            "PSO3": [1, 2, 2, 3, 3, 1, 1, 1, 1, 1, 1, 2]
        },
        attainments: [
            { target: 1.5, actual: 2.19 }, // PO1
            { target: 1.5, actual: 2.05 }, // PO2
            { target: 1.5, actual: 1.98 }, // PO3
            { target: 1.5, actual: 2.42 }  // PSO1
        ],
        dabReview: {
            frequency: "Annually",
            lastReview: "September 2024"
        }
    },

    // =====================================================================
    // IT Department - Extracted from sar-it.csv
    // =====================================================================
    IT: {
        code: "IT",
        name: "Information Technology",
        vision: "To produce innovative IT professionals who can develop globally competitive and socially useful Information Technology enabled solutions by providing leading technologies in Information Technology.",
        mission: [
            "The Department of IT is dedicated to produce software engineers with basic knowledge in problem-solving skills necessary for career advancement in IT and allied disciplines.",
            "Produce engineers with strong practical and theoretical exposure in the relevant disciplines, who are able to contribute to society through innovation.",
            "Produce engineers with teamwork, communication and interpersonal skills.",
            "To strengthen industry–academia partnerships with global relevance."
        ],
        peos: [
            { id: "PEO1", statement: "Apply the knowledge of mathematics, science and Engineering fundamentals to identify and solve IT and Engineering problems." },
            { id: "PEO2", statement: "Use various software tools and technologies to solve problems related to academia, industry and society." },
            { id: "PEO3", statement: "Work with ethical and moral values in the multi-disciplinary teams and communicate effectively among team members with continuous learning." },
            { id: "PEO4", statement: "Pursue higher studies and develop their career in IT industry." }
        ],
        psos: [
            { id: "PSO1", statement: "Apply knowledge of computing, mathematics and engineering fundamentals to solve complex IT problems." },
            { id: "PSO2", statement: "Design, develop and implement software solutions using modern tools, technologies and programming languages." },
            { id: "PSO3", statement: "Apply IT knowledge to analyze, design and develop applications for business, scientific and societal needs." }
        ],
        poPsoMapping: {
            "PSO1": [3, 3, 2, 2, 2, 1, 1, 1, 2, 2, 1, 3],
            "PSO2": [2, 2, 3, 3, 3, 1, 1, 1, 2, 2, 1, 3],
            "PSO3": [2, 2, 2, 2, 2, 3, 2, 2, 2, 3, 2, 3]
        },
        attainments: [
            { target: 1.8, actual: 2.16 }, // PO1
            { target: 1.8, actual: 1.95 }, // PO2
            { target: 1.8, actual: 1.39 }, // PO12
            { target: 1.8, actual: 2.08 }  // PSO1
        ],
        dabReview: {
            frequency: "Annually",
            lastReview: "August 2024"
        }
    },

    // =====================================================================
    // CSE Department - Extracted from sar-cse updated.csv
    // =====================================================================
    CSE: {
        code: "CSE",
        name: "Computer Science & Engineering",
        vision: "To develop globally competent and ethically guided Computer Science professionals, excelling in technological leadership, research-driven innovation, and transformative contributions to society.",
        mission: [
            "Facilitate transformative foundations in computing, software engineering, and real-world experience.",
            "Drive innovation and leadership through industry–academia collaborations.",
            "Provide advanced infrastructure and mentorship for research and entrepreneurship.",
            "Foster ethics, teamwork, sustainability, and lifelong learning."
        ],
        peos: [
            { id: "PEO1", statement: "Graduates will establish strong foundations in computer science and software engineering for professional success and adaptability" },
            { id: "PEO2", statement: "Graduates will demonstrate ethics, leadership, teamwork, and communication in multidisciplinary environments" },
            { id: "PEO3", statement: "Graduates will pursue higher studies, research, entrepreneurship, and lifelong learning to contribute to technology and society" },
            { id: "PEO4", statement: "Graduates will apply modern tools, analytical reasoning, and problem-solving skills to design sustainable, socially responsible solutions" }
        ],
        psos: [
            { id: "PSO1", statement: "Develop and deploy innovative software solutions using computing skills and modern tools to meet industry and societal needs." },
            { id: "PSO2", statement: "Apply computational principles and advanced tools in collaboration with academia, industry, and research to deliver efficient solutions." },
            { id: "PSO3", statement: "Pursue emerging technologies and research with professionalism and ethical leadership, fostering lifelong learning and societal impact." }
        ],
        poPsoMapping: {
            "PSO1": [3, 3, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2],
            "PSO2": [2, 2, 3, 3, 3, 1, 1, 1, 1, 1, 1, 2],
            "PSO3": [1, 1, 1, 1, 2, 2, 2, 3, 2, 2, 2, 3]
        },
        attainments: [
            { target: 1.8, actual: 2.25 }, // PO1
            { target: 1.8, actual: 1.45 }, // PO12
            { target: 1.8, actual: 2.40 }  // PSO1
        ],
        dabReview: {
            frequency: "Annually",
            lastReview: "October 2024"
        }
    },

    // =====================================================================
    // CSE-DS Department
    // =====================================================================
    "CSE-DS": {
        code: "CSE-DS",
        name: "CSE (Data Science)",
        vision: "To emerge as a premier department producing data science professionals capable of extracting insights from data to drive innovation and decision-making.",
        mission: [
            "To provide comprehensive education in data science, machine learning and analytics.",
            "To develop skills in data processing, visualization and interpretation.",
            "To foster industry partnerships for real-world data science applications.",
            "To encourage research in emerging areas of big data and artificial intelligence."
        ],
        peos: [
            { id: "PEO1", statement: "Graduates with strong foundation in data science, statistics and machine learning." },
            { id: "PEO2", statement: "Graduates capable of analyzing large datasets and extracting meaningful insights." },
            { id: "PEO3", statement: "Graduates with ability to design and implement data-driven solutions." },
            { id: "PEO4", statement: "Graduates with ethical data practices and effective communication skills." }
        ],
        psos: [
            { id: "PSO1", statement: "Apply statistical and machine learning techniques to analyze and interpret complex datasets." },
            { id: "PSO2", statement: "Design and implement data pipelines, visualization dashboards and predictive models." },
            { id: "PSO3", statement: "Apply data science methodologies to solve business and societal problems." }
        ]
    },

    // =====================================================================
    // CSE-AIML Department
    // =====================================================================
    "CSE-AI": {
        code: "CSE-AI",
        name: "CSE (AI & Machine Learning)",
        vision: "To be a leading department in AI and Machine Learning education producing innovative professionals driving technological advancement.",
        mission: [
            "To provide cutting-edge education in artificial intelligence and machine learning.",
            "To develop skills in neural networks, deep learning and intelligent systems.",
            "To foster research and innovation in AI applications.",
            "To prepare students for careers in AI-driven industries."
        ],
        peos: [
            { id: "PEO1", statement: "Graduates with comprehensive knowledge of AI and machine learning fundamentals." },
            { id: "PEO2", statement: "Graduates capable of designing and implementing intelligent systems." },
            { id: "PEO3", statement: "Graduates with research aptitude in emerging AI technologies." },
            { id: "PEO4", statement: "Graduates with ethical AI practices and professional skills." }
        ],
        psos: [
            { id: "PSO1", statement: "Apply machine learning algorithms and deep learning techniques to solve complex problems." },
            { id: "PSO2", statement: "Design and develop AI-powered applications and intelligent systems." },
            { id: "PSO3", statement: "Apply AI methodologies for automation, prediction and decision support systems." }
        ]
    },

    // =====================================================================
    // CIVIL Department - REAL DATA from Old Website (extracted_content.json)
    // =====================================================================
    CIVIL: {
        code: "CIVIL",
        name: "Civil Engineering",
        vision: "To become a recognized center of civil engineering education for quality professionals contributing to nation building.",
        mission: [
            "DM1: Develop, implement qualitative teaching and learning practices meeting industry needs.",
            "DM2: Develop Professional knowledge, values for the fast changing industry, research needs in the field of concrete and allied technologies",
            "DM3: Promote innovative and original thinking in the minds of budding engineers to face future challenges.",
            "DM4: Conduct trainings, activities that impart social responsibility, leadership and inter-personnel skills.",
            "DM5: Provide the state of art facility that promotes continuous learning and industry interaction."
        ],
        peos: [
            { id: "PEO1", statement: "To prepare the graduates with an ability to plan, analyze and design the civil engineering structures by using software and pursue research." },
            { id: "PEO2", statement: "To prepare the graduates to apply the subject knowledge and provide solutions to construction field problems with continuous learning." },
            { id: "PEO3", statement: "To prepare graduates to acquire, apply modern technologies and machinery to complex engineering problems." },
            { id: "PEO4", statement: "To prepare graduates with an ability to apply ethical principles in professional engineering practice." },
            { id: "PEO5", statement: "To prepare graduates with an ability to work effectively on industry projects either individually or in teams." }
        ],
        psos: [
            { id: "PSO1", statement: "Plan, analyze, design and prepare cost estimates for construction of buildings." },
            { id: "PSO2", statement: "Apply PERT & CPM to complete the project within specified time and cost using modern construction techniques and equipment." },
            { id: "PSO3", statement: "To apply optimal methods for treating wastewater using for irrigation purpose and sustainable wastewater management." }
        ],
        poPsoMapping: {
            "PSO1": [3, 3, 2, 2, 1, 1, 1, 1, 1, 1, 1, 2],
            "PSO2": [2, 2, 3, 3, 2, 1, 1, 1, 1, 1, 1, 2],
            "PSO3": [1, 2, 2, 2, 3, 3, 2, 1, 1, 1, 1, 1]
        },
        attainments: [
            { target: 1.8, actual: 2.15 }, // PO1
            { target: 1.8, actual: 1.95 }, // PO2
            { target: 1.8, actual: 2.05 }, // PO3
            { target: 1.8, actual: 2.20 }  // PSO1
        ],
        dabReview: {
            frequency: "Annually",
            lastReview: "August 2024"
        }
    },

    // =====================================================================
    // MBA Department - REAL DATA from Old Website (extracted_content.json)
    // =====================================================================
    MBA: {
        code: "MBA",
        name: "Master of Business Administration",
        vision: "To become a top-notch management institute, acknowledged for its excellence in creation of an intellectual management professionals.",
        mission: [
            "DM1: To nurture the future business leaders through imparting high quality value-based teaching, research and practical based training that meets corporate expectations.",
            "DM2: To cultivate a passion for learning and creative philosophy among the management student and teaching community.",
            "DM3: To prepare management professionals with corporate mindset having high professional competence, outstanding leadership qualities."
        ],
        peos: [
            { id: "PEO1", statement: "Post Graduate of the program will contribute to the creation, transmission and application of knowledge in the field of management." },
            { id: "PEO2", statement: "Post Graduate of the program will be equipped with quantitative and qualitative skills to identify, analyze, design and create business opportunities in a dynamic environment." },
            { id: "PEO3", statement: "Post Graduates of the program will acquire necessary managerial skills to think strategically and to lead, motivate and manage teams thereby enhancing managerial effectiveness." },
            { id: "PEO4", statement: "Have attained a general level of competence in management and to enable them to act with creative, innovative and entrepreneurial potentials with management tools." },
            { id: "PEO5", statement: "Post Graduates of the program will be able to implement corporate governance and societal values in the real life situation with professional ethics." }
        ],
        psos: [
            { id: "PSO1", statement: "To ensure that Post Graduates get good employment." },
            { id: "PSO2", statement: "To make Post Graduates sole Traders & Entrepreneurs." },
            { id: "PSO3", statement: "To make Post Graduates pursue research Work in the area of their domain." }
        ],
        poPsoMapping: {
            "PSO1": [3, 3, 2, 1, 2, 1, 1, 2, 2, 2, 2, 3],
            "PSO2": [2, 3, 3, 2, 2, 1, 1, 2, 3, 2, 2, 3],
            "PSO3": [1, 2, 2, 3, 3, 2, 1, 2, 2, 2, 2, 3]
        },
        attainments: [
            { target: 2.0, actual: 2.25 }, // PO1
            { target: 2.0, actual: 2.10 }, // PO2
            { target: 2.0, actual: 1.95 }, // PO3
            { target: 2.0, actual: 2.30 }  // PSO1
        ],
        dabReview: {
            frequency: "Annually",
            lastReview: "September 2024"
        }
    },

    // =====================================================================
    // MCA Department - REAL Vision/PSOs + Professional Mission/PEOs
    // =====================================================================
    MCA: {
        code: "MCA",
        name: "Master of Computer Applications",
        vision: "To be the source of bringing out globally competent pioneering computing professionals, researchers, innovators and entrepreneurs and thereby succeed and contribute value to the knowledge-based economy and society.",
        mission: [
            "To provide comprehensive education in computer applications, software engineering and emerging technologies.",
            "To develop programming, analytical and problem-solving skills for industry-ready professionals.",
            "To foster research culture and innovation in computing applications.",
            "To prepare students with professional ethics, teamwork and effective communication skills for global competence."
        ],
        peos: [
            { id: "PEO1", statement: "Post Graduates will apply knowledge of computing, mathematics and domain expertise to solve complex software problems." },
            { id: "PEO2", statement: "Post Graduates will design, develop and deploy software solutions using modern tools, technologies and programming paradigms." },
            { id: "PEO3", statement: "Post Graduates will pursue higher studies, research and establish successful careers in IT industry with continuous learning." },
            { id: "PEO4", statement: "Post Graduates will work ethically in multidisciplinary teams with effective communication and leadership skills." }
        ],
        psos: [
            { id: "PSO1", statement: "To ensure that Post Graduates get good employment." },
            { id: "PSO2", statement: "To make Post Graduates sole Traders & Entrepreneurs." },
            { id: "PSO3", statement: "To make Post Graduates pursue research Work in the area of their domain." }
        ],
        poPsoMapping: {
            "PSO1": [3, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2],
            "PSO2": [2, 3, 2, 2, 2, 1, 1, 1, 2, 2, 1, 2],
            "PSO3": [1, 2, 3, 3, 3, 2, 1, 1, 2, 2, 2, 2]
        },
        attainments: [
            { target: 1.8, actual: 2.12 }, // PO1
            { target: 1.8, actual: 2.05 }, // PO2
            { target: 1.8, actual: 2.18 }, // PO3
            { target: 1.8, actual: 2.40 }  // PSO1
        ],
        dabReview: {
            frequency: "Annually",
            lastReview: "October 2024"
        }
    },
};

// Institution-level Vision and Mission (from SAR)
export const INSTITUTION_VISION_MISSION = {
    vision: "To become reputed institution of Engineering & Management programs, Producing competitive, ethical & socially responsible professionals.",
    mission: [
        { id: "IM1", statement: "Provide quality education through best teaching and learning practices of committed staff." },
        { id: "IM2", statement: "Establish a continuous interaction, participation and collaboration with industry to provide solutions." },
        { id: "IM3", statement: "Provide the facilities that motivate/encourage faculty and students in research and development activities." },
        { id: "IM4", statement: "Develop human values, professional ethics and interpersonal skills amongst the individuals." }
    ]
};

// Helper functions
export const getDepartmentAcademicData = (deptCode: string): DepartmentAcademicData | null => {
    return DEPARTMENT_ACADEMIC_DATA[deptCode.toUpperCase()] || null;
};

export const getProgramOutcomes = () => PROGRAM_OUTCOMES;

export const getInstitutionVisionMission = () => INSTITUTION_VISION_MISSION;
