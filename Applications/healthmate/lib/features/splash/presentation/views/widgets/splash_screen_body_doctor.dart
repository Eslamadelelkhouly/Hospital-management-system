import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/features/splash/presentation/views/widgets/custom_indictor.dart';
import 'package:healthmate/features/splash/presentation/views/widgets/custom_page_view.dart';
import 'package:healthmate/features/splash/presentation/views/widgets/row_of_button.dart';
import 'package:healthmate/features/splash/presentation/views/widgets/title_on_boarding.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: Column(
        children: [
          50.verticalSpace,
          TitleOnBoarding(),
          CustomPageView(
            height: height,
            pageController: _pageController,
            controller: controller,
          ),
          CustomIndictor(
            pageController: _pageController,
            controller: controller,
          ),
          50.verticalSpace,
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
