import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class ContainerPersonalInfo extends StatelessWidget {
  const ContainerPersonalInfo(
      {super.key, required this.text1, required this.text2});
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.defaultSize.width * 0.25,
      height: 80.r,
      decoration: BoxDecoration(
        color: ColorSystem.kPrimaryColorLight,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              style: StylingSystem.textStyle16Medium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            6.verticalSpace,
            Text(
              text2,
              style: StylingSystem.textStyle16Medium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
