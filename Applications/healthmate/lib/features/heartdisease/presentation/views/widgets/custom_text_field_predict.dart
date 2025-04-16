import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomTextFieldPredict extends StatelessWidget {
  const CustomTextFieldPredict({
    super.key,
    required this.text,
    required this.hinttext,
    required this.controller,
    this.onSaved,
    required this.texterror,
  });

  final String text;
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? onSaved;
  final String texterror;

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
          child: TextFormField(
            controller: controller,
            onSaved: onSaved,
            validator: (value) {
              if (value!.isEmpty || value == null) {
                return 'Please enter your $text';
              }
            },
            cursorColor: ColorSystem.kPrimaryColor,
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle:
                  StylingSystem.textStyle14Medium.copyWith(color: Colors.grey),
              filled: true,
              fillColor: ColorSystem.kbtnColorblue,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorSystem.kbtnColorblue),
                borderRadius: BorderRadius.circular(10).r,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide: const BorderSide(color: ColorSystem.kbtnColorblue),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorSystem.kbtnColorblue,
                ),
                borderRadius: BorderRadius.circular(10).r,
              ),
            ),
          ),
        ),
        Text(
          texterror,
          style: StylingSystem.textStyleSign12.copyWith(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
