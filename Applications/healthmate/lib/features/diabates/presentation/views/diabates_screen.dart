import 'package:flutter/material.dart';
import 'package:healthmate/features/diabates/presentation/views/widgets/diabates_screen_body.dart';

class DiabatesScreen extends StatelessWidget {
  const DiabatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DiabatesScreenBody(),
    );
  }
}