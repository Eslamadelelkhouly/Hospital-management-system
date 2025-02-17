import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';

class SplashSliderWidget extends StatelessWidget {
  const SplashSliderWidget({
    super.key,
    required this.imageURL,
    required this.title,
    required this.description,
    this.onPressed,
  });
  final String imageURL;
  final String title;
  final String description;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: 236,
          height: 236,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageURL),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          title,
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
              description,
              style: StylingSystem.textStyleSubtitles2,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 7,
              backgroundColor: ColorSystem.kPrimaryColor,
            ),
            SizedBox(width: 3),
            CircleAvatar(
              radius: 5,
              backgroundColor: ColorSystem.kGrayColor,
            ),
            SizedBox(width: 3),
            CircleAvatar(
              radius: 5,
              backgroundColor: ColorSystem.kGrayColor,
            ),
          ],
        ),
        SizedBox(
          height: height * 0.1,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
            onPressed: onPressed,
            width: 100,
            height: 42,
            text: 'Next',
          ),
        ),
      ],
    );
  }
}
