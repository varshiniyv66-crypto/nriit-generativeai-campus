import 'server-only';
import * as admin from 'firebase-admin';

interface FirebaseAdminConfig {
    projectId: string;
    clientEmail: string;
    privateKey: string;
}

function formatPrivateKey(key: string) {
    return key.replace(/\\n/g, '\n');
}

export function createFirebaseAdminApp(config: FirebaseAdminConfig) {
    if (admin.apps.length > 0) {
        return admin.app();
    }

    return admin.initializeApp({
        credential: admin.credential.cert({
            projectId: config.projectId,
            clientEmail: config.clientEmail,
            privateKey: formatPrivateKey(config.privateKey),
        }),
    });
}

export function getFirebaseAdmin() {
    if (admin.apps.length > 0) {
        return admin.app();
    }

    const projectId = process.env.FIREBASE_ADMIN_PROJECT_ID;
    const clientEmail = process.env.FIREBASE_ADMIN_CLIENT_EMAIL;
    const privateKey = process.env.FIREBASE_ADMIN_PRIVATE_KEY;

    if (!projectId || !clientEmail || !privateKey) {
        // In development, we might not have these set up yet.
        // Return mock or throw based on strictness.
        console.warn('Firebase Admin credentials not found in environment');
        return null;
    }

    return createFirebaseAdminApp({
        projectId,
        clientEmail,
        privateKey,
    });
}

export const adminAuth = getFirebaseAdmin()?.auth();
export const adminStorage = getFirebaseAdmin()?.storage();
export const adminMessaging = getFirebaseAdmin()?.messaging();
