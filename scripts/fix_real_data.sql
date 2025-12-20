-- FIX REAL DATA: PAN and DOJ
BEGIN;

UPDATE faculty_profiles 
SET pan_number = 'ATOPK4061A', date_of_joining = '2021-11-15'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SREEDEVI KUMARI%G%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SREEDEVI KUMARI%G%'
);

UPDATE faculty_profiles 
SET pan_number = 'ASKPK4364K', date_of_joining = '2015-6-26'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SUJATA%KANDUKURI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SUJATA%KANDUKURI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AAJPE3195R', date_of_joining = '2016-1-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%NAGESWARA RAO%ETIKALA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%NAGESWARA RAO%ETIKALA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BNBPP2906D', date_of_joining = '2015-7-1'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RATNAKUMAR%PAMULA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RATNAKUMAR%PAMULA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BNOPD4835L', date_of_joining = '2024-7-1'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VANI%DHARANIKOTA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VANI%DHARANIKOTA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AKKPC8107C', date_of_joining = '2015-4-1'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ANUSHA%CHINTALA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ANUSHA%CHINTALA%'
);

UPDATE faculty_profiles 
SET pan_number = 'DXTPS1696R', date_of_joining = '2015-7-1'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%GUMMADIDALA%SRINIVASARAO%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%GUMMADIDALA%SRINIVASARAO%'
);

UPDATE faculty_profiles 
SET pan_number = 'CGSPG1970R', date_of_joining = '2015-7-8'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BABURAO%GUDIVADA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BABURAO%GUDIVADA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BLAPG8227K', date_of_joining = '2016-6-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%HANUMANTHA%GUTTA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%HANUMANTHA%GUTTA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BNOPK5736R', date_of_joining = '2016-6-9'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VENKATESHWARARAO%KANIKICHARLA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VENKATESHWARARAO%KANIKICHARLA%'
);

UPDATE faculty_profiles 
SET pan_number = 'ATAPC2949P', date_of_joining = '2017-6-5'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%TELUKUTLA%CHAKRAVARTHI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%TELUKUTLA%CHAKRAVARTHI%'
);

UPDATE faculty_profiles 
SET pan_number = 'BAVPB3860K', date_of_joining = '2017-6-5'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PRADEEP%BOLLIPALLI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PRADEEP%BOLLIPALLI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AGFPL9859B', date_of_joining = '2017-1-4'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VENKATESH%LAM%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VENKATESH%LAM%'
);

UPDATE faculty_profiles 
SET pan_number = 'BYZPG7403B', date_of_joining = '2015-6-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KRISHNA%GADE%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KRISHNA%GADE%'
);

UPDATE faculty_profiles 
SET pan_number = 'APUPM9900J', date_of_joining = '2011-8-16'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRINIVASA%MUTYAM%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRINIVASA%MUTYAM%'
);

UPDATE faculty_profiles 
SET pan_number = 'CAGPM8971A', date_of_joining = '2017-4-28'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%MANASA%MANUKONDA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%MANASA%MANUKONDA%'
);

UPDATE faculty_profiles 
SET pan_number = 'ADJPI0582P', date_of_joining = '2017-5-24'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SURESH BABU%IMMADISETTY%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SURESH BABU%IMMADISETTY%'
);

UPDATE faculty_profiles 
SET pan_number = 'DLFPB2803H', date_of_joining = '2017-6-8'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%CHIKKALA%BABU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%CHIKKALA%BABU%'
);

UPDATE faculty_profiles 
SET pan_number = 'APCPP4507Q', date_of_joining = '2022-2-26'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRINIVAS REDDY%PALLE%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRINIVAS REDDY%PALLE%'
);

UPDATE faculty_profiles 
SET pan_number = 'CHVPB8471N', date_of_joining = '2023-6-30'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%NAGAMANI%BODIGIRI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%NAGAMANI%BODIGIRI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AIOPL1000D', date_of_joining = '2021-9-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VENU GOPAL%LANKAPALLI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VENU GOPAL%LANKAPALLI%'
);

UPDATE faculty_profiles 
SET pan_number = 'ALOPN4499D', date_of_joining = '2013-6-3'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%NARENDRA KUMAR%VADIGINA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%NARENDRA KUMAR%VADIGINA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BCEPN1649H', date_of_joining = '2022-6-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SIVA%NAVULURI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SIVA%NAVULURI%'
);

