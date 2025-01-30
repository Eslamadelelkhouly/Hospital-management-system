import 'package:flutter/material.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/mangement_string.dart';
import 'package:healthmate/core/class/style.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_form_sign_in.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_logo_sign_in.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          CustomLogoSignIn(),
          SizedBox(
            height: 10,
          ),
          Text(
            MangementString.title,
            style: StylingSystem.textStyleTitle.copyWith(
              color: ColorSystem.kColorBlack,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          CustomFormSignIn(),
        ],
      ),
    );
  }
}
