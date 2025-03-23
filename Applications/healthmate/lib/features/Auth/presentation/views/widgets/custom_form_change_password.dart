import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_password_text_field.dart';

class CustomFormChangePassword extends StatelessWidget {
  const CustomFormChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomPasswordTextField(
            texterror: '',
            controller: TextEditingController(),
            text: 'Password',
          ),
          SizedBox(
            height: 16,
          ),
          CustomPasswordTextField(
            texterror: '',
            controller: TextEditingController(),
            text: 'Confirm Password',
          ),
          SizedBox(
            height: 24,
          ),
          CustomButton(
            onPressed: () {},
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
