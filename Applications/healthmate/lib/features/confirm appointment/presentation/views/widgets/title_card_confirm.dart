import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class TitleCardConfirm extends StatelessWidget {
  const TitleCardConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Today’s Appointments',
          style: StylingSystem.textStyle18semibold,
        ),
        Text(
          '09 Apr, 2025',
          style: StylingSystem.textStyleSign12
              .copyWith(color: ColorSystem.kPrimaryColor),
        ),
      ],
    );
  }
}
