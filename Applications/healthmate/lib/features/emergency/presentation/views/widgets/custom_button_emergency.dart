import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomButtonEmergency extends StatelessWidget {
  const CustomButtonEmergency(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      this.onPressed,
      required this.textColor,
      required this.backgrounColor});
  final String text;
  final double width;
  final double height;
  final void Function()? onPressed;
  final Color textColor;
  final Color backgrounColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgrounColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(
                callicon,
              ),
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: StylingSystem.textStyle16Medium.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
