import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_social_media_icons.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:healthmate/core/widgets/custom_button.dart';

class CustomFormSignIn extends StatelessWidget {
  const CustomFormSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomTextField(
              hinttext: 'Mohamed @example.com',
              text: 'Email',
              iconField: smsicon,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomPasswordTextField(
              text: 'Password',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(Routing.kforgetpassword);
                    },
                    child: Text(
                      'Forget password?',
                      style: StylingSystem.textStyle16Medium.copyWith(
                        color: Color(0xff83818E),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(Routing.khomescreen);
                  },
                  text: 'Sign In',
                  width: 362,
                  height: 44,
                  textColor: ColorSystem.kbtnColorWhite,
                  backgrounColor: ColorSystem.kPrimaryColor,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don’t have an account?  ',
                  style: StylingSystem.textStyle14Medium,
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(Routing.Ksignup);
                  },
                  child: Text(
                    'Create Account',
                    style: StylingSystem.textStyle14Medium.copyWith(
                      color: ColorSystem.kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            CustomOrDivider(),
            SizedBox(
              height: 24,
            ),
            CustomSocialMediaIcons()
          ],
        ),
      ),
    );
  }
}
