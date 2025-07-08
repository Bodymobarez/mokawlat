
import { getApp, getApps, initializeApp } from 'firebase/app';
import { getAuth } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';
import { getStorage } from 'firebase/storage';

const firebaseConfig = {
  apiKey: process.env.NEXT_PUBLIC_FIREBASE_API_KEY,
  authDomain: process.env.NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN,
  projectId: process.env.NEXT_PUBLIC_FIREBASE_PROJECT_ID,
  storageBucket: process.env.NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET,
  messagingSenderId: process.env.NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID,
  appId: process.env.NEXT_PUBLIC_FIREBASE_APP_ID,
  measurementId: process.env.NEXT_PUBLIC_FIREBASE_MEASUREMENT_ID,
};

// CRITICAL: Check for the existence of the API key.
// This is the most common cause of deployment failure.
if (!firebaseConfig.apiKey) {
  console.warn(
    'WARNING: NEXT_PUBLIC_FIREBASE_API_KEY is not defined. ' +
    'Using fallback configuration for build purposes. ' +
    'Please set proper environment variables for production deployment.'
  );
  // Use fallback config for build purposes
  firebaseConfig.apiKey = 'AIzaSyDummyKeyForBuildPurposes';
  firebaseConfig.authDomain = 'dummy-project.firebaseapp.com';
  firebaseConfig.projectId = 'dummy-project';
  firebaseConfig.storageBucket = 'dummy-project.appspot.com';
  firebaseConfig.messagingSenderId = '123456789';
  firebaseConfig.appId = '1:123456789:web:dummyappid';
  firebaseConfig.measurementId = 'G-DUMMYID';
}


// Initialize Firebase
const app = !getApps().length ? initializeApp(firebaseConfig) : getApp();
const auth = getAuth(app);
const firestore = getFirestore(app);
const storage = getStorage(app);

export { app, auth, firestore, storage };
