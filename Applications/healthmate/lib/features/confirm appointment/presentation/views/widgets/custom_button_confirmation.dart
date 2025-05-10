import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomButtonConfirmation extends StatelessWidget {
  const CustomButtonConfirmation({
    super.key,
    required this.background,
    required this.textColor,
    required this.borderColor,
    required this.text,
    required this.onPressed,
  });
  final Color background;
  final Color textColor;
  final Color borderColor;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      height: 34,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: StylingSystem.textStyle16Medium.copyWith(
              color: textColor,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
