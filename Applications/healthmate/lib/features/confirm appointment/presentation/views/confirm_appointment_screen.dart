import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/manager/DeleteAppointmentCubit/delete_appointment_cubit.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/manager/UpcomingCubit/upcoming_cubit.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/confirm_appointment_body.dart';

class ConfirmAppointmentScreen extends StatelessWidget {
  const ConfirmAppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpcomingCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteAppointmentCubit(),
        ),
      ],
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: ConfirmAppointmentBody(),
      ),
    );
  }
}
