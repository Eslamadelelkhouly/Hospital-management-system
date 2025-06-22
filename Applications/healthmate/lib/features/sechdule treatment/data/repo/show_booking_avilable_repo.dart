import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/sechdule%20treatment/data/models/booking_avaliabale_model.dart';

abstract class ShowBookingAvailableRepo {
  Future<Either<Map<String, dynamic>, BookingAvaliabalTimeeModel>>
      showBookingAvailable({required String doctorId, required String date});
}
