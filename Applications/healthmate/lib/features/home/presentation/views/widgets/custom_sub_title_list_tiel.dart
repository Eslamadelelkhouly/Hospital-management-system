import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomSubtitleListTiel extends StatelessWidget {
  const CustomSubtitleListTiel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Good Morning ',
          style: StylingSystem.textStyle14Medium,
        ),
        SizedBox(
          width: 6,
        ),
        Image.asset(sun)
      ],
    );
  }
}
