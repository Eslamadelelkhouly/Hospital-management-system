import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/heartdisease/data/manager/cubit/heart_disease_cubit.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_disease_response_model.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_disease_respose_error.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_request_model.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/container_state_predict.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/content_alart_dialogue.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_bar_progress.dart';
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
  late SingleValueDropDownController genderController;
  late SingleValueDropDownController modelTypeController;
  late SingleValueDropDownController slopeController;
  late SingleValueDropDownController cpController;
  late SingleValueDropDownController caController;
  late SingleValueDropDownController thalController;
  late SingleValueDropDownController restecgController;
  late SingleValueDropDownController fbsController;
  late SingleValueDropDownController exangController;
  late SingleValueDropDownController chestPainTypeController;
  late HeartDiseaseResponseError responseError;
  int age = 0, trestbps = 0, chol = 0, thalachh = 0;
  double oldpeak = 0.0;
  String modelType = 'random_forest';

  HeartDiseasePredictionModel heartDiseasePredictionModel =
      HeartDiseasePredictionModel(
    prediction: '',
    modelUsed: '',
    probabilityPercentage: '',
    confidenceLevel: '',
    rawProbability: 0.0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ageController = TextEditingController();
    bloodPressureController = TextEditingController();
    cholesterolController = TextEditingController();
    maxHeartRateController = TextEditingController();
    oldpeakController = TextEditingController();
    genderController = SingleValueDropDownController();
    modelTypeController = SingleValueDropDownController();
    slopeController = SingleValueDropDownController();
    cpController = SingleValueDropDownController();
    caController = SingleValueDropDownController();
    thalController = SingleValueDropDownController();
    restecgController = SingleValueDropDownController();
    fbsController = SingleValueDropDownController();
    exangController = SingleValueDropDownController();
    chestPainTypeController = SingleValueDropDownController();
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

  void _showSuccessDialog(
      BuildContext context, HeartDiseasePredictionModel model) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: ContentAlartDialog(
            heartDiseasePredictionModel: model,
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errors.toString()),
                    ),
                  );
                } else if (state is HeartDiseaseSucess) {
                  setState(() {
                    heartDiseasePredictionModel =
                        state.heartDiseasePredictionModel;
                  });
                  _showSuccessDialog(
                    context,
                    heartDiseasePredictionModel,
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 45.h),
                    CustomAppBar(
                      title: 'Heart Disease Predict',
                      stateicon: true,
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
                      controller: genderController,
                      texterror: responseError.errors.sex.isNotEmpty
                          ? responseError.errors.sex
                          : '',
                      text: 'Gender',
                      hinttext: 'Gender',
                      dropdowntext1: 'Male',
                      dropdowntext2: 'Female',
                    ),
                    CustomDropDownString(
                      controller: modelTypeController,
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
                      controller: restecgController,
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
                      controller: fbsController,
                      texterror: responseError.errors.fbs.isNotEmpty
                          ? responseError.errors.fbs
                          : '',
                      hinttext: 'Fasting blood sugar',
                      dropdowntext1: 'Yes',
                      dropdowntext2: 'No',
                      text: 'Fasting blood sugar',
                    ),
                    CustomDropDown(
                      controller: exangController,
                      hinttext: 'Exercise induced angina',
                      dropdowntext1: 'Yes',
                      dropdowntext2: 'No',
                      text: 'Exercise induced angina',
                      texterror: responseError.errors.exang.isNotEmpty
                          ? responseError.errors.exang
                          : '',
                    ),
                    CustomDropDownThreeValue(
                      controller: slopeController,
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
                      controller: cpController,
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
                      controller: caController,
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
                      controller: thalController,
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
                          log(thalController.dropDownValue!.value.toString());
                          log(genderController.dropDownValue!.value.toString());
                          log(cpController.dropDownValue!.value.toString());
                          HeartRequestModel heartRequestModel =
                              HeartRequestModel(
                            age: age,
                            sex: genderController.dropDownValue!.value,
                            cp: cpController.dropDownValue!.value,
                            trestbps: trestbps,
                            chol: chol,
                            fbs: fbsController.dropDownValue!.value,
                            restecg: restecgController.dropDownValue!.value,
                            thalachh: thalachh,
                            exang: exangController.dropDownValue!.value,
                            oldpeak: oldpeak,
                            slope: slopeController.dropDownValue!.value,
                            ca: caController.dropDownValue!.value,
                            thal: thalController.dropDownValue!.value,
                            modelType: modelType,
                          );
                          context.read<HeartDiseaseCubit>().predictHeartDisease(
                                body: heartRequestModel,
                              );
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
