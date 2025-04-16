import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/verification_screen_body.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorSystem.kbtnColorWhite,
      body: VerificationScreenBody(),
    );
  }
}
