import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    this.onPressed,
    required this.textColor,
    required this.backgrounColor,
  });
  final String text;
  final double width;
  final double height;
  final void Function()? onPressed;
  final Color textColor;
  final Color backgrounColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgrounColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10).r,
          ),
        ),
        child: Text(
          text,
          style: ResponsiveStylingSystem.textStyleSubtitles2(context).copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
