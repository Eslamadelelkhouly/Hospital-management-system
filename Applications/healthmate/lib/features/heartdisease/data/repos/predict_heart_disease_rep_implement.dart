import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_disease_response_model.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_request_model.dart';
import 'package:healthmate/features/heartdisease/data/repos/predict_heart_disease_repo.dart';
import 'package:healthmate/features/heartdisease/endpoints/endpoints_heart_disease.dart';

class PredictHeartDiseaseRepImplement implements PredictHeartDiseaseRepo {
  final ApiService apiService;

  PredictHeartDiseaseRepImplement({required this.apiService});

  @override
  Future<Either<Failures, HeartDiseasePredictionModel>> predictHeartDisease(
      {required HeartRequestModel heartDiseaseBody}) async {
    try {
      var response = await apiService.Post(
        endpoint: EndpointsHeartDisease.endpoint,
        data: heartDiseaseBody.toJson(),
      );
      HeartDiseasePredictionModel heartDiseasePredictionModel =
          HeartDiseasePredictionModel.fromJson(response);
      return right(heartDiseasePredictionModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(
          ServerFailure(
            {"message": "Connection timeout with ApiServer", "errors": {}},
          ),
        );
      }
    }
  }
}
