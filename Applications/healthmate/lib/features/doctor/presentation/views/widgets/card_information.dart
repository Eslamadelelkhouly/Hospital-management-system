import 'package:flutter/material.dart';
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
      width: 110,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorSystem.kPrimaryColorHighLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: StylingSystem.textStyle16Medium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Image.asset(imageUrl),
          SizedBox(
            height: 6,
          ),
          Text(
            subtext,
            style: StylingSystem.textStyle16Medium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
