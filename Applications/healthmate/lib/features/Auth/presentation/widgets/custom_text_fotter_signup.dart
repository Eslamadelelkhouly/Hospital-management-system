import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/router_screens.dart';
import 'package:healthmate/core/class/style.dart';

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
          style: StylingSystem.textStyleSign12,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routing.Ksignin);
          },
          child: Text(
            'Log In',
            style: StylingSystem.textStyleSign12.copyWith(
              color: ColorSystem.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
