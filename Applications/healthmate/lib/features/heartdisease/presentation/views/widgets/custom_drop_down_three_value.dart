import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomDropDownThreeValue extends StatelessWidget {
  const CustomDropDownThreeValue({
    super.key,
    required this.hinttext,
    required this.dropdowntext1,
    required this.dropdowntext2,
    required this.dropdowntext3,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.texterror,
    required this.controller,
  });
  final String hinttext, dropdowntext1, dropdowntext2, dropdowntext3, texterror;
  final int value1;
  final int value2;
  final int value3;
  final SingleValueDropDownController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hinttext,
            style: ResponsiveStylingSystem.textStyle15bold(context),
          ),
          2.verticalSpace,
          DropDownTextField(
            controller: controller,
            textFieldDecoration: InputDecoration(
              filled: true,
              fillColor: ColorSystem.kPrimaryColorHighLight,
              hintText: hinttext,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none, // Removes the black border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
            dropDownList: [
              DropDownValueModel(name: dropdowntext1, value: value1),
              DropDownValueModel(name: dropdowntext2, value: value2),
              DropDownValueModel(name: dropdowntext3, value: value3),
            ],
          ),
          Text(
            texterror,
            style: ResponsiveStylingSystem.textStyleSign12(context).copyWith(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
