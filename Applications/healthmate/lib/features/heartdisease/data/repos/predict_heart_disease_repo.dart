import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_request_model.dart';

abstract class PredictHeartDiseaseRepo {
  Future<Either<Failures, HeartRequestModel>> predictHeartDisease({
    required HeartRequestModel heartDiseaseBody,
  });
}
