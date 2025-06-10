
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/features/medical%20test%20information/data/model/medical_info_model.dart';
import 'package:healthmate/features/medical%20test%20information/data/repos/get_medical_info_test_repo.dart';

class GetMedicalInfoRepoImplementation  extends GetMedicalInfoTestRepo{
  final ApiService apiService;

  GetMedicalInfoRepoImplementation({required this.apiService});
  @override
  Future<Either<Map<String, dynamic>, MedicalInfoModel>> getMedicalInfo({required String id}) async{
    try{
      var response = await apiService.GetWithKey(endpoint: BackendEndpoint.getmedicalinfo, key: id);
      log(response.toString());
      return right(MedicalInfoModel.fromJson(response));
    }catch(e){
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());
        return left({"message": "Server error", "errors": e.response?.data ?? {}});
      } else {
        return left({"message": "Connection timeout with ApiServer", "errors": {}});
      }
    }
  }

}