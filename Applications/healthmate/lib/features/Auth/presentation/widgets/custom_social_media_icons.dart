import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';

class CustomSocialMediaIcons extends StatelessWidget {
  const CustomSocialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(child: Image.asset(googleicon)),
        GestureDetector(child: Image.asset(facebookicon)),
      ],
    );
  }
}
