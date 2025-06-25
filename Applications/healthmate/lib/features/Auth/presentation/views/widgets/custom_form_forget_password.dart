import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/features/Auth/manager/forgetpassword%20cubit/forget_password_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/settings/presentation/manager/Logout%20cubit/logout_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomFormForgetPassword extends StatefulWidget {
  const CustomFormForgetPassword({super.key});

  @override
  State<CustomFormForgetPassword> createState() =>
      _CustomFormForgetPasswordState();
}

class _CustomFormForgetPasswordState extends State<CustomFormForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late String email;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Form(
      key: key,
      child: Column(
        children: [
          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return CustomTextField(
                controller: emailController,
                onSaved: (value) {
                  email = value!;
                },
                texterror: state is ForgetPasswordError ? state.error : '',
                hinttext: 'Mohamed@example.com',
                text: 'Email',
                iconField: smsicon,
              );
            },
          ),
          24.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7).r,
            child: Row(
              children: [
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  text: 'Previous',
                  width: width * 0.40,
                  height: 48,
                  textColor: ColorSystem.kPrimaryColor,
                  backgrounColor: ColorSystem.kbtnColorblue,
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          key.currentState!.save();
                          context
                              .read<ForgetPasswordCubit>()
                              .forgetpasword(email: email);
                        }
                        if (state is ForgetPasswordSuccess) {
                          GoRouter.of(context).push(
                            Routing.kverificationemail,
                            extra: email,
                          );
                        }
                      },
                      text: 'Next',
                      width: width * 0.40,
                      height: 48,
                      textColor: ColorSystem.kbtnColorblue,
                      backgrounColor: ColorSystem.kPrimaryColor,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
