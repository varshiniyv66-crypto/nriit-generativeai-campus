import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function applyFixes() {
    console.log('Starting Batch Update...');
    let successCount = 0;
    let failCount = 0;


    // Row 3: SREEDEVI KUMARI G (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SREEDEVI KUMARI%,last_name.ilike.%G%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ATOPK4061A", "date_of_joining": "2021-11-15"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SREEDEVI KUMARI G:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SREEDEVI KUMARI G');
        }
    }

    // Row 9: SUJATA KANDUKURI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%SUJATA%,last_name.ilike.%KANDUKURI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ASKPK4364K", "date_of_joining": "2015-6-26"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SUJATA KANDUKURI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SUJATA KANDUKURI');
        }
    }

    // Row 11: NAGESWARA RAO ETIKALA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%NAGESWARA RAO%,last_name.ilike.%ETIKALA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AAJPE3195R", "date_of_joining": "2016-1-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed NAGESWARA RAO ETIKALA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): NAGESWARA RAO ETIKALA');
        }
    }

    // Row 12: RATNAKUMAR PAMULA (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%RATNAKUMAR%,last_name.ilike.%PAMULA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BNBPP2906D", "date_of_joining": "2015-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RATNAKUMAR PAMULA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RATNAKUMAR PAMULA');
        }
    }

    // Row 13: VANI DHARANIKOTA (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%VANI%,last_name.ilike.%DHARANIKOTA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BNOPD4835L", "date_of_joining": "2024-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VANI DHARANIKOTA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VANI DHARANIKOTA');
        }
    }

    // Row 14: ANUSHA CHINTALA (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%ANUSHA%,last_name.ilike.%CHINTALA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AKKPC8107C", "date_of_joining": "2015-4-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ANUSHA CHINTALA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ANUSHA CHINTALA');
        }
    }

    // Row 15: GUMMADIDALA SRINIVASARAO (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%GUMMADIDALA%,last_name.ilike.%SRINIVASARAO%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DXTPS1696R", "date_of_joining": "2015-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed GUMMADIDALA SRINIVASARAO:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): GUMMADIDALA SRINIVASARAO');
        }
    }

    // Row 17: BABURAO GUDIVADA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BABURAO%,last_name.ilike.%GUDIVADA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CGSPG1970R", "date_of_joining": "2015-7-8"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BABURAO GUDIVADA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BABURAO GUDIVADA');
        }
    }

    // Row 22: HANUMANTHA GUTTA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%HANUMANTHA%,last_name.ilike.%GUTTA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BLAPG8227K", "date_of_joining": "2016-6-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed HANUMANTHA GUTTA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): HANUMANTHA GUTTA');
        }
    }

    // Row 23: VENKATESHWARARAO KANIKICHARLA (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%VENKATESHWARARAO%,last_name.ilike.%KANIKICHARLA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BNOPK5736R", "date_of_joining": "2016-6-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VENKATESHWARARAO KANIKICHARLA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VENKATESHWARARAO KANIKICHARLA');
        }
    }

    // Row 25: TELUKUTLA CHAKRAVARTHI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%TELUKUTLA%,last_name.ilike.%CHAKRAVARTHI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ATAPC2949P", "date_of_joining": "2017-6-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed TELUKUTLA CHAKRAVARTHI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): TELUKUTLA CHAKRAVARTHI');
        }
    }

    // Row 27: PRADEEP BOLLIPALLI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%PRADEEP%,last_name.ilike.%BOLLIPALLI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BAVPB3860K", "date_of_joining": "2017-6-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PRADEEP BOLLIPALLI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PRADEEP BOLLIPALLI');
        }
    }

    // Row 28: VENKATESH LAM (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VENKATESH%,last_name.ilike.%LAM%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AGFPL9859B", "date_of_joining": "2017-1-4"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VENKATESH LAM:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VENKATESH LAM');
        }
    }

    // Row 29: KRISHNA GADE (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%KRISHNA%,last_name.ilike.%GADE%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BYZPG7403B", "date_of_joining": "2015-6-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KRISHNA GADE:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KRISHNA GADE');
        }
    }

    // Row 30: SRINIVASA MUTYAM (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SRINIVASA%,last_name.ilike.%MUTYAM%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "APUPM9900J", "date_of_joining": "2011-8-16"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRINIVASA MUTYAM:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRINIVASA MUTYAM');
        }
    }

    // Row 35: MANASA MANUKONDA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%MANASA%,last_name.ilike.%MANUKONDA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CAGPM8971A", "date_of_joining": "2017-4-28"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed MANASA MANUKONDA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): MANASA MANUKONDA');
        }
    }

    // Row 36: SURESH BABU IMMADISETTY (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SURESH BABU%,last_name.ilike.%IMMADISETTY%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ADJPI0582P", "date_of_joining": "2017-5-24"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SURESH BABU IMMADISETTY:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SURESH BABU IMMADISETTY');
        }
    }

    // Row 37: CHIKKALA BABU (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%CHIKKALA%,last_name.ilike.%BABU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DLFPB2803H", "date_of_joining": "2017-6-8"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed CHIKKALA BABU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): CHIKKALA BABU');
        }
    }

    // Row 39: SRINIVAS REDDY PALLE (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SRINIVAS REDDY%,last_name.ilike.%PALLE%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "APCPP4507Q", "date_of_joining": "2022-2-26"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRINIVAS REDDY PALLE:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRINIVAS REDDY PALLE');
        }
    }

    // Row 40: NAGAMANI BODIGIRI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%NAGAMANI%,last_name.ilike.%BODIGIRI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CHVPB8471N", "date_of_joining": "2023-6-30"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed NAGAMANI BODIGIRI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): NAGAMANI BODIGIRI');
        }
    }

    // Row 42: VENU GOPAL LANKAPALLI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VENU GOPAL%,last_name.ilike.%LANKAPALLI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AIOPL1000D", "date_of_joining": "2021-9-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VENU GOPAL LANKAPALLI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VENU GOPAL LANKAPALLI');
        }
    }

    // Row 43: NARENDRA KUMAR VADIGINA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%NARENDRA KUMAR%,last_name.ilike.%VADIGINA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ALOPN4499D", "date_of_joining": "2013-6-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed NARENDRA KUMAR VADIGINA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): NARENDRA KUMAR VADIGINA');
        }
    }

    // Row 44: SIVA NAVULURI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SIVA%,last_name.ilike.%NAVULURI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BCEPN1649H", "date_of_joining": "2022-6-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SIVA NAVULURI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SIVA NAVULURI');
        }
    }

    // Row 47: SURYA KATTA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SURYA%,last_name.ilike.%KATTA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FZYPS3143E", "date_of_joining": "2020-11-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SURYA KATTA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SURYA KATTA');
        }
    }

    // Row 48: JYOTHI JARUGULA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%JYOTHI%,last_name.ilike.%JARUGULA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BBZPJ0764R", "date_of_joining": "2020-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed JYOTHI JARUGULA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): JYOTHI JARUGULA');
        }
    }

    // Row 49: VUTLA GOVARDHANA RAO (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VUTLA%,last_name.ilike.%GOVARDHANA RAO%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "APVPG7097P", "date_of_joining": "2023-7-25"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VUTLA GOVARDHANA RAO:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VUTLA GOVARDHANA RAO');
        }
    }

    // Row 50: SURESH GOTTIPATI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SURESH%,last_name.ilike.%GOTTIPATI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AMAPG0946M", "date_of_joining": "2021-11-27"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SURESH GOTTIPATI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SURESH GOTTIPATI');
        }
    }

    // Row 52: RAMU JARUBULA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%RAMU%,last_name.ilike.%JARUBULA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AISPJ9290M", "date_of_joining": "2022-3-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RAMU JARUBULA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RAMU JARUBULA');
        }
    }

    // Row 60: CHETTY KALAISELVAN (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%CHETTY%,last_name.ilike.%KALAISELVAN%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BBZPK0581M", "date_of_joining": "2018-8-29"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed CHETTY KALAISELVAN:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): CHETTY KALAISELVAN');
        }
    }

    // Row 61: THRIVENI DEEPTHI KOTA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%THRIVENI DEEPTHI%,last_name.ilike.%KOTA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "GKBPK4116E", "date_of_joining": "2017-11-11"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed THRIVENI DEEPTHI KOTA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): THRIVENI DEEPTHI KOTA');
        }
    }

    // Row 64: RAJA KARNATI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%RAJA%,last_name.ilike.%KARNATI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BBBPK9727M", "date_of_joining": "2020-3-21"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RAJA KARNATI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RAJA KARNATI');
        }
    }

    // Row 67: BALAKRISHNA PEYYALA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%BALAKRISHNA%,last_name.ilike.%PEYYALA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AYHPP3809M", "date_of_joining": "2025-6-23"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BALAKRISHNA PEYYALA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BALAKRISHNA PEYYALA');
        }
    }

    // Row 69: VENKATA YEDAVALLI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VENKATA%,last_name.ilike.%YEDAVALLI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ACDPY4427C", "date_of_joining": "2021-5-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VENKATA YEDAVALLI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VENKATA YEDAVALLI');
        }
    }

    // Row 73: SREENIVASARAO KUMMARI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%SREENIVASARAO%,last_name.ilike.%KUMMARI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EOJPS9903H", "date_of_joining": "2025-6-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SREENIVASARAO KUMMARI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SREENIVASARAO KUMMARI');
        }
    }

    // Row 74: BHAVANI BUTHUKURI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BHAVANI%,last_name.ilike.%BUTHUKURI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AWNPB4162H", "date_of_joining": "2024-1-22"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BHAVANI BUTHUKURI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BHAVANI BUTHUKURI');
        }
    }

    // Row 75: VISVANATH SAI CHENNUBOINA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VISVANATH SAI%,last_name.ilike.%CHENNUBOINA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BRVPC1435N", "date_of_joining": "2022-2-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VISVANATH SAI CHENNUBOINA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VISVANATH SAI CHENNUBOINA');
        }
    }

    // Row 76: ANJANEYULU UMMANENI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%ANJANEYULU%,last_name.ilike.%UMMANENI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AFDPU1254J", "date_of_joining": "2022-5-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ANJANEYULU UMMANENI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ANJANEYULU UMMANENI');
        }
    }

    // Row 78: TEJASWI KAVURU (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%TEJASWI%,last_name.ilike.%KAVURU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "IQQPK5649D", "date_of_joining": "2022-1-10"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed TEJASWI KAVURU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): TEJASWI KAVURU');
        }
    }

    // Row 80: CHIRANJEEVI MODUKURI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%CHIRANJEEVI%,last_name.ilike.%MODUKURI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BMHPM2963E", "date_of_joining": "2025-6-16"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed CHIRANJEEVI MODUKURI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): CHIRANJEEVI MODUKURI');
        }
    }

    // Row 81: MADDIRALA PRADEEP CHANDRA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%MADDIRALA PRADEEP%,last_name.ilike.%CHANDRA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BKTPM7946M", "date_of_joining": "2022-3-29"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed MADDIRALA PRADEEP CHANDRA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): MADDIRALA PRADEEP CHANDRA');
        }
    }

    // Row 84: GAYATREE UPPALAPATI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%GAYATREE%,last_name.ilike.%UPPALAPATI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ACFPU2313R", "date_of_joining": "2019-10-19"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed GAYATREE UPPALAPATI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): GAYATREE UPPALAPATI');
        }
    }

    // Row 88: VINODA DAMACHERLA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VINODA%,last_name.ilike.%DAMACHERLA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "APGPD7086N", "date_of_joining": "2019-7-4"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VINODA DAMACHERLA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VINODA DAMACHERLA');
        }
    }

    // Row 89: VIDYAREKHA IKKURTHI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VIDYAREKHA%,last_name.ilike.%IKKURTHI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ABWPI8311B", "date_of_joining": "2019-6-27"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VIDYAREKHA IKKURTHI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VIDYAREKHA IKKURTHI');
        }
    }

    // Row 92: HASEENA SAYYED (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%HASEENA%,last_name.ilike.%SAYYED%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DQIPS4042D", "date_of_joining": "2019-6-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed HASEENA SAYYED:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): HASEENA SAYYED');
        }
    }

    // Row 93: NAGAJYOTHI VALETI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%NAGAJYOTHI%,last_name.ilike.%VALETI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ATRPV1800B", "date_of_joining": "2019-9-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed NAGAJYOTHI VALETI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): NAGAJYOTHI VALETI');
        }
    }

    // Row 96: LALITA GOGINENI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%LALITA%,last_name.ilike.%GOGINENI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CKSPG9700M", "date_of_joining": "2021-2-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed LALITA GOGINENI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): LALITA GOGINENI');
        }
    }

    // Row 98: DOPPALAPUDI HARI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%DOPPALAPUDI%,last_name.ilike.%HARI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BCJPD3175R", "date_of_joining": "2021-9-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed DOPPALAPUDI HARI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): DOPPALAPUDI HARI');
        }
    }

    // Row 99: SURESH GANGI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SURESH%,last_name.ilike.%GANGI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AXMPG0182E", "date_of_joining": "2021-12-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SURESH GANGI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SURESH GANGI');
        }
    }

    // Row 100: NAGA MALLESWARI VERICHERLA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%NAGA MALLESWARI%,last_name.ilike.%VERICHERLA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AGFPV0118D", "date_of_joining": "2020-11-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed NAGA MALLESWARI VERICHERLA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): NAGA MALLESWARI VERICHERLA');
        }
    }

    // Row 102: CHANDRA JAMPANI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%CHANDRA%,last_name.ilike.%JAMPANI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AJBPJ5874D", "date_of_joining": "2018-12-11"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed CHANDRA JAMPANI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): CHANDRA JAMPANI');
        }
    }

    // Row 106: BAJI SITARAO MALLA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BAJI SITARAO%,last_name.ilike.%MALLA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CNGPM7874R", "date_of_joining": "2018-5-7"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BAJI SITARAO MALLA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BAJI SITARAO MALLA');
        }
    }

    // Row 110: THIRUPATHAMMA DEEKONDA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%THIRUPATHAMMA%,last_name.ilike.%DEEKONDA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "COTPD0280A", "date_of_joining": "2021-2-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed THIRUPATHAMMA DEEKONDA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): THIRUPATHAMMA DEEKONDA');
        }
    }

    // Row 111: . DUTTA DEVIKA (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%.%,last_name.ilike.%DUTTA DEVIKA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FFEPD1851Q", "date_of_joining": "2021-1-27"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed . DUTTA DEVIKA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): . DUTTA DEVIKA');
        }
    }

    // Row 112: SOWMYA GANDLA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SOWMYA%,last_name.ilike.%GANDLA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CDZPG3632C", "date_of_joining": "2022-1-29"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SOWMYA GANDLA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SOWMYA GANDLA');
        }
    }

    // Row 114: BHARGAVI GADDE (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BHARGAVI%,last_name.ilike.%GADDE%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CJNPG4057P", "date_of_joining": "2020-12-28"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BHARGAVI GADDE:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BHARGAVI GADDE');
        }
    }

    // Row 115: RAVIKANT CHERUKURI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%RAVIKANT%,last_name.ilike.%CHERUKURI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ACOPC1844Q", "date_of_joining": "2025-5-8"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RAVIKANT CHERUKURI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RAVIKANT CHERUKURI');
        }
    }

    // Row 118: NEERUKONDA PRIYADARSINI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%NEERUKONDA%,last_name.ilike.%PRIYADARSINI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ASUPN0182C", "date_of_joining": "2019-12-13"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed NEERUKONDA PRIYADARSINI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): NEERUKONDA PRIYADARSINI');
        }
    }

    // Row 121: MANVITHA KODURU (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%MANVITHA%,last_name.ilike.%KODURU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FRNPK0670R", "date_of_joining": "2020-8-20"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed MANVITHA KODURU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): MANVITHA KODURU');
        }
    }

    // Row 122: SAI SILPA VENNA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SAI SILPA%,last_name.ilike.%VENNA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BBFPV3679H", "date_of_joining": "2020-8-20"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SAI SILPA VENNA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SAI SILPA VENNA');
        }
    }

    // Row 123: BALASAITRINADH BANDI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BALASAITRINADH%,last_name.ilike.%BANDI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CHNPB7437A", "date_of_joining": "2020-8-20"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BALASAITRINADH BANDI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BALASAITRINADH BANDI');
        }
    }

    // Row 124: SRINIVAS PATCHALA (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%SRINIVAS%,last_name.ilike.%PATCHALA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CAUPP4414P", "date_of_joining": "2023-6-30"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRINIVAS PATCHALA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRINIVAS PATCHALA');
        }
    }

    // Row 125: SURE SRIDHAR (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%SURE%,last_name.ilike.%SRIDHAR%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DQXPS8830J", "date_of_joining": "2024-10-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SURE SRIDHAR:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SURE SRIDHAR');
        }
    }

    // Row 127: UMADEVI MARMUDI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%UMADEVI%,last_name.ilike.%MARMUDI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CSTPM2022D", "date_of_joining": "2021-4-12"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed UMADEVI MARMUDI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): UMADEVI MARMUDI');
        }
    }

    // Row 128: VAILA BEJJAM (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VAILA%,last_name.ilike.%BEJJAM%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CCIPB9776Q", "date_of_joining": "2020-12-28"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VAILA BEJJAM:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VAILA BEJJAM');
        }
    }

    // Row 129: BINDU CHAVVA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BINDU%,last_name.ilike.%CHAVVA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BISPC5648H", "date_of_joining": "2021-9-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BINDU CHAVVA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BINDU CHAVVA');
        }
    }

    // Row 131: SAIDAIAH BANDI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%SAIDAIAH%,last_name.ilike.%BANDI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AHLPB1060B", "date_of_joining": "2022-1-19"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SAIDAIAH BANDI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SAIDAIAH BANDI');
        }
    }

    // Row 132: SOWJANYA BATTULA (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%SOWJANYA%,last_name.ilike.%BATTULA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AMGPB4443C", "date_of_joining": "2020-3-20"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SOWJANYA BATTULA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SOWJANYA BATTULA');
        }
    }

    // Row 138: KRISHNA ANNAVARAPU (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%KRISHNA%,last_name.ilike.%ANNAVARAPU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AJKPA4463E", "date_of_joining": "2021-1-27"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KRISHNA ANNAVARAPU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KRISHNA ANNAVARAPU');
        }
    }

    // Row 139: PARVATHI ATCHUTANNA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%PARVATHI%,last_name.ilike.%ATCHUTANNA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BXHPA9165P", "date_of_joining": "2021-1-27"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PARVATHI ATCHUTANNA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PARVATHI ATCHUTANNA');
        }
    }

    // Row 140: KALYANI MIRIYALA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%KALYANI%,last_name.ilike.%MIRIYALA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "GHZPM4947L", "date_of_joining": "2022-10-28"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KALYANI MIRIYALA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KALYANI MIRIYALA');
        }
    }

    // Row 141: MARUTHI GUNJI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%MARUTHI%,last_name.ilike.%GUNJI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CPQPG7746Q", "date_of_joining": "2020-1-7"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed MARUTHI GUNJI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): MARUTHI GUNJI');
        }
    }

    // Row 143: RAMBABU CHEMAKURTHI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%RAMBABU%,last_name.ilike.%CHEMAKURTHI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AWKPC1868N", "date_of_joining": "2017-4-12"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RAMBABU CHEMAKURTHI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RAMBABU CHEMAKURTHI');
        }
    }

    // Row 144: RAMESH DANTAM (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%RAMESH%,last_name.ilike.%DANTAM%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FKPPD1096H", "date_of_joining": "2021-11-8"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RAMESH DANTAM:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RAMESH DANTAM');
        }
    }

    // Row 146: BHIKSHALU POLICHERLA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BHIKSHALU%,last_name.ilike.%POLICHERLA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DWNPP8224F", "date_of_joining": "2022-5-26"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BHIKSHALU POLICHERLA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BHIKSHALU POLICHERLA');
        }
    }

    // Row 149: PAVANI KURAGANTI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%PAVANI%,last_name.ilike.%KURAGANTI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CAFPK2820M", "date_of_joining": "2021-12-31"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PAVANI KURAGANTI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PAVANI KURAGANTI');
        }
    }

    // Row 150: RAJA BATCHU (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%RAJA%,last_name.ilike.%BATCHU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CRVPB4846F", "date_of_joining": "2021-3-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RAJA BATCHU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RAJA BATCHU');
        }
    }

    // Row 151: ANUSHA KUNCHAKARRA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%ANUSHA%,last_name.ilike.%KUNCHAKARRA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ELAPK9178J", "date_of_joining": "2021-12-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ANUSHA KUNCHAKARRA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ANUSHA KUNCHAKARRA');
        }
    }

    // Row 152: ANUPAMA MEDIDA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%ANUPAMA%,last_name.ilike.%MEDIDA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "GAHPM8457E", "date_of_joining": "2021-12-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ANUPAMA MEDIDA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ANUPAMA MEDIDA');
        }
    }

    // Row 156: PATHURU RAJASEKHAR (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%PATHURU%,last_name.ilike.%RAJASEKHAR%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FJFPR4842Q", "date_of_joining": "2024-6-26"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PATHURU RAJASEKHAR:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PATHURU RAJASEKHAR');
        }
    }

    // Row 157: KOTESWARA RAO DASARI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%KOTESWARA RAO%,last_name.ilike.%DASARI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "APYPD0479D", "date_of_joining": "2008-11-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KOTESWARA RAO DASARI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KOTESWARA RAO DASARI');
        }
    }

    // Row 164: . MOPARTHI MARY JUNITHA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%.%,last_name.ilike.%MOPARTHI MARY JUNITHA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ASEPM5158P", "date_of_joining": "2009-6-22"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed . MOPARTHI MARY JUNITHA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): . MOPARTHI MARY JUNITHA');
        }
    }

    // Row 165: KRISHNA KUMARI GANESUNI (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%KRISHNA KUMARI%,last_name.ilike.%GANESUNI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ARJPG3461H", "date_of_joining": "2008-8-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KRISHNA KUMARI GANESUNI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KRISHNA KUMARI GANESUNI');
        }
    }

    // Row 169: VENGATESAN VENUGOPAL (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VENGATESAN%,last_name.ilike.%VENUGOPAL%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AYQPV3375D", "date_of_joining": "2023-6-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VENGATESAN VENUGOPAL:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VENGATESAN VENUGOPAL');
        }
    }

    // Row 170: ALEKHYA MEDIDA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%ALEKHYA%,last_name.ilike.%MEDIDA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BTLPM1693N", "date_of_joining": "2021-1-4"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ALEKHYA MEDIDA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ALEKHYA MEDIDA');
        }
    }

    // Row 171: GUDURU MEGHANA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%GUDURU%,last_name.ilike.%MEGHANA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AKBPN0878N", "date_of_joining": "2024-4-18"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed GUDURU MEGHANA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): GUDURU MEGHANA');
        }
    }

    // Row 172: SRINIVAS BODA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SRINIVAS%,last_name.ilike.%BODA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BYHPB3029A", "date_of_joining": "2022-6-20"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRINIVAS BODA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRINIVAS BODA');
        }
    }

    // Row 173: SRAVANI CHINNAM (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%SRAVANI%,last_name.ilike.%CHINNAM%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CALPC6118A", "date_of_joining": "2023-3-17"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRAVANI CHINNAM:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRAVANI CHINNAM');
        }
    }

    // Row 174: SAI KUMAR GOPU (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%SAI KUMAR%,last_name.ilike.%GOPU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CFBPG9923C", "date_of_joining": "2023-3-13"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SAI KUMAR GOPU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SAI KUMAR GOPU');
        }
    }

    // Row 175: DHANALAKSHMI CHENNUPATI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%DHANALAKSHMI%,last_name.ilike.%CHENNUPATI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BSAPC8068F", "date_of_joining": "2022-6-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed DHANALAKSHMI CHENNUPATI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): DHANALAKSHMI CHENNUPATI');
        }
    }

    // Row 177: BOLLEPALLI MOHANA RAGINI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BOLLEPALLI%,last_name.ilike.%MOHANA RAGINI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BUYPB2238J", "date_of_joining": "2023-2-27"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BOLLEPALLI MOHANA RAGINI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BOLLEPALLI MOHANA RAGINI');
        }
    }

    // Row 179: SARIPUDI SUNEETHA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SARIPUDI%,last_name.ilike.%SUNEETHA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "QPHPS2639M", "date_of_joining": "2022-8-24"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SARIPUDI SUNEETHA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SARIPUDI SUNEETHA');
        }
    }

    // Row 180: SREEVANI VARAGAANI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SREEVANI%,last_name.ilike.%VARAGAANI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BIUPV7464A", "date_of_joining": "2023-2-13"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SREEVANI VARAGAANI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SREEVANI VARAGAANI');
        }
    }

    // Row 181: YADLA SAI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%YADLA%,last_name.ilike.%SAI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "LHOPS4816G", "date_of_joining": "2023-3-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed YADLA SAI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): YADLA SAI');
        }
    }

    // Row 182: YOJITHA PUPPALLA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%YOJITHA%,last_name.ilike.%PUPPALLA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FNCPP1259L", "date_of_joining": "2025-6-12"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed YOJITHA PUPPALLA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): YOJITHA PUPPALLA');
        }
    }

    // Row 184: DESU SABARI GIRINADH (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%DESU%,last_name.ilike.%SABARI GIRINADH%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BEWPD1223D", "date_of_joining": "2024-3-22"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed DESU SABARI GIRINADH:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): DESU SABARI GIRINADH');
        }
    }

    // Row 185: MANOHAR PATRA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%MANOHAR%,last_name.ilike.%PATRA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BNXPP9154K", "date_of_joining": "2022-8-18"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed MANOHAR PATRA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): MANOHAR PATRA');
        }
    }

    // Row 187: YARRU SREEJA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%YARRU%,last_name.ilike.%SREEJA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "MURPS2833L", "date_of_joining": "2022-5-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed YARRU SREEJA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): YARRU SREEJA');
        }
    }

    // Row 189: KANVITHA PENUMUTCHU (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%KANVITHA%,last_name.ilike.%PENUMUTCHU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DCOPP4624Q", "date_of_joining": "2021-1-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KANVITHA PENUMUTCHU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KANVITHA PENUMUTCHU');
        }
    }

    // Row 190: HANEEF SHAIK (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%HANEEF%,last_name.ilike.%SHAIK%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FQDPS3325A", "date_of_joining": "2022-5-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed HANEEF SHAIK:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): HANEEF SHAIK');
        }
    }

    // Row 191: PAVANI VELAGA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%PAVANI%,last_name.ilike.%VELAGA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ASLPV6028N", "date_of_joining": "2022-12-26"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PAVANI VELAGA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PAVANI VELAGA');
        }
    }

    // Row 194: AMALA PAYALA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%AMALA%,last_name.ilike.%PAYALA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BKOPP3138F", "date_of_joining": "2021-1-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed AMALA PAYALA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): AMALA PAYALA');
        }
    }

    // Row 196: ANUSHA MEDISETTY (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%ANUSHA%,last_name.ilike.%MEDISETTY%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "HMNPM7163L", "date_of_joining": "2020-4-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ANUSHA MEDISETTY:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ANUSHA MEDISETTY');
        }
    }

    // Row 203: ARUNA THOTA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%ARUNA%,last_name.ilike.%THOTA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BZTPA3366A", "date_of_joining": "2023-2-27"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ARUNA THOTA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ARUNA THOTA');
        }
    }

    // Row 204: RAZIA SULTANA PATHAN (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%RAZIA SULTANA%,last_name.ilike.%PATHAN%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FMBPP4788J", "date_of_joining": "2021-2-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RAZIA SULTANA PATHAN:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RAZIA SULTANA PATHAN');
        }
    }

    // Row 209: SRILEKHA KASIMALA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%SRILEKHA%,last_name.ilike.%KASIMALA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "GZBPK7341L", "date_of_joining": "2024-2-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRILEKHA KASIMALA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRILEKHA KASIMALA');
        }
    }

    // Row 211: BHARGAV KUMAR AVVARU (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BHARGAV KUMAR%,last_name.ilike.%AVVARU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DMHPA7533J", "date_of_joining": "2023-11-22"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BHARGAV KUMAR AVVARU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BHARGAV KUMAR AVVARU');
        }
    }

    // Row 212: BHEEMANA INDU (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%BHEEMANA%,last_name.ilike.%INDU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CHOPB4463R", "date_of_joining": "2023-6-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BHEEMANA INDU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BHEEMANA INDU');
        }
    }

    // Row 213: VIJAY KUMAR ANKIPALLI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%VIJAY KUMAR%,last_name.ilike.%ANKIPALLI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CYUPA3019H", "date_of_joining": "2023-12-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VIJAY KUMAR ANKIPALLI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VIJAY KUMAR ANKIPALLI');
        }
    }

    // Row 216: DEEPTHI AMULOTHU (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%DEEPTHI%,last_name.ilike.%AMULOTHU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CHIPA9447E", "date_of_joining": "2017-12-28"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed DEEPTHI AMULOTHU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): DEEPTHI AMULOTHU');
        }
    }

    // Row 219: VENKATA EEDARA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VENKATA%,last_name.ilike.%EEDARA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AEPPE2224M", "date_of_joining": "2023-12-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VENKATA EEDARA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VENKATA EEDARA');
        }
    }

    // Row 220: SRUTHI CHEVULA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SRUTHI%,last_name.ilike.%CHEVULA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CBBPC7865H", "date_of_joining": "2023-7-10"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRUTHI CHEVULA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRUTHI CHEVULA');
        }
    }

    // Row 221: SRAVANI LATHA GARNEPUDI (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%SRAVANI LATHA%,last_name.ilike.%GARNEPUDI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CKUPG6787L", "date_of_joining": "2023-7-18"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRAVANI LATHA GARNEPUDI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRAVANI LATHA GARNEPUDI');
        }
    }

    // Row 222: ASHALATHA PODILI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%ASHALATHA%,last_name.ilike.%PODILI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DYFPP0215L", "date_of_joining": "2024-2-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ASHALATHA PODILI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ASHALATHA PODILI');
        }
    }

    // Row 223: PAVAN VENKATA DURGA PETLA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%PAVAN VENKATA DURGA%,last_name.ilike.%PETLA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EOKPP9643Q", "date_of_joining": "2024-1-10"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PAVAN VENKATA DURGA PETLA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PAVAN VENKATA DURGA PETLA');
        }
    }

    // Row 224: CHALUVADI JYOTHIRMAI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%CHALUVADI%,last_name.ilike.%JYOTHIRMAI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BZUPJ7620M", "date_of_joining": "2023-6-29"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed CHALUVADI JYOTHIRMAI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): CHALUVADI JYOTHIRMAI');
        }
    }

    // Row 225: VAMSI ALLAM (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VAMSI%,last_name.ilike.%ALLAM%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DINPA8530D", "date_of_joining": "2023-1-10"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VAMSI ALLAM:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VAMSI ALLAM');
        }
    }

    // Row 226: JAYA DEEPTHI KARASALA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%JAYA DEEPTHI%,last_name.ilike.%KARASALA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "MINPK8812P", "date_of_joining": "2023-6-29"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed JAYA DEEPTHI KARASALA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): JAYA DEEPTHI KARASALA');
        }
    }

    // Row 227: MOUNIKA KONGARI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%MOUNIKA%,last_name.ilike.%KONGARI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CQAPK6119A", "date_of_joining": "2024-2-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed MOUNIKA KONGARI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): MOUNIKA KONGARI');
        }
    }

    // Row 229: PRAVEEN ADDANKI (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%PRAVEEN%,last_name.ilike.%ADDANKI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CNKPA0778G", "date_of_joining": "2024-10-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PRAVEEN ADDANKI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PRAVEEN ADDANKI');
        }
    }

    // Row 230: ANJU SHAIK (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%ANJU%,last_name.ilike.%SHAIK%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "HQIPS0369K", "date_of_joining": "2021-8-31"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ANJU SHAIK:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ANJU SHAIK');
        }
    }

    // Row 231: PREMCHAND PAGIDI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%PREMCHAND%,last_name.ilike.%PAGIDI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CJQPP1352F", "date_of_joining": "2021-9-2"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PREMCHAND PAGIDI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PREMCHAND PAGIDI');
        }
    }

    // Row 233: . MEKALA ANGULI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%.%,last_name.ilike.%MEKALA ANGULI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "GHYPM9382N", "date_of_joining": "2023-9-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed . MEKALA ANGULI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): . MEKALA ANGULI');
        }
    }

    // Row 234: LAKSHMI TELLURI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%LAKSHMI%,last_name.ilike.%TELLURI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AGTPT6450E", "date_of_joining": "2023-9-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed LAKSHMI TELLURI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): LAKSHMI TELLURI');
        }
    }

    // Row 235: . YAMPATI SIREESHA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%.%,last_name.ilike.%YAMPATI SIREESHA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BMIPY5261J", "date_of_joining": "2023-9-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed . YAMPATI SIREESHA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): . YAMPATI SIREESHA');
        }
    }

    // Row 236: YAMPATI SUPRAJA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%YAMPATI%,last_name.ilike.%SUPRAJA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AHXPY3098A", "date_of_joining": "2023-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed YAMPATI SUPRAJA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): YAMPATI SUPRAJA');
        }
    }

    // Row 239: NAGARJUNA EARLA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%NAGARJUNA%,last_name.ilike.%EARLA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ABTPE8752D", "date_of_joining": "2022-6-2"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed NAGARJUNA EARLA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): NAGARJUNA EARLA');
        }
    }

    // Row 240: BHUMANA SUJATHA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BHUMANA%,last_name.ilike.%SUJATHA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AMNPB4541J", "date_of_joining": "2000-3-19"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BHUMANA SUJATHA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BHUMANA SUJATHA');
        }
    }

    // Row 241: . MANNEPULA ARUNKUMAR (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%.%,last_name.ilike.%MANNEPULA ARUNKUMAR%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AMAPM7701Q", "date_of_joining": "2021-5-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed . MANNEPULA ARUNKUMAR:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): . MANNEPULA ARUNKUMAR');
        }
    }

    // Row 247: PENUMOLU RATNAKUMARI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%PENUMOLU%,last_name.ilike.%RATNAKUMARI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "NPYPK5159E", "date_of_joining": "2023-9-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PENUMOLU RATNAKUMARI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PENUMOLU RATNAKUMARI');
        }
    }

    // Row 248: SHAIK KARISHMABANU (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SHAIK%,last_name.ilike.%KARISHMABANU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "GATPB5713A", "date_of_joining": "2022-6-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SHAIK KARISHMABANU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SHAIK KARISHMABANU');
        }
    }

    // Row 249: NUTALAPATI BHUVANESWARI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%NUTALAPATI%,last_name.ilike.%BHUVANESWARI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BGAPN8730P", "date_of_joining": "2024-3-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed NUTALAPATI BHUVANESWARI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): NUTALAPATI BHUVANESWARI');
        }
    }

    // Row 250: UYYALA SRAVANTHI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%UYYALA%,last_name.ilike.%SRAVANTHI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "APVPU4169C", "date_of_joining": "2024-10-21"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed UYYALA SRAVANTHI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): UYYALA SRAVANTHI');
        }
    }

    // Row 251: MADANU ANUSHA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%MADANU%,last_name.ilike.%ANUSHA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FTZPA4904A", "date_of_joining": "2024-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed MADANU ANUSHA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): MADANU ANUSHA');
        }
    }

    // Row 252: SALE RAVITEJA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SALE%,last_name.ilike.%RAVITEJA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EMAPR7929K", "date_of_joining": "2024-9-10"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SALE RAVITEJA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SALE RAVITEJA');
        }
    }

    // Row 253: BHAVANAM SRAVANI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BHAVANAM%,last_name.ilike.%SRAVANI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "PJKPS6990H", "date_of_joining": "2024-11-18"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BHAVANAM SRAVANI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BHAVANAM SRAVANI');
        }
    }

    // Row 254: PANAMALA PRASANNA KUMARI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%PANAMALA%,last_name.ilike.%PRASANNA KUMARI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "LWNPK2458N", "date_of_joining": "2023-6-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PANAMALA PRASANNA KUMARI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PANAMALA PRASANNA KUMARI');
        }
    }

    // Row 257: SUNKARA PRASHANTH (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SUNKARA%,last_name.ilike.%PRASHANTH%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "LUSPS6332L", "date_of_joining": "2024-11-18"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SUNKARA PRASHANTH:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SUNKARA PRASHANTH');
        }
    }

    // Row 258: SHAIK SHARIQA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%SHAIK%,last_name.ilike.%SHARIQA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "LMJPS2423R", "date_of_joining": "2024-6-20"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SHAIK SHARIQA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SHAIK SHARIQA');
        }
    }

    // Row 259: CHIKKAM VISHNUPRIYA (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%CHIKKAM%,last_name.ilike.%VISHNUPRIYA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CSMPV3326C", "date_of_joining": "2024-12-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed CHIKKAM VISHNUPRIYA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): CHIKKAM VISHNUPRIYA');
        }
    }

    // Row 260: KADHIRE PRAVEENA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%KADHIRE%,last_name.ilike.%PRAVEENA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BZHPP6770M", "date_of_joining": "2024-5-15"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KADHIRE PRAVEENA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KADHIRE PRAVEENA');
        }
    }

    // Row 261: KOTA NAGAPURNIMABABY (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%KOTA%,last_name.ilike.%NAGAPURNIMABABY%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "LYFPK8619F", "date_of_joining": "2024-6-10"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KOTA NAGAPURNIMABABY:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KOTA NAGAPURNIMABABY');
        }
    }

    // Row 262: SYED APSARA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SYED%,last_name.ilike.%APSARA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "OAFPS8113D", "date_of_joining": "2024-11-19"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SYED APSARA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SYED APSARA');
        }
    }

    // Row 263: BALUDRA CHANDINIRAM (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%BALUDRA%,last_name.ilike.%CHANDINIRAM%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CJLPB5181R", "date_of_joining": "2025-6-16"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BALUDRA CHANDINIRAM:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BALUDRA CHANDINIRAM');
        }
    }

    // Row 264: VUNNAVA CHAITANYAKUMARI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%VUNNAVA%,last_name.ilike.%CHAITANYAKUMARI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BADPV4745F", "date_of_joining": "2020-8-20"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VUNNAVA CHAITANYAKUMARI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VUNNAVA CHAITANYAKUMARI');
        }
    }

    // Row 276: M APPA RAO (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%M%,last_name.ilike.%APPA RAO%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AXTPM5753C", "date_of_joining": "2024-6-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed M APPA RAO:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): M APPA RAO');
        }
    }

    // Row 277: V SANDHYA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%V%,last_name.ilike.%SANDHYA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CDOPV6407P", "date_of_joining": "2025-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed V SANDHYA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): V SANDHYA');
        }
    }

    // Row 278: SRINIVASA RAO KALAM (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SRINIVASA RAO%,last_name.ilike.%KALAM%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CNIPK5146F", "date_of_joining": "2025-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRINIVASA RAO KALAM:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRINIVASA RAO KALAM');
        }
    }

    // Row 279: SRINIVASARAO V (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%SRINIVASARAO%,last_name.ilike.%V%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AUUPV4836I", "date_of_joining": "2025-7-31"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRINIVASARAO V:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRINIVASARAO V');
        }
    }

    // Row 281: K NAGAVALLI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%K%,last_name.ilike.%NAGAVALLI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CSVPV0592C", "date_of_joining": "2024-6-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed K NAGAVALLI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): K NAGAVALLI');
        }
    }

    // Row 282: B RAJU (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%B%,last_name.ilike.%RAJU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "GZUPR7245S", "date_of_joining": "2025-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed B RAJU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): B RAJU');
        }
    }

    // Row 284: RATNA KUMARI P (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%RATNA KUMARI%,last_name.ilike.%P%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "NPYPY5159E", "date_of_joining": "2021-9-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RATNA KUMARI P:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RATNA KUMARI P');
        }
    }

    // Row 285: KAVYA SRI K (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%KAVYA SRI%,last_name.ilike.%K%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "FLIPS5042C", "date_of_joining": "2022-2-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KAVYA SRI K:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KAVYA SRI K');
        }
    }

    // Row 286: SOWJANYA S (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SOWJANYA%,last_name.ilike.%S%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EEZPS2467P", "date_of_joining": "2021-2-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SOWJANYA S:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SOWJANYA S');
        }
    }

    // Row 287: BALAJI KOMMURI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%BALAJI%,last_name.ilike.%KOMMURI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BZSPB9501P", "date_of_joining": "2020-5-18"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed BALAJI KOMMURI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): BALAJI KOMMURI');
        }
    }

    // Row 288: SAI SULOCHANA K (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SAI SULOCHANA%,last_name.ilike.%K%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CJDPK3471R", "date_of_joining": "2023-10-2"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SAI SULOCHANA K:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SAI SULOCHANA K');
        }
    }

    // Row 290: LAVANYA K (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%LAVANYA%,last_name.ilike.%K%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EBQPK7677J", "date_of_joining": "2021-5-12"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed LAVANYA K:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): LAVANYA K');
        }
    }

    // Row 291: RAMA KOTESWARA RAO K (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%RAMA KOTESWARA RAO%,last_name.ilike.%K%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EBJPK8148B", "date_of_joining": "2020-9-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RAMA KOTESWARA RAO K:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RAMA KOTESWARA RAO K');
        }
    }

    // Row 292: SRIKANTH G (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SRIKANTH%,last_name.ilike.%G%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "NFNPS3820D", "date_of_joining": "2022-6-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRIKANTH G:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRIKANTH G');
        }
    }

    // Row 293: VAMSI KRISHNA N (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VAMSI KRISHNA%,last_name.ilike.%N%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "APSPN0854N", "date_of_joining": "2022-2-21"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VAMSI KRISHNA N:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VAMSI KRISHNA N');
        }
    }

    // Row 294: ROSHNA SHAIK (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%ROSHNA%,last_name.ilike.%SHAIK%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "KTBPS1307E", "date_of_joining": "2022-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed ROSHNA SHAIK:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): ROSHNA SHAIK');
        }
    }

    // Row 295: PRADEEP KUMAR N (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%PRADEEP KUMAR%,last_name.ilike.%N%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ASHPN9227F", "date_of_joining": "2022-6-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed PRADEEP KUMAR N:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): PRADEEP KUMAR N');
        }
    }

    // Row 296: VEERENDRA U (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%VEERENDRA%,last_name.ilike.%U%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ALEPV8806A", "date_of_joining": "2021-7-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed VEERENDRA U:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): VEERENDRA U');
        }
    }

    // Row 297: SURESH BABU V (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SURESH BABU%,last_name.ilike.%V%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AOTPV8598R", "date_of_joining": "2021-6-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SURESH BABU V:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SURESH BABU V');
        }
    }

    // Row 300: S V GANESH KUMAR KONDETI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%S V GANESH KUMAR%,last_name.ilike.%KONDETI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DELPK5325C", "date_of_joining": "2022-12-20"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed S V GANESH KUMAR KONDETI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): S V GANESH KUMAR KONDETI');
        }
    }

    // Row 301: SANDHYA V (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SANDHYA%,last_name.ilike.%V%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CEUPV6510E", "date_of_joining": "2024-5-4"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SANDHYA V:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SANDHYA V');
        }
    }

    // Row 302: CH KUMAR (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%CH%,last_name.ilike.%KUMAR%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CHDPC8248Q", "date_of_joining": "2025-9-25"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed CH KUMAR:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): CH KUMAR');
        }
    }

    // Row 303: CHAKRAVARTHI T (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%CHAKRAVARTHI%,last_name.ilike.%T%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ATAPC2949D", "date_of_joining": "2017-6-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed CHAKRAVARTHI T:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): CHAKRAVARTHI T');
        }
    }

    // Row 304: SK. MUNNISA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%SK.%,last_name.ilike.%MUNNISA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "GBKPS8605A", "date_of_joining": "2022-4-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SK. MUNNISA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SK. MUNNISA');
        }
    }

    // Row 305: N. CHAND (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%N.%,last_name.ilike.%CHAND%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AMGPN3421Q", "date_of_joining": "2009-9-29"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed N. CHAND:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): N. CHAND');
        }
    }

    // Row 307: D. NARESH (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%D.%,last_name.ilike.%NARESH%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BZDPN6628Q", "date_of_joining": "2025-1-21"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed D. NARESH:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): D. NARESH');
        }
    }

    // Row 308: GAYATRI KONIJETI (IT)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'IT')
            .or(`first_name.ilike.%GAYATRI%,last_name.ilike.%KONIJETI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ENNBK9054E", "date_of_joining": "2022-6-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed GAYATRI KONIJETI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): GAYATRI KONIJETI');
        }
    }

    // Row 309: SWETHA VALETI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SWETHA%,last_name.ilike.%VALETI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ATGPV3641M", "date_of_joining": "2020-11-9"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SWETHA VALETI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SWETHA VALETI');
        }
    }

    // Row 310: M SUBRAMANYAM (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%M%,last_name.ilike.%SUBRAMANYAM%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DDRPM3350J", "date_of_joining": "2024-6-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed M SUBRAMANYAM:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): M SUBRAMANYAM');
        }
    }

    // Row 313: SK. RASOOL (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SK.%,last_name.ilike.%RASOOL%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AOIPS0514E", "date_of_joining": "2024-10-14"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SK. RASOOL:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SK. RASOOL');
        }
    }

    // Row 314: K SAMBAIAH (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%K%,last_name.ilike.%SAMBAIAH%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EAFPK2291O", "date_of_joining": "2024-7-31"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed K SAMBAIAH:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): K SAMBAIAH');
        }
    }

    // Row 315: V BABU (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%V%,last_name.ilike.%BABU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AYHPB6786F", "date_of_joining": "2023-7-10"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed V BABU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): V BABU');
        }
    }

    // Row 316: G LAKSHMI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%G%,last_name.ilike.%LAKSHMI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EAMPG0472F", "date_of_joining": "2023-7-10"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed G LAKSHMI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): G LAKSHMI');
        }
    }

    // Row 317: A SAKEETH (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%A%,last_name.ilike.%SAKEETH%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BHOPA8812R", "date_of_joining": "2020-11-16"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed A SAKEETH:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): A SAKEETH');
        }
    }

    // Row 318: A ADIYYA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%A%,last_name.ilike.%ADIYYA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AOVPA6437O", "date_of_joining": "2024-6-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed A ADIYYA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): A ADIYYA');
        }
    }

    // Row 319: SK. PHARJANA (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SK.%,last_name.ilike.%PHARJANA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "IDZPS7287B", "date_of_joining": "2021-8-25"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SK. PHARJANA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SK. PHARJANA');
        }
    }

    // Row 320: GODA MAHESH (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%GODA%,last_name.ilike.%MAHESH%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "ADSPG4422D", "date_of_joining": "2024-12-26"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed GODA MAHESH:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): GODA MAHESH');
        }
    }

    // Row 322: MORABOENA RAMESH BABU (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%MORABOENA%,last_name.ilike.%RAMESH BABU%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EGEPM2488F", "date_of_joining": "2025-8-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed MORABOENA RAMESH BABU:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): MORABOENA RAMESH BABU');
        }
    }

    // Row 323: LANKA SOWJANYA (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%LANKA%,last_name.ilike.%SOWJANYA%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "BDNPL4819F", "date_of_joining": "2025-9-15"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed LANKA SOWJANYA:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): LANKA SOWJANYA');
        }
    }

    // Row 325: SRIHARI KOMATINENI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%SRIHARI%,last_name.ilike.%KOMATINENI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AHHPK9247R", "date_of_joining": "2012-1-6"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRIHARI KOMATINENI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRIHARI KOMATINENI');
        }
    }

    // Row 326: UPENDRA KOTAPATI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%UPENDRA%,last_name.ilike.%KOTAPATI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CJCPK0371F", "date_of_joining": "2021-6-3"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed UPENDRA KOTAPATI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): UPENDRA KOTAPATI');
        }
    }

    // Row 328: RANGANADH SRIPERUMBUDURI (ECE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'ECE')
            .or(`first_name.ilike.%RANGANADH%,last_name.ilike.%SRIPERUMBUDURI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "DAKPS1029A", "date_of_joining": "2022-4-5"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed RANGANADH SRIPERUMBUDURI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): RANGANADH SRIPERUMBUDURI');
        }
    }

    // Row 329: MUNTAJ BEGUM SHAIK (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%MUNTAJ BEGUM%,last_name.ilike.%SHAIK%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EFPPS9216L", "date_of_joining": "2022-6-1"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed MUNTAJ BEGUM SHAIK:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): MUNTAJ BEGUM SHAIK');
        }
    }

    // Row 330: SRILAKSHMI KONAKANCHI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SRILAKSHMI%,last_name.ilike.%KONAKANCHI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "CEQPK5883R", "date_of_joining": "2023-7-22"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRILAKSHMI KONAKANCHI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRILAKSHMI KONAKANCHI');
        }
    }

    // Row 332: SRINIVASA RAO KOLAGANI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%SRINIVASA RAO%,last_name.ilike.%KOLAGANI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "EAMPK1222C", "date_of_joining": "2024-7-12"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed SRINIVASA RAO KOLAGANI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): SRINIVASA RAO KOLAGANI');
        }
    }

    // Row 333: KRISHNA VAKALAPUDI (CSE)
    {
        const { data: matches } = await supabase
            .from('faculty_profiles')
            .select('id')
            .eq('dept_code', 'CSE')
            .or(`first_name.ilike.%KRISHNA%,last_name.ilike.%VAKALAPUDI%`);
            
        if (matches && matches.length > 0) {
             // Filter for stronger match if multiple? For now just update all partial name matches in dept as it is likely correct.
             // Actually, let's just take the first one to avoid over-updating if ambiguous.
             for (const match of matches) {
                 const { error } = await supabase.from('faculty_profiles').update({"pan_number": "AHJPV7914J", "date_of_joining": "2018-12-17"}).eq('id', match.id);
                 if (!error) successCount++;
                 else { console.error('Failed KRISHNA VAKALAPUDI:', error.message); failCount++; }
             }
        } else {
            console.log('Skipped (Not Found): KRISHNA VAKALAPUDI');
        }
    }

    console.log(`Update Complete. Success: ${successCount}, Failed: ${failCount}`);
}

applyFixes();