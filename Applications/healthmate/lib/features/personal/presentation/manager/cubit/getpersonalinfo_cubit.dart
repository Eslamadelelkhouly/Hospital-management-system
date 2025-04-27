import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/personal/data/models/personal_info_model.dart';
import 'package:healthmate/features/personal/data/repos/get_personal_info_repo_implement.dart';
import 'package:meta/meta.dart';

part 'getpersonalinfo_state.dart';

class GetpersonalinfoCubit extends Cubit<GetpersonalinfoState> {
  GetpersonalinfoCubit() : super(GetpersonalinfoInitial());
  final ApiService apiService = ApiService(dio: Dio());

  Future<void> getPersonalInfo() async {
    emit(GetpersonalinfoLoading());
    final result = await GetPersonalInfoRepoImplement(apiService: apiService)
        .getPersonalInfo();
    result.fold(
      (failure) => emit(GetpersonalinfoError(erorMessage: failure.errorData)),
      (response) => emit(GetpersonalinfoSuccess(personalInfoModel: response)),
    );
  }
}
