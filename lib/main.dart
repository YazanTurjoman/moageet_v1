import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // paste the code copied
      // from Firebase SDK below.
      options: const FirebaseOptions(
          apiKey: " AIzaSyCg1WtkicrQgytf2V7N_FrG3e2gAliu2qI ",
          authDomain: "",
          projectId: "moageet-40056",
          storageBucket: "",
          messagingSenderId: "",
          appId: "1:312093639159:android:fd374988557e16ebe8aef2",
          measurementId: ""));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moageet App',
      home: SplashScreen(),
    );
  }
}
