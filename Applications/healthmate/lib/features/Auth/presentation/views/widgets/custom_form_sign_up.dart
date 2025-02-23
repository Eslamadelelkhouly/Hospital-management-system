import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_social_media_icons.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field_celender.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_fotter_signup.dart';
import 'package:healthmate/core/widgets/custom_button.dart';

class CustomFormSignUp extends StatelessWidget {
  const CustomFormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
              hinttext: 'Mohamed Mahmoud',
              text: 'Full Name',
              iconField: usericon,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hinttext: 'Mohamed @example.com',
              text: 'Email',
              iconField: smsicon,
            ),
            SizedBox(
              height: 10,
            ),
            CustomPasswordTextField(
              text: 'Password',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFieldCelender(),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).push(Routing.khomescreen);
              },
              text: 'Sign Up',
              width: width * 0.90,
              height: height * 0.06,
              textColor: ColorSystem.kbtnColorWhite,
              backgrounColor: ColorSystem.kPrimaryColor,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextFotterSignUP(),
            SizedBox(
              height: height * 0.02,
            ),
            CustomOrDivider(),
            SizedBox(
              height: height * 0.03,
            ),
            CustomSocialMediaIcons(),
          ],
        ),
      ),
    );
  }
}
