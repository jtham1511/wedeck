import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDCvxw0fcr2z-FSjYMVAoVBjPR0U8lG2ME",
            authDomain: "wedeck-a6a9a.firebaseapp.com",
            projectId: "wedeck-a6a9a",
            storageBucket: "wedeck-a6a9a.appspot.com",
            messagingSenderId: "770824008817",
            appId: "1:770824008817:web:a4bfcbb949212548ded7d0",
            measurementId: "G-Q0L7TQHDQS"));
  } else {
    await Firebase.initializeApp();
  }
}