UPDATE faculty_profiles 
SET pan_number = 'FZYPS3143E', date_of_joining = '2020-11-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SURYA%KATTA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SURYA%KATTA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BBZPJ0764R', date_of_joining = '2020-7-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%JYOTHI%JARUGULA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%JYOTHI%JARUGULA%'
);

UPDATE faculty_profiles 
SET pan_number = 'APVPG7097P', date_of_joining = '2023-7-25'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VUTLA%GOVARDHANA RAO%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VUTLA%GOVARDHANA RAO%'
);

UPDATE faculty_profiles 
SET pan_number = 'AMAPG0946M', date_of_joining = '2021-11-27'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SURESH%GOTTIPATI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SURESH%GOTTIPATI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AISPJ9290M', date_of_joining = '2022-3-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RAMU%JARUBULA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RAMU%JARUBULA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BBZPK0581M', date_of_joining = '2018-8-29'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%CHETTY%KALAISELVAN%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%CHETTY%KALAISELVAN%'
);

UPDATE faculty_profiles 
SET pan_number = 'GKBPK4116E', date_of_joining = '2017-11-11'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%THRIVENI DEEPTHI%KOTA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%THRIVENI DEEPTHI%KOTA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BBBPK9727M', date_of_joining = '2020-3-21'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RAJA%KARNATI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RAJA%KARNATI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AYHPP3809M', date_of_joining = '2025-6-23'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BALAKRISHNA%PEYYALA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BALAKRISHNA%PEYYALA%'
);

UPDATE faculty_profiles 
SET pan_number = 'ACDPY4427C', date_of_joining = '2021-5-3'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VENKATA%YEDAVALLI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VENKATA%YEDAVALLI%'
);

UPDATE faculty_profiles 
SET pan_number = 'EOJPS9903H', date_of_joining = '2025-6-5'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SREENIVASARAO%KUMMARI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SREENIVASARAO%KUMMARI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AWNPB4162H', date_of_joining = '2024-1-22'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BHAVANI%BUTHUKURI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BHAVANI%BUTHUKURI%'
);

UPDATE faculty_profiles 
SET pan_number = 'BRVPC1435N', date_of_joining = '2022-2-5'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VISVANATH SAI%CHENNUBOINA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VISVANATH SAI%CHENNUBOINA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AFDPU1254J', date_of_joining = '2022-5-9'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ANJANEYULU%UMMANENI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ANJANEYULU%UMMANENI%'
);

UPDATE faculty_profiles 
SET pan_number = 'IQQPK5649D', date_of_joining = '2022-1-10'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%TEJASWI%KAVURU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%TEJASWI%KAVURU%'
);

UPDATE faculty_profiles 
SET pan_number = 'BMHPM2963E', date_of_joining = '2025-6-16'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%CHIRANJEEVI%MODUKURI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%CHIRANJEEVI%MODUKURI%'
);

UPDATE faculty_profiles 
SET pan_number = 'BKTPM7946M', date_of_joining = '2022-3-29'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%MADDIRALA PRADEEP%CHANDRA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%MADDIRALA PRADEEP%CHANDRA%'
);

UPDATE faculty_profiles 
SET pan_number = 'ACFPU2313R', date_of_joining = '2019-10-19'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%GAYATREE%UPPALAPATI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%GAYATREE%UPPALAPATI%'
);

UPDATE faculty_profiles 
SET pan_number = 'APGPD7086N', date_of_joining = '2019-7-4'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VINODA%DAMACHERLA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VINODA%DAMACHERLA%'
);

UPDATE faculty_profiles 
SET pan_number = 'ABWPI8311B', date_of_joining = '2019-6-27'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VIDYAREKHA%IKKURTHI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VIDYAREKHA%IKKURTHI%'
);

UPDATE faculty_profiles 
SET pan_number = 'DQIPS4042D', date_of_joining = '2019-6-1'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%HASEENA%SAYYED%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%HASEENA%SAYYED%'
);

UPDATE faculty_profiles 
SET pan_number = 'ATRPV1800B', date_of_joining = '2019-9-3'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%NAGAJYOTHI%VALETI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%NAGAJYOTHI%VALETI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CKSPG9700M', date_of_joining = '2021-2-9'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%LALITA%GOGINENI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%LALITA%GOGINENI%'
);

