import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/personal/data/models/personal_info_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class GetPersonalInfoRepo {
  Future<Either<Failures, PersonalInfoModel>> getPersonalInfo();
  Future<Either<String, Map<String, dynamic>>> updatePersonalInfo({
    required String name,
    required String address,
    required String gender,
    required String phoneNumber,
    required XFile image,
    required String id,
  });
}
