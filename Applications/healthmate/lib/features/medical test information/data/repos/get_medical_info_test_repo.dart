import 'package:dartz/dartz.dart';
import 'package:healthmate/features/medical%20test%20information/data/model/medical_info_model.dart';

abstract class GetMedicalInfoTestRepo {
  Future<Either<Map<String, dynamic>, MedicalInfoModel>> getMedicalInfo(
      {required String id});
}
