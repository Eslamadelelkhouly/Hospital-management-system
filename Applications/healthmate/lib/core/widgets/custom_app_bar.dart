import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.stateicon,
  });
  final String title;
  final bool stateicon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: stateicon,
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24.r,
            ),
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              title,
              style: StylingSystem.textStyle24bold,
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
