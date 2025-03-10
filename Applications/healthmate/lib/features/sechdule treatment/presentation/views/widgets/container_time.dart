import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class ContainerTime extends StatelessWidget {
  const ContainerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 31,
      decoration: BoxDecoration(
        color: ColorSystem.kPrimaryColorLight,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          '08:00',
          style: StylingSystem.textStyle14Medium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
