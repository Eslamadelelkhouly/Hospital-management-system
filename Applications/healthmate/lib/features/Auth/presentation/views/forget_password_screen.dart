import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/Auth/manager/forgetpassword%20cubit/forget_password_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/forget_password_bloc_consumer.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorSystem.kbtnColorWhite,
        body: ForgetPasswordBlocConsumer(),
      ),
    );
  }
}
