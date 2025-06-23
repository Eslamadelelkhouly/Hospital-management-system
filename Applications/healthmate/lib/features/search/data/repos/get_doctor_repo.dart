import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

abstract class GetDoctorRepo {
  Future<Either<Failures,DoctorsResponse>> getDoctors();
  Future<Either<Failures,DoctorsResponse>> getDoctorSearch({required String name});
}