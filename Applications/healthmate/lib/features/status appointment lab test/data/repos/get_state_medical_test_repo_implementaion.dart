import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/models/medical_test_state.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/repos/get_state_medical_test_repo.dart';

class GetStateMedicalTestRepoImplementaion extends GetStateMedicalTestRepo {
  final ApiService apiService;

  GetStateMedicalTestRepoImplementaion({required this.apiService});
  @override
  Future<Either<String, MedicalTestState>> getUpcoming() async {
    try {
      var response = await apiService.Get(
        endpoint: BackendEndpoint.getUpcomingMedicalTest,
      );
      log('Response: $response');
      MedicalTestState upcomingAppointment =
          MedicalTestState.fromJson(response);
      return right(upcomingAppointment);
    } catch (e) {
      log('Error: $e');
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
  
  @override
  Future<Either<String, MedicalTestState>> getCancel() async{
    try {
      var response = await apiService.Get(
        endpoint: BackendEndpoint.getcancelmedicaltest,
      );
      log('Response: $response');
      MedicalTestState upcomingAppointment =
          MedicalTestState.fromJson(response);
      return right(upcomingAppointment);
    } catch (e) {
      log('Error: $e');
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
