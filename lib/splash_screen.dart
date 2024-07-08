import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ellostars/onboarding_screen.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: 'assets/logo/logo.gif',
        splashIconSize: 2000.0,
        centered: true,
        duration: 6800,
        nextScreen: onboarding_screen(),
      backgroundColor: Colors.orange.shade50,
    );

  }
}
