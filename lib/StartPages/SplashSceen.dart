import 'package:agriboost/Pages/HomePage.dart';
import 'package:agriboost/StartPages/FrontPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Already logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Homepage()),
        );
      } else {
        // Not logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const FrontPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 241, 241, 1),
      body: Center(
        child: Image.asset(
          "assets/splash.jpg",
          height: 200,
          width: 300,
        ),
      ),
    );
  }
}