UPDATE faculty_profiles 
SET pan_number = 'BCJPD3175R', date_of_joining = '2021-9-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%DOPPALAPUDI%HARI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%DOPPALAPUDI%HARI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AXMPG0182E', date_of_joining = '2021-12-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SURESH%GANGI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SURESH%GANGI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AGFPV0118D', date_of_joining = '2020-11-9'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%NAGA MALLESWARI%VERICHERLA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%NAGA MALLESWARI%VERICHERLA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AJBPJ5874D', date_of_joining = '2018-12-11'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%CHANDRA%JAMPANI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%CHANDRA%JAMPANI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CNGPM7874R', date_of_joining = '2018-5-7'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BAJI SITARAO%MALLA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BAJI SITARAO%MALLA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BZIPT5979H', date_of_joining = '2022-6-24'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ANUPOJU%TEJASWI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ANUPOJU%TEJASWI%'
);

UPDATE faculty_profiles 
SET pan_number = 'COTPD0280A', date_of_joining = '2021-2-3'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%THIRUPATHAMMA%DEEKONDA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%THIRUPATHAMMA%DEEKONDA%'
);

UPDATE faculty_profiles 
SET pan_number = 'FFEPD1851Q', date_of_joining = '2021-1-27'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%.%DUTTA DEVIKA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%.%DUTTA DEVIKA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CDZPG3632C', date_of_joining = '2022-1-29'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SOWMYA%GANDLA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SOWMYA%GANDLA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CJNPG4057P', date_of_joining = '2020-12-28'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BHARGAVI%GADDE%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BHARGAVI%GADDE%'
);

UPDATE faculty_profiles 
SET pan_number = 'ACOPC1844Q', date_of_joining = '2025-5-8'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RAVIKANT%CHERUKURI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RAVIKANT%CHERUKURI%'
);

UPDATE faculty_profiles 
SET pan_number = 'ASUPN0182C', date_of_joining = '2019-12-13'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%NEERUKONDA%PRIYADARSINI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%NEERUKONDA%PRIYADARSINI%'
);

UPDATE faculty_profiles 
SET pan_number = 'FRNPK0670R', date_of_joining = '2020-8-20'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%MANVITHA%KODURU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%MANVITHA%KODURU%'
);

UPDATE faculty_profiles 
SET pan_number = 'BBFPV3679H', date_of_joining = '2020-8-20'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SAI SILPA%VENNA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SAI SILPA%VENNA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CHNPB7437A', date_of_joining = '2020-8-20'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BALASAITRINADH%BANDI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BALASAITRINADH%BANDI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CAUPP4414P', date_of_joining = '2023-6-30'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRINIVAS%PATCHALA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRINIVAS%PATCHALA%'
);

UPDATE faculty_profiles 
SET pan_number = 'DQXPS8830J', date_of_joining = '2024-10-1'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SURE%SRIDHAR%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SURE%SRIDHAR%'
);

UPDATE faculty_profiles 
SET pan_number = 'CSTPM2022D', date_of_joining = '2021-4-12'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%UMADEVI%MARMUDI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%UMADEVI%MARMUDI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CCIPB9776Q', date_of_joining = '2020-12-28'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VAILA%BEJJAM%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VAILA%BEJJAM%'
);

UPDATE faculty_profiles 
SET pan_number = 'BISPC5648H', date_of_joining = '2021-9-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BINDU%CHAVVA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BINDU%CHAVVA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AHLPB1060B', date_of_joining = '2022-1-19'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SAIDAIAH%BANDI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SAIDAIAH%BANDI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AMGPB4443C', date_of_joining = '2020-3-20'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SOWJANYA%BATTULA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SOWJANYA%BATTULA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AJKPA4463E', date_of_joining = '2021-1-27'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KRISHNA%ANNAVARAPU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KRISHNA%ANNAVARAPU%'
);

UPDATE faculty_profiles 
SET pan_number = 'BXHPA9165P', date_of_joining = '2021-1-27'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PARVATHI%ATCHUTANNA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PARVATHI%ATCHUTANNA%'
);

UPDATE faculty_profiles 
SET pan_number = 'GHZPM4947L', date_of_joining = '2022-10-28'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KALYANI%MIRIYALA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KALYANI%MIRIYALA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CPQPG7746Q', date_of_joining = '2020-1-7'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%MARUTHI%GUNJI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%MARUTHI%GUNJI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AWKPC1868N', date_of_joining = '2017-4-12'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RAMBABU%CHEMAKURTHI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RAMBABU%CHEMAKURTHI%'
);

UPDATE faculty_profiles 
SET pan_number = 'FKPPD1096H', date_of_joining = '2021-11-8'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RAMESH%DANTAM%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RAMESH%DANTAM%'
);

