import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/manager/cubit/upcoming_cubit.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/confirm_appointment_body.dart';

class ConfirmAppointmentScreen extends StatelessWidget {
  const ConfirmAppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpcomingCubit(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: ConfirmAppointmentBody(),
      ),
    );
  }
}
