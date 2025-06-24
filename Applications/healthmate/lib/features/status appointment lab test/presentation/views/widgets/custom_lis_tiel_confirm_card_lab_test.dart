import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomLisTielConfirmCardLabTest extends StatelessWidget {
  const CustomLisTielConfirmCardLabTest(
      {super.key, required this.name, required this.special});
  final String name;
  final String special;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$name',
        style: StylingSystem.textStyle16Medium.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '$special',
        style: StylingSystem.textStyleSign12,
      ),
    );
  }
}
