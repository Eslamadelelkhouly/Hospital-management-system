import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomDropDownFourValue extends StatelessWidget {
  const CustomDropDownFourValue(
      {super.key,
      required this.hinttext,
      required this.dropdowntext1,
      required this.dropdowntext2,
      required this.dropdowntext3,
      required this.dropdowntext4,
      required this.value1,
      required this.value2,
      required this.value3,
      required this.value4,
      required this.text,
      required this.texterror,
      required this.controller});
  final String hinttext,
      dropdowntext1,
      dropdowntext2,
      dropdowntext3,
      dropdowntext4,
      text,
      texterror;
  final int value1;
  final int value2;
  final int value3;
  final int value4;
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
            style:ResponsiveStylingSystem.textStyle15bold(context),
          ),
          2.verticalSpace,
          DropDownTextField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty || value == null) {
                return 'Please enter your $text';
              }
            },
            textFieldDecoration: InputDecoration(
              filled: true,
              fillColor: ColorSystem.kPrimaryColorHighLight,
              hintText: hinttext,
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
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
              DropDownValueModel(name: dropdowntext4, value: value4),
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
