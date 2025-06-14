import 'package:dartz/dartz.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/data/models/available_appointment_medical_test_model.dart';

abstract class GetAvailableMedicalTestTimeRepo {
  Future<Either<Map<String, dynamic>, AvailableAppointmentsMedicalTest>>
      getAvailableMedicalTestTime(String medicalTestId, String date);
}
