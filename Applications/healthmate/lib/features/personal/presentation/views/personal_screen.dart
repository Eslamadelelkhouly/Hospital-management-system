import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/personal/presentation/manager/get_presonal_info_cubit/getpersonalinfo_cubit.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/personal_body_bloc_consumer.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/personal_screen_body.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetpersonalinfoCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PersonalBodyBlocConsumer(),
      ),
    );
  }
}
