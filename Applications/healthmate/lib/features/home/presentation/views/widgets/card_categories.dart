import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CardCategories extends StatelessWidget {
  const CardCategories({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
  });
  final String text, image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 98.r,
        height: 76.r,
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
            Image.asset(
              image,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
