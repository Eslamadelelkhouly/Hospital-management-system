import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Column(
      children: [
        Container(
          width: 236.r,
          height: 236.r,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageURL),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: StylingSystem.textStyle24bold,
        ),
        (ScreenUtil().screenHeight * 0.01).verticalSpace,
         Container(
          width: 300.r,
          height: 79.r,
          child: Text(
            textAlign: TextAlign.start,
            description,
            style: StylingSystem.textStyleSubtitles2,
            maxLines: 3,
          ),
        ),
        (ScreenUtil().screenHeight * 0.02).verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 7.r,
              backgroundColor: ColorSystem.kPrimaryColor,
            ),
            3.verticalSpace,
            CircleAvatar(
              radius: 5.r,
              backgroundColor: ColorSystem.kGrayColor,
            ),
            3.verticalSpace,
            CircleAvatar(
              radius: 5.r,
              backgroundColor: ColorSystem.kGrayColor,
            ),
          ],
        ),
        (ScreenUtil().screenHeight * 0.1).verticalSpace,
        Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
            onPressed: onPressed,
            width: 100.r,
            height: 42.r,
            text: 'Next',
          ),
        ),
      ],
    );
  }
}
