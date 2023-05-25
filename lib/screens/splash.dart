import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moageet/screens/authenticate/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF99CDA9),
            Color(0xFF2B8EA6),
            Color(0xFF14586E),
          ],
        )),
        child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/img/logo.png",
              width: 128,
              height: 128,
            )),
      ),
    );
  }
}
