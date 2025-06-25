import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_password_text_field.dart';

class CustomFormChangePassword extends StatefulWidget {
  const CustomFormChangePassword(
      {super.key, required this.OTP, required this.emial});
  final String OTP;
  final String emial;

  @override
  State<CustomFormChangePassword> createState() =>
      _CustomFormChangePasswordState();
}

class _CustomFormChangePasswordState extends State<CustomFormChangePassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  String password = '', confirmpasword = '';
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          CustomPasswordTextField(
            onSaved: (value) {
              password = value!;
            },
            texterror: '',
            controller: passwordController,
            text: 'Password',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomPasswordTextField(
            onSaved: (value) {
              confirmpasword = value!;
            },
            texterror: '',
            controller: confirmpasswordController,
            text: 'Confirm Password',
          ),
          const SizedBox(
            height: 24,
          ),
          CustomButton(
            onPressed: () {
              if (key.currentState!.validate()) {
                log('Success');
              } else {
                log('Failed');
              }
            },
            text: 'Create new password',
            width: 362,
            height: 44,
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
