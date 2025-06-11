import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomDropDownDoctor extends StatelessWidget {
  const CustomDropDownDoctor(
      {super.key,
      required this.hinttext,
      required this.texterror,
      required this.controller,
      required this.dropDownList});
  final String hinttext, texterror;
  final SingleValueDropDownController controller;
  final List<DropDownValueModel> dropDownList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hinttext,
              style: StylingSystem.textStyle15bold,
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
              dropDownList: dropDownList,
            ),
            Text(
              texterror,
              style: StylingSystem.textStyleSign12.copyWith(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
