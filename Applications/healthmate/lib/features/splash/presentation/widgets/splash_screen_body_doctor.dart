import 'package:flutter/material.dart';

class SplashScreenBodyDoctor extends StatelessWidget {
  const SplashScreenBodyDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/core/assets/images/gif1.gif'),
        ],
      ),
    );
  }
}
