import 'package:flutter/material.dart';
import 'package:healthmate/core/helper_function/custom_app_bar.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/Auth/presentation/widgets/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorSystem.kbtnColorWhite,
      body: ForgetPasswordBody(),
    );
  }
}
