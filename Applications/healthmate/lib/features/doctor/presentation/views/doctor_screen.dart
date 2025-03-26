import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/doctor_screen_body.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Doctor doctor = GoRouterState.of(context).extra as Doctor;
    return Scaffold(
      backgroundColor: ColorSystem.kbtnColorWhite,
      body: DoctorScreenBody(
        doctor: doctor,
      ),
    );
  }
}
