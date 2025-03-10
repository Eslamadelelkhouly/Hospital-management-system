import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class RowSocialCardDoctorPersonal extends StatelessWidget {
  final String imageurl, text;

  const RowSocialCardDoctorPersonal({
    super.key,
    required this.imageurl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ImageIcon(
          AssetImage(
            imageurl,
          ),
          color: ColorSystem.kPrimaryColor,
        ),
        3.horizontalSpace,
        Text(
          text,
          style: StylingSystem.textStyle16Medium,
        ),
      ],
    );
  }
}
