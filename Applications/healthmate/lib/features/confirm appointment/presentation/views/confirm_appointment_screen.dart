import 'package:flutter/material.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/confirm_appointment_body.dart';

class ConfirmAppointmentScreen extends StatelessWidget {
  const ConfirmAppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ConfirmAppointmentBody(),
    );
  }
}
