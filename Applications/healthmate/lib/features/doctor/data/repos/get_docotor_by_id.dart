import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

abstract class GetDoctorById {
  Future<Either<String, Doctor>> getDoctorwithID(
      {required String id});
}
