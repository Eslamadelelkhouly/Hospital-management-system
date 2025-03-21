import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/Auth/data/model/patient_model.dart';
import 'package:healthmate/features/Auth/data/repo/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  @override
  Future<Either<Failuers, PatientModel>> register(PatientModel patient) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
