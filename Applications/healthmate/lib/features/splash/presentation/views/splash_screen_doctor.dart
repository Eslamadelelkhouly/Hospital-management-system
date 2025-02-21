import 'package:flutter/material.dart';
import 'package:healthmate/features/splash/presentation/views/widgets/splash_screen_body_doctor.dart';

class SplashScreenDoctor extends StatelessWidget {
  const SplashScreenDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SplashScreenBodyDoctor(),
    );
  }
}
