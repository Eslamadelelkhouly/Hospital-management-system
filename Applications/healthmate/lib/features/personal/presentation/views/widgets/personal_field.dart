import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class PersonalField extends StatelessWidget {
  const PersonalField({
    super.key,
    required this.label,
    required this.input,
    required this.imgUrl,
  });
  final String label, input, imgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorSystem.kPrimaryColorLight,
        borderRadius: BorderRadius.circular(10).r,
      ),
      child: ListTile(
        title: Row(
          children: [
            ImageIcon(
              AssetImage(imgUrl),
            ),
            8.horizontalSpace,
            Text(
              label,
              style: StylingSystem.textStyle14Medium.copyWith(
                color: ColorSystem.kGrayColor2,
              ),
            ),
          ],
        ),
        trailing: Text(
          input,
          style: StylingSystem.textStyle14Medium.copyWith(
            color: ColorSystem.kGrayColor2,
          ),
        ),
      ),
    );
  }
}
