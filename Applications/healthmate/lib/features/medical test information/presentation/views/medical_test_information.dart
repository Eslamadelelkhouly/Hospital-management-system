import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/features/medical%20test%20information/presentation/views/widgets/medical_test_inofrmation_body.dart';

class MedicalTestInformationView extends StatefulWidget {
  const MedicalTestInformationView({super.key});

  @override
  State<MedicalTestInformationView> createState() =>
      _MedicalTestInformationViewState();
}

class _MedicalTestInformationViewState
    extends State<MedicalTestInformationView> {
  @override
  Widget build(BuildContext context) {
    final int id = GoRouterState.of(context).extra as int;

    return Scaffold(
      backgroundColor: Colors.white,
      body: MedicalTestInofrmationBody(id: id),
    );
  }
}
