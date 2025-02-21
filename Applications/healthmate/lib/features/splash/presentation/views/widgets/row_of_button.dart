import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/shared_perfernce_singletone.dart';
import 'package:healthmate/core/widgets/custom_button.dart';

class RowOfButton extends StatelessWidget {
  const RowOfButton({
    super.key,
    required int currentPage,
    required PageController pageController,
    required this.controller,
  })  : _currentPage = currentPage,
        _pageController = pageController;

  final int _currentPage;
  final PageController _pageController;
  final OnBoardingData controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: _currentPage > 0,
          child: CustomButton(
            onPressed: () {
              if (_currentPage > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            text: 'Previous',
            width: 150,
            height: 48,
            textColor: ColorSystem.kbtnColorWhite,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
        ),
        CustomButton(
          onPressed: () {
            if (_currentPage < controller.onBoardingData.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              SharedPreferenceSingleton.setBool(Ksplashscreendoctor, true);
              GoRouter.of(context).pushReplacement(Routing.Ksignin);
            }
          },
          text: _currentPage == controller.onBoardingData.length - 1
              ? 'Finish'
              : 'Next',
          width: 150,
          height: 48,
          textColor: ColorSystem.kbtnColorWhite,
          backgrounColor: ColorSystem.kPrimaryColor,
        ),
      ],
    );
  }
}
