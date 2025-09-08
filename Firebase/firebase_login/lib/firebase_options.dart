import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return android;
    }
    throw UnsupportedError('This platform is not supported');
  }

  // 🔹 Web ka config
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyCXv6sKH7Ls_bkBmI5H95Wg0or-S3oRJOU",
    authDomain: "fir-intro-d70e7.firebaseapp.com",
    projectId: "fir-intro-d70e7",
    storageBucket: "fir-intro-d70e7.firebasestorage.app",
    messagingSenderId: "766909176940",
    appId: "1:766909176940:web:b9439605f7de61b82a8c49",
    measurementId: "G-C76PS18NDM"
  );

  // 🔹 Android ka config (ye aapke `google-services.json` se milega)
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyD2npvPnfj2QA2eJftYOxWZ1Ke7TPKgpxk",
    appId: "1:766909176940:android:dad8e69830c129702a8c49",
    messagingSenderId: "766909176940",
    projectId: "fir-intro-d70e7",
    storageBucket: "fir-intro-d70e7.firebasestorage.app",
  );
}
