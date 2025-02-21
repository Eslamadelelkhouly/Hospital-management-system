import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class CustomOtp extends StatelessWidget {
  const CustomOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

    return OtpPinField(
      key: _otpPinFieldController,
      onSubmit: (text) {},
      onChange: (text){},
    );
  }
}
