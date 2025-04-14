import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/AI%20models/presentation/views/widgets/ai_model_screen_body.dart';

class AiModels extends StatelessWidget {
  const AiModels({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorSystem.kbtnColorWhite,
      body:AiModelScreenBody(),
    );
  }
}