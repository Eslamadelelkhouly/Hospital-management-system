import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_form_change_password.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_logo_sign_in.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

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
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomAppBar(
                    title: '',
                    stateicon: true,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const CustomLogoSignIn(),
                  Text(
                    'Health Mate',
                    style: ResponsiveStylingSystem.textStyle24bold(context),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Enter verification',
                        style: ResponsiveStylingSystem.textStyle18semibold(context),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '''We've sent a code to hello@aiignui.com''',
                        style: ResponsiveStylingSystem.textStyle14Medium(context)
                            .copyWith(color: const Color(0xff4F4E59)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const CustomFormChangePassword(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
