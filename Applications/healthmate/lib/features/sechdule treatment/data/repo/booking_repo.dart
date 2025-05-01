import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/sechdule%20treatment/data/models/booking_model_request.dart';

abstract class BookingRepo {
  Future<Either<Map<String,dynamic>,Map<String,dynamic>>> bookTreatment({
    required AppointmentModelRequest appointmentModelRequest,
  });
}