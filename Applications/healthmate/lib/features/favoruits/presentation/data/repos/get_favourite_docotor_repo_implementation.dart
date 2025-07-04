import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/features/favoruits/presentation/data/models/favoutite_list_model.dart';
import 'package:healthmate/features/favoruits/presentation/data/repos/get_favourite_doctor_repo.dart';

class GetFavouriteDocotorRepoImplementation implements GetFavouriteDoctorRepo {
  @override
  final ApiService apiService;

  GetFavouriteDocotorRepoImplementation({required this.apiService});

  Future<Either<Map<String, dynamic>, FavoriteDoctorsResponse>>
      getFavouritedoctor() async {
    try {
      var response =
          await apiService.Get(endpoint: BackendEndpoint.getfavourite);
      log(response.toString());

      if (response['status'] == 200 &&
          response.containsKey('message') &&
          response['message'] == 'No favorite doctors found') {
        return Left(
            {"message": response['message'], "status": response['status']});
      }

      return Right(FavoriteDoctorsResponse.fromJson(response));
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
}
