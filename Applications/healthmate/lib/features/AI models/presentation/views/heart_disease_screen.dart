import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/AI%20models/presentation/views/widgets/heart_disease_body.dart';

class HeartDiseaseScreen extends StatelessWidget {
  const HeartDiseaseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorSystem.kbtnColorWhite,
      body:HeartDiseaseBody()
    );
  }
}