export interface Faculty {
    id: string;
    name: string;
    designation: string;
    qualification?: string;
    specialization?: string;
    experience?: string;
    email?: string;
    phone?: string;
    photo?: string;
    publications?: number;
    department: string;
    title?: string;
    joiningDate?: string;
    panNumber?: string;
}

// UPDATED faculty data - Extracted from e-NBA SAR files (Latest 2024-25)
// CSE, IT, ECE from SAR cr 5 files
// Other departments from extracted_content.json (unchanged)

export const facultyData: Record<string, Faculty[]> = {
    // =====================================================================
    // CSE DEPARTMENT - UPDATED FROM e-NBA CSE cr 5.htm (Lines 1040-1720)
    // Total: 38 Faculty Members
    // =====================================================================
    cse: [
        // Professors (Ph.D holders)
        { id: "cse-1", title: "Dr.", name: "DARA VIKRAM", designation: "Professor", department: "CSE", qualification: "Ph.D", joiningDate: "21/08/2018", panNumber: "CHSPD3354F" },
        { id: "cse-36", title: "Dr.", name: "K NAGESWARA RAO", designation: "Professor", department: "CSE", qualification: "Ph.D", joiningDate: "20/10/2014", panNumber: "AGZPK9875A" },
        { id: "cse-2", title: "Dr.", name: "D SARADA MANI", designation: "Professor", department: "CSE", qualification: "Ph.D", joiningDate: "24/06/2019", panNumber: "ATTPD1757H" },
        // Associate Professors (Ph.D holders)
        { id: "cse-3", title: "Dr.", name: "Y V RAGHAVA RAO", designation: "Associate Professor", department: "CSE", qualification: "Ph.D", specialization: "Data Mining", joiningDate: "18/12/2017", panNumber: "ACDPY4427C" },
        { id: "cse-4", title: "Dr.", name: "KODE RAJIV", designation: "Associate Professor", department: "CSE", qualification: "Ph.D", joiningDate: "18/02/2019", panNumber: "BBEPK6502R" },
        { id: "cse-5", title: "Dr.", name: "G MAHESH", designation: "Associate Professor", department: "CSE", qualification: "Ph.D", joiningDate: "08/11/2019", panNumber: "BASPG9439G" },
        { id: "cse-6", title: "Dr.", name: "G KALYANI", designation: "Associate Professor", department: "CSE", qualification: "Ph.D", joiningDate: "20/12/2019", panNumber: "HSKPK9569M" },
        // Assistant Professors
        { id: "cse-7", title: "Mrs.", name: "P SWATHI", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "20/11/2013", panNumber: "BBEPP2042K" },
        { id: "cse-8", title: "Ms.", name: "S SOWJANYA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "06/01/2016", panNumber: "EEZPS2467P" },
        { id: "cse-9", title: "Mr.", name: "N VAMSI KRISHNA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "15/05/2012", panNumber: "APSPN0854N" },
        { id: "cse-10", title: "Mrs.", name: "P RATNA KUMARI", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "09/12/2014", panNumber: "NPYPY5159E" },
        { id: "cse-11", title: "Mrs.", name: "K KAVYA SRI", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "09/06/2016", panNumber: "FLIPS5042C" },
        { id: "cse-12", title: "Mrs.", name: "G SINDHUJA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "01/09/2022", panNumber: "BRJPG4572Q" },
        { id: "cse-13", title: "Mrs.", name: "SHAIK ROSHNA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "01/09/2021", panNumber: "KTBPS1307E" },
        { id: "cse-14", title: "Mr.", name: "N PRADEEP KUMAR", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "05/05/2022", panNumber: "ASHPN9227F" },
        { id: "cse-15", title: "Mr.", name: "U U VEERENDRA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "02/12/2013", panNumber: "ALEPV8806A" },
        { id: "cse-16", title: "Mrs.", name: "V ASHA LATHA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "08/06/2015", panNumber: "ANEPL3244L" },
        { id: "cse-17", title: "Mr.", name: "V SURESH BABU", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "08/06/2015", panNumber: "AOTPV8598R" },
        { id: "cse-18", title: "Mr.", name: "KOMMURI BALAJI", designation: "Assistant Professor", department: "CSE", qualification: "MS", joiningDate: "18/11/2011", panNumber: "BZSPB9501P" },
        { id: "cse-19", title: "Mrs.", name: "S ANUSHA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "01/09/2023", panNumber: "DCOPP4624Q" },
        { id: "cse-20", title: "Mr.", name: "J RAMU", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "02/06/2004", panNumber: "AISPJ9290M" },
        { id: "cse-21", title: "Mrs.", name: "SK HUSSAINBI", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "02/10/2023", panNumber: "DFJPS0129M" },
        { id: "cse-22", title: "Mr.", name: "D KOTESWARA RAO", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "09/12/2013", panNumber: "APYPD0479D" },
        { id: "cse-23", title: "Mr.", name: "I NAGESWARA RAO", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "02/03/2015", panNumber: "AAJPE3195R" },
        { id: "cse-24", title: "Mrs.", name: "K SAI SULOCHANA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "02/10/2023", panNumber: "CJDPK3471R" },
        { id: "cse-25", title: "Mr.", name: "M ARUNKUMAR", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "01/01/2004", panNumber: "AMAPM7701Q" },
        { id: "cse-26", title: "Mr.", name: "P ARAVIND", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "02/03/2015", panNumber: "BTYPP5435L" },
        { id: "cse-27", title: "Mrs.", name: "B SUJATHA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "11/04/2016", panNumber: "AMNPB4541J" },
        { id: "cse-28", title: "Mrs.", name: "M UMA DEVI", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "03/03/2014", panNumber: "CSTPM2022D" },
        { id: "cse-29", title: "Mr.", name: "G ASHOK BABU", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "03/04/2017", panNumber: "BZXPG5143F" },
        { id: "cse-30", title: "Mr.", name: "ADDANKI PRAVEEN", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "01/10/2024", panNumber: "CNKPA0778G" },
        { id: "cse-31", title: "Mrs.", name: "KOPURI LAVANYA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "01/04/2017", panNumber: "EBQPK7677J" },
        { id: "cse-32", title: "Mr.", name: "K RAMA KOTESWARA RAO", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "01/12/2017", panNumber: "EBJPK8148B" },
        { id: "cse-33", title: "Mrs.", name: "P SUJATHA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "18/08/2011", panNumber: "CDTPS3716F" },
        { id: "cse-34", title: "Mrs.", name: "M ALEKHYA", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "20/07/2011", panNumber: "BTLPM1693N" },
        { id: "cse-35", title: "Mr.", name: "GANTA SRIKANTH", designation: "Assistant Professor", department: "CSE", qualification: "M.Tech", joiningDate: "09/04/2022", panNumber: "NFNPS3820D" },
    ],

    // =====================================================================
    // IT DEPARTMENT - UPDATED FROM e-NBA IT cr 5.htm
    // Total: 18 Faculty Members
    // =====================================================================
    it: [
        // Associate Professors 
        { id: "it-1", title: "Mr.", name: "RAMAKOTESWARARAO GADDAM", designation: "HOD & Associate Professor", department: "IT", qualification: "MSc(Mathematics)", joiningDate: "03/06/2013" },
        { id: "it-2", title: "Mrs.", name: "VANI DHARANIKOTA", designation: "Associate Professor", department: "IT", qualification: "MSc(Mathematics)", joiningDate: "01/07/2015" },
        { id: "it-3", title: "Mrs.", name: "SUJATHA DEVARAPALLI", designation: "Associate Professor", department: "IT", qualification: "M.Tech", joiningDate: "26/09/2022" },
        { id: "it-4", title: "Mrs.", name: "NANCY NAMRATHA JELDI", designation: "Associate Professor", department: "IT", qualification: "M.Tech", joiningDate: "20/01/2020" },
        // Assistant Professors
        { id: "it-5", title: "Mr.", name: "RATNAKUMAR PAMULA", designation: "Assistant Professor", department: "IT", qualification: "M.A", joiningDate: "01/07/2015" },
        { id: "it-6", title: "Mrs.", name: "ANUSHA CHINTALA", designation: "Assistant Professor", department: "IT", qualification: "M.Sc.", joiningDate: "01/04/2015" },
        { id: "it-7", title: "Mr.", name: "GUMMADIDALA SRINIVASARAO", designation: "Assistant Professor", department: "IT", qualification: "M.Sc(Phy)", joiningDate: "01/04/2015" },
        { id: "it-8", title: "Mrs.", name: "HASEENA SAYYED", designation: "Assistant Professor", department: "IT", qualification: "M.Tech", joiningDate: "01/06/2019" },
        { id: "it-9", title: "Ms.", name: "DUTTA DEVIKA", designation: "Assistant Professor", department: "IT", qualification: "M.Tech" },
        { id: "it-10", title: "Mr.", name: "SRINIVAS PATCHALA", designation: "Assistant Professor", department: "IT", qualification: "M.Tech", joiningDate: "30/06/2023" },
        { id: "it-11", title: "Mrs.", name: "SRAVANI CHINNAM", designation: "Assistant Professor", department: "IT", qualification: "M.Tech", joiningDate: "17/03/2023" },
        { id: "it-12", title: "Mrs.", name: "SRAVANI LATHA GARNEPUDI", designation: "Assistant Professor", department: "IT", qualification: "M.Tech", joiningDate: "18/07/2023" },
        { id: "it-13", title: "Mr.", name: "PRAVEEN ADDANKI", designation: "Assistant Professor", department: "IT", qualification: "M.Tech" },
        { id: "it-14", title: "Dr.", name: "GUNTUPALLI KUMARI", designation: "Professor", department: "IT", qualification: "Ph.D", joiningDate: "08/11/2021" },
        { id: "it-15", title: "Mr.", name: "VENKATESHWARARAO KANIKICHARLA", designation: "Assistant Professor", department: "IT", qualification: "M.Sc.", joiningDate: "09/06/2016" },
        { id: "it-16", title: "Mr.", name: "R KOTESWARA RAO", designation: "Assistant Professor", department: "IT", qualification: "M.Tech" },
        { id: "it-17", title: "Mrs.", name: "B SRAVANI", designation: "Assistant Professor", department: "IT", qualification: "M.Tech" },
        { id: "it-18", title: "Mrs.", name: "K DURGA BHAVANI", designation: "Assistant Professor", department: "IT", qualification: "M.Tech" },
    ],

    // =====================================================================
    // ECE DEPARTMENT - UPDATED FROM e-NBA ECE cr 5.htm
    // Total: 28 Faculty Members
    // =====================================================================
    ece: [
        // Professors (Ph.D holders)
        { id: "ece-1", title: "Dr.", name: "SRIHARI KOMATINENI", designation: "Professor & Vice Principal", department: "ECE", qualification: "Ph.D", joiningDate: "01/06/2012" },
        { id: "ece-2", title: "Dr.", name: "CHETTY KALAISELVAN", designation: "Professor", department: "ECE", qualification: "Ph.D", joiningDate: "29/08/2018" },
        { id: "ece-3", title: "Dr.", name: "RAVI MANCHARLA", designation: "Professor", department: "ECE", qualification: "Ph.D", joiningDate: "05/06/2023" },
        { id: "ece-4", title: "Dr.", name: "SAIDAIAH BANDI", designation: "Professor", department: "ECE", qualification: "Ph.D", joiningDate: "19/01/2022" },
        { id: "ece-5", title: "Mrs.", name: "MOPARTHI MARY JUNITHA", designation: "Professor", department: "ECE", qualification: "M.Tech", joiningDate: "22/06/2009" },
        // Associate Professors
        { id: "ece-6", title: "Mr.", name: "CHEKURI VENUGOPALA CHOWDARY", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "01/06/2023" },
        { id: "ece-7", title: "Mr.", name: "SESHAGIRI RAO SUGGUNA", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "02/06/2020" },
        { id: "ece-8", title: "Mr.", name: "VENKATESWARARAO VENUTURUMILLI", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "06/09/2023" },
        { id: "ece-9", title: "Miss", name: "LAKSHMI DARSI", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "14/02/2017" },
        { id: "ece-10", title: "Mrs.", name: "SUJATA KANDUKURI", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "26/06/2015" },
        { id: "ece-11", title: "Mrs.", name: "NAGAJYOTHI VALETI", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "09/03/2019" },
        { id: "ece-12", title: "Mr.", name: "CHODAVARAPU SATYANARAYANA MURTHY", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "14/02/2022" },
        { id: "ece-13", title: "Mrs.", name: "LAKSHMI DEVARA KONDA", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "09/03/2022" },
        { id: "ece-14", title: "Mr.", name: "MANOHAR PATRA", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "18/08/2022" },
        { id: "ece-15", title: "Mrs.", name: "AMALA PAYALA", designation: "Associate Professor", department: "ECE", qualification: "M.Tech", joiningDate: "01/09/2021" },
        // Assistant Professors
        { id: "ece-16", title: "Mr.", name: "BABA FARIDDIN SHAIK", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-17", title: "Mr.", name: "POTHULA TEJA", designation: "Lecturer", department: "ECE", qualification: "M.Tech" },
        { id: "ece-18", title: "Ms.", name: "MANASA MANUKONDA", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-19", title: "Mrs.", name: "PRAMEELA PODILI", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-20", title: "Miss", name: "SRILAKSHMI PAMARTHI", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-21", title: "Mr.", name: "SAI KUMAR GOPU", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-22", title: "Miss", name: "SARIPUDI SUNEETHA", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-23", title: "Ms.", name: "BINDU SRI MOKAMATAM", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-24", title: "Mrs.", name: "YARRU SREEJA", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-25", title: "Ms.", name: "KANVITHA PENUMUTCHU", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-26", title: "Mr.", name: "UJJIT BURADAGUNTA", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech" },
        { id: "ece-27", title: "Mrs.", name: "BHEEMANA INDU", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech", joiningDate: "05/06/2023" },
        { id: "ece-28", title: "Miss", name: "SRAVYA DOPPALAPUDI", designation: "Assistant Professor", department: "ECE", qualification: "M.Tech", joiningDate: "06/06/2018" },
    ],

    // =====================================================================
    // OTHER DEPARTMENTS (UNCHANGED from extracted_content.json)
    // =====================================================================
    aiml: [
        { id: "aiml-1", title: "Mr.", name: "ADIYYA AALOKAM", designation: "Assistant Professor", department: "AIML", qualification: "M.Tech", joiningDate: "06/09/2023" },
        { id: "aiml-2", title: "Dr.", name: "SRINIVASA KELLAMPALLI", designation: "HOD & Professor", department: "AIML", qualification: "Ph.D", joiningDate: "15/12/2020" },
        { id: "aiml-3", title: "Mr.", name: "BHUSHAN KUMAR KURUMATLA", designation: "Assistant Professor", department: "AIML", qualification: "M.Tech", joiningDate: "25/06/2018" },
        { id: "aiml-4", title: "Mrs.", name: "SIRISHA TUMATI", designation: "Assistant Professor", department: "AIML", qualification: "M.Tech", joiningDate: "11/12/2019" },
        { id: "aiml-5", title: "Mrs.", name: "CHAITANYA MACHERLA", designation: "Assistant Professor", department: "AIML", qualification: "M.Tech", joiningDate: "01/06/2019" },
        { id: "aiml-6", title: "Mrs.", name: "ANURADHA KOYYALAMUDI", designation: "Assistant Professor", department: "AIML", qualification: "M.Tech", joiningDate: "01/06/2019" },
        { id: "aiml-7", title: "Miss", name: "LAKSHMI PRIYA PARNASALA", designation: "Assistant Professor", department: "AIML", qualification: "MSc(Mathematics)", joiningDate: "27/01/2021" },
        { id: "aiml-8", title: "Mr.", name: "SRINIVASA RAO YEPURI", designation: "Assistant Professor", department: "AIML", qualification: "MSc(Mathematics)", joiningDate: "27/01/2021" },
        { id: "aiml-9", title: "Mrs.", name: "JAYMUNNISA SHAIK", designation: "Assistant Professor", department: "AIML", qualification: "M.A", joiningDate: "27/01/2021" },
        { id: "aiml-10", title: "Mr.", name: "NAVEEN VATTIKUTI", designation: "Assistant Professor", department: "AIML", qualification: "M.A", joiningDate: "27/01/2021" },
        { id: "aiml-11", title: "Dr.", name: "JAGAN KAMMILI", designation: "Associate Professor", department: "AIML", qualification: "Ph.D" },
        { id: "aiml-12", title: "Dr.", name: "KRISHNA KUMARI GANESUNI", designation: "Professor", department: "AIML", qualification: "Ph.D", joiningDate: "06/08/2008" },
        { id: "aiml-13", title: "Ms.", name: "RAZIA SULTANA PATHAN", designation: "Assistant Professor", department: "AIML", qualification: "M.Tech" },
        { id: "aiml-14", title: "Mr.", name: "NARUKULLAPATI RAMMOHAN", designation: "Assistant Professor", department: "AIML", qualification: "M.Tech" },
        { id: "aiml-15", title: "Mr.", name: "PREMCHAND PAGIDI", designation: "Assistant Professor", department: "AIML", qualification: "M.Tech" },
    ],
    ds: [
        { id: "ds-1", title: "Mr.", name: "NAGESWARA RAO ETIKALA", designation: "Associate Professor", department: "CSD", qualification: "M.Tech", joiningDate: "01/06/2015" },
        { id: "ds-2", title: "Mr.", name: "BABURAO GUDIVADA", designation: "Assistant Professor", department: "CSD", qualification: "M.Sc(Phy)", joiningDate: "08/07/2015" },
        { id: "ds-3", title: "Mr.", name: "HANUMANTHA GUTTA", designation: "Assistant Professor", department: "CSD", qualification: "M.Sc.", joiningDate: "09/06/2016" },
        { id: "ds-4", title: "Mr.", name: "TELUKUTLA CHAKRAVARTHI", designation: "Assistant Professor", department: "CSD", qualification: "M.Tech", joiningDate: "05/06/2017" },
        { id: "ds-5", title: "Mr.", name: "KRISHNA GADE", designation: "Associate Professor", department: "CSD", qualification: "M.Tech", joiningDate: "01/06/2015" },
        { id: "ds-6", title: "Mr.", name: "SRINIVASA MUTYAM", designation: "Assistant Professor", department: "CSD", qualification: "M.Tech", joiningDate: "17/09/2018" },
        { id: "ds-7", title: "Mrs.", name: "SIVA NAVULURI", designation: "Assistant Professor", department: "CSD", qualification: "M.Tech", joiningDate: "06/06/2022" },
        { id: "ds-8", title: "Mr.", name: "SURESH GOTTIPATI", designation: "Associate Professor", department: "CSD", qualification: "MSc(Mathematics)", joiningDate: "08/11/2021" },
        { id: "ds-9", title: "Ms.", name: "THRIVENI DEEPTHI KOTA", designation: "Assistant Professor", department: "CSD", qualification: "M.Tech", joiningDate: "11/11/2017" },
        { id: "ds-10", title: "Mr.", name: "VISVANATH SAI CHENNUBOINA", designation: "Assistant Professor", department: "CSD", qualification: "M.Tech", joiningDate: "05/02/2022" },
        { id: "ds-11", title: "Mrs.", name: "VINODA DAMACHERLA", designation: "Associate Professor", department: "CSD", qualification: "MSc(Mathematics)", joiningDate: "04/07/2019" },
        { id: "ds-12", title: "Mrs.", name: "VIDYAREKHA IKKURTHI", designation: "Associate Professor", department: "CSD", qualification: "M.Tech", joiningDate: "27/06/2019" },
        { id: "ds-13", title: "Mr.", name: "RATNA KUMAR TALATOTI", designation: "Assistant Professor", department: "CSD", qualification: "M.Tech", joiningDate: "27/11/2019" },
        { id: "ds-14", title: "Mr.", name: "BAJI SITARAO MALLA", designation: "Associate Professor", department: "CSD", qualification: "M.Tech", joiningDate: "07/05/2018" },
        { id: "ds-15", title: "Mr.", name: "BHIKSHALU POLICHERLA", designation: "Assistant Professor", department: "CSD", qualification: "M.Sc.", joiningDate: "08/11/2021" },
    ],
    civil: [
        { id: "civil-1", title: "Dr.", name: "CHANDRAMOULI KODURU", designation: "Professor & HOD", department: "Civil", qualification: "Ph.D", joiningDate: "07/06/2010" },
        { id: "civil-2", title: "Dr.", name: "SRINIVASU KOTA", designation: "Principal/Director", department: "Civil", qualification: "Ph.D", joiningDate: "30/03/2020" },
        { id: "civil-3", title: "Mrs.", name: "SHEIKH SAHERA", designation: "Assistant Professor", department: "Civil", qualification: "M.Tech", joiningDate: "05/06/2021" },
        { id: "civil-4", title: "Mr.", name: "CHAITANYA MATURU", designation: "Assistant Professor", department: "Civil", qualification: "M.Tech" },
        { id: "civil-5", title: "Mr.", name: "SREE NAGA CHAITANYA JARUGUMILLY", designation: "Associate Professor", department: "Civil", qualification: "M.Tech", joiningDate: "09/06/2016" },
        { id: "civil-6", title: "Mrs.", name: "KONDETI DIVYA", designation: "Assistant Professor", department: "Civil", qualification: "M.Tech" },
        { id: "civil-7", title: "Ms.", name: "HYMAVATHI GADEELA", designation: "Assistant Professor", department: "Civil", qualification: "M.Tech" },
        { id: "civil-8", title: "Mr.", name: "PRASANTHI DODDA", designation: "Assistant Professor", department: "Civil", qualification: "M.Tech", joiningDate: "07/02/2022" },
        { id: "civil-9", title: "Mr.", name: "SAI BANDARU", designation: "Associate Professor", department: "Civil", qualification: "M.Tech", joiningDate: "28/12/2021" },
    ],
    mba: [
        { id: "mba-1", title: "Mr.", name: "SUDA RAO", designation: "Associate Professor", department: "MBA", qualification: "MBA" },
        { id: "mba-2", title: "Mrs.", name: "BOLLISETTI ARCHANA", designation: "Assistant Professor", department: "MBA", qualification: "MBA" },
        { id: "mba-3", title: "Mrs.", name: "DAKARAPU SUSI SOWMYA", designation: "Assistant Professor", department: "MBA", qualification: "MBA" },
        { id: "mba-4", title: "Mr.", name: "ANUPAMA PAMIDIMUKKALA", designation: "Assistant Professor", department: "MBA", qualification: "MBA" },
        { id: "mba-5", title: "Dr.", name: "ZIA REHMAN", designation: "HOD & Professor", department: "MBA", qualification: "Ph.D", joiningDate: "01/06/2010" },
        { id: "mba-6", title: "Dr.", name: "CHENCHU VETAPALEM", designation: "Professor", department: "MBA", qualification: "Ph.D", joiningDate: "08/11/2021" },
    ],
    mca: [
        { id: "mca-1", title: "Mr.", name: "THALLAM HANUMANTHA RAO", designation: "Professor", department: "MCA", qualification: "MCA", joiningDate: "16/11/2022" },
        { id: "mca-2", title: "Ms.", name: "NAGA BHARGAVI THOTA", designation: "Assistant Professor", department: "MCA", qualification: "M.Tech" },
        { id: "mca-3", title: "Mr.", name: "BALA CHILAKA", designation: "Assistant Professor", department: "MCA", qualification: "MCA" },
        { id: "mca-4", title: "Mr.", name: "SURESH BABU IMMADISETTY", designation: "Assistant Professor", department: "MCA", qualification: "MCA" },
        { id: "mca-5", title: "Mrs.", name: "SUJATHA TALATHOTI", designation: "Assistant Professor", department: "MCA", qualification: "MCA" },
        { id: "mca-6", title: "Mr.", name: "GADDAM KRISHNA", designation: "Assistant Professor", department: "MCA", qualification: "MCA" },
        { id: "mca-7", title: "Ms.", name: "NANDINI GUDE", designation: "Assistant Professor", department: "MCA", qualification: "MCA" },
        { id: "mca-8", title: "Mr.", name: "RAJASEKHAR GOLLAPUDI", designation: "Assistant Professor", department: "MCA", qualification: "MCA" },
        { id: "mca-9", title: "Mr.", name: "AKULA SRI RAMANA", designation: "Assistant Professor", department: "MCA", qualification: "MCA" },
        { id: "mca-10", title: "Mrs.", name: "NALINI POLU", designation: "Assistant Professor", department: "MCA", qualification: "MCA" },
    ],
    vlsi: [
        { id: "vlsi-1", title: "Mr.", name: "PAVAN KUMAR KATTA", designation: "Lecturer", department: "VLSI", qualification: "M.Tech" },
        { id: "vlsi-2", title: "Mr.", name: "ANJANEYULU UMMANENI", designation: "Assistant Professor", department: "VLSI", qualification: "M.Tech" },
        { id: "vlsi-3", title: "Mrs.", name: "LALITA GOGINENI", designation: "Assistant Professor", department: "VLSI", qualification: "M.Tech" },
        { id: "vlsi-4", title: "Mr.", name: "BALAKRISHNA PEYYALA", designation: "Associate Professor", department: "VLSI", qualification: "M.Tech", joiningDate: "01/06/2023" },
        { id: "vlsi-5", title: "Mrs.", name: "VIJAYASANTHI EDARA", designation: "Associate Professor", department: "VLSI", qualification: "M.Tech", joiningDate: "24/10/2023" },
        { id: "vlsi-6", title: "Mr.", name: "RAMBABU CHEMAKURTHI", designation: "Associate Professor", department: "VLSI", qualification: "M.Tech", joiningDate: "12/04/2017" },
        { id: "vlsi-7", title: "Mrs.", name: "MEENAKSHI BOLLU", designation: "Assistant Professor", department: "VLSI", qualification: "M.Tech" },
        { id: "vlsi-8", title: "Miss", name: "TRIVENI LAKSHMI MARELLA", designation: "Assistant Professor", department: "VLSI", qualification: "M.Tech" },
        { id: "vlsi-9", title: "Mr.", name: "FAIROZE SHAIK", designation: "Associate Professor", department: "VLSI", qualification: "M.Tech", joiningDate: "01/01/2024" },
    ],

};

// =====================================================================
// PLACEMENT DATA - From SAR and NIRF Reports
// =====================================================================
export const placementData: Record<string, { year: string, placed: number, total: number, highestPackage: string, averagePackage: string }[]> = {
    cse: [
        { year: "2023-24", placed: 98, total: 297, highestPackage: "6.0 LPA", averagePackage: "6.0 LPA" },
        { year: "2022-23", placed: 167, total: 208, highestPackage: "8.0 LPA", averagePackage: "8.0 LPA" },
        { year: "2021-22", placed: 92, total: 217, highestPackage: "5.0 LPA", averagePackage: "5.0 LPA" },
    ],
    it: [
        { year: "2023-24", placed: 35, total: 80, highestPackage: "6.0 LPA", averagePackage: "5.0 LPA" },
        { year: "2022-23", placed: 45, total: 75, highestPackage: "6.5 LPA", averagePackage: "4.5 LPA" },
        { year: "2021-22", placed: 38, total: 70, highestPackage: "5.5 LPA", averagePackage: "4.0 LPA" },
    ],
    ece: [
        { year: "2023-24", placed: 55, total: 120, highestPackage: "5.5 LPA", averagePackage: "4.5 LPA" },
        { year: "2022-23", placed: 68, total: 115, highestPackage: "6.0 LPA", averagePackage: "5.0 LPA" },
        { year: "2021-22", placed: 45, total: 110, highestPackage: "5.0 LPA", averagePackage: "4.0 LPA" },
    ],
    mba: [
        { year: "2023-24", placed: 16, total: 33, highestPackage: "6.0 LPA", averagePackage: "6.0 LPA" },
        { year: "2022-23", placed: 19, total: 49, highestPackage: "6.0 LPA", averagePackage: "6.0 LPA" },
        { year: "2021-22", placed: 12, total: 42, highestPackage: "6.0 LPA", averagePackage: "6.0 LPA" },
    ],
};

// Top recruiters from placement records
export const topRecruiters = [
    { company: "TCS", logo: "TCS", studentsPlaced: 25, package: "4.08 LPA" },
    { company: "Wipro", logo: "Wipro", studentsPlaced: 35, package: "3.5 LPA" },
    { company: "Infosys", logo: "Infosys", studentsPlaced: 18, package: "3.6 LPA" },
    { company: "Cognizant (CTS)", logo: "CTS", studentsPlaced: 22, package: "4.55 LPA" },
    { company: "Accenture", logo: "Accenture", studentsPlaced: 28, package: "4.5 LPA" },
    { company: "Tech Mahindra", logo: "TechM", studentsPlaced: 45, package: "2.0 LPA" },
    { company: "Capgemini", logo: "Capgemini", studentsPlaced: 15, package: "3.6 LPA" },
    { company: "VPG Sensors", logo: "VPG", studentsPlaced: 55, package: "3.2 LPA" },
    { company: "IBM", logo: "IBM", studentsPlaced: 12, package: "2.8 LPA" },
    { company: "HCL", logo: "HCL", studentsPlaced: 20, package: "3.0 LPA" },
];

// Department statistics from NIRF data
export const departmentStats: Record<string, { students: number, faculty: number, labs: number, publications: number, placements: number }> = {
    cse: { students: 450, faculty: 36, labs: 8, publications: 180, placements: 80 },
    it: { students: 180, faculty: 18, labs: 5, publications: 85, placements: 75 },
    ece: { students: 350, faculty: 28, labs: 10, publications: 195, placements: 67 },
    aiml: { students: 180, faculty: 15, labs: 4, publications: 65, placements: 85 },
    ds: { students: 240, faculty: 15, labs: 4, publications: 55, placements: 78 },
    civil: { students: 150, faculty: 9, labs: 6, publications: 75, placements: 65 },
    mba: { students: 279, faculty: 6, labs: 2, publications: 45, placements: 49 },
    mca: { students: 80, faculty: 10, labs: 3, publications: 30, placements: 60 },
    vlsi: { students: 60, faculty: 9, labs: 3, publications: 25, placements: 85 },

};

// Overall institution stats from NIRF
export const institutionStats = {
    totalUGStudents: 2231,
    totalPGStudents: 279,
    sanctionedIntakeUG: 660,
    sanctionedIntakePG: 198,
};

export const getFacultyByDepartment = (deptCode: string): Faculty[] => {
    return facultyData[deptCode.toLowerCase()] || [];
};

export const getPlacementsByDepartment = (deptCode: string) => {
    return placementData[deptCode.toLowerCase()] || [];
};

export const getStatsByDepartment = (deptCode: string) => {
    return departmentStats[deptCode.toLowerCase()] || null;
};
