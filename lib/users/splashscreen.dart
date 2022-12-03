import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/users/authentication/login_screen.dart';
import 'package:flutter_ecommerce/users/fragments/dashboard_of_fragments.dart';

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
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(118, 17, 28, 1),
      body: Center(child: Image.asset('images/splashscreen.png')),
    );
  }
}
