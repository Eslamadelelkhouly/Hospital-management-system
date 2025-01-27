import 'package:flutter/material.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/style.dart';

class SplashSliderWidget extends StatefulWidget {
  const SplashSliderWidget({super.key});
  final String imageURL = 'lib/core/assets/images/gif1.gif';
  @override
  State<SplashSliderWidget> createState() => _SplashSliderWidgetState();
}

class _SplashSliderWidgetState extends State<SplashSliderWidget> {
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
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Choose your Doctor',
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
              'Lorem ipsum dolor sit amet consectetur. Morbi risus non non aliquam amet aliquet.',
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
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorSystem.kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Get Started',
              style: StylingSystem.textStyleSubtitles2.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
