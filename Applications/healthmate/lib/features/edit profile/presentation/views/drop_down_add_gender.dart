import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class DropDownAddGender extends StatelessWidget {
  const DropDownAddGender({
    super.key,
    required this.hinttext,
    required this.dropdowntext1,
    required this.dropdowntext2,
    required this.text,
    required this.texterror,
    required this.controller,
  });
  final String hinttext, dropdowntext1, dropdowntext2, text, texterror;

  final SingleValueDropDownController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hinttext,
            style: ResponsiveStylingSystem.textStyleSign12(context),
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
              prefixIcon: const ImageIcon(
                AssetImage('assets/images/gender.png'),
              ),
              filled: true,
              fillColor: ColorSystem.kPrimaryColorHighLight,
              hintText: hinttext,
              hintStyle: TextStyle(color: Colors.grey),
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
              DropDownValueModel(name: dropdowntext1, value: 'male'),
              DropDownValueModel(name: dropdowntext2, value: 'female'),
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
