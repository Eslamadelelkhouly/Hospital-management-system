import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/presentation/views/widgets/choose_data_time_medical_test_view_body.dart';

class ChooseDataTimeMedicalTestView extends StatelessWidget {
  const ChooseDataTimeMedicalTestView({super.key});

  @override
  Widget build(BuildContext context) {
    final String testid = GoRouterState.of(context).extra as String;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChooseDataTimeMedicalTestViewBody(
        id: testid,
      ),
    );
  }
}
