import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/widgets/custom_snackbar.dart';
import 'package:healthmate/features/Auth/manager/cubit/register_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/sign_up_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomSignUpBlocConsumer extends StatelessWidget {
  const CustomSignUpBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          GoRouter.of(context).push(Routing.Ksignin);
        } else if (state is RegisterFailure) {
          CustomSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading ? true : false,
          color: ColorSystem.kPrimaryColor,
          child: const SignUpBody(),
        );
      },
    );
  }
}
