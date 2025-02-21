import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';

class TitleOnBoarding extends StatelessWidget {
  const TitleOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(Routing.Ksignin);
        },
        child: Text(
          'Skip',
          style: StylingSystem.textStylehintext,
        ),
      ),
    );
  }
}
