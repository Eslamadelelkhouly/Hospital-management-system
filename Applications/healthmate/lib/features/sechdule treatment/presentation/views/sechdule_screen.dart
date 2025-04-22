import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/sechdule%20treatment/data/manager/cubit/showavailabletime_cubit.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/sechdule_screen_body.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/shecdule_screen_body_consumer.dart';

class SechduleScreen extends StatelessWidget {
  const SechduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Doctor doctor = GoRouterState.of(context).extra as Doctor;

    return BlocProvider(
      create: (context) => ShowavailabletimeCubit(),
      child: Scaffold(
        backgroundColor: ColorSystem.kbtnColorWhite,
        body: ShecduleScreenBodyConsumer(
          doctor: doctor,
        ),
      ),
    );
  }
}
