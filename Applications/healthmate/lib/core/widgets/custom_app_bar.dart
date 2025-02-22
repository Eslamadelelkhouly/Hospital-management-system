import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
        ),
        SizedBox(
          width: 45,
        ),
        Text(
          title,
          style: StylingSystem.textStyle24bold,
        ),
      ],
    );
  }
}
