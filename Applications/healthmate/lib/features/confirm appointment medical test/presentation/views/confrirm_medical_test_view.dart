import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/features/confirm%20appointment%20medical%20test/presentation/views/widgets/confirm_medical_test_view_body.dart';

class ConfrirmMedicalTestView extends StatelessWidget {
  const ConfrirmMedicalTestView({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = GoRouterState.of(context).extra as String;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ConfirmMedicalTestViewBody(),
    );
  }
}
