import 'package:flutter/material.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/style.dart';

class CustomTextBottomSignUp extends StatelessWidget {
  const CustomTextBottomSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'By continuing , you agree to',
          style: StylingSystem.textStyleSign12.copyWith(
            color: ColorSystem.kGrayColor2,
          ),
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Terms of Use',
                style: StylingSystem.textStyleSign12.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: StylingSystem.textStyleSign12.copyWith(
                  color: ColorSystem.kGrayColor2,
                ),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: StylingSystem.textStyleSign12.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
