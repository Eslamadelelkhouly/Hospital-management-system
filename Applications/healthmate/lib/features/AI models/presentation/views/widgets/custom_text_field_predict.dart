import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomTextFieldPredict extends StatelessWidget {
  const CustomTextFieldPredict(
      {super.key, required this.text, required this.hinttext});

  final String text;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: StylingSystem.textStyle15bold,
        ),
        2.verticalSpace,
        Container(
          width: 362.r,
          height: 48.r,
          child: TextField(
            cursorColor: ColorSystem.kPrimaryColor,
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle:
                  StylingSystem.textStyle14Medium.copyWith(color: Colors.grey),
              filled: true,
              fillColor: ColorSystem.kbtnColorblue,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorSystem.kbtnColorblue),
                borderRadius: BorderRadius.circular(10).r,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide: BorderSide(color: ColorSystem.kbtnColorblue),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorSystem.kbtnColorblue,
                ),
                borderRadius: BorderRadius.circular(10).r,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
