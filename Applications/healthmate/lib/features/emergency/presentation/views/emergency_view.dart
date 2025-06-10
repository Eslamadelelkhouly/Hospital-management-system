import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/features/emergency/presentation/views/widgets/emergency_view_body.dart';

class EmergencyView extends StatelessWidget {
  const EmergencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: EmergencyViewBody(),
    );
  }
}