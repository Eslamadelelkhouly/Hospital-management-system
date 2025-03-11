import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class PersonalField extends StatelessWidget {
  const PersonalField({
    super.key,
  });

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
              AssetImage(smsicon),
            ),
            8.horizontalSpace,
            Text(
              'Email',
              style: StylingSystem.textStyle14Medium.copyWith(
                color: ColorSystem.kGrayColor2,
              ),
            ),
          ],
        ),
        trailing: Text(
          'Mohamed@gmail.com',
          style: StylingSystem.textStyle14Medium.copyWith(
            color: ColorSystem.kGrayColor2,
          ),
        ),
      ),
    );
  }
}
