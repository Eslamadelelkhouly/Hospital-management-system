import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/features/confirm%20appointment/data/repos/cancel_appointment_repo.dart';

class CancelAppointementRepoImplementation extends CancelAppointmentRepo {
  final ApiService apiService;

  CancelAppointementRepoImplementation({required this.apiService});
  @override
  Future<Either<String, String>> cancelAppointment(
      {required String appointmentId}) async {
    try {
      String endpoint = '${BackendEndpoint.deleteAppointment}$appointmentId';
      var response = await apiService.Delete(endpoint: endpoint);
      return Right(response['message'] as String);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data != null) {
          return left(e.response!.data['message'] ?? 'An error occurred');
        } else {
          return left('Connection timeout with ApiServer');
        }
      } else {
        return left('Unexpected Error: $e');
      }
    }
  }
}
