import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/router_screens.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_password_text_field.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:healthmate/features/splash/presentation/widgets/custom_button.dart';

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
              text: 'Email',
              iconField: smsicon,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomPasswordTextField(),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(Routing.Ksignup);
                  },
                  text: 'Sign Up',
                  width: 173,
                  height: 45,
                  textColor: ColorSystem.kPrimaryColor,
                  backgrounColor: ColorSystem.kbtnColorSign,
                ),
                CustomButton(
                  onPressed: () {},
                  text: 'Sign In',
                  width: 173,
                  height: 45,
                  textColor: ColorSystem.kbtnColorWhite,
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
