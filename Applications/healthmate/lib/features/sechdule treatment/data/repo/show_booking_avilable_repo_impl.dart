import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/sechdule%20treatment/data/models/booking_avaliabale_model.dart';
import 'package:healthmate/features/sechdule%20treatment/data/repo/show_booking_avilable_repo.dart';

class ShowBookingAvilableRepoImpl implements ShowBookingAvailableRepo {
  @override
  final ApiService apiService;

  ShowBookingAvilableRepoImpl({required this.apiService});
  Future<Either<Map<String, dynamic>, BookingAvaliabalTimeeModel>>
      showBookingAvailable(
          {required String doctorId, required String date}) async {
    try {
      String endpoint = '${doctorId}?date=$date';
      log('Endpoint: $endpoint');
      final response = await apiService.GetWithKey(
        endpoint: BackendEndpoint.getavailbletimedoctor,
        key: endpoint,
      );

      if (response['available_appointments'] == null ||
          (response['available_appointments'] as List).isEmpty) {
        return left({
          "message": response['message'] ?? "No appointments found",
          "status": response['status'] ?? 200,
        });
      }

      final bookingModel = BookingAvaliabalTimeeModel.fromJson(response);
      return right(bookingModel);
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
