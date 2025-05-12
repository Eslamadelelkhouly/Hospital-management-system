import 'package:dartz/dartz.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/lab_test_model.dart';

abstract class GetLabTestRepo {
  Future<Either<Map<String, dynamic>, MedicalTestsResponse>> getLabtest();
}
