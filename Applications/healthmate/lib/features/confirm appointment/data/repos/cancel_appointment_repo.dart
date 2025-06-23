import 'package:dartz/dartz.dart';

abstract class CancelAppointmentRepo {
  Future<Either<String,String>> cancelAppointment({
    required String appointmentId,
  });

}
