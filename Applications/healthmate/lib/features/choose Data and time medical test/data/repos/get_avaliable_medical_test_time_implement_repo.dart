import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/data/models/available_appointment_medical_test_model.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/data/repos/get_avaliable_medical_test_time_repo.dart';

class GetAvaliableMedicalTestTimeImplementRepo
    extends GetAvailableMedicalTestTimeRepo {
  final ApiService apiService;
  GetAvaliableMedicalTestTimeImplementRepo({required this.apiService});
  @override
  Future<Either<Map<String, dynamic>, AvailableAppointmentsMedicalTest>>
      getAvailableMedicalTestTime(String medicalTestId, String date) async {
    try {
      String key = '$medicalTestId?date=$date';
      var response = await apiService.GetWithKey(
          endpoint: BackendEndpoint.getmedicaltestavailable, key: key);
      if (response['available_appointments'] == null ||
          (response['available_appointments'] as List).isEmpty) {
        return left({
          "message": response['message'] ?? "No appointments found",
          "status": response['status'] ?? 200,
        });
      }
      final availableAppointmentsMidicalTest =
          AvailableAppointmentsMedicalTest.fromJson(response);
      return right(availableAppointmentsMidicalTest);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data != null) {
          return left(Map<String, dynamic>.from(e.response!.data));
        } else {
          return left(
              {"message": "Connection timeout with ApiServer", "errors": {}});
        }
      } else {
        return left({"message": "Unexpected Error", "errors": {}});
      }
    }
  }
}
