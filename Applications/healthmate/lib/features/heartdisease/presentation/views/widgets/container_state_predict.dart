import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';

class ContainerStatePredict extends StatelessWidget {
  const ContainerStatePredict({super.key, required this.predict});
  final bool predict;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      predict ? failureimage : sucessimage,
      scale: 2,
    );
  }
}
