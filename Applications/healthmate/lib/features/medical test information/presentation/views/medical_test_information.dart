import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/features/medical%20test%20information/presentation/views/widgets/medical_test_inofrmation_body.dart';

class MedicalTestInformationView extends StatelessWidget {
  const MedicalTestInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: MedicalTestInofrmationBody(),
    );
  }
}