import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/features/Auth/manager/verify_cubit/verification_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/change_password_bloc_consumer.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/change_password_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        GoRouterState.of(context).extra as Map<String, dynamic>;
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: Scaffold(
        body: ChangePasswordBlocConsumer(
          Otp: data['otp'],
          email: data['email'],
        ),
      ),
    );
  }
}
