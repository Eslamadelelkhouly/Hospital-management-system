import 'package:flutter/material.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/doctor_screen_body.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorScreenBody(),
    );
  }
}
