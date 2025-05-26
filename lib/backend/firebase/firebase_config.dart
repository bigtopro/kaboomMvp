import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCeP4dX1JOvtU6ClmFhzqCFoTZ42wFBTSE",
            authDomain: "kaboomapp-32688.firebaseapp.com",
            projectId: "kaboomapp-32688",
            storageBucket: "kaboomapp-32688.firebasestorage.app",
            messagingSenderId: "443950273820",
            appId: "1:443950273820:web:71fa190d5a83d9b96d56d9",
            measurementId: "G-1S0ZVWVQN0"));
  } else {
    await Firebase.initializeApp();
  }
}
