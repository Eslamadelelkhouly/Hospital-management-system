import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomListTielConfirmCard extends StatelessWidget {
  const CustomListTielConfirmCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.asset(
          doctorphoto1,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        'Dr. Ali Hassan',
        style: StylingSystem.textStyle16Medium.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        'Dermato-Endocrinology',
        style: StylingSystem.textStyleSign12,
      ),
    );
  }
}
