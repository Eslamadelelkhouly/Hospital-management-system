import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/search/data/models/doctor_model_get_by_name.dart';

abstract class GetDoctorRepo {
  Future<Either<Failures,DoctorsResponse>> getDoctors();
  Future<Either<String,DoctorSearch>> getDoctorSearch({required String name});
}