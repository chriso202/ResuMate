import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB-aSSddxsUxC2eUtlZlr6elhna4iI7t7w",
            authDomain: "resumelogin-5e97d.firebaseapp.com",
            projectId: "resumelogin-5e97d",
            storageBucket: "resumelogin-5e97d.appspot.com",
            messagingSenderId: "353351133069",
            appId: "1:353351133069:web:85d6ca45dcbc5c9ed13fc4"));
  } else {
    await Firebase.initializeApp();
  }
}