UPDATE faculty_profiles 
SET pan_number = 'DWNPP8224F', date_of_joining = '2022-5-26'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BHIKSHALU%POLICHERLA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BHIKSHALU%POLICHERLA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CAFPK2820M', date_of_joining = '2021-12-31'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PAVANI%KURAGANTI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PAVANI%KURAGANTI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CRVPB4846F', date_of_joining = '2021-3-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RAJA%BATCHU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RAJA%BATCHU%'
);

UPDATE faculty_profiles 
SET pan_number = 'ELAPK9178J', date_of_joining = '2021-12-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ANUSHA%KUNCHAKARRA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ANUSHA%KUNCHAKARRA%'
);

UPDATE faculty_profiles 
SET pan_number = 'GAHPM8457E', date_of_joining = '2021-12-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ANUPAMA%MEDIDA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ANUPAMA%MEDIDA%'
);

UPDATE faculty_profiles 
SET pan_number = 'FJFPR4842Q', date_of_joining = '2024-6-26'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PATHURU%RAJASEKHAR%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PATHURU%RAJASEKHAR%'
);

UPDATE faculty_profiles 
SET pan_number = 'APYPD0479D', date_of_joining = '2008-11-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KOTESWARA RAO%DASARI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KOTESWARA RAO%DASARI%'
);

UPDATE faculty_profiles 
SET pan_number = 'ASEPM5158P', date_of_joining = '2009-6-22'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%.%MOPARTHI MARY JUNITHA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%.%MOPARTHI MARY JUNITHA%'
);

UPDATE faculty_profiles 
SET pan_number = 'ARJPG3461H', date_of_joining = '2008-8-6'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KRISHNA KUMARI%GANESUNI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KRISHNA KUMARI%GANESUNI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AYQPV3375D', date_of_joining = '2023-6-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VENGATESAN%VENUGOPAL%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VENGATESAN%VENUGOPAL%'
);

UPDATE faculty_profiles 
SET pan_number = 'BTLPM1693N', date_of_joining = '2021-1-4'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ALEKHYA%MEDIDA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ALEKHYA%MEDIDA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AKBPN0878N', date_of_joining = '2024-4-18'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%GUDURU%MEGHANA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%GUDURU%MEGHANA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BYHPB3029A', date_of_joining = '2022-6-20'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRINIVAS%BODA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRINIVAS%BODA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CALPC6118A', date_of_joining = '2023-3-17'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRAVANI%CHINNAM%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRAVANI%CHINNAM%'
);

UPDATE faculty_profiles 
SET pan_number = 'CFBPG9923C', date_of_joining = '2023-3-13'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SAI KUMAR%GOPU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SAI KUMAR%GOPU%'
);

UPDATE faculty_profiles 
SET pan_number = 'BSAPC8068F', date_of_joining = '2022-6-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%DHANALAKSHMI%CHENNUPATI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%DHANALAKSHMI%CHENNUPATI%'
);

UPDATE faculty_profiles 
SET pan_number = 'BUYPB2238J', date_of_joining = '2023-2-27'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BOLLEPALLI%MOHANA RAGINI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BOLLEPALLI%MOHANA RAGINI%'
);

UPDATE faculty_profiles 
SET pan_number = 'QPHPS2639M', date_of_joining = '2022-8-24'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SARIPUDI%SUNEETHA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SARIPUDI%SUNEETHA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BIUPV7464A', date_of_joining = '2023-2-13'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SREEVANI%VARAGAANI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SREEVANI%VARAGAANI%'
);

UPDATE faculty_profiles 
SET pan_number = 'LHOPS4816G', date_of_joining = '2023-3-3'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%YADLA%SAI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%YADLA%SAI%'
);

UPDATE faculty_profiles 
SET pan_number = 'FNCPP1259L', date_of_joining = '2025-6-12'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%YOJITHA%PUPPALLA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%YOJITHA%PUPPALLA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BEWPD1223D', date_of_joining = '2024-3-22'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%DESU%SABARI GIRINADH%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%DESU%SABARI GIRINADH%'
);

UPDATE faculty_profiles 
SET pan_number = 'BNXPP9154K', date_of_joining = '2022-8-18'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%MANOHAR%PATRA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%MANOHAR%PATRA%'
);

UPDATE faculty_profiles 
SET pan_number = 'MURPS2833L', date_of_joining = '2022-5-9'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%YARRU%SREEJA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%YARRU%SREEJA%'
);

