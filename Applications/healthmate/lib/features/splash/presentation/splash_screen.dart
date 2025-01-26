import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/features/splash/presentation/widgets/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.kPrimaryColor,
      body: const SplashScreenBody(),
    );
  }
}
