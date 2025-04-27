import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/personal/data/models/personal_info_model.dart';
import 'package:healthmate/features/personal/data/repos/get_personal_info_repo.dart';

class GetPersonalInfoRepoImplement implements GetPersonalInfoRepo {
  final ApiService apiService;

  GetPersonalInfoRepoImplement({required this.apiService});

  @override
  Future<Either<Failures, PersonalInfoModel>> getPersonalInfo() async {
    try {
      String url = '${BackendEndpoint.getpatientinfo}';
      var response = await apiService.Get(endpoint: url);
      return right(PersonalInfoModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(
            {"message": "Connection timeout with ApiServer", "errors": {}}));
      }
    }
  }
}
