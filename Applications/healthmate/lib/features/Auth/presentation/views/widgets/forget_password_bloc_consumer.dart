import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/Auth/manager/forgetpassword%20cubit/forget_password_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/forget_password_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordBlocConsumer extends StatelessWidget {
  const ForgetPasswordBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: ColorSystem.kGrayColor,
          progressIndicator: const CircularProgressIndicator(
            color: ColorSystem.kPrimaryColor,
          ),
          inAsyncCall: state is ForgetPasswordLoading,
          child: ForgetPasswordBody(),
        );
      },
    );
  }
}
