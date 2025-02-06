import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_form_forget_password.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset(logo2),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          CustomFormForgetPassword(),
        ],
      ),
    );
  }
}
