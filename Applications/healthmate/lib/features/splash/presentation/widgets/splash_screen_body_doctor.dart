import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/style.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          SizedBox(
            height: height * 0.1,
          ),
          Expanded(
            child: PageView.builder(
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
                        height: 10,
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
                        height: 20,
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: controller.onBoardingData.length,
                        axisDirection: Axis.horizontal,
                        effect: ScrollingDotsEffect(
                          activeDotColor: ColorSystem.kPrimaryColor,
                          dotColor: ColorSystem.kGrayColor,
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                          }
                        },
                        text: 'Continue',
                        width: width * 0.5,
                        height: height * 0.05,
                        textColor: Colors.white,
                        backgrounColor: ColorSystem.kPrimaryColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
