import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:healthmate/core/widgets/custom_button.dart';

class CustomFormForgetPassword extends StatelessWidget {
  const CustomFormForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Form(
      child: Column(
        children: [
          CustomTextField(
            hinttext: 'Mohamed @example.com',
            text: 'Email',
            iconField: smsicon,
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
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(Routing.kverificationemail);
                  },
                  text: 'Next',
                  width: width * 0.40,
                  height: 48,
                  textColor: ColorSystem.kbtnColorblue,
                  backgrounColor: ColorSystem.kPrimaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
