import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.controller,
    this.onTap,
    this.onChanged,
  });

  final TextEditingController controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: TextField(
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          hintText: 'Search Doctor',
          hintStyle: StylingSystem.textStyle14Medium.copyWith(
            color: ColorSystem.kGrayColor2,
          ),
          prefixIcon: GestureDetector(
            onTap: onTap,
            child: ImageIcon(
              AssetImage(searchicon),
              color: ColorSystem.kPrimaryColor,
            ),
          ),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close, color: ColorSystem.kGrayColor2),
                  onPressed: () {
                    controller.clear();
                    if (onChanged != null) {
                      onChanged!('');
                    }
                  },
                )
              : null,
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
              color: ColorSystem.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
