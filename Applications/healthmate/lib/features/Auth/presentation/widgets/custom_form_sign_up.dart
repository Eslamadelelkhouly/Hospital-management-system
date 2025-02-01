import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_password_text_field.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_text_field_celender.dart';

class CustomFormSignUp extends StatelessWidget {
  const CustomFormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
              text: 'Full Name',
              iconField: usericon,
            ),
            SizedBox(
              height: 10,
            ),
            CustomPasswordTextField(),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              text: 'Email',
              iconField: smsicon,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              text: 'Mobile Number',
              iconField: callicon,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFieldCelender(),
          ],
        ),
      ),
    );
  }
}
