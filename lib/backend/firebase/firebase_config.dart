import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDkE3Lpj3DLeUF2I4Lz9oyEcTn82q5TZVc",
            authDomain: "foodease-b45e6.firebaseapp.com",
            projectId: "foodease-b45e6",
            storageBucket: "foodease-b45e6.firebasestorage.app",
            messagingSenderId: "859465162363",
            appId: "1:859465162363:web:d9b3b564be05b3ec594cde",
            measurementId: "G-GFGTME2E99"));
  } else {
    await Firebase.initializeApp();
  }
}
