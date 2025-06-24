import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/models/medical_test_state.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/repos/get_state_medical_test_repo.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/repos/get_state_medical_test_repo_implementaion.dart';
import 'package:meta/meta.dart';

part 'upcoming_medical_test_state.dart';

class UpcomingMedicalTestCubit extends Cubit<UpcomingMedicalTestState> {
  UpcomingMedicalTestCubit() : super(UpcomingMedicalTestInitial());
  ApiService apiService = ApiService(dio: Dio());
  Future<void> getUpcomingMedicalTest() async {
    emit(UpcomingMedicalTestLoading());
    var result =
        await GetStateMedicalTestRepoImplementaion(apiService: apiService)
            .getUpcoming();
    result.fold(
      (failure) => emit(
        UpcomingMedicalTestError(errorMessage: failure),
      ),
      (meicalteststate) => emit(
        UpcomingMedicalTestSuccess(medicalTestState: meicalteststate),
      ),
    );
  }
}
