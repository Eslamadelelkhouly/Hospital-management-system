import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/home/data/model/top_doctor_model.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

abstract class GetTopDoctorRepo {
  Future<Either<Failures, TopDoctorsResponse>> getTopDoctor();
}
