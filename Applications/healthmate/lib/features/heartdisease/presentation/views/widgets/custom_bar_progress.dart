import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomBarProgress extends StatelessWidget {
  const CustomBarProgress(
      {super.key, required this.statepatient, required this.value});
  final bool statepatient;
  final double value;
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      lineHeight: 20,
      animationDuration: 2500,
      percent: value / 100,
      backgroundColor: ColorSystem.kPrimaryColorLight,
      center: Text(
        '${value.toString()}',
        style: StylingSystem.textStyle15bold.copyWith(
          color: Colors.white,
        ),
      ),
      barRadius: const Radius.circular(20),
      progressColor: statepatient ? Colors.red : ColorSystem.kPrimaryColor,
    );
  }
}
