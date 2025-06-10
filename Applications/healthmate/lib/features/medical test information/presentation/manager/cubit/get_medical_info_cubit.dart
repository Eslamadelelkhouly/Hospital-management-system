import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/medical%20test%20information/data/model/medical_info_model.dart';
import 'package:healthmate/features/medical%20test%20information/data/repos/get_medical_info_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'get_medical_info_state.dart';

class GetMedicalInfoCubit extends Cubit<GetMedicalInfoState> {
  GetMedicalInfoCubit() : super(GetMedicalInfoInitial());
  ApiService apiService = ApiService(dio: Dio());

  Future<void>getMedicalinfo({required String id}) async {
    emit(GetMedicalInfoLoading());
    var result = await GetMedicalInfoRepoImplementation(apiService: apiService).getMedicalInfo(id: id);
    result.fold(
      (failure) {
        emit(GetMedicalInfoFailure(message: failure));
      },
      (success) {
        emit(GetMedicalInfoSuccess(medicalInfo: success));
      },
    );
  }
}
