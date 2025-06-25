import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomTextFotterSignUP extends StatelessWidget {
  const CustomTextFotterSignUP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: ResponsiveStylingSystem.textStyleSign12(context),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routing.Ksignin);
          },
          child: Text(
            'Log In',
            style: ResponsiveStylingSystem.textStyleSign12(context).copyWith(
              color: ColorSystem.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
