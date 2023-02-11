import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBf6ZSG-a4_POE4e-5uMWnoWwM1zX8bXUU",
            authDomain: "mindchat-app-116f6.firebaseapp.com",
            projectId: "mindchat-app-116f6",
            storageBucket: "mindchat-app-116f6.appspot.com",
            messagingSenderId: "221930476231",
            appId: "1:221930476231:web:b8d9f86b7d461edf81e4e2",
            measurementId: "G-N7Z1KN1854"));
  } else {
    await Firebase.initializeApp();
  }
}
