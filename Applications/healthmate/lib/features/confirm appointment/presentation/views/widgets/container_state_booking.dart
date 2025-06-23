import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class Containerstatebooking extends StatelessWidget {
  const Containerstatebooking({
    super.key,
    required this.textstatecontainer,
  });
  final String textstatecontainer;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorSystem.kGreenAccept,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Text(
          '$textstatecontainer',
          style: StylingSystem.textStyle11.copyWith(
            color: ColorSystem.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
