
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/Auth/manager/verify_cubit/verification_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/verification_screen_body.dart';

class VerifyBlocConsumer extends StatelessWidget {
  const VerifyBlocConsumer({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return VerificationScreenBody(
          email: email,
        );
      },
    );
  }
}
