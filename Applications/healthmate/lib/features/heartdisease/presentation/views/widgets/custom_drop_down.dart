import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.hinttext,
      required this.dropdowntext1,
      required this.dropdowntext2,
      required this.text,
      required this.texterror});
  final String hinttext, dropdowntext1, dropdowntext2, text, texterror;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hinttext,
            style: StylingSystem.textStyle15bold,
          ),
          2.verticalSpace,
          DropDownTextField(
            validator: (value) {
              if (value!.isEmpty || value == null) {
                return 'Please enter your $text';
              }
            },
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
              DropDownValueModel(name: dropdowntext1, value: 1.0),
              DropDownValueModel(name: dropdowntext2, value: 0.0),
            ],
          ),
          Text(
            texterror,
            style: StylingSystem.textStyleSign12.copyWith(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
