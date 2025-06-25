import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/style.dart';

class ContainerTitleList extends StatelessWidget {
  const ContainerTitleList({
    super.key,
    required this.text,
    required this.backgrouncolor,
    required this.textColor,
  });

  final String text;
  final Color backgrouncolor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 40,
      decoration: BoxDecoration(
        color: backgrouncolor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          text,
          style: ResponsiveStylingSystem.textStyle16Medium(context).copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
