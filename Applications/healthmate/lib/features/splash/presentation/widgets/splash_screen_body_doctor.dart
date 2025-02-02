import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/class/router_screens.dart';
import 'package:healthmate/core/class/style.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_page_view.dart';

class SplashScreenBodyDoctor extends StatefulWidget {
  const SplashScreenBodyDoctor({super.key});

  @override
  _SplashScreenBodyDoctorState createState() => _SplashScreenBodyDoctorState();
}

class _SplashScreenBodyDoctorState extends State<SplashScreenBodyDoctor> {
  final controller = OnBoardingData();
  final PageController _pageController = PageController();

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
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(Routing.Ksignin);
              },
              child: Text(
                'Skip',
                style: StylingSystem.textStylehintext,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Expanded(
            child: CustomPageView(
              pageController: _pageController,
              controller: controller,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}
