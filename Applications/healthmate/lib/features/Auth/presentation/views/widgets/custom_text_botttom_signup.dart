import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

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
          style: ResponsiveStylingSystem.textStyleSign12(context).copyWith(
            color: ColorSystem.kGrayColor2,
          ),
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Terms of Use',
                style:
                    ResponsiveStylingSystem.textStyleSign12(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' and ',
                style:
                    ResponsiveStylingSystem.textStyleSign12(context).copyWith(
                  color: ColorSystem.kGrayColor2,
                ),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: ResponsiveStylingSystem.textStyleSign12(context).copyWith(
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
