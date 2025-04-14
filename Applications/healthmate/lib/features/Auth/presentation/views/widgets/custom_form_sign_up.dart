import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/Auth/data/model/error_response_register_model.dart';
import 'package:healthmate/features/Auth/manager/register_cubit/register_cubit.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_social_media_icons.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field_celender.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_fotter_signup.dart';
import 'package:intl/intl.dart';

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
  late String fullname, email, password;
  late DateTime? selectedDate; // Store the selected date as DateTime
  late ErrorResponse errorResponse;
  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    dateofbirthController = TextEditingController();
    selectedDate = null; // Initialize as null
    errorResponse = ErrorResponse(
      message: '',
      errors: errors(
        fullName: [],
        password: [],
        dateOfBirth: [],
      ),
    );
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
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterFailure) {
              setState(() {
                errorResponse = ErrorResponse.fromJson(state.errorMessage);
              });
              log(errorResponse.toString());
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                CustomTextField(
                  texterror: (errorResponse.errors.fullName.isNotEmpty
                          ? errorResponse.errors.fullName[0]
                          : '') ??
                      '',
                  controller: fullNameController,
                  onSaved: (value) {
                    fullname = value!;
                  },
                  hinttext: 'Mohamed Mahmoud',
                  text: 'Full Name',
                  iconField: usericon,
                ),
                CustomTextField(
                  texterror: (errorResponse.errors.email.isNotEmpty
                          ? errorResponse.errors.email[0]
                          : '') ??
                      '',
                  controller: emailController,
                  onSaved: (value) {
                    email = value!;
                  },
                  hinttext: 'Mohamed@example.com',
                  text: 'Email',
                  iconField: smsicon,
                ),
                CustomPasswordTextField(
                  controller: passwordController,
                  text: 'Password',
                  texterror: (errorResponse.errors.password.isNotEmpty
                          ? errorResponse.errors.password[0]
                          : '') ??
                      '',
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                CustomTextFieldCelender(
                  texterror: (errorResponse.errors.dateOfBirth.isNotEmpty
                          ? errorResponse.errors.dateOfBirth[0]
                          : '') ??
                      '',
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date; // Update the selected date
                      dateofbirthController.text = DateFormat("dd MMMM, yyyy")
                          .format(date); // Update UI format
                    });
                  },
                  controller: dateofbirthController,
                ),
                SizedBox(height: height * 0.02),
                CustomButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();
                      if (selectedDate != null) {
                        // Format the date for the backend
                        String backendDate =
                            DateFormat("yyyy-MM-dd").format(selectedDate!);
                        context.read<RegisterCubit>().signUp(
                              fullname: fullname,
                              email: email,
                              dateofbirth:
                                  backendDate, // Send formatted date to backend
                              password: password,
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Please select a date of birth')),
                        );
                      }
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
            );
          },
        ),
      ),
    );
  }
}
