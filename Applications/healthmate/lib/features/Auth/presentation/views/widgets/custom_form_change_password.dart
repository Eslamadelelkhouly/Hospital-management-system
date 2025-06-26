import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/Auth/data/model/verify_model.dart';
import 'package:healthmate/features/Auth/manager/verify_cubit/verification_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_password_text_field.dart';

class CustomFormChangePassword extends StatefulWidget {
  const CustomFormChangePassword({
    super.key,
    required this.OTP,
    required this.emial,
  });

  final String OTP;
  final String emial;

  @override
  State<CustomFormChangePassword> createState() =>
      _CustomFormChangePasswordState();
}

class _CustomFormChangePasswordState extends State<CustomFormChangePassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  String password = '';
  String confirmpasword = '';

  VerificationErrorModel errorModel = VerificationErrorModel(
    message: '',
    status: 0,
    errors: {
      'email': [],
      'code': [],
      'password': [],
      'password_confirmation': [],
    },
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: BlocConsumer<VerificationCubit, VerificationState>(
        listener: (context, state) {
          if (state is VerificationFailure) {
            errorModel = state.errorMessage;
          }
          if (state is VerificationSuccess) {
            GoRouter.of(context).push(Routing.Ksignin);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              CustomPasswordTextField(
                onSaved: (value) {
                  password = value ?? '';
                },
                texterror: (state is VerificationFailure &&
                        state.errorMessage.errors['password'] != null &&
                        state.errorMessage.errors['password']!.isNotEmpty)
                    ? state.errorMessage.errors['password']![0]
                    : '',
                controller: passwordController,
                text: 'Password',
              ),
              const SizedBox(height: 16),
              CustomPasswordTextField(
                onSaved: (value) {
                  confirmpasword = value ?? '';
                },
                texterror: (state is VerificationFailure &&
                        state.errorMessage.errors['password'] != null &&
                        state.errorMessage.errors['password']!.isNotEmpty)
                    ? state.errorMessage.errors['password']![1]
                    : '',
                controller: confirmpasswordController,
                text: 'Confirm Password',
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    context.read<VerificationCubit>().verify(
                          otp: widget.OTP,
                          email: widget.emial,
                          password: password,
                          confirmpassword: confirmpasword,
                        );
                    log('Submitted');
                  } else {
                    log('Validation failed');
                  }
                },
                text: 'Create new password',
                width: 362,
                height: 44,
                textColor: Colors.white,
                backgrounColor: ColorSystem.kPrimaryColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
