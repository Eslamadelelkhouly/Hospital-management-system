import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/search/data/repos/get_doctor_repo.dart';

class GetDoctorRepoImplementaion extends GetDoctorRepo {
  final ApiService apiService;
  GetDoctorRepoImplementaion({required this.apiService});
  @override
  Future<Either<Failures, DoctorsResponse>> getDoctors() async {
    try {
      var response = await apiService.Get(
        endpoint: BackendEndpoint.endpointShowDoctor,
      );

      try {
        DoctorsResponse doctorsResponse = DoctorsResponse.fromJson(response);
        return Right(doctorsResponse);
      } catch (e) {
        log('Parsing error: $e');
        return left(ServerFailure({
          "message": "Failed to parse doctor data",
          "errors": {"parsing": e.toString()}
        }));
      }
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Unexpected error: $e');
      return left(ServerFailure({
        "message": "Unexpected error occurred",
        "errors": {"unexpected": e.toString()}
      }));
    }
  }
}
