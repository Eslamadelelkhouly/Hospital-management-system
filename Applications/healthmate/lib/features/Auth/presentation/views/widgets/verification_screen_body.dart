import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_form_verfication.dart';

class VerificationScreenBody extends StatelessWidget {
  const VerificationScreenBody({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.verticalSpace,
                  CustomAppBar(
                    title: ' ',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(logo2),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Health Mate',
                    style: StylingSystem.textStyle24bold,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'New Password',
                        style: StylingSystem.textStyle18semibold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '''Please write your new password''',
                        style: StylingSystem.textStyle14Medium.copyWith(
                          color: const Color(0xff4F4E59),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const CustomFormVerfication(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
