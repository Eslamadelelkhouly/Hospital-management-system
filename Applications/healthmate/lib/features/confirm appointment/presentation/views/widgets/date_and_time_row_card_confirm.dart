import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class DateAndTimeRowCardConfirm extends StatelessWidget {
  const DateAndTimeRowCardConfirm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          celendericon,
          color: ColorSystem.kPrimaryColor,
        ),
        const SizedBox(width: 8),
        Text(
          'Mon, 12 Apr 2025',
          style: StylingSystem.textStyle14Medium.copyWith(
            color: ColorSystem.kPrimaryColor,
          ),
        ),
        const Spacer(),
        Container(
          width: 1,
          height: 20,
          color: Colors.white,
        ),
        const Spacer(),
        Image.asset(
          clock,
          color: ColorSystem.kPrimaryColor,
        ),
        const SizedBox(width: 8),
        Text(
          '10:00 AM',
          style: StylingSystem.textStyle14Medium.copyWith(
            color: ColorSystem.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
