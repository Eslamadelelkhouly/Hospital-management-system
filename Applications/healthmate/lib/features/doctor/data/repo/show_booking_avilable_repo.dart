import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/doctor/data/models/booking_avaliabale_model.dart';

abstract class ShowBookingAvailableRepo {
  Future<Either<Failures, BookingAvaliabaleModel>> showBookingAvailable(
      {required String doctorId});
}
