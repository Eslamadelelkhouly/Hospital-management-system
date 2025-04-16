import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/sechdule_screen_body.dart';

class SechduleScreen extends StatelessWidget {
  const SechduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorSystem.kbtnColorWhite,
      body: SechduleScreenBody(),
    );
  }
}
