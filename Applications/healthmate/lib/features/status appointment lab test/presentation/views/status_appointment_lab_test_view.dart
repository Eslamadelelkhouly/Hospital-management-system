import 'package:flutter/material.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/views/widgets/status_appointment_lab_test_view_body.dart';

class StatusAppointmentLabTestView extends StatelessWidget {
  const StatusAppointmentLabTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StatusAppointmentLabTestViewBody(),
    );
  }
}
