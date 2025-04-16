import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_disease_response_model.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_request_model.dart';

abstract class PredictHeartDiseaseRepo {
  Future<Either<Failures, HeartDiseasePredictionModel>> predictHeartDisease({
    required HeartRequestModel heartDiseaseBody,
  });
}
