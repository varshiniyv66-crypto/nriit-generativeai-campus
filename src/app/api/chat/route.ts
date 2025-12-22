import { openai } from "@ai-sdk/openai";
import { google } from "@ai-sdk/google";
import { generateText } from "ai";
import { NRIIT_KNOWLEDGE_BASE, SYSTEM_PROMPT } from "@/lib/ai-context";

export async function POST(req: Request) {
    try {
        const { messages } = await req.json();
        const lastMessage = messages[messages.length - 1];
        const query = lastMessage.content.toLowerCase();

        // COMPREHENSIVE INSTITUTIONAL INTELLIGENCE CORE
        // Pre-built answers sourced directly from NRIIT website data
        const getFallbackResponse = () => {
            let content = "";

            // ============== GREETINGS ==============
            if (query.includes("hi") || query.includes("hello") || query.includes("hey") || query.includes("good morning") || query.includes("good evening")) {
                content = "👋 Hello! I am the **NRIIT Visionary Assistant**, your AI Academic Counselor. I can help you with:\n\n• Admissions & Fee Structure\n• Departments & Programmes\n• Placements & Recruiters\n• Campus Facilities\n• Accreditations (NAAC A+)\n\nWhat would you like to know?";
            }
            // ============== ADMISSIONS ==============
            else if (query.includes("admission") || query.includes("join") || query.includes("enrol") || query.includes("apply") || query.includes("eligibility")) {
                content = "🎓 **Admissions 2026 are NOW OPEN!**\n\n**Eligibility:**\n• B.Tech: 10+2 with 45% in PCM (40% for reserved)\n• M.Tech/MBA/MCA: Valid GATE/CAT/ICET score or institutional entrance\n\n**How to Apply:**\n1. Visit [APHERMC](https://aphermc.ap.gov.in) for counseling\n2. Or apply directly via our [Enquiry Form](/enquire)\n\n**Documents Required:** SSC, Inter marks, Aadhaar, Caste/EWS certificate (if applicable).\n\n📞 Helpline: **0863 234 4300**";
            }
            // ============== FEES ==============
            else if (query.includes("fee") || query.includes("cost") || query.includes("price") || query.includes("tuition") || query.includes("scholarship")) {
                content = "💰 **Fee Structure (APHERMC Regulated):**\n\n| Programme | Annual Fee |\n|-----------|------------|\n| B.Tech (All Branches) | ₹1,20,000 |\n| M.Tech | ₹72,000 |\n| MBA | ₹65,000 |\n| MCA | ₹55,000 |\n\n**Scholarships Available:**\n• Jagananna Vidya Deevena (100% for eligible)\n• Merit Scholarships for toppers\n• SC/ST/BC fee reimbursement\n\nNo EMI or installment plans as per institutional policy. Visit [Admissions](/admissions) for details.";
            }
            // ============== PLACEMENTS ==============
            else if (query.includes("placement") || query.includes("job") || query.includes("salary") || query.includes("package") || query.includes("recruit") || query.includes("company")) {
                content = "🚀 **Placement Highlights (2024-25):**\n\n• **Placement Rate:** 95%+\n• **Highest Package:** ₹12 LPA\n• **Average Package:** ₹4.5 LPA\n• **Top Recruiters:** TCS, Infosys, Wipro, Cognizant, Tech Mahindra, Capgemini, Amazon, Accenture, IBM\n\n**Training Starts:** From 2nd Year (Soft Skills, Aptitude, Coding)\n\n**Placement Cell Contact:** placements@nriit.ac.in\n\nView placement records: [Placement Reports](/departments/cse#placements)";
            }
            // ============== DEPARTMENTS ==============
            else if (query.includes("department") || query.includes("branch") || query.includes("course") || query.includes("programme") || query.includes("cse") || query.includes("ece") || query.includes("it") || query.includes("mba") || query.includes("mca") || query.includes("civil") || query.includes("ai") || query.includes("data science")) {
                content = "🏛️ **NRIIT Departments (11 Schools of Excellence):**\n\n**B.Tech (4 Years):**\n• Computer Science & Engineering (CSE)\n• Information Technology (IT)\n• Electronics & Communication (ECE)\n• Civil Engineering\n• CSE - Artificial Intelligence & ML\n• CSE - Data Science\n• Electric Vehicles Technology (EVT)\n\n**Postgraduate:**\n• M.Tech (Structural, VLSI, CSE)\n• MBA (2 Years)\n• MCA (2 Years)\n\nExplore all: [Academic Programmes](/programmes)";
            }
            // ============== ACCREDITATION ==============
            else if (query.includes("naac") || query.includes("nba") || query.includes("accredit") || query.includes("autonomous") || query.includes("aicte") || query.includes("jntuk") || query.includes("ranking")) {
                content = "🏅 **Accreditations & Recognitions:**\n\n• **NAAC A+** Accredited Institution\n• **Autonomous Status** (JNTUK, Kakinada)\n• **AICTE Approved** (All India Council for Technical Education)\n• **ISO 9001-2015** Certified Institution\n• **Washington Accord Ready** - Degrees globally recognized\n\nLearn more: [Accreditation Hub](/accreditation)";
            }
            // ============== FACULTY ==============
            else if (query.includes("faculty") || query.includes("professor") || query.includes("teacher") || query.includes("staff") || query.includes("hod")) {
                content = "👨‍🏫 **Faculty Excellence:**\n\n• **300+ Expert Faculty** (Ph.D. & Industry Experts)\n• Student-Faculty Ratio: **15:1**\n• Regular FDPs (Faculty Development Programs)\n• Industry Collaboration for Guest Lectures\n\nEach department is led by experienced HODs with 15+ years of academic and research experience. Contact your department: [Faculty Directory](/departments)";
            }
            // ============== CONTACT ==============
            else if (query.includes("contact") || query.includes("phone") || query.includes("email") || query.includes("address") || query.includes("location") || query.includes("reach")) {
                content = "📍 **Contact NRIIT:**\n\n**Address:**\nNRI Institute of Technology\nVisadala (V), Medikonduru (M)\nGuntur - 522438, Andhra Pradesh\n\n**Phone:** 0863 234 4300\n**Email:** admissions@nriit.ac.in\n**Website:** [www.nriit.ac.in](https://www.nriit.ac.in)\n\n**Office Hours:** Mon-Sat, 9 AM - 5 PM\n\n[Get Directions on Maps](/contact)";
            }
            // ============== HOSTEL ==============
            else if (query.includes("hostel") || query.includes("accommodation") || query.includes("stay") || query.includes("room")) {
                content = "🏠 **Hostel Facilities:**\n\n• Separate Boys & Girls Hostels\n• AC & Non-AC Rooms Available\n• 24/7 Security & CCTV Surveillance\n• Wi-Fi Enabled Campus\n• Mess with Nutritious Meals\n• Laundry Services\n\n**Annual Hostel Fee:** ~₹60,000 - ₹80,000 (varies by room type)\n\nContact Hostel Warden: hostel@nriit.ac.in";
            }
            // ============== TRANSPORT ==============
            else if (query.includes("bus") || query.includes("transport") || query.includes("travel") || query.includes("route")) {
                content = "🚌 **Transport Facilities:**\n\n• Fleet of 50+ College Buses\n• Routes covering Guntur, Vijayawada, Tenali, Mangalagiri, Narasaraopet\n• GPS Tracking for Safety\n• Pick-up & Drop at designated points\n\n**Annual Transport Fee:** ~₹25,000 - ₹40,000 (distance-based)\n\nFor route inquiries: transport@nriit.ac.in";
            }
            // ============== LIBRARY ==============
            else if (query.includes("library") || query.includes("book") || query.includes("digital") || query.includes("journal")) {
                content = "📚 **Central Library:**\n\n• 50,000+ Books & Journals\n• Digital Library with IEEE, NPTEL, DELNET access\n• E-Books & Online Resources\n• Spacious Reading Halls\n• Open from 8 AM - 8 PM\n\n**OPAC:** Online Public Access Catalog available for students.";
            }
            // ============== LABS & INFRASTRUCTURE ==============
            else if (query.includes("lab") || query.includes("infrastructure") || query.includes("facility") || query.includes("campus") || query.includes("building")) {
                content = "🏗️ **World-Class Infrastructure:**\n\n• 25-acre Green Campus\n• State-of-the-Art Laboratories\n• High-Speed Wi-Fi (10 Gbps backbone)\n• Smart Classrooms with Projectors\n• Auditorium (Platinum Jubilee Hall - 1000 seats)\n• Sports Complex, Gym & Indoor Games\n• Cafeteria & Food Courts\n\nExplore: [Campus Gallery](/gallery)";
            }
            // ============== HISTORY ==============
            else if (query.includes("history") || query.includes("about") || query.includes("established") || query.includes("founder") || query.includes("chairman")) {
                content = "📜 **About NRIIT:**\n\nEstablished in **2008**, NRI Institute of Technology (NRIIT) is a premier autonomous engineering college located in Visadala, Guntur District, Andhra Pradesh.\n\n**Vision:** To become a reputed institution producing competitive, ethical & socially responsible professionals.\n\n**Affiliation:** Permanently affiliated to JNTUK, Kakinada.\n\nDiscover our story: [About Us](/about)";
            }
            // ============== EVENTS ==============
            else if (query.includes("event") || query.includes("fest") || query.includes("cultural") || query.includes("technical") || query.includes("sports")) {
                content = "🎉 **Campus Events:**\n\n• **Technical Fest:** Annual inter-college tech symposium\n• **Cultural Fest:** Dussehra & Pongal celebrations\n• **Sports Meet:** Annual athletics & tournaments\n• **Workshops:** Regular industry-led tech workshops\n• **Guest Lectures:** Experts from TCS, Infosys, ISRO\n\nStay updated: [News & Events](/news-events)";
            }
            // ============== STUDY HELP ==============
            else if (query.includes("study") || query.includes("exam") || query.includes("syllabus") || query.includes("timetable") || query.includes("learn")) {
                content = "📖 **Academic Support:**\n\n• **Autonomous Syllabus:** Outcome-Based Education (OBE)\n• **Semester Pattern:** 2 semesters/year + internships\n• **Internal Assessment:** 30% | End Sem: 70%\n• **Attendance Requirement:** Minimum 75%\n\nFor timetables and exam schedules, login to your [Student Portal](/login?role=student).";
            }
            // ============== DEFAULT ==============
            else {
                content = "🤔 I'm currently in **Visionary Sandbox Mode** and can answer questions about:\n\n• Admissions & Fees\n• Departments & Programmes\n• Placements & Recruiters\n• Campus Facilities (Hostel, Transport, Library)\n• Accreditations (NAAC A+)\n• Contact Information\n\nTry asking: *\"What are the placements like?\"* or *\"Tell me about CSE department.\"*\n\n**For full AI capabilities**, ensure valid API keys are set in `.env.local`.";
            }

            return content;
        };

        // 1. Check for API Keys
        const hasOpenAI = !!process.env.OPENAI_API_KEY && process.env.OPENAI_API_KEY.length > 10;
        const hasGemini = !!process.env.GOOGLE_GENERATIVE_AI_API_KEY && process.env.GOOGLE_GENERATIVE_AI_API_KEY.length > 10;

        console.log(`🤖 AI Status: OpenAI=${hasOpenAI}, Gemini=${hasGemini}`);

        if (!hasOpenAI && !hasGemini) {
            return new Response(JSON.stringify({ content: getFallbackResponse(), provider: "sandbox" }), {
                headers: { "Content-Type": "application/json" },
            });
        }

        // 2. Attempt AI Generation with Provider Switching
        const tryAI = async (primary: "openai" | "google", secondary?: "openai" | "google"): Promise<{ text: string; provider: string } | null> => {
            try {
                // OpenAI: gpt-4o-mini is much cheaper and more likely to succeed on low-quota keys
                // Google: gemini-2.5-flash matches the working AI Studio project
                const model = primary === "openai" ? openai("gpt-4o-mini") : google("gemini-2.5-flash");
                const modelName = primary === "openai" ? "GPT-4o Mini (OpenAI)" : "Gemini 2.5 Flash (Google)";

                const { text } = await generateText({
                    model: model,
                    system: SYSTEM_PROMPT,
                    messages: messages.map((m: any) => ({
                        role: m.role,
                        content: m.content
                    }))
                });
                return { text, provider: modelName };
            } catch (err: any) {
                console.error(`❌ ${primary.toUpperCase()} AI failed:`, err.message || err);
                if (secondary) {
                    console.log(`🔄 Switching to secondary provider: ${secondary}...`);
                    return tryAI(secondary);
                }
                return null;
            }
        };

        const primaryChoice = hasOpenAI ? "openai" : (hasGemini ? "google" : null);
        const secondaryChoice = (hasOpenAI && hasGemini) ? "google" : undefined;

        if (primaryChoice) {
            const result = await tryAI(primaryChoice as any, secondaryChoice as any);
            if (result) {
                return new Response(JSON.stringify({ content: result.text, provider: result.provider }), {
                    headers: { "Content-Type": "application/json" },
                });
            }
        }

        // 3. Last Resort: Sandbox Mode
        return new Response(JSON.stringify({
            content: getFallbackResponse() + ((hasOpenAI || hasGemini) ? "\n\n*(Note: Your AI API keys were detected but failed to initialize. Reverting to Sandbox.)*" : ""),
            provider: "Institutional Intelligence (Sandbox)"
        }), {
            headers: { "Content-Type": "application/json" },
        });

    } catch (error: any) {
        console.error("Critical Chat Error:", error);
        return new Response(JSON.stringify({
            content: "I'm experiencing a brief outage. Please try again in secondary mode.",
            error: error.message
        }), {
            status: 500,
            headers: { "Content-Type": "application/json" },
        });
    }
}
