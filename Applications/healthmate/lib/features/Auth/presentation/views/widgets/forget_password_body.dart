import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_form_forget_password.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                header,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                fotter,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  30.verticalSpace,
                  CustomAppBar(
                    title: 'Forget Password',
                  ),
                  15.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 15).r,
                    child: Image.asset(logo2),
                  ),
                  4.verticalSpace,
                  Text(
                    'Health Mate',
                    style: StylingSystem.textStyle24bold,
                  ),
                  32.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Password',
                        style: StylingSystem.textStyle18semibold,
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text:
                            'Enter the email associated with your account and we’ll send an email with instructions to reset your password',
                        style: StylingSystem.textStyle16Medium.copyWith(
                          color: Color(0xff4F4E59),
                        ),
                      ),
                    ]),
                  ),
                  40.verticalSpace,
                  CustomFormForgetPassword(),
                  120.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
