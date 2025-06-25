import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/manager/cancel_medical_test_cubit/cancel_medical_test_cubit.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/manager/get_cancel_medical_test/get_cancel_medical_test_cubit.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/manager/upcoming_medical_test_cubit/upcoming_medical_test_cubit.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/views/widgets/status_appointment_lab_test_view_body.dart';

class StatusAppointmentLabTestView extends StatelessWidget {
  const StatusAppointmentLabTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpcomingMedicalTestCubit(),
        ),
        BlocProvider(
          create: (context) => CancelMedicalTestCubit(),
        ),
        BlocProvider(
          create: (context) => GetCancelMedicalTestCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StatusAppointmentLabTestViewBody(),
      ),
    );
  }
}
