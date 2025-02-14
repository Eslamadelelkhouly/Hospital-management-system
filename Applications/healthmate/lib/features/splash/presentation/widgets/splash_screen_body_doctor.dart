import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_indictor.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_page_view.dart';
import 'package:healthmate/features/splash/presentation/widgets/row_of_button.dart';
import 'package:healthmate/features/splash/presentation/widgets/title_on_boarding.dart';

class SplashScreenBodyDoctor extends StatefulWidget {
  const SplashScreenBodyDoctor({super.key});

  @override
  _SplashScreenBodyDoctorState createState() => _SplashScreenBodyDoctorState();
}

class _SplashScreenBodyDoctorState extends State<SplashScreenBodyDoctor> {
  final controller = OnBoardingData();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.07,
          ),
          TitleOnBoarding(),
          SizedBox(
            height: height * 0.1,
          ),
          CustomPageView(
            pageController: _pageController,
            controller: controller,
            height: height,
          ),
          CustomIndictor(
            pageController: _pageController,
            controller: controller,
          ),
          SizedBox(
            height: 50,
          ),
          RowOfButton(
            currentPage: _currentPage,
            pageController: _pageController,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
