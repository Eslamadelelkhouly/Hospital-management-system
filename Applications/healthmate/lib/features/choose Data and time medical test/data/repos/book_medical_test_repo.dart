import 'package:dartz/dartz.dart';

abstract class BookMedicalTestRepo {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> bookMedicalTest({
    required String medicalTestId,
    required String doctorId,
    required String date,
    required String time,
  });
}
