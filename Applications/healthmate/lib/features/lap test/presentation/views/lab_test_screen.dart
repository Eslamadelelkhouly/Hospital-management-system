import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/lap%20test/presentation/views/manager/get_lab_test_cubit/get_lab_test_cubit.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/lab_test_body.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/lab_test_body_bloc_consumer.dart';

class LabTestScreen extends StatelessWidget {
  const LabTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetLabTestCubit(),
      child: Scaffold(
        backgroundColor: ColorSystem.kbtnColorWhite,
        body: LabTestBodyBlocConsumer(),
      ),
    );
  }
}
