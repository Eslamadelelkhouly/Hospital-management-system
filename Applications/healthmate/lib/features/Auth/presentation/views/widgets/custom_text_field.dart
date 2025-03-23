import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      required this.iconField,
      required this.hinttext,
      required this.onSaved,
      required this.controller,
      required this.texterror});
  final String text;
  final String iconField;
  final String hinttext;
  final String? Function(String?)? onSaved;
  final TextEditingController controller;
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
          height: 70.r,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty || value == null) {
                return 'Please enter your $text';
              }
            },
            cursorColor: ColorSystem.kPrimaryColor,
            onSaved: onSaved,
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle:
                  StylingSystem.textStyle14Medium.copyWith(color: Colors.grey),
              prefixIcon: ImageIcon(AssetImage(iconField)),
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
