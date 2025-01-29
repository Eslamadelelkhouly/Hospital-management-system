import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/router_screens.dart';
import 'package:healthmate/core/class/style.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_button.dart';

class SplashSliderWidget2btn extends StatefulWidget {
  const SplashSliderWidget2btn({
    super.key,
    required this.imageURL,
    required this.title,
    required this.description,
  });
  final String imageURL;
  final String title;
  final String description;

  @override
  State<SplashSliderWidget2btn> createState() => _SplashSliderWidget2btnState();
}

class _SplashSliderWidget2btnState extends State<SplashSliderWidget2btn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 236,
          height: 236,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imageURL),
            ),
          ),
        ),
        Text(
          widget.title,
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
              widget.description,
              style: StylingSystem.textStyleSubtitles2,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 5,
              backgroundColor: ColorSystem.kGrayColor,
            ),
            SizedBox(width: 3),
            CircleAvatar(
              radius: 7,
              backgroundColor: ColorSystem.kPrimaryColor,
            ),
            SizedBox(width: 3),
            CircleAvatar(
              radius: 5,
              backgroundColor: ColorSystem.kGrayColor,
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              textColor: ColorSystem.kPrimaryColor,
              backgrounColor: ColorSystem.kbtnColorblue,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              width: 100,
              height: 42,
              text: 'Back',
            ),
            CustomButton(
              textColor: Colors.white,
              backgrounColor: ColorSystem.kPrimaryColor,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              width: 100,
              height: 42,
              text: 'Next',
            ),
          ],
        ),
      ],
    );
  }
}
