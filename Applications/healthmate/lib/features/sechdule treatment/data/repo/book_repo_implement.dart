import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/sechdule%20treatment/data/models/booking_model_request.dart';
import 'package:healthmate/features/sechdule%20treatment/data/repo/booking_repo.dart';

class BookRepoImplement implements BookingRepo {
  final ApiService apiService;

  BookRepoImplement({required this.apiService});
  @override
  Future<Either<Failures, Map<String, dynamic>>> bookTreatment(
      {required AppointmentModelRequest appointmentModelRequest}) async {
    try {
      var response = await apiService.PostToken(
        endpoint: BackendEndpoint.bookappointment,
        data: appointmentModelRequest.toJson(),
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(
            {"message": "Connection timeout with ApiServer", "errors": {}}));
      }
    }
  }
}
