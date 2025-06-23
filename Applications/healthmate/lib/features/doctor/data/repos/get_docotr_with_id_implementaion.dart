import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/doctor/data/repos/get_docotor_by_id.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

class GetDocotrWithIdImplementaion extends GetDoctorById {
  final ApiService apiService;

  GetDocotrWithIdImplementaion({required this.apiService});
  @override
  Future<Either<String, Doctor>> getDoctorwithID({required String id}) async {
    try {
      var endpoint = '${BackendEndpoint.getdoctorwithid}$id';
      log(endpoint);
      var response = await apiService.Get(endpoint: endpoint);
      log(response.toString());
      Doctor doctorsResponse = Doctor.fromJson(response['doctor']);
      return Right(doctorsResponse);
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
