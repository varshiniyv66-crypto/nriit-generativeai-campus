// ===========================================
// Firebase Client Configuration
// Used for: Phone Auth (OTP), FCM, Storage, Realtime
// ===========================================

import { initializeApp, getApps, FirebaseApp } from 'firebase/app';
import { getAuth, Auth, RecaptchaVerifier, signInWithPhoneNumber, ConfirmationResult } from 'firebase/auth';
import { getStorage, ref, uploadBytes, getDownloadURL, deleteObject, StorageReference } from 'firebase/storage';
import { getMessaging, getToken, onMessage, Messaging } from 'firebase/messaging';
import { getDatabase, ref as dbRef, onValue, set, push, Database } from 'firebase/database';

// Firebase configuration
const firebaseConfig = {
    apiKey: process.env.NEXT_PUBLIC_FIREBASE_API_KEY,
    authDomain: process.env.NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN,
    projectId: process.env.NEXT_PUBLIC_FIREBASE_PROJECT_ID,
    storageBucket: process.env.NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET,
    messagingSenderId: process.env.NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID,
    appId: process.env.NEXT_PUBLIC_FIREBASE_APP_ID,
    measurementId: process.env.NEXT_PUBLIC_FIREBASE_MEASUREMENT_ID,
    databaseURL: `https://${process.env.NEXT_PUBLIC_FIREBASE_PROJECT_ID}-default-rtdb.firebaseio.com`,
};

// Initialize Firebase (singleton pattern)
let app: FirebaseApp;
let auth: Auth;
let storage: ReturnType<typeof getStorage>;
let messaging: Messaging | null = null;
let database: Database;

const initializeFirebase = () => {
    if (!getApps().length) {
        app = initializeApp(firebaseConfig);
    } else {
        app = getApps()[0];
    }

    auth = getAuth(app);
    storage = getStorage(app);
    database = getDatabase(app);

    // Messaging is only available in browser
    if (typeof window !== 'undefined' && 'Notification' in window) {
        try {
            messaging = getMessaging(app);
        } catch (error) {
            console.warn('Firebase Messaging not supported:', error);
        }
    }

    return { app, auth, storage, messaging, database };
};

// Initialize on import
const firebase = initializeFirebase();

export { firebase, auth, storage, messaging, database };

// ===========================================
// Phone Authentication (OTP)
// ===========================================

let recaptchaVerifier: RecaptchaVerifier | null = null;

export const setupRecaptcha = (containerId: string): RecaptchaVerifier => {
    if (!recaptchaVerifier) {
        recaptchaVerifier = new RecaptchaVerifier(auth, containerId, {
            size: 'invisible',
            callback: () => {
                // reCAPTCHA solved
            },
            'expired-callback': () => {
                // Reset reCAPTCHA
                recaptchaVerifier = null;
            },
        });
    }
    return recaptchaVerifier;
};

export const sendOTP = async (phoneNumber: string): Promise<ConfirmationResult> => {
    const formattedNumber = phoneNumber.startsWith('+') ? phoneNumber : `+91${phoneNumber}`;

    if (!recaptchaVerifier) {
        throw new Error('reCAPTCHA not initialized');
    }

    return signInWithPhoneNumber(auth, formattedNumber, recaptchaVerifier);
};

export const verifyOTP = async (confirmationResult: ConfirmationResult, otp: string) => {
    return confirmationResult.confirm(otp);
};

export const getCurrentUser = () => auth.currentUser;

export const signOut = () => auth.signOut();

// ===========================================
// Firebase Storage (File Uploads)
// ===========================================

export interface UploadResult {
    path: string;
    url: string;
    fileName: string;
    fileSize: number;
    contentType: string;
}

export const uploadFile = async (
    file: File,
    path: string,
    onProgress?: (progress: number) => void
): Promise<UploadResult> => {
    const storageRef = ref(storage, path);

    // Upload file
    const snapshot = await uploadBytes(storageRef, file, {
        contentType: file.type,
        customMetadata: {
            originalName: file.name,
            uploadedAt: new Date().toISOString(),
        },
    });

    // Get download URL
    const url = await getDownloadURL(snapshot.ref);

    return {
        path: snapshot.ref.fullPath,
        url,
        fileName: file.name,
        fileSize: file.size,
        contentType: file.type,
    };
};

