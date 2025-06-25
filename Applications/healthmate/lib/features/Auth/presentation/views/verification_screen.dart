import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/verification_screen_body.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = GoRouterState.of(context).extra as String;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorSystem.kbtnColorWhite,
      body: VerificationScreenBody(
        email: email,
      ),
    );
  }
}
