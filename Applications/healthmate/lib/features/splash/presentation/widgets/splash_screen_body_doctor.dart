import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/class/style.dart';

class SplashScreenBodyDoctor extends StatelessWidget {
  const SplashScreenBodyDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.07,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Text(
                'Skip',
                style: StylingSystem.textStylehintext,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
