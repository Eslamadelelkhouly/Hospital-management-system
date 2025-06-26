import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/personal/data/models/personal_info_model.dart';
import 'package:healthmate/features/personal/data/repos/get_personal_info_repo.dart';
import 'package:image_picker/image_picker.dart';

class GetPersonalInfoRepoImplement implements GetPersonalInfoRepo {
  final ApiService apiService;

  GetPersonalInfoRepoImplement({required this.apiService});

  @override
  Future<Either<Failures, PersonalInfoModel>> getPersonalInfo() async {
    try {
      String url = '${BackendEndpoint.getpatientinfo}';
      var response = await apiService.Get(endpoint: url);
      log(response.toString());
      return right(PersonalInfoModel.fromJson(response));
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(
            {"message": "Connection timeout with ApiServer", "errors": {}}));
      }
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> updatePersonalInfo({
    required String name,
    required String address,
    required String gender,
    required String phoneNumber,
    required XFile image,
    required String id,
  }) async {
    try {
      String url = '${BackendEndpoint.editprofile}$id';
      FormData data = FormData.fromMap({
        "fullName": name,
        "address": address,
        "gender": gender,
        "phoneNumber": phoneNumber,
        "image": await MultipartFile.fromFile(image.path, filename: image.name),
      });
      var response = await apiService.PostToken(endpoint: url, data: data);
      log(response.toString());
      return right(response);
    } catch (e) {
      log(e.toString());
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
