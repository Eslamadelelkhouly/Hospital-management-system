import 'package:dartz/dartz.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/models/medical_test_state.dart';

abstract class GetStateMedicalTestRepo {
  Future<Either<String, MedicalTestState>> getUpcoming();
  Future<Either<String, MedicalTestState>> getCancel();
}
