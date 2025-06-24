import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomLisTielConfirmCardLabTest extends StatelessWidget {
  const CustomLisTielConfirmCardLabTest(
      {super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$name',
        style: StylingSystem.textStyle16Medium.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
