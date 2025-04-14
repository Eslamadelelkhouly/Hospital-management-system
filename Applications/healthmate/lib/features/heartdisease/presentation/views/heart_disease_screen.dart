import 'package:flutter/material.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/heart_disease_body.dart';

class HeartDiseaseScreen extends StatelessWidget {
  const HeartDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: HeartDiseaseBody(),
    );
  }
}