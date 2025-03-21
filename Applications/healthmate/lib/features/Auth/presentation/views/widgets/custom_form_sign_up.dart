import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/Auth/manager/cubit/register_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_social_media_icons.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field_celender.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_fotter_signup.dart';
import 'package:healthmate/core/widgets/custom_button.dart';

class CustomFormSignUp extends StatefulWidget {
  const CustomFormSignUp({super.key});

  @override
  State<CustomFormSignUp> createState() => _CustomFormSignUpState();
}

class _CustomFormSignUpState extends State<CustomFormSignUp> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController dateofbirthController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late String fullname, email, password, data;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    dateofbirthController = TextEditingController();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dateofbirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
              controller: fullNameController,
              onSaved: (value) {
                fullname = value!;
              },
              hinttext: 'Mohamed Mahmoud',
              text: 'Full Name',
              iconField: usericon,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: emailController,
              onSaved: (value) {
                email = value!;
              },
              hinttext: 'Mohamed@example.com',
              text: 'Email',
              iconField: smsicon,
            ),
            SizedBox(height: 10),
            CustomPasswordTextField(
              controller: passwordController,
              text: 'Password',
              onSaved: (value) {
                password = value!;
              },
            ),
            SizedBox(height: 10),
            CustomTextFieldCelender(
              onSaved: (value) {
                data = value!;
              },
              controller: dateofbirthController,
            ),
            SizedBox(height: height * 0.02),
            CustomButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                  context.read<RegisterCubit>().signUp(
                        fullname: fullname,
                        email: email,
                        dateofbirth: dateofbirthController.text.trim(),
                        password: password,
                      );
                }
              },
              text: 'Sign Up',
              width: width * 0.90,
              height: height * 0.06,
              textColor: ColorSystem.kbtnColorWhite,
              backgrounColor: ColorSystem.kPrimaryColor,
            ),
            SizedBox(height: height * 0.02),
            CustomTextFotterSignUP(),
            SizedBox(height: height * 0.02),
            CustomOrDivider(),
            SizedBox(height: height * 0.03),
            CustomSocialMediaIcons(),
          ],
        ),
      ),
    );
  }
}