UPDATE faculty_profiles 
SET pan_number = 'DCOPP4624Q', date_of_joining = '2021-1-9'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KANVITHA%PENUMUTCHU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KANVITHA%PENUMUTCHU%'
);

UPDATE faculty_profiles 
SET pan_number = 'FQDPS3325A', date_of_joining = '2022-5-9'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%HANEEF%SHAIK%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%HANEEF%SHAIK%'
);

UPDATE faculty_profiles 
SET pan_number = 'ASLPV6028N', date_of_joining = '2022-12-26'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PAVANI%VELAGA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PAVANI%VELAGA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BKOPP3138F', date_of_joining = '2021-1-9'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%AMALA%PAYALA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%AMALA%PAYALA%'
);

UPDATE faculty_profiles 
SET pan_number = 'HMNPM7163L', date_of_joining = '2020-4-5'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ANUSHA%MEDISETTY%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ANUSHA%MEDISETTY%'
);

UPDATE faculty_profiles 
SET pan_number = 'BZTPA3366A', date_of_joining = '2023-2-27'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ARUNA%THOTA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ARUNA%THOTA%'
);

UPDATE faculty_profiles 
SET pan_number = 'FMBPP4788J', date_of_joining = '2021-2-3'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RAZIA SULTANA%PATHAN%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RAZIA SULTANA%PATHAN%'
);

UPDATE faculty_profiles 
SET pan_number = 'GZBPK7341L', date_of_joining = '2024-2-5'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRILEKHA%KASIMALA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRILEKHA%KASIMALA%'
);

UPDATE faculty_profiles 
SET pan_number = 'DMHPA7533J', date_of_joining = '2023-11-22'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BHARGAV KUMAR%AVVARU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BHARGAV KUMAR%AVVARU%'
);

UPDATE faculty_profiles 
SET pan_number = 'CHOPB4463R', date_of_joining = '2023-6-5'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BHEEMANA%INDU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BHEEMANA%INDU%'
);

UPDATE faculty_profiles 
SET pan_number = 'CYUPA3019H', date_of_joining = '2023-12-6'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VIJAY KUMAR%ANKIPALLI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VIJAY KUMAR%ANKIPALLI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CHIPA9447E', date_of_joining = '2017-12-28'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%DEEPTHI%AMULOTHU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%DEEPTHI%AMULOTHU%'
);

UPDATE faculty_profiles 
SET pan_number = 'AEPPE2224M', date_of_joining = '2023-12-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VENKATA%EEDARA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VENKATA%EEDARA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CBBPC7865H', date_of_joining = '2023-7-10'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRUTHI%CHEVULA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRUTHI%CHEVULA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CKUPG6787L', date_of_joining = '2023-7-18'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRAVANI LATHA%GARNEPUDI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRAVANI LATHA%GARNEPUDI%'
);

UPDATE faculty_profiles 
SET pan_number = 'DYFPP0215L', date_of_joining = '2024-2-5'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ASHALATHA%PODILI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ASHALATHA%PODILI%'
);

UPDATE faculty_profiles 
SET pan_number = 'EOKPP9643Q', date_of_joining = '2024-1-10'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PAVAN VENKATA DURGA%PETLA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PAVAN VENKATA DURGA%PETLA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BZUPJ7620M', date_of_joining = '2023-6-29'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%CHALUVADI%JYOTHIRMAI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%CHALUVADI%JYOTHIRMAI%'
);

UPDATE faculty_profiles 
SET pan_number = 'DINPA8530D', date_of_joining = '2023-1-10'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VAMSI%ALLAM%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VAMSI%ALLAM%'
);

UPDATE faculty_profiles 
SET pan_number = 'MINPK8812P', date_of_joining = '2023-6-29'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%JAYA DEEPTHI%KARASALA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%JAYA DEEPTHI%KARASALA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CQAPK6119A', date_of_joining = '2024-2-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%MOUNIKA%KONGARI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%MOUNIKA%KONGARI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CNKPA0778G', date_of_joining = '2024-10-9'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PRAVEEN%ADDANKI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PRAVEEN%ADDANKI%'
);

UPDATE faculty_profiles 
SET pan_number = 'HQIPS0369K', date_of_joining = '2021-8-31'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ANJU%SHAIK%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ANJU%SHAIK%'
);

UPDATE faculty_profiles 
SET pan_number = 'CJQPP1352F', date_of_joining = '2021-9-2'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PREMCHAND%PAGIDI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PREMCHAND%PAGIDI%'
);

