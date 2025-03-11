import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CardInformation extends StatelessWidget {
  const CardInformation(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.subtext});
  final String text, imageUrl, subtext;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.r,
      height: 110.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
        color: ColorSystem.kPrimaryColorHighLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          8.verticalSpace,
          Text(
            text,
            style: StylingSystem.textStyle16Medium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          6.verticalSpace,
          Image.asset(imageUrl),
          6.verticalSpace,
          Text(
            subtext,
            style: StylingSystem.textStyle16Medium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
