import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_drop_down.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_text_field_predict.dart';

class HeartDiseaseBody extends StatelessWidget {
  const HeartDiseaseBody({super.key});

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text('Success', textAlign: TextAlign.center),
          content: const Text(
            'Prediction completed successfully!',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 45.h),
              CustomAppBar(title: 'Heart Disease Predict'),
              SizedBox(height: 5.h),
              Image.asset(
                heartanimate,
                scale: 0.6.h,
              ),
              CustomTextFieldPredict(text: 'Age', hinttext: 'age'),
              CustomDropDown(
                  hinttext: 'Gender',
                  dropdowntext1: 'Male',
                  dropdowntext2: 'Female'),
              CustomTextFieldPredict(
                  text: 'Resting Blood Pressure',
                  hinttext: 'Resting Blood Pressure'),
              CustomTextFieldPredict(
                  text: 'Cholesterol level', hinttext: 'Cholesterol level'),
              CustomTextFieldPredict(
                  text: 'Maximum heart rate', hinttext: 'Maximum heart rate'),
              CustomTextFieldPredict(
                  text: 'oldpeak', hinttext: 'ST depression'),
              CustomDropDown(
                  hinttext: 'Exercise-induced angina',
                  dropdowntext1: 'Yes',
                  dropdowntext2: 'No'),
              20.verticalSpace,
              CustomButton(
                onPressed: () {
                  _showSuccessDialog(context);
                },
                text: 'Predict',
                width: 320,
                height: 54,
                textColor: ColorSystem.kbtnColorWhite,
                backgrounColor: ColorSystem.kPrimaryColor,
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
