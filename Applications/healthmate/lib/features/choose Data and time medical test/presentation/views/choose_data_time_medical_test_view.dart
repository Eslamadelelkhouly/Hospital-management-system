import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/data/models/available_appointment_medical_test_model.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/presentation/manager/Available%20time%20medical%20test%20cubit/avaliable_time_medical_test_cubit.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/presentation/manager/Book%20Medical%20Test%20Cubit/book_medical_test_cubit.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/presentation/views/widgets/choose_data_time_medical_test_view_body.dart';
import 'package:healthmate/features/search/manager/Show%20Doctor%20Cubit/show_doctor_cubit.dart';

class ChooseDataTimeMedicalTestView extends StatelessWidget {
  const ChooseDataTimeMedicalTestView({super.key});

  @override
  Widget build(BuildContext context) {
    final String testid = GoRouterState.of(context).extra as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShowDoctorCubit(),
        ),
        BlocProvider(
          create: (context) => AvaliableTimeMedicalTestCubit(),
        ),
          BlocProvider(
          create: (context) => BookMedicalTestCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ChooseDataTimeMedicalTestViewBody(
          id: testid,
        ),
      ),
    );
  }
}
