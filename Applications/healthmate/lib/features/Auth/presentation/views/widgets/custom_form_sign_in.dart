import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/Auth/data/model/error_response_register_model.dart';
import 'package:healthmate/features/Auth/manager/login_cubit/login_cubit_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_social_media_icons.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:healthmate/core/widgets/custom_button.dart';

class CustomFormSignIn extends StatefulWidget {
  const CustomFormSignIn({super.key});

  @override
  State<CustomFormSignIn> createState() => _CustomFormSignInState();
}

class _CustomFormSignInState extends State<CustomFormSignIn> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late String email, password;
  ErrorResponse errorResponse = ErrorResponse(
    message: '',
    errors: errors(
      fullName: [],
      password: [],
      dateOfBirth: [],
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocConsumer<LoginCubit, LoginCubitState>(
              listener: (context, state) {
                if (state is LoginCubitFailure) {
                  errorResponse = ErrorResponse.fromJson(state.erorMessage);
                }
              },
              builder: (context, state) {
                return CustomTextField(
                  texterror: errorResponse.errors.email!.isNotEmpty
                      ? errorResponse.errors.email![0]
                      : '',
                  controller: emailController,
                  onSaved: (value) {
                    email = value!;
                  },
                  hinttext: 'Mohamed @example.com',
                  text: 'Email',
                  iconField: smsicon,
                );
              },
            ),
            CustomPasswordTextField(
              onSaved: (value) {
                password = value!;
              },
              texterror: errorResponse.errors.password!.isNotEmpty
                  ? errorResponse.errors.password![0]
                  : '',
              controller: passwordController,
              text: 'Password',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(Routing.kforgetpassword);
                    },
                    child: Text(
                      'Forget password?',
                      style: ResponsiveStylingSystem.textStyle16Medium(context).copyWith(
                        color: Color(0xff83818E),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                  context.read<LoginCubit>().logIn(
                        email: email,
                        password: password,
                      );
                } else {
                  print('error');
                }
              },
              text: 'Sign In',
              width: 362,
              height: 44,
              textColor: ColorSystem.kbtnColorWhite,
              backgrounColor: ColorSystem.kPrimaryColor,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don’t have an account?  ',
                  style: ResponsiveStylingSystem.textStyle14Medium(context),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(Routing.Ksignup);
                  },
                  child: Text(
                    'Create Account',
                    style: ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
                      color: ColorSystem.kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const CustomOrDivider(),
            SizedBox(
              height: 24,
            ),
            const CustomSocialMediaIcons()
          ],
        ),
      ),
    );
  }
}
