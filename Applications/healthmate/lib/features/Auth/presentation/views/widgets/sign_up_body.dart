import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/mangement_string.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_form_sign_up.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_logo_sign_in.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                header,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                fotter,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    const CustomLogoSignIn(),
                    Text(
                      MangementString.title,
                      style: StylingSystem.textStyleTitle.copyWith(
                        color: ColorSystem.kColorBlack,
                      ),
                    ),
                    CustomFormSignUp(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
