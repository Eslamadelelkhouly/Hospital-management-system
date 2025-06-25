import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/row_otp.dart';

class CustomFormVerfication extends StatefulWidget {
  const CustomFormVerfication({super.key, required this.email});
  final String email;

  @override
  State<CustomFormVerfication> createState() => _CustomFormVerficationState();
}

class _CustomFormVerficationState extends State<CustomFormVerfication> {
  final GlobalKey<RowOtpState> otpKey = GlobalKey<RowOtpState>();
  String? finalOtp;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RowOtp(
            key: otpKey,
            onOtpSaved: (otp) {
              setState(() {
                finalOtp = otp;
              });
              debugPrint('Final OTP: $otp');
            },
          ),
          const SizedBox(height: 36),
          CustomButton(
            text: 'Verify',
            onPressed: () {
              log('Final OTP: $finalOtp');
              otpKey.currentState?.saveForm();

              if (finalOtp != null && finalOtp!.length == 6) {
                GoRouter.of(context).push(
                  Routing.kchangepassword,
                  extra: {
                    "email": widget.email,
                    "otp": finalOtp
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please enter a valid 6-digit code')),
                );
              }
            },
            width: 362,
            height: 44,
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '''Didn't receive code? ''',
                style: ResponsiveStylingSystem.textStyle14Medium(context),
              ),
              Text(
                '''Resend Now''',
                style:
                    ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
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
