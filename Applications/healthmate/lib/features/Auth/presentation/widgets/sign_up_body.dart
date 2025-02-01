import 'package:flutter/material.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/mangement_string.dart';
import 'package:healthmate/core/class/style.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_form_sign_up.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.04),
          Text(
            MangementString.title,
            style: StylingSystem.textStyleTitle.copyWith(
              color: ColorSystem.kColorBlack,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          CustomFormSignUp(),
        ],
      ),
    );
  }
}
