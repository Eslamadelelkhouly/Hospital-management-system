import 'package:flutter/material.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/style.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_button.dart';

class SplashSliderWidget2btn extends StatelessWidget {
  const SplashSliderWidget2btn(
      {super.key,
      required this.imageURL,
      required this.title,
      required this.description,
      this.onPressed});
  final String imageURL;
  final String title;
  final String description;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
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
          height: 10,
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
          height: 20,
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
          height: 100,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
            onPressed: onPressed,
            width: 173,
            height: 42,
            text: 'Next',
          ),
        ),
      ],
    );
  }
}
