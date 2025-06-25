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
        style: ResponsiveStylingSystem.textStyle16Medium(context).copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
