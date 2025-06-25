import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/lab_test_model.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/medical_test_serch_model.dart';
import 'package:healthmate/features/lap%20test/presentation/data/repos/get_lab_test_repo.dart';

class GetLabTestRepoImplementation implements GetLabTestRepo {
  @override
  final ApiService apiService;

  GetLabTestRepoImplementation({required this.apiService});
  Future<Either<Map<String, dynamic>, MedicalTestsResponse>>
      getLabtest() async {
    try {
      var response = await apiService.Get(endpoint: BackendEndpoint.getlabtest);
      MedicalTestsResponse medicalTestsResponse =
          MedicalTestsResponse.fromJson(response);
      log(response.toString());
      return Right(medicalTestsResponse);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        if (e.response != null && e.response?.data != null) {
          return Left(Map<String, dynamic>.from(e.response!.data));
        } else {
          return Left(
              {"message": "Connection timeout with ApiServer", "errors": {}});
        }
      } else {
        return Left({"message": "Unexpected Error", "errors": {}});
      }
    }
  }

  @override
  Future<Either<String, MedicalTestSearch>> getLabtestSearch(
      {required String query}) async {
    try {
      String url = '${BackendEndpoint.getmedicaltestsearch}$query';
      log(url);
      var response = await apiService.Get(
        endpoint: url,
      );
      log(response.toString());

      return Right(MedicalTestSearch.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
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
