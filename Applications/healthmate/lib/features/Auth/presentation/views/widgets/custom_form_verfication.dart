import 'package:flutter/material.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_otp.dart';

class CustomFormVerfication extends StatelessWidget {
  const CustomFormVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomOtp(),
        ],
      ),
    );
  }
}
