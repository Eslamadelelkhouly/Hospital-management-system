import 'package:flutter/material.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_otp.dart';

class RowOtp extends StatelessWidget {
  const RowOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomOtp(),
        CustomOtp(),
        CustomOtp(),
        CustomOtp(),
        CustomOtp(),
        CustomOtp(),
      ],
    );
  }
}
