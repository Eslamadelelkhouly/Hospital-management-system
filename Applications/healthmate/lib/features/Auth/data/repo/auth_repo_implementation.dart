import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/Auth/data/model/patient_model.dart';
import 'package:healthmate/features/Auth/data/repo/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final ApiService apiService;

  AuthRepoImplementation({required this.apiService});
  @override
  @override
  Future<Either<Failuers, Map<String, dynamic>>> signUp({
    required String fullname,
    required String email,
    required String password,
    required String dateofbirth,
  }) async {
    try {
      PatientModel patientModel = PatientModel(
        fullName: fullname,
        email: email,
        password: password,
        DateofBirth: dateofbirth,
      );
      var response = await apiService.Post(
        endpoint: BackendEndpoint.endpointregiseter,
        data: patientModel.toMap(),
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure('Unexpected Error, please try Again'));
      }
    }
  }
}
