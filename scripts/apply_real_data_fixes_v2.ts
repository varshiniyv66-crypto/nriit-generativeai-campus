import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function applyFixes() {
    console.log('Starting Smart Batch Update...');
    let successCount = 0;
    let skippedCount = 0;
    let failCount = 0;

    // 1. Fetch all faculty first to minimize queries
    const { data: allFaculty } = await supabase.from('faculty_profiles').select('*');
    if (!allFaculty) { console.error('Failed to fetch faculty'); return; }
    console.log(`Fetched ${allFaculty.length} faculty profiles.`);

    const updates = [];

    // 2. Iterate Excel Data
    matchAndQueue('CSE', 'SREEDEVI KUMARI', 'G', {"pan_number": "ATOPK4061A", "date_of_joining": "2021-11-15"});
    matchAndQueue('ECE', 'SUJATA', 'KANDUKURI', {"pan_number": "ASKPK4364K", "date_of_joining": "2015-6-26"});
    matchAndQueue('CSE', 'NAGESWARA RAO', 'ETIKALA', {"pan_number": "AAJPE3195R", "date_of_joining": "2016-1-6"});
    matchAndQueue('IT', 'RATNAKUMAR', 'PAMULA', {"pan_number": "BNBPP2906D", "date_of_joining": "2015-7-1"});
    matchAndQueue('IT', 'VANI', 'DHARANIKOTA', {"pan_number": "BNOPD4835L", "date_of_joining": "2024-7-1"});
    matchAndQueue('IT', 'ANUSHA', 'CHINTALA', {"pan_number": "AKKPC8107C", "date_of_joining": "2015-4-1"});
    matchAndQueue('IT', 'GUMMADIDALA', 'SRINIVASARAO', {"pan_number": "DXTPS1696R", "date_of_joining": "2015-7-1"});
    matchAndQueue('CSE', 'BABURAO', 'GUDIVADA', {"pan_number": "CGSPG1970R", "date_of_joining": "2015-7-8"});
    matchAndQueue('CSE', 'HANUMANTHA', 'GUTTA', {"pan_number": "BLAPG8227K", "date_of_joining": "2016-6-9"});
    matchAndQueue('IT', 'VENKATESHWARARAO', 'KANIKICHARLA', {"pan_number": "BNOPK5736R", "date_of_joining": "2016-6-9"});
    matchAndQueue('CSE', 'TELUKUTLA', 'CHAKRAVARTHI', {"pan_number": "ATAPC2949P", "date_of_joining": "2017-6-5"});
    matchAndQueue('CSE', 'PRADEEP', 'BOLLIPALLI', {"pan_number": "BAVPB3860K", "date_of_joining": "2017-6-5"});
    matchAndQueue('CSE', 'VENKATESH', 'LAM', {"pan_number": "AGFPL9859B", "date_of_joining": "2017-1-4"});
    matchAndQueue('CSE', 'KRISHNA', 'GADE', {"pan_number": "BYZPG7403B", "date_of_joining": "2015-6-1"});
    matchAndQueue('CSE', 'SRINIVASA', 'MUTYAM', {"pan_number": "APUPM9900J", "date_of_joining": "2011-8-16"});
    matchAndQueue('ECE', 'MANASA', 'MANUKONDA', {"pan_number": "CAGPM8971A", "date_of_joining": "2017-4-28"});
    matchAndQueue('CSE', 'SURESH BABU', 'IMMADISETTY', {"pan_number": "ADJPI0582P", "date_of_joining": "2017-5-24"});
    matchAndQueue('CSE', 'CHIKKALA', 'BABU', {"pan_number": "DLFPB2803H", "date_of_joining": "2017-6-8"});
    matchAndQueue('CSE', 'SRINIVAS REDDY', 'PALLE', {"pan_number": "APCPP4507Q", "date_of_joining": "2022-2-26"});
    matchAndQueue('CSE', 'NAGAMANI', 'BODIGIRI', {"pan_number": "CHVPB8471N", "date_of_joining": "2023-6-30"});
    matchAndQueue('CSE', 'VENU GOPAL', 'LANKAPALLI', {"pan_number": "AIOPL1000D", "date_of_joining": "2021-9-1"});
    matchAndQueue('CSE', 'NARENDRA KUMAR', 'VADIGINA', {"pan_number": "ALOPN4499D", "date_of_joining": "2013-6-3"});
    matchAndQueue('CSE', 'SIVA', 'NAVULURI', {"pan_number": "BCEPN1649H", "date_of_joining": "2022-6-6"});
    matchAndQueue('CSE', 'SURYA', 'KATTA', {"pan_number": "FZYPS3143E", "date_of_joining": "2020-11-9"});
    matchAndQueue('CSE', 'JYOTHI', 'JARUGULA', {"pan_number": "BBZPJ0764R", "date_of_joining": "2020-7-1"});
    matchAndQueue('CSE', 'VUTLA', 'GOVARDHANA RAO', {"pan_number": "APVPG7097P", "date_of_joining": "2023-7-25"});
    matchAndQueue('CSE', 'SURESH', 'GOTTIPATI', {"pan_number": "AMAPG0946M", "date_of_joining": "2021-11-27"});
    matchAndQueue('CSE', 'RAMU', 'JARUBULA', {"pan_number": "AISPJ9290M", "date_of_joining": "2022-3-9"});
    matchAndQueue('ECE', 'CHETTY', 'KALAISELVAN', {"pan_number": "BBZPK0581M", "date_of_joining": "2018-8-29"});
    matchAndQueue('CSE', 'THRIVENI DEEPTHI', 'KOTA', {"pan_number": "GKBPK4116E", "date_of_joining": "2017-11-11"});
    matchAndQueue('CSE', 'RAJA', 'KARNATI', {"pan_number": "BBBPK9727M", "date_of_joining": "2020-3-21"});
    matchAndQueue('ECE', 'BALAKRISHNA', 'PEYYALA', {"pan_number": "AYHPP3809M", "date_of_joining": "2025-6-23"});
    matchAndQueue('CSE', 'VENKATA', 'YEDAVALLI', {"pan_number": "ACDPY4427C", "date_of_joining": "2021-5-3"});
    matchAndQueue('ECE', 'SREENIVASARAO', 'KUMMARI', {"pan_number": "EOJPS9903H", "date_of_joining": "2025-6-5"});
    matchAndQueue('CSE', 'BHAVANI', 'BUTHUKURI', {"pan_number": "AWNPB4162H", "date_of_joining": "2024-1-22"});
    matchAndQueue('CSE', 'VISVANATH SAI', 'CHENNUBOINA', {"pan_number": "BRVPC1435N", "date_of_joining": "2022-2-5"});
    matchAndQueue('ECE', 'ANJANEYULU', 'UMMANENI', {"pan_number": "AFDPU1254J", "date_of_joining": "2022-5-9"});
    matchAndQueue('CSE', 'TEJASWI', 'KAVURU', {"pan_number": "IQQPK5649D", "date_of_joining": "2022-1-10"});
    matchAndQueue('ECE', 'CHIRANJEEVI', 'MODUKURI', {"pan_number": "BMHPM2963E", "date_of_joining": "2025-6-16"});
    matchAndQueue('CSE', 'MADDIRALA PRADEEP', 'CHANDRA', {"pan_number": "BKTPM7946M", "date_of_joining": "2022-3-29"});
    matchAndQueue('CSE', 'GAYATREE', 'UPPALAPATI', {"pan_number": "ACFPU2313R", "date_of_joining": "2019-10-19"});
    matchAndQueue('CSE', 'VINODA', 'DAMACHERLA', {"pan_number": "APGPD7086N", "date_of_joining": "2019-7-4"});
    matchAndQueue('CSE', 'VIDYAREKHA', 'IKKURTHI', {"pan_number": "ABWPI8311B", "date_of_joining": "2019-6-27"});
    matchAndQueue('IT', 'HASEENA', 'SAYYED', {"pan_number": "DQIPS4042D", "date_of_joining": "2019-6-1"});
    matchAndQueue('ECE', 'NAGAJYOTHI', 'VALETI', {"pan_number": "ATRPV1800B", "date_of_joining": "2019-9-3"});
    matchAndQueue('ECE', 'LALITA', 'GOGINENI', {"pan_number": "CKSPG9700M", "date_of_joining": "2021-2-9"});
    matchAndQueue('CSE', 'DOPPALAPUDI', 'HARI', {"pan_number": "BCJPD3175R", "date_of_joining": "2021-9-6"});
    matchAndQueue('CSE', 'SURESH', 'GANGI', {"pan_number": "AXMPG0182E", "date_of_joining": "2021-12-6"});
    matchAndQueue('ECE', 'NAGA MALLESWARI', 'VERICHERLA', {"pan_number": "AGFPV0118D", "date_of_joining": "2020-11-9"});
    matchAndQueue('CSE', 'CHANDRA', 'JAMPANI', {"pan_number": "AJBPJ5874D", "date_of_joining": "2018-12-11"});
    matchAndQueue('CSE', 'BAJI SITARAO', 'MALLA', {"pan_number": "CNGPM7874R", "date_of_joining": "2018-5-7"});
    matchAndQueue('CSE', 'THIRUPATHAMMA', 'DEEKONDA', {"pan_number": "COTPD0280A", "date_of_joining": "2021-2-3"});
    matchAndQueue('IT', '.', 'DUTTA DEVIKA', {"pan_number": "FFEPD1851Q", "date_of_joining": "2021-1-27"});
    matchAndQueue('CSE', 'SOWMYA', 'GANDLA', {"pan_number": "CDZPG3632C", "date_of_joining": "2022-1-29"});
    matchAndQueue('CSE', 'BHARGAVI', 'GADDE', {"pan_number": "CJNPG4057P", "date_of_joining": "2020-12-28"});
    matchAndQueue('CSE', 'RAVIKANT', 'CHERUKURI', {"pan_number": "ACOPC1844Q", "date_of_joining": "2025-5-8"});
    matchAndQueue('CSE', 'NEERUKONDA', 'PRIYADARSINI', {"pan_number": "ASUPN0182C", "date_of_joining": "2019-12-13"});
    matchAndQueue('CSE', 'MANVITHA', 'KODURU', {"pan_number": "FRNPK0670R", "date_of_joining": "2020-8-20"});
    matchAndQueue('CSE', 'SAI SILPA', 'VENNA', {"pan_number": "BBFPV3679H", "date_of_joining": "2020-8-20"});
    matchAndQueue('CSE', 'BALASAITRINADH', 'BANDI', {"pan_number": "CHNPB7437A", "date_of_joining": "2020-8-20"});
    matchAndQueue('IT', 'SRINIVAS', 'PATCHALA', {"pan_number": "CAUPP4414P", "date_of_joining": "2023-6-30"});
    matchAndQueue('IT', 'SURE', 'SRIDHAR', {"pan_number": "DQXPS8830J", "date_of_joining": "2024-10-1"});
    matchAndQueue('CSE', 'UMADEVI', 'MARMUDI', {"pan_number": "CSTPM2022D", "date_of_joining": "2021-4-12"});
    matchAndQueue('CSE', 'VAILA', 'BEJJAM', {"pan_number": "CCIPB9776Q", "date_of_joining": "2020-12-28"});
    matchAndQueue('CSE', 'BINDU', 'CHAVVA', {"pan_number": "BISPC5648H", "date_of_joining": "2021-9-9"});
    matchAndQueue('ECE', 'SAIDAIAH', 'BANDI', {"pan_number": "AHLPB1060B", "date_of_joining": "2022-1-19"});
    matchAndQueue('IT', 'SOWJANYA', 'BATTULA', {"pan_number": "AMGPB4443C", "date_of_joining": "2020-3-20"});
    matchAndQueue('CSE', 'KRISHNA', 'ANNAVARAPU', {"pan_number": "AJKPA4463E", "date_of_joining": "2021-1-27"});
    matchAndQueue('CSE', 'PARVATHI', 'ATCHUTANNA', {"pan_number": "BXHPA9165P", "date_of_joining": "2021-1-27"});
    matchAndQueue('CSE', 'KALYANI', 'MIRIYALA', {"pan_number": "GHZPM4947L", "date_of_joining": "2022-10-28"});
    matchAndQueue('CSE', 'MARUTHI', 'GUNJI', {"pan_number": "CPQPG7746Q", "date_of_joining": "2020-1-7"});
    matchAndQueue('ECE', 'RAMBABU', 'CHEMAKURTHI', {"pan_number": "AWKPC1868N", "date_of_joining": "2017-4-12"});
    matchAndQueue('CSE', 'RAMESH', 'DANTAM', {"pan_number": "FKPPD1096H", "date_of_joining": "2021-11-8"});
    matchAndQueue('CSE', 'BHIKSHALU', 'POLICHERLA', {"pan_number": "DWNPP8224F", "date_of_joining": "2022-5-26"});
    matchAndQueue('CSE', 'PAVANI', 'KURAGANTI', {"pan_number": "CAFPK2820M", "date_of_joining": "2021-12-31"});
    matchAndQueue('CSE', 'RAJA', 'BATCHU', {"pan_number": "CRVPB4846F", "date_of_joining": "2021-3-9"});
    matchAndQueue('CSE', 'ANUSHA', 'KUNCHAKARRA', {"pan_number": "ELAPK9178J", "date_of_joining": "2021-12-6"});
    matchAndQueue('CSE', 'ANUPAMA', 'MEDIDA', {"pan_number": "GAHPM8457E", "date_of_joining": "2021-12-6"});
    matchAndQueue('CSE', 'PATHURU', 'RAJASEKHAR', {"pan_number": "FJFPR4842Q", "date_of_joining": "2024-6-26"});
    matchAndQueue('CSE', 'KOTESWARA RAO', 'DASARI', {"pan_number": "APYPD0479D", "date_of_joining": "2008-11-1"});
    matchAndQueue('ECE', '.', 'MOPARTHI MARY JUNITHA', {"pan_number": "ASEPM5158P", "date_of_joining": "2009-6-22"});
    matchAndQueue('IT', 'KRISHNA KUMARI', 'GANESUNI', {"pan_number": "ARJPG3461H", "date_of_joining": "2008-8-6"});
    matchAndQueue('CSE', 'VENGATESAN', 'VENUGOPAL', {"pan_number": "AYQPV3375D", "date_of_joining": "2023-6-9"});
    matchAndQueue('CSE', 'ALEKHYA', 'MEDIDA', {"pan_number": "BTLPM1693N", "date_of_joining": "2021-1-4"});
    matchAndQueue('CSE', 'GUDURU', 'MEGHANA', {"pan_number": "AKBPN0878N", "date_of_joining": "2024-4-18"});
    matchAndQueue('CSE', 'SRINIVAS', 'BODA', {"pan_number": "BYHPB3029A", "date_of_joining": "2022-6-20"});
    matchAndQueue('IT', 'SRAVANI', 'CHINNAM', {"pan_number": "CALPC6118A", "date_of_joining": "2023-3-17"});
    matchAndQueue('ECE', 'SAI KUMAR', 'GOPU', {"pan_number": "CFBPG9923C", "date_of_joining": "2023-3-13"});
    matchAndQueue('CSE', 'DHANALAKSHMI', 'CHENNUPATI', {"pan_number": "BSAPC8068F", "date_of_joining": "2022-6-1"});
    matchAndQueue('CSE', 'BOLLEPALLI', 'MOHANA RAGINI', {"pan_number": "BUYPB2238J", "date_of_joining": "2023-2-27"});
    matchAndQueue('CSE', 'SARIPUDI', 'SUNEETHA', {"pan_number": "QPHPS2639M", "date_of_joining": "2022-8-24"});
    matchAndQueue('CSE', 'SREEVANI', 'VARAGAANI', {"pan_number": "BIUPV7464A", "date_of_joining": "2023-2-13"});
    matchAndQueue('CSE', 'YADLA', 'SAI', {"pan_number": "LHOPS4816G", "date_of_joining": "2023-3-3"});
    matchAndQueue('ECE', 'YOJITHA', 'PUPPALLA', {"pan_number": "FNCPP1259L", "date_of_joining": "2025-6-12"});
    matchAndQueue('IT', 'DESU', 'SABARI GIRINADH', {"pan_number": "BEWPD1223D", "date_of_joining": "2024-3-22"});
    matchAndQueue('ECE', 'MANOHAR', 'PATRA', {"pan_number": "BNXPP9154K", "date_of_joining": "2022-8-18"});
    matchAndQueue('ECE', 'YARRU', 'SREEJA', {"pan_number": "MURPS2833L", "date_of_joining": "2022-5-9"});
    matchAndQueue('ECE', 'KANVITHA', 'PENUMUTCHU', {"pan_number": "DCOPP4624Q", "date_of_joining": "2021-1-9"});
    matchAndQueue('ECE', 'HANEEF', 'SHAIK', {"pan_number": "FQDPS3325A", "date_of_joining": "2022-5-9"});
    matchAndQueue('ECE', 'PAVANI', 'VELAGA', {"pan_number": "ASLPV6028N", "date_of_joining": "2022-12-26"});
    matchAndQueue('ECE', 'AMALA', 'PAYALA', {"pan_number": "BKOPP3138F", "date_of_joining": "2021-1-9"});
    matchAndQueue('CSE', 'ANUSHA', 'MEDISETTY', {"pan_number": "HMNPM7163L", "date_of_joining": "2020-4-5"});
    matchAndQueue('CSE', 'ARUNA', 'THOTA', {"pan_number": "BZTPA3366A", "date_of_joining": "2023-2-27"});
    matchAndQueue('CSE', 'RAZIA SULTANA', 'PATHAN', {"pan_number": "FMBPP4788J", "date_of_joining": "2021-2-3"});
    matchAndQueue('ECE', 'SRILEKHA', 'KASIMALA', {"pan_number": "GZBPK7341L", "date_of_joining": "2024-2-5"});
    matchAndQueue('CSE', 'BHARGAV KUMAR', 'AVVARU', {"pan_number": "DMHPA7533J", "date_of_joining": "2023-11-22"});
    matchAndQueue('ECE', 'BHEEMANA', 'INDU', {"pan_number": "CHOPB4463R", "date_of_joining": "2023-6-5"});
    matchAndQueue('ECE', 'VIJAY KUMAR', 'ANKIPALLI', {"pan_number": "CYUPA3019H", "date_of_joining": "2023-12-6"});
    matchAndQueue('ECE', 'DEEPTHI', 'AMULOTHU', {"pan_number": "CHIPA9447E", "date_of_joining": "2017-12-28"});
    matchAndQueue('CSE', 'VENKATA', 'EEDARA', {"pan_number": "AEPPE2224M", "date_of_joining": "2023-12-9"});
    matchAndQueue('CSE', 'SRUTHI', 'CHEVULA', {"pan_number": "CBBPC7865H", "date_of_joining": "2023-7-10"});
    matchAndQueue('IT', 'SRAVANI LATHA', 'GARNEPUDI', {"pan_number": "CKUPG6787L", "date_of_joining": "2023-7-18"});
    matchAndQueue('CSE', 'ASHALATHA', 'PODILI', {"pan_number": "DYFPP0215L", "date_of_joining": "2024-2-5"});
    matchAndQueue('CSE', 'PAVAN VENKATA DURGA', 'PETLA', {"pan_number": "EOKPP9643Q", "date_of_joining": "2024-1-10"});
    matchAndQueue('CSE', 'CHALUVADI', 'JYOTHIRMAI', {"pan_number": "BZUPJ7620M", "date_of_joining": "2023-6-29"});
    matchAndQueue('CSE', 'VAMSI', 'ALLAM', {"pan_number": "DINPA8530D", "date_of_joining": "2023-1-10"});
    matchAndQueue('CSE', 'JAYA DEEPTHI', 'KARASALA', {"pan_number": "MINPK8812P", "date_of_joining": "2023-6-29"});
    matchAndQueue('CSE', 'MOUNIKA', 'KONGARI', {"pan_number": "CQAPK6119A", "date_of_joining": "2024-2-6"});
    matchAndQueue('IT', 'PRAVEEN', 'ADDANKI', {"pan_number": "CNKPA0778G", "date_of_joining": "2024-10-9"});
    matchAndQueue('ECE', 'ANJU', 'SHAIK', {"pan_number": "HQIPS0369K", "date_of_joining": "2021-8-31"});
    matchAndQueue('CSE', 'PREMCHAND', 'PAGIDI', {"pan_number": "CJQPP1352F", "date_of_joining": "2021-9-2"});
    matchAndQueue('CSE', '.', 'MEKALA ANGULI', {"pan_number": "GHYPM9382N", "date_of_joining": "2023-9-6"});
    matchAndQueue('CSE', 'LAKSHMI', 'TELLURI', {"pan_number": "AGTPT6450E", "date_of_joining": "2023-9-6"});
    matchAndQueue('CSE', '.', 'YAMPATI SIREESHA', {"pan_number": "BMIPY5261J", "date_of_joining": "2023-9-6"});
    matchAndQueue('CSE', 'YAMPATI', 'SUPRAJA', {"pan_number": "AHXPY3098A", "date_of_joining": "2023-7-1"});
    matchAndQueue('CSE', 'NAGARJUNA', 'EARLA', {"pan_number": "ABTPE8752D", "date_of_joining": "2022-6-2"});
    matchAndQueue('CSE', 'BHUMANA', 'SUJATHA', {"pan_number": "AMNPB4541J", "date_of_joining": "2000-3-19"});
    matchAndQueue('CSE', '.', 'MANNEPULA ARUNKUMAR', {"pan_number": "AMAPM7701Q", "date_of_joining": "2021-5-3"});
    matchAndQueue('CSE', 'PENUMOLU', 'RATNAKUMARI', {"pan_number": "NPYPK5159E", "date_of_joining": "2023-9-1"});
    matchAndQueue('CSE', 'SHAIK', 'KARISHMABANU', {"pan_number": "GATPB5713A", "date_of_joining": "2022-6-9"});
    matchAndQueue('CSE', 'NUTALAPATI', 'BHUVANESWARI', {"pan_number": "BGAPN8730P", "date_of_joining": "2024-3-1"});
    matchAndQueue('CSE', 'UYYALA', 'SRAVANTHI', {"pan_number": "APVPU4169C", "date_of_joining": "2024-10-21"});
    matchAndQueue('CSE', 'MADANU', 'ANUSHA', {"pan_number": "FTZPA4904A", "date_of_joining": "2024-7-1"});
    matchAndQueue('CSE', 'SALE', 'RAVITEJA', {"pan_number": "EMAPR7929K", "date_of_joining": "2024-9-10"});
    matchAndQueue('CSE', 'BHAVANAM', 'SRAVANI', {"pan_number": "PJKPS6990H", "date_of_joining": "2024-11-18"});
    matchAndQueue('CSE', 'PANAMALA', 'PRASANNA KUMARI', {"pan_number": "LWNPK2458N", "date_of_joining": "2023-6-5"});
    matchAndQueue('CSE', 'SUNKARA', 'PRASHANTH', {"pan_number": "LUSPS6332L", "date_of_joining": "2024-11-18"});
    matchAndQueue('ECE', 'SHAIK', 'SHARIQA', {"pan_number": "LMJPS2423R", "date_of_joining": "2024-6-20"});
    matchAndQueue('IT', 'CHIKKAM', 'VISHNUPRIYA', {"pan_number": "CSMPV3326C", "date_of_joining": "2024-12-6"});
    matchAndQueue('CSE', 'KADHIRE', 'PRAVEENA', {"pan_number": "BZHPP6770M", "date_of_joining": "2024-5-15"});
    matchAndQueue('CSE', 'KOTA', 'NAGAPURNIMABABY', {"pan_number": "LYFPK8619F", "date_of_joining": "2024-6-10"});
    matchAndQueue('CSE', 'SYED', 'APSARA', {"pan_number": "OAFPS8113D", "date_of_joining": "2024-11-19"});
    matchAndQueue('ECE', 'BALUDRA', 'CHANDINIRAM', {"pan_number": "CJLPB5181R", "date_of_joining": "2025-6-16"});
    matchAndQueue('ECE', 'VUNNAVA', 'CHAITANYAKUMARI', {"pan_number": "BADPV4745F", "date_of_joining": "2020-8-20"});
    matchAndQueue('CSE', 'M', 'APPA RAO', {"pan_number": "AXTPM5753C", "date_of_joining": "2024-6-1"});
    matchAndQueue('CSE', 'V', 'SANDHYA', {"pan_number": "CDOPV6407P", "date_of_joining": "2025-7-1"});
    matchAndQueue('CSE', 'SRINIVASA RAO', 'KALAM', {"pan_number": "CNIPK5146F", "date_of_joining": "2025-7-1"});
    matchAndQueue('IT', 'SRINIVASARAO', 'V', {"pan_number": "AUUPV4836I", "date_of_joining": "2025-7-31"});
    matchAndQueue('CSE', 'K', 'NAGAVALLI', {"pan_number": "CSVPV0592C", "date_of_joining": "2024-6-1"});
    matchAndQueue('CSE', 'B', 'RAJU', {"pan_number": "GZUPR7245S", "date_of_joining": "2025-7-1"});
    matchAndQueue('CSE', 'RATNA KUMARI', 'P', {"pan_number": "NPYPY5159E", "date_of_joining": "2021-9-1"});
    matchAndQueue('CSE', 'KAVYA SRI', 'K', {"pan_number": "FLIPS5042C", "date_of_joining": "2022-2-9"});
    matchAndQueue('CSE', 'SOWJANYA', 'S', {"pan_number": "EEZPS2467P", "date_of_joining": "2021-2-3"});
    matchAndQueue('CSE', 'BALAJI', 'KOMMURI', {"pan_number": "BZSPB9501P", "date_of_joining": "2020-5-18"});
    matchAndQueue('CSE', 'SAI SULOCHANA', 'K', {"pan_number": "CJDPK3471R", "date_of_joining": "2023-10-2"});
    matchAndQueue('CSE', 'LAVANYA', 'K', {"pan_number": "EBQPK7677J", "date_of_joining": "2021-5-12"});
    matchAndQueue('CSE', 'RAMA KOTESWARA RAO', 'K', {"pan_number": "EBJPK8148B", "date_of_joining": "2020-9-1"});
    matchAndQueue('CSE', 'SRIKANTH', 'G', {"pan_number": "NFNPS3820D", "date_of_joining": "2022-6-9"});
    matchAndQueue('CSE', 'VAMSI KRISHNA', 'N', {"pan_number": "APSPN0854N", "date_of_joining": "2022-2-21"});
    matchAndQueue('CSE', 'ROSHNA', 'SHAIK', {"pan_number": "KTBPS1307E", "date_of_joining": "2022-7-1"});
    matchAndQueue('CSE', 'PRADEEP KUMAR', 'N', {"pan_number": "ASHPN9227F", "date_of_joining": "2022-6-1"});
    matchAndQueue('CSE', 'VEERENDRA', 'U', {"pan_number": "ALEPV8806A", "date_of_joining": "2021-7-1"});
    matchAndQueue('CSE', 'SURESH BABU', 'V', {"pan_number": "AOTPV8598R", "date_of_joining": "2021-6-3"});
    matchAndQueue('CSE', 'S V GANESH KUMAR', 'KONDETI', {"pan_number": "DELPK5325C", "date_of_joining": "2022-12-20"});
    matchAndQueue('CSE', 'SANDHYA', 'V', {"pan_number": "CEUPV6510E", "date_of_joining": "2024-5-4"});
    matchAndQueue('ECE', 'CH', 'KUMAR', {"pan_number": "CHDPC8248Q", "date_of_joining": "2025-9-25"});
    matchAndQueue('CSE', 'CHAKRAVARTHI', 'T', {"pan_number": "ATAPC2949D", "date_of_joining": "2017-6-5"});
    matchAndQueue('ECE', 'SK.', 'MUNNISA', {"pan_number": "GBKPS8605A", "date_of_joining": "2022-4-1"});
    matchAndQueue('CSE', 'N.', 'CHAND', {"pan_number": "AMGPN3421Q", "date_of_joining": "2009-9-29"});
    matchAndQueue('ECE', 'D.', 'NARESH', {"pan_number": "BZDPN6628Q", "date_of_joining": "2025-1-21"});
    matchAndQueue('IT', 'GAYATRI', 'KONIJETI', {"pan_number": "ENNBK9054E", "date_of_joining": "2022-6-6"});
    matchAndQueue('CSE', 'SWETHA', 'VALETI', {"pan_number": "ATGPV3641M", "date_of_joining": "2020-11-9"});
    matchAndQueue('ECE', 'M', 'SUBRAMANYAM', {"pan_number": "DDRPM3350J", "date_of_joining": "2024-6-5"});
    matchAndQueue('CSE', 'SK.', 'RASOOL', {"pan_number": "AOIPS0514E", "date_of_joining": "2024-10-14"});
    matchAndQueue('CSE', 'K', 'SAMBAIAH', {"pan_number": "EAFPK2291O", "date_of_joining": "2024-7-31"});
    matchAndQueue('CSE', 'V', 'BABU', {"pan_number": "AYHPB6786F", "date_of_joining": "2023-7-10"});
    matchAndQueue('CSE', 'G', 'LAKSHMI', {"pan_number": "EAMPG0472F", "date_of_joining": "2023-7-10"});
    matchAndQueue('ECE', 'A', 'SAKEETH', {"pan_number": "BHOPA8812R", "date_of_joining": "2020-11-16"});
    matchAndQueue('ECE', 'A', 'ADIYYA', {"pan_number": "AOVPA6437O", "date_of_joining": "2024-6-5"});
    matchAndQueue('CSE', 'SK.', 'PHARJANA', {"pan_number": "IDZPS7287B", "date_of_joining": "2021-8-25"});
    matchAndQueue('CSE', 'GODA', 'MAHESH', {"pan_number": "ADSPG4422D", "date_of_joining": "2024-12-26"});
    matchAndQueue('ECE', 'MORABOENA', 'RAMESH BABU', {"pan_number": "EGEPM2488F", "date_of_joining": "2025-8-5"});
    matchAndQueue('ECE', 'LANKA', 'SOWJANYA', {"pan_number": "BDNPL4819F", "date_of_joining": "2025-9-15"});
    matchAndQueue('ECE', 'SRIHARI', 'KOMATINENI', {"pan_number": "AHHPK9247R", "date_of_joining": "2012-1-6"});
    matchAndQueue('CSE', 'UPENDRA', 'KOTAPATI', {"pan_number": "CJCPK0371F", "date_of_joining": "2021-6-3"});
    matchAndQueue('ECE', 'RANGANADH', 'SRIPERUMBUDURI', {"pan_number": "DAKPS1029A", "date_of_joining": "2022-4-5"});
    matchAndQueue('CSE', 'MUNTAJ BEGUM', 'SHAIK', {"pan_number": "EFPPS9216L", "date_of_joining": "2022-6-1"});
    matchAndQueue('CSE', 'SRILAKSHMI', 'KONAKANCHI', {"pan_number": "CEQPK5883R", "date_of_joining": "2023-7-22"});
    matchAndQueue('CSE', 'SRINIVASA RAO', 'KOLAGANI', {"pan_number": "EAMPK1222C", "date_of_joining": "2024-7-12"});
    matchAndQueue('CSE', 'KRISHNA', 'VAKALAPUDI', {"pan_number": "AHJPV7914J", "date_of_joining": "2018-12-17"});

    function matchAndQueue(dept, fname, lname, updateData) {
         const fnameClean = fname.toLowerCase().replace(/\s+/g, '');
         const lnameClean = lname.toLowerCase().replace(/\s+/g, '');
         
         const match = allFaculty.find(f => {
             if (f.dept_code !== dept) return false;
             const fFirst = (f.first_name || '').toLowerCase().replace(/\s+/g, '');
             const fLast = (f.last_name || '').toLowerCase().replace(/\s+/g, '');
             // Check permutations
             return (fFirst.includes(fnameClean) || fLast.includes(lnameClean) ||
                     fFirst.includes(lnameClean) || fLast.includes(fnameClean));
         });
         
         if (match) {
             updates.push({ id: match.id, ...updateData });
         } else {
             // console.log(`Skipped: ${fname} ${lname} (${dept})`);
             skippedCount++;
         }
    }

    // 3. Execute Updates
    console.log(`Found ${updates.length} matches to update.`);
    for (const u of updates) {
        const { id, ...data } = u;
        const { error } = await supabase.from('faculty_profiles').update(data).eq('id', id);
        if (error) { console.error(`Failed ${id}:`, error.message); failCount++; }
        else successCount++;
    }

    console.log(`Done. Success: ${successCount}, Failed: ${failCount}, Skipped: ${skippedCount}`);
}
applyFixes();