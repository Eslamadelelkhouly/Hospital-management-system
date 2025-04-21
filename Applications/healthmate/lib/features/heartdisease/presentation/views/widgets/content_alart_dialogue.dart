import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_disease_response_model.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/container_state_predict.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_bar_progress.dart';

class ContentAlartDialog extends StatelessWidget {
  const ContentAlartDialog({
    super.key,
    required this.heartDiseasePredictionModel,
  });

  final HeartDiseasePredictionModel heartDiseasePredictionModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContainerStatePredict(
            predict: heartDiseasePredictionModel.prediction == 'Patient'
                ? true
                : false,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Prediction : ${heartDiseasePredictionModel.prediction}',
            style: StylingSystem.textStyle17semibold,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          CustomBarProgress(
            statepatient: heartDiseasePredictionModel.prediction == 'Patient'
                ? true
                : false,
            value: double.tryParse(heartDiseasePredictionModel
                    .probabilityPercentage
                    .replaceAll('%', '')) ??
                0,
          ),
        ],
      ),
    );
  }
}
