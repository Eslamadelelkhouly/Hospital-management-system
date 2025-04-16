import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/Auth/manager/login_cubit/login_cubit_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/sign_in_bloc_consumer.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorSystem.kbtnColorWhite,
        body:  SignInBlocConsumer(),
      ),
    );
  }
}
