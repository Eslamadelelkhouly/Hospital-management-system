import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/heartdisease/data/manager/cubit/heart_disease_cubit.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_disease_respose_error.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_drop_down.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_drop_down_four_value.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_drop_down_string.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_drop_down_three_value.dart';
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
  late HeartDiseaseResponseError responseError;
  late int age,
      sex,
      cp,
      trestbps,
      chol,
      fbs,
      restecg,
      thalachh,
      exang,
      slope,
      ca,
      thal;
  late double oldpeak;
  late String modelType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ageController = TextEditingController();
    bloodPressureController = TextEditingController();
    cholesterolController = TextEditingController();
    maxHeartRateController = TextEditingController();
    oldpeakController = TextEditingController();
    responseError = HeartDiseaseResponseError(
      message: '',
      errors: errors(
        age: '',
        sex: '',
        cp: '',
        trestbps: '',
        chol: '',
        fbs: '',
        restecg: '',
        thalachh: '',
        exang: '',
        oldpeak: '',
        slope: '',
        ca: '',
        thal: '',
        modelType: '',
      ),
    );
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
            child: BlocConsumer<HeartDiseaseCubit, HeartDiseaseState>(
              listener: (context, state) {
                if (state is HeartDiseaseFaiuler) {
                  setState(() {
                    responseError = HeartDiseaseResponseError.fromJson(
                      state.errors,
                    );
                  });
                  log(responseError.toString());
                }
              },
              builder: (context, state) {
                return Column(
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
                      onSaved: (value) {
                        age = int.parse(value!);
                      },
                      texterror: responseError.errors.age.isNotEmpty
                          ? responseError.errors.age
                          : '',
                      controller: ageController,
                      text: 'Age',
                      hinttext: 'age',
                    ),
                    CustomDropDown(
                      onChanged: (value) {
                        if (value == 'Male') {
                          sex = 1;
                        } else {
                          sex = 0;
                        }
                      },
                      texterror: responseError.errors.sex.isNotEmpty
                          ? responseError.errors.sex
                          : '',
                      text: 'Gender',
                      hinttext: 'Gender',
                      dropdowntext1: 'Male',
                      dropdowntext2: 'Female',
                    ),
                    CustomDropDownString(
                      onChanged: (value) {
                        if (value == 'Random Forest') {
                          modelType = 'random_forest';
                        } else {
                          modelType = 'decision_tree';
                        }
                      },
                      hinttext: 'Model Type',
                      dropdowntext1: 'Random Forest',
                      dropdowntext2: 'Decision Tree',
                      text: 'Model Type',
                      texterror: responseError.errors.modelType.isNotEmpty
                          ? responseError.errors.modelType
                          : '',
                    ),
                    CustomTextFieldPredict(
                      onSaved: (value) {
                        trestbps = int.parse(value!);
                      },
                      texterror: responseError.errors.trestbps.isNotEmpty
                          ? responseError.errors.trestbps
                          : '',
                      controller: bloodPressureController,
                      text: 'Resting Blood Pressure',
                      hinttext: 'Resting Blood Pressure',
                    ),
                    CustomTextFieldPredict(
                      onSaved: (value) {
                        chol = int.parse(value!);
                      },
                      texterror: responseError.errors.chol.isNotEmpty
                          ? responseError.errors.chol
                          : '',
                      controller: cholesterolController,
                      text: 'Cholesterol level',
                      hinttext: 'Cholesterol level',
                    ),
                    CustomTextFieldPredict(
                      onSaved: (value) {
                        thalachh = int.parse(value!);
                      },
                      texterror: responseError.errors.thalachh.isNotEmpty
                          ? responseError.errors.thalachh
                          : '',
                      controller: maxHeartRateController,
                      text: 'Maximum heart rate',
                      hinttext: 'Maximum heart rate',
                    ),
                    CustomTextFieldPredict(
                      onSaved: (value) {
                        oldpeak = double.parse(value!);
                      },
                      texterror: responseError.errors.oldpeak.isNotEmpty
                          ? responseError.errors.oldpeak
                          : '',
                      controller: oldpeakController,
                      text: 'oldpeak',
                      hinttext: 'ST depression',
                    ),
                    CustomDropDownThreeValue(
                      onChanged: (value) {
                        if (value == 'Normal') {
                          restecg = 0;
                        } else if (value == 'Abnormal') {
                          restecg = 1;
                        } else if (value == 'hypertrophy') {
                          restecg = 3;
                        }
                      },
                      texterror: responseError.errors.restecg.isNotEmpty
                          ? responseError.errors.restecg
                          : '',
                      hinttext: 'Resting electrocardiographic results',
                      dropdowntext1: 'Normal',
                      dropdowntext2: 'Abnormal',
                      dropdowntext3: 'hypertrophy',
                      value1: 0,
                      value2: 1,
                      value3: 2,
                    ),
                    CustomDropDown(
                      onChanged: (value) {
                        if (value == 'Yes') {
                          fbs = 1;
                        } else {
                          fbs = 0;
                        }
                      },
                      texterror: responseError.errors.fbs.isNotEmpty
                          ? responseError.errors.fbs
                          : '',
                      hinttext: 'Fasting blood sugar',
                      dropdowntext1: 'Yes',
                      dropdowntext2: 'No',
                      text: 'Fasting blood sugar',
                    ),
                    CustomDropDown(
                      onChanged: (value) {
                        if (value == 'Yes') {
                          exang = 1;
                        } else {
                          exang = 0;
                        }
                      },
                      hinttext: 'Exercise induced angina',
                      dropdowntext1: 'Yes',
                      dropdowntext2: 'No',
                      text: 'Exercise induced angina',
                      texterror: responseError.errors.exang.isNotEmpty
                          ? responseError.errors.exang
                          : '',
                    ),
                    CustomDropDownThreeValue(
                      onChanged: (value) {
                        if (value == 'Upsloping') {
                          slope = 0;
                        } else if (value == 'Flat') {
                          slope = 1;
                        } else if (value == 'Downsloping') {
                          slope = 3;
                        }
                      },
                      hinttext: 'Slope of the peak exercise ST segment',
                      dropdowntext1: 'Upsloping',
                      dropdowntext2: 'Flat',
                      dropdowntext3: 'Downsloping',
                      value1: 0,
                      value2: 1,
                      value3: 2,
                      texterror: responseError.errors.slope.isNotEmpty
                          ? responseError.errors.slope
                          : '',
                    ),
                    CustomDropDownFourValue(
                      onChanged: (value) {
                        if (value == 'Typical angina') {
                          cp = 0;
                        } else if (value == 'Atypical angina') {
                          cp = 1;
                        } else if (value == 'Non-anginal pain') {
                          cp = 2;
                        } else if (value == 'Asymptomatic') {
                          cp = 3;
                        }
                      },
                      texterror: responseError.errors.cp.isNotEmpty
                          ? responseError.errors.cp
                          : '',
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
                      onChanged: (value) {
                        if (value == '0') {
                          ca = 0;
                        } else if (value == '1') {
                          ca = 1;
                        } else if (value == '2') {
                          ca = 2;
                        } else if (value == '3') {
                          ca = 3;
                        }
                      },
                      texterror: responseError.errors.ca.isNotEmpty
                          ? responseError.errors.ca
                          : '',
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
                      onChanged: (value) {
                        if (value == 'Normal') {
                          thal = 1;
                        } else if (value == 'Fixed Defect') {
                          thal = 2;
                        } else if (value == 'Reversable Defect') {
                          thal = 3;
                        } else if (value == 'Not Present') {
                          thal = 4;
                        }
                      },
                      texterror: responseError.errors.thal.isNotEmpty
                          ? responseError.errors.thal
                          : '',
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
                        if (key.currentState!.validate()) {
                          key.currentState!.save();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please fill in all fields correctly.'),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
