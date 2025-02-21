import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';

class CustomLogoSignIn extends StatelessWidget {
  const CustomLogoSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Image.asset(logo2),
    );
  }
}