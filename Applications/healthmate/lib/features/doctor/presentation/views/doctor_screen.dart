import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/doctor/presentation/manager/cubit/get_doctor_by_id_cubit.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/doctor_screen_body.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String idDoctor = GoRouterState.of(context).extra as String;
    return BlocProvider(
      create: (context) => GetDoctorByIdCubit(),
      child: Scaffold(
        backgroundColor: ColorSystem.kbtnColorWhite,
        body: DoctorScreenBody(
          id: idDoctor,
        ),
      ),
    );
  }
}
