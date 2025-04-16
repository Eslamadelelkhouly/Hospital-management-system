import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_drop_down.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_drop_down_four_value.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_text_field_predict.dart';

class HeartDiseaseBody extends StatefulWidget {
  const HeartDiseaseBody({super.key});

  @override
  State<HeartDiseaseBody> createState() => _HeartDiseaseBodyState();
}

class _HeartDiseaseBodyState extends State<HeartDiseaseBody> {
  late TextEditingController ageController;
  late TextEditingController bloodPressureController;
  late TextEditingController cholesterolController;
  late TextEditingController maxHeartRateController;
  late TextEditingController oldpeakController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ageController = TextEditingController();
    bloodPressureController = TextEditingController();
    cholesterolController = TextEditingController();
    maxHeartRateController = TextEditingController();
    oldpeakController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ageController.dispose();
    bloodPressureController.dispose();
    cholesterolController.dispose();
    maxHeartRateController.dispose();
    oldpeakController.dispose();
  }

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
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 45.h),
                CustomAppBar(
                  title: 'Heart Disease Predict',
                ),
                SizedBox(height: 5.h),
                Image.asset(
                  heartanimate,
                  scale: 0.6.h,
                ),
                CustomTextFieldPredict(
                  controller: ageController,
                  text: 'Age',
                  hinttext: 'age',
                ),
                CustomDropDown(
                  text: 'Gender',
                  hinttext: 'Gender',
                  dropdowntext1: 'Male',
                  dropdowntext2: 'Female',
                ),
                CustomTextFieldPredict(
                  controller: bloodPressureController,
                  text: 'Resting Blood Pressure',
                  hinttext: 'Resting Blood Pressure',
                ),
                CustomTextFieldPredict(
                  controller: cholesterolController,
                  text: 'Cholesterol level',
                  hinttext: 'Cholesterol level',
                ),
                CustomTextFieldPredict(
                  controller: maxHeartRateController,
                  text: 'Maximum heart rate',
                  hinttext: 'Maximum heart rate',
                ),
                CustomTextFieldPredict(
                  controller: oldpeakController,
                  text: 'oldpeak',
                  hinttext: 'ST depression',
                ),
                CustomDropDown(
                  hinttext: 'Exercise-induced angina',
                  dropdowntext1: 'Yes',
                  dropdowntext2: 'No',
                  text: 'Exercise-induced angina',
                
                ),
                CustomDropDown(
                  hinttext: 'Fasting blood sugar',
                  dropdowntext1: 'Yes',
                  dropdowntext2: 'No',
                  text: 'Fasting blood sugar',
                ),
                CustomDropDownFourValue(
                  value1: 0,
                  value2: 1,
                  value3: 2,
                  value4: 3,
                  hinttext: 'Chest pain type',
                  text: 'Chest pain type',
                  dropdowntext1: 'Typical angina',
                  dropdowntext2: 'Atypical angina',
                  dropdowntext3: 'Non-anginal pain',
                  dropdowntext4: 'Asymptomatic',
                ),
                CustomDropDownFourValue(
                  value1: 0,
                  value2: 1,
                  value3: 2,
                  value4: 3,
                  hinttext: 'Number of major vessels',
                  text: 'Number of major vessels',
                  dropdowntext1: '0',
                  dropdowntext2: '1',
                  dropdowntext3: '2',
                  dropdowntext4: '3',
                ),
                CustomDropDownFourValue(
                  value1: 1,
                  value2: 2,
                  value3: 3,
                  value4: 4,
                  hinttext: 'Thalassemia types',
                  dropdowntext1: 'Normal',
                  text: 'Thalassemia types',
                  dropdowntext2: 'Fixed Defect',
                  dropdowntext3: 'Reversable Defect',
                  dropdowntext4: 'Not Present',
                ),
                20.verticalSpace,
                CustomButton(
                  onPressed: () {
                    if(key.currentState!.validate()){
                      _showSuccessDialog(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all fields correctly.'),
                        ),
                      );
                    }
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
      ),
    );
  }
}
