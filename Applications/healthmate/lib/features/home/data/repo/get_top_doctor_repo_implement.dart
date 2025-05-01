import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/home/data/model/top_doctor_model.dart';
import 'package:healthmate/features/home/data/repo/get_top_doctor_repo.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/search/data/repos/get_doctor_repo.dart';

class GetTopDoctorRepoImplement  implements GetTopDoctorRepo{
  final ApiService apiService;

  GetTopDoctorRepoImplement({required this.apiService});
  @override
  Future<Either<Failures, TopDoctorsResponse>> getTopDoctor() async{
    try{
      String url = '${BackendEndpoint.gettopdoctor}';
      var response =  await apiService.Get(endpoint: url);
      log(response.toString());
      return right(TopDoctorsResponse.fromJson(response));
    }catch(e){
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
  

}