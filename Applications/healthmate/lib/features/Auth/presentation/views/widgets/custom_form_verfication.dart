import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/row_otp.dart';

class CustomFormVerfication extends StatelessWidget {
  const CustomFormVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          RowOtp(),
          SizedBox(
            height: 36,
          ),
          CustomButton(
            text: 'Verify',
            onPressed: () {},
            width: 362,
            height: 44,
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '''Didn't receive code? ''',
                style: StylingSystem.textStyle14Medium,
              ),
              Text(
                '''Resend Now''',
                style: StylingSystem.textStyle14Medium.copyWith(
                  color: ColorSystem.kPrimaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
