import 'package:flutter/material.dart';
import 'package:healthmate/features/splash/presentation/widgets/splash_screen_sechdule_body.dart';

class SplashScreenSechdule extends StatelessWidget {
  const SplashScreenSechdule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashScreenSechduleBody(),
    );
  }
}
