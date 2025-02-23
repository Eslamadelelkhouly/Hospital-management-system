import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CardCategories extends StatelessWidget {
  const CardCategories({
    super.key,
    required this.text,
    required this.image,
  });
  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98,
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorSystem.kPrimaryColorLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(image),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: StylingSystem.textStyle14Medium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
