import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/router_screens.dart';
import 'package:healthmate/core/class/style.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_button.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_indictor.dart';

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
    return PageView.builder(
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
              CustomIndictor(
                  pageController: _pageController, controller: controller),
              SizedBox(
                height: height * 0.08,
              ),
              CustomButton(
                onPressed: () {
                  if (_pageController.page?.toInt() !=
                      controller.onBoardingData.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    GoRouter.of(context).pushReplacement(Routing.Ksignin);
                  }
                },
                text: 'Next',
                width: 362,
                height: 48,
                textColor: ColorSystem.kbtnColorWhite,
                backgrounColor: ColorSystem.kPrimaryColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
