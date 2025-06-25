import 'package:dartz/dartz.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/lab_test_model.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/medical_test_serch_model.dart';

abstract class GetLabTestRepo {
  Future<Either<Map<String, dynamic>, MedicalTestsResponse>> getLabtest();
  Future<Either<String, MedicalTestSearch>> getLabtestSearch({required String query});
}
