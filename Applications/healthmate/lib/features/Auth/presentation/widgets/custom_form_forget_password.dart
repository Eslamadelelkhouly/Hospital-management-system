import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_button.dart';

class CustomFormForgetPassword extends StatelessWidget {
  const CustomFormForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(text: 'Email', iconField: smsicon),
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  text: 'Previous',
                  width: 173,
                  height: 48,
                  textColor: ColorSystem.kPrimaryColor,
                  backgrounColor: ColorSystem.kbtnColorblue,
                ),
                CustomButton(
                  onPressed: () {},
                  text: 'Send',
                  width: 173,
                  height: 48,
                  textColor: ColorSystem.kbtnColorblue,
                  backgrounColor: ColorSystem.kPrimaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
