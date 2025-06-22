import 'package:dartz/dartz.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';

abstract class UpcomingRepo {
  Future<Either<String , UpcomingAppointment>> getUpcomingAppointments();
}