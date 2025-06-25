import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/models/medical_test_state.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/repos/get_state_medical_test_repo_implementaion.dart';
import 'package:meta/meta.dart';

part 'get_cancel_medical_test_state.dart';

class GetCancelMedicalTestCubit extends Cubit<GetCancelMedicalTestState> {
  ApiService apiService = ApiService(dio: Dio());
  GetCancelMedicalTestCubit() : super(GetCancelMedicalTestInitial());

  Future<void> getCancelMedicalTest() async {
    emit(GetCancelMedicalTestLoading());
    var result =
        await GetStateMedicalTestRepoImplementaion(apiService: apiService)
            .getCancel();
    result.fold(
      (failure) => emit(
        GetCancelMedicalTestError(errorMessage: failure),
      ),
      (meicalteststate) => emit(
        GetCancelMedicalTestSuccess(medicalTestState: meicalteststate),
      ),
    );
  }
}
