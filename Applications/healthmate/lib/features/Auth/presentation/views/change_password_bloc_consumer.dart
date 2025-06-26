import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/Auth/manager/verify_cubit/verification_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/change_password_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChangePasswordBlocConsumer extends StatelessWidget {
  const ChangePasswordBlocConsumer(
      {super.key, required this.Otp, required this.email});
  final String Otp, email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is VerificationLoading ? true : false,
          child: ChangePasswordBody(
            otp: Otp,
            email: email,
          ),
        );
      },
    );
  }
}
