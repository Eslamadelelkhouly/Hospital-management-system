import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/Auth/data/model/patient_model.dart';
import 'package:healthmate/features/Auth/data/model/user_login_model.dart';
import 'package:healthmate/features/Auth/data/model/verify_model.dart';
import 'package:healthmate/features/Auth/data/repo/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final ApiService apiService;

  AuthRepoImplementation({required this.apiService});
  @override
  @override
  Future<Either<Failures, Map<String, dynamic>>> signUp({
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
        return left(ServerFailure(
            {"message": "Connection timeout with ApiServer", "errors": {}}));
      }
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> logIn(
      {required String email, required String password}) async {
    try {
      UserLoginModel userLoginModel =
          UserLoginModel(email: email, password: password);
      var response = await apiService.Post(
        endpoint: BackendEndpoint.endpointlogin,
        data: userLoginModel.toMap(),
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

  @override
  Future<Either<String, String>> logOut() async {
    try {
      var response = await apiService.PostTokenNoData(
        endpoint: BackendEndpoint.logout,
      );
      log(response['message']);
      return right(response['message']);
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

  @override
  Future<Either<String, String>> forgotPassword({required String email}) async {
    try {
      var response = await apiService.Post(
        endpoint: BackendEndpoint.foretpassword,
        data: {"email": email},
      );
      log(response['message']);
      return right(response['message']);
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

  @override
  Future<Either<VerificationErrorModel, String>> verifyOtp({
    required String otp,
    required String email,
    required String password,
    required String confirmpassword,
  }) async {
    try {
      final response = await apiService.Post(
        endpoint: BackendEndpoint.foretpassword,
        data: {
          "email": email,
          "code": otp,
          "password": password,
          "password_confirmation": confirmpassword,
        },
      );
      log(response['message']);
      return right(response['message']);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());

        final errorData = e.response?.data;
        if (errorData != null && errorData is Map<String, dynamic>) {
          final errorModel = VerificationErrorModel.fromJson(errorData);
          return left(errorModel);
        } else {
          return left(
            VerificationErrorModel(
              message: 'Connection timeout with ApiServer',
              status: 500,
              errors: {},
            ),
          );
        }
      } else {
        return left(
          VerificationErrorModel(
            message: 'Unexpected Error: $e',
            status: 500,
            errors: {},
          ),
        );
      }
    }
  }
}
