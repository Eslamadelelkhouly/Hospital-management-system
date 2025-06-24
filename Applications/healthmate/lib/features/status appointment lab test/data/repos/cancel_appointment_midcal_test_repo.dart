import 'package:dartz/dartz.dart';

abstract class CancelAppointmentMidcalTestRepo {
  Future<Either<String, String>> cancelappointment({
    required String appointmentId,
  });
}