UPDATE faculty_profiles 
SET pan_number = 'GHYPM9382N', date_of_joining = '2023-9-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%.%MEKALA ANGULI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%.%MEKALA ANGULI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AGTPT6450E', date_of_joining = '2023-9-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%LAKSHMI%TELLURI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%LAKSHMI%TELLURI%'
);

UPDATE faculty_profiles 
SET pan_number = 'BMIPY5261J', date_of_joining = '2023-9-6'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%.%YAMPATI SIREESHA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%.%YAMPATI SIREESHA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AHXPY3098A', date_of_joining = '2023-7-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%YAMPATI%SUPRAJA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%YAMPATI%SUPRAJA%'
);

UPDATE faculty_profiles 
SET pan_number = 'ABTPE8752D', date_of_joining = '2022-6-2'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%NAGARJUNA%EARLA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%NAGARJUNA%EARLA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AMNPB4541J', date_of_joining = '2000-3-19'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BHUMANA%SUJATHA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BHUMANA%SUJATHA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AMAPM7701Q', date_of_joining = '2021-5-3'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%.%MANNEPULA ARUNKUMAR%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%.%MANNEPULA ARUNKUMAR%'
);

UPDATE faculty_profiles 
SET pan_number = 'NPYPK5159E', date_of_joining = '2023-9-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PENUMOLU%RATNAKUMARI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PENUMOLU%RATNAKUMARI%'
);

UPDATE faculty_profiles 
SET pan_number = 'GATPB5713A', date_of_joining = '2022-6-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SHAIK%KARISHMABANU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SHAIK%KARISHMABANU%'
);

UPDATE faculty_profiles 
SET pan_number = 'BGAPN8730P', date_of_joining = '2024-3-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%NUTALAPATI%BHUVANESWARI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%NUTALAPATI%BHUVANESWARI%'
);

UPDATE faculty_profiles 
SET pan_number = 'APVPU4169C', date_of_joining = '2024-10-21'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%UYYALA%SRAVANTHI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%UYYALA%SRAVANTHI%'
);

UPDATE faculty_profiles 
SET pan_number = 'FTZPA4904A', date_of_joining = '2024-7-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%MADANU%ANUSHA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%MADANU%ANUSHA%'
);

UPDATE faculty_profiles 
SET pan_number = 'EMAPR7929K', date_of_joining = '2024-9-10'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SALE%RAVITEJA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SALE%RAVITEJA%'
);

UPDATE faculty_profiles 
SET pan_number = 'PJKPS6990H', date_of_joining = '2024-11-18'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BHAVANAM%SRAVANI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BHAVANAM%SRAVANI%'
);

UPDATE faculty_profiles 
SET pan_number = 'LWNPK2458N', date_of_joining = '2023-6-5'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PANAMALA%PRASANNA KUMARI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PANAMALA%PRASANNA KUMARI%'
);

UPDATE faculty_profiles 
SET pan_number = 'LUSPS6332L', date_of_joining = '2024-11-18'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SUNKARA%PRASHANTH%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SUNKARA%PRASHANTH%'
);

UPDATE faculty_profiles 
SET pan_number = 'LMJPS2423R', date_of_joining = '2024-6-20'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SHAIK%SHARIQA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SHAIK%SHARIQA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CSMPV3326C', date_of_joining = '2024-12-6'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%CHIKKAM%VISHNUPRIYA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%CHIKKAM%VISHNUPRIYA%'
);

UPDATE faculty_profiles 
SET pan_number = 'BZHPP6770M', date_of_joining = '2024-5-15'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KADHIRE%PRAVEENA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KADHIRE%PRAVEENA%'
);

UPDATE faculty_profiles 
SET pan_number = 'LYFPK8619F', date_of_joining = '2024-6-10'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KOTA%NAGAPURNIMABABY%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KOTA%NAGAPURNIMABABY%'
);

UPDATE faculty_profiles 
SET pan_number = 'OAFPS8113D', date_of_joining = '2024-11-19'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SYED%APSARA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SYED%APSARA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CJLPB5181R', date_of_joining = '2025-6-16'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BALUDRA%CHANDINIRAM%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BALUDRA%CHANDINIRAM%'
);

UPDATE faculty_profiles 
SET pan_number = 'BADPV4745F', date_of_joining = '2020-8-20'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VUNNAVA%CHAITANYAKUMARI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VUNNAVA%CHAITANYAKUMARI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AXTPM5753C', date_of_joining = '2024-6-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%M%APPA RAO%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%M%APPA RAO%'
);

