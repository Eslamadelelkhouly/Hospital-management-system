import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required PageController pageController,
    required this.controller,
    required this.height,
  }) : _pageController = pageController;

  final PageController _pageController;
  final OnBoardingData controller;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: controller.onBoardingData.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                Container(
                  width: 236,
                  height: 236,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        controller.onBoardingData[index].images,
                      ),
                    ),
                  ),
                ),
                Text(
                  controller.onBoardingData[index].title,
                  style: StylingSystem.textStyleheading5,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  width: 250,
                  height: 79,
                  child: Center(
                    child: Text(
                      controller.onBoardingData[index].description,
                      style: StylingSystem.textStyleSubtitles2,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
