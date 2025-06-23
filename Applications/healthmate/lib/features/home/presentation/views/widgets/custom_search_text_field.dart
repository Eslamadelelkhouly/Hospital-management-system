import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key, required this.controller,
    this.onTap
  });
  final TextEditingController controller;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 48,
      child: TextField(
        onTap: onTap,
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search Doctor',
          hintStyle: StylingSystem.textStyle14Medium.copyWith(
            color: ColorSystem.kGrayColor2,
          ),
          prefixIcon: ImageIcon(
            AssetImage(
              searchicon,
            ),
            color: ColorSystem.kPrimaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorSystem.kGrayColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorSystem.kGrayColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: ColorSystem.kGrayColor,
              )),
        ),
      ),
    );
  }
}
