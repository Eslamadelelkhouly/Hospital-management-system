import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';
class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Animate(
            effects: [
              const FadeEffect(),
              const ScaleEffect(),
              const SlideEffect(
                begin: Offset(0, -3),
                end: Offset(0, 0),
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.only(left: 9).r,
              child: Image.asset(logo),
            ),
          ),
          10.verticalSpace,
          Animate(
            effects: [
              const FadeEffect(),
              const ScaleEffect(),
              const SlideEffect(
                begin: Offset(0, 10),
                end: Offset(0, 0),
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
            ],
            child: Text(
              'Health Mate',
              style: StylingSystem.textStyleTitle,
            ),
          ),
        ],
      ),
    );
  }
}
