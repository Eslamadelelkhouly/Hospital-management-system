import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndictor extends StatelessWidget {
  const CustomIndictor({
    super.key,
    required PageController pageController,
    required this.controller,
  }) : _pageController = pageController;

  final PageController _pageController;
  final OnBoardingData controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: controller.onBoardingData.length,
      axisDirection: Axis.horizontal,
      effect: SwapEffect(
        activeDotColor: ColorSystem.kPrimaryColor,
        dotColor: ColorSystem.kGrayColor,
        dotHeight: 15.r,
        dotWidth: 15.r,
      ),
    );
  }
}