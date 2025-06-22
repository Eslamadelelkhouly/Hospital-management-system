// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/data/repos/upcoming_repo.dart';

class UpcomingRepoImplementation extends UpcomingRepo {
  ApiService apiService;
  UpcomingRepoImplementation({
    required this.apiService,
  });
  @override
  Future<Either<String, UpcomingAppointment>> getUpcomingAppointments() async {
    try {
      var response = await apiService.Get(
        endpoint: BackendEndpoint.getupcomingappointment,
      );
      log('Response: $response');
      UpcomingAppointment upcomingAppointment =
          UpcomingAppointment.fromJson(response);
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