UPDATE faculty_profiles 
SET pan_number = 'CDOPV6407P', date_of_joining = '2025-7-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%V%SANDHYA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%V%SANDHYA%'
);

UPDATE faculty_profiles 
SET pan_number = 'CNIPK5146F', date_of_joining = '2025-7-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRINIVASA RAO%KALAM%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRINIVASA RAO%KALAM%'
);

UPDATE faculty_profiles 
SET pan_number = 'AUUPV4836I', date_of_joining = '2025-7-31'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRINIVASARAO%V%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRINIVASARAO%V%'
);

UPDATE faculty_profiles 
SET pan_number = 'CSVPV0592C', date_of_joining = '2024-6-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%K%NAGAVALLI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%K%NAGAVALLI%'
);

UPDATE faculty_profiles 
SET pan_number = 'GZUPR7245S', date_of_joining = '2025-7-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%B%RAJU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%B%RAJU%'
);

UPDATE faculty_profiles 
SET pan_number = 'NPYPY5159E', date_of_joining = '2021-9-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RATNA KUMARI%P%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RATNA KUMARI%P%'
);

UPDATE faculty_profiles 
SET pan_number = 'FLIPS5042C', date_of_joining = '2022-2-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KAVYA SRI%K%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KAVYA SRI%K%'
);

UPDATE faculty_profiles 
SET pan_number = 'EEZPS2467P', date_of_joining = '2021-2-3'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SOWJANYA%S%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SOWJANYA%S%'
);

UPDATE faculty_profiles 
SET pan_number = 'BZSPB9501P', date_of_joining = '2020-5-18'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%BALAJI%KOMMURI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%BALAJI%KOMMURI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CJDPK3471R', date_of_joining = '2023-10-2'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SAI SULOCHANA%K%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SAI SULOCHANA%K%'
);

UPDATE faculty_profiles 
SET pan_number = 'EBQPK7677J', date_of_joining = '2021-5-12'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%LAVANYA%K%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%LAVANYA%K%'
);

UPDATE faculty_profiles 
SET pan_number = 'EBJPK8148B', date_of_joining = '2020-9-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RAMA KOTESWARA RAO%K%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RAMA KOTESWARA RAO%K%'
);

UPDATE faculty_profiles 
SET pan_number = 'NFNPS3820D', date_of_joining = '2022-6-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRIKANTH%G%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRIKANTH%G%'
);

UPDATE faculty_profiles 
SET pan_number = 'APSPN0854N', date_of_joining = '2022-2-21'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VAMSI KRISHNA%N%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VAMSI KRISHNA%N%'
);

UPDATE faculty_profiles 
SET pan_number = 'KTBPS1307E', date_of_joining = '2022-7-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%ROSHNA%SHAIK%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%ROSHNA%SHAIK%'
);

UPDATE faculty_profiles 
SET pan_number = 'ASHPN9227F', date_of_joining = '2022-6-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%PRADEEP KUMAR%N%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%PRADEEP KUMAR%N%'
);

UPDATE faculty_profiles 
SET pan_number = 'ALEPV8806A', date_of_joining = '2021-7-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%VEERENDRA%U%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%VEERENDRA%U%'
);

UPDATE faculty_profiles 
SET pan_number = 'AOTPV8598R', date_of_joining = '2021-6-3'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SURESH BABU%V%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SURESH BABU%V%'
);

UPDATE faculty_profiles 
SET pan_number = 'DELPK5325C', date_of_joining = '2022-12-20'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%S V GANESH KUMAR%KONDETI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%S V GANESH KUMAR%KONDETI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CEUPV6510E', date_of_joining = '2024-5-4'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SANDHYA%V%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SANDHYA%V%'
);

UPDATE faculty_profiles 
SET pan_number = 'CHDPC8248Q', date_of_joining = '2025-9-25'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%CH%KUMAR%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%CH%KUMAR%'
);

UPDATE faculty_profiles 
SET pan_number = 'ATAPC2949D', date_of_joining = '2017-6-5'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%CHAKRAVARTHI%T%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%CHAKRAVARTHI%T%'
);

UPDATE faculty_profiles 
SET pan_number = 'GBKPS8605A', date_of_joining = '2022-4-1'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SK.%MUNNISA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SK.%MUNNISA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AMGPN3421Q', date_of_joining = '2009-9-29'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%N.%CHAND%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%N.%CHAND%'
);

