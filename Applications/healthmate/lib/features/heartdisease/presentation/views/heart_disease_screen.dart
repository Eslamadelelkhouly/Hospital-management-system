import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/heartdisease/data/manager/cubit/heart_disease_cubit.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/heart_disease_bloc_consumer_body.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/heart_disease_body.dart';

class HeartDiseaseScreen extends StatelessWidget {
  const HeartDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HeartDiseaseCubit(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: HeartDiseaseBlocConsumerBody(),
      ),
    );
  }
}
