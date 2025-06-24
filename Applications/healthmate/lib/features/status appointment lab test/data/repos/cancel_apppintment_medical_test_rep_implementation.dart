import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/repos/cancel_appointment_midcal_test_repo.dart';

class CancelApppintmentMedicalTestRepImplementation
    extends CancelAppointmentMidcalTestRepo {
  final ApiService apiService;

  CancelApppintmentMedicalTestRepImplementation({required this.apiService});
  @override
  Future<Either<String, String>> cancelappointment(
      {required String appointmentId}) async {
    try {
      String endpoint = '${BackendEndpoint.deletemdicaltest}$appointmentId';
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