UPDATE faculty_profiles 
SET pan_number = 'BZDPN6628Q', date_of_joining = '2025-1-21'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%D.%NARESH%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%D.%NARESH%'
);

UPDATE faculty_profiles 
SET pan_number = 'ENNBK9054E', date_of_joining = '2022-6-6'
WHERE dept_code = 'IT' 
AND (
    (first_name || ' ' || last_name) ILIKE '%GAYATRI%KONIJETI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%GAYATRI%KONIJETI%'
);

UPDATE faculty_profiles 
SET pan_number = 'ATGPV3641M', date_of_joining = '2020-11-9'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SWETHA%VALETI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SWETHA%VALETI%'
);

UPDATE faculty_profiles 
SET pan_number = 'DDRPM3350J', date_of_joining = '2024-6-5'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%M%SUBRAMANYAM%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%M%SUBRAMANYAM%'
);

UPDATE faculty_profiles 
SET pan_number = 'AOIPS0514E', date_of_joining = '2024-10-14'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SK.%RASOOL%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SK.%RASOOL%'
);

UPDATE faculty_profiles 
SET pan_number = 'EAFPK2291O', date_of_joining = '2024-7-31'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%K%SAMBAIAH%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%K%SAMBAIAH%'
);

UPDATE faculty_profiles 
SET pan_number = 'AYHPB6786F', date_of_joining = '2023-7-10'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%V%BABU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%V%BABU%'
);

UPDATE faculty_profiles 
SET pan_number = 'EAMPG0472F', date_of_joining = '2023-7-10'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%G%LAKSHMI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%G%LAKSHMI%'
);

UPDATE faculty_profiles 
SET pan_number = 'BHOPA8812R', date_of_joining = '2020-11-16'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%A%SAKEETH%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%A%SAKEETH%'
);

UPDATE faculty_profiles 
SET pan_number = 'AOVPA6437O', date_of_joining = '2024-6-5'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%A%ADIYYA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%A%ADIYYA%'
);

UPDATE faculty_profiles 
SET pan_number = 'IDZPS7287B', date_of_joining = '2021-8-25'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SK.%PHARJANA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SK.%PHARJANA%'
);

UPDATE faculty_profiles 
SET pan_number = 'ADSPG4422D', date_of_joining = '2024-12-26'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%GODA%MAHESH%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%GODA%MAHESH%'
);

UPDATE faculty_profiles 
SET pan_number = 'EGEPM2488F', date_of_joining = '2025-8-5'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%MORABOENA%RAMESH BABU%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%MORABOENA%RAMESH BABU%'
);

UPDATE faculty_profiles 
SET pan_number = 'BDNPL4819F', date_of_joining = '2025-9-15'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%LANKA%SOWJANYA%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%LANKA%SOWJANYA%'
);

UPDATE faculty_profiles 
SET pan_number = 'AHHPK9247R', date_of_joining = '2012-1-6'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRIHARI%KOMATINENI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRIHARI%KOMATINENI%'
);

UPDATE faculty_profiles 
SET pan_number = 'CJCPK0371F', date_of_joining = '2021-6-3'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%UPENDRA%KOTAPATI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%UPENDRA%KOTAPATI%'
);

UPDATE faculty_profiles 
SET pan_number = 'DAKPS1029A', date_of_joining = '2022-4-5'
WHERE dept_code = 'ECE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%RANGANADH%SRIPERUMBUDURI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%RANGANADH%SRIPERUMBUDURI%'
);

UPDATE faculty_profiles 
SET pan_number = 'EFPPS9216L', date_of_joining = '2022-6-1'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%MUNTAJ BEGUM%SHAIK%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%MUNTAJ BEGUM%SHAIK%'
);

UPDATE faculty_profiles 
SET pan_number = 'CEQPK5883R', date_of_joining = '2023-7-22'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRILAKSHMI%KONAKANCHI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRILAKSHMI%KONAKANCHI%'
);

UPDATE faculty_profiles 
SET pan_number = 'EAMPK1222C', date_of_joining = '2024-7-12'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%SRINIVASA RAO%KOLAGANI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%SRINIVASA RAO%KOLAGANI%'
);

UPDATE faculty_profiles 
SET pan_number = 'AHJPV7914J', date_of_joining = '2018-12-17'
WHERE dept_code = 'CSE' 
AND (
    (first_name || ' ' || last_name) ILIKE '%KRISHNA%VAKALAPUDI%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%KRISHNA%VAKALAPUDI%'
);
COMMIT;