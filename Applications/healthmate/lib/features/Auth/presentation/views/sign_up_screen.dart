import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/Auth/manager/register_cubit/register_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/sign_up_bloc_consumer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorSystem.kbtnColorWhite,
        body: const CustomSignUpBlocConsumer(),
      ),
    );
  }
}
