import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/personal/data/models/personal_info_model.dart';

abstract class GetPersonalInfoRepo {
  Future<Either<Failures, PersonalInfoModel>> getPersonalInfo();
}
