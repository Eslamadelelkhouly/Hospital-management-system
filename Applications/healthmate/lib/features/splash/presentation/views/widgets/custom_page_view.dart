import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: height * 0.6.r,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: controller.onBoardingData.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: width * 0.6.r,
                  height: height * 0.2.r,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        controller.onBoardingData[index].images,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.9.r,
                  height: height * 0.05.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.onBoardingData[index].title,
                        style: ResponsiveStylingSystem.textStyle24bold(context),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                SizedBox(
                  width: width * 0.7.r,
                  height: height * 0.3.r,
                  child: Padding(
                    padding: const EdgeInsets.all(20).r,
                    child: Text(
                      controller.onBoardingData[index].description,
                      style: ResponsiveStylingSystem.textStyleSubtitles2(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