export const deleteFile = async (path: string): Promise<void> => {
    const storageRef = ref(storage, path);
    await deleteObject(storageRef);
};

export const getFileUrl = async (path: string): Promise<string> => {
    const storageRef = ref(storage, path);
    return getDownloadURL(storageRef);
};

// Storage path generators based on file purpose
export const getStoragePath = {
    facultyPhoto: (employeeId: string) => `faculty/photos/${employeeId}`,
    studentPhoto: (rollNumber: string) => `students/photos/${rollNumber}`,
    circular: (deptCode: string, fileName: string) => `departments/${deptCode}/circulars/${fileName}`,
    timetable: (deptCode: string, semester: number) => `departments/${deptCode}/timetables/${semester}`,
    hallTicket: (rollNumber: string, examType: string) => `hall_tickets/${rollNumber}/${examType}`,
    certificate: (rollNumber: string, certType: string) => `certificates/${rollNumber}/${certType}`,
    receipt: (rollNumber: string, receiptNo: string) => `receipts/${rollNumber}/${receiptNo}.pdf`,
    material: (deptCode: string, courseCode: string, fileName: string) =>
        `materials/${deptCode}/${courseCode}/${fileName}`,
    accreditation: (deptCode: string, criterion: string, fileName: string) =>
        `accreditation/${deptCode}/${criterion}/${fileName}`,
    gallery: (deptCode: string, eventId: string, fileName: string) =>
        `galleries/${deptCode}/${eventId}/${fileName}`,
    banner: (deptCode: string, slug: string) => `banners/${deptCode}/${slug}`,
    lab: (deptCode: string, labCode: string, fileName: string) =>
        `labs/${deptCode}/${labCode}/${fileName}`,
};

// ===========================================
// Firebase Cloud Messaging (Push Notifications)
// ===========================================

export const requestNotificationPermission = async (): Promise<string | null> => {
    if (!messaging) return null;

    try {
        const permission = await Notification.requestPermission();
        if (permission === 'granted') {
            const token = await getToken(messaging, {
                vapidKey: process.env.NEXT_PUBLIC_FIREBASE_VAPID_KEY,
            });
            return token;
        }
        return null;
    } catch (error) {
        console.error('Error getting notification token:', error);
        return null;
    }
};

export const onMessageListener = () => {
    if (!messaging) return Promise.resolve(null);

    return new Promise((resolve) => {
        onMessage(messaging!, (payload) => {
            resolve(payload);
        });
    });
};

// ===========================================
// Firebase Realtime Database (Live Updates)
// ===========================================

export const realtimeDb = {
    // Listen to attendance updates
    onAttendanceUpdate: (classId: string, callback: (data: unknown) => void) => {
        const attendanceRef = dbRef(database, `attendance/${classId}`);
        return onValue(attendanceRef, (snapshot) => {
            callback(snapshot.val());
        });
    },

    // Update attendance in realtime
    markAttendance: async (classId: string, studentId: string, status: string) => {
        const attendanceRef = dbRef(database, `attendance/${classId}/${studentId}`);
        await set(attendanceRef, {
            status,
            timestamp: Date.now(),
        });
    },

    // Listen to notification count
    onNotificationCount: (userId: string, callback: (count: number) => void) => {
        const countRef = dbRef(database, `notifications/${userId}/unread_count`);
        return onValue(countRef, (snapshot) => {
            callback(snapshot.val() || 0);
        });
    },

    // Send realtime alert
    sendAlert: async (userId: string, alert: { title: string; message: string; type: string }) => {
        const alertsRef = dbRef(database, `alerts/${userId}`);
        await push(alertsRef, {
            ...alert,
            timestamp: Date.now(),
            read: false,
        });
    },

    // Listen to live exam updates
    onExamUpdate: (examId: string, callback: (data: unknown) => void) => {
        const examRef = dbRef(database, `exams/${examId}`);
        return onValue(examRef, (snapshot) => {
            callback(snapshot.val());
        });
    },
};

export default firebase;
