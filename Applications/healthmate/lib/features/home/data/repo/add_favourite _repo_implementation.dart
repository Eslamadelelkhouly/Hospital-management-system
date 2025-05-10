import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/home/data/repo/add_favourite_repo.dart';

class AddFavouriteRepoImplementation implements AddFavouriteRepo {
  final ApiService apiService;

  AddFavouriteRepoImplementation({required this.apiService});
  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> addFavourite(
      {required int doctorId}) async {
    try {
      var response = await apiService.PostToken(
        endpoint: BackendEndpoint.addfavourite,
        data: {
          "doctor_id": doctorId,
        },
      );
      log(response.toString());
      return right(response);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
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
