import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/medical_test_serch_model.dart';
import 'package:healthmate/features/lap%20test/presentation/data/repos/get_lab_test_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'get_medical_test_by_name_state.dart';

class GetMedicalTestByNameCubit extends Cubit<GetMedicalTestByNameState> {
  ApiService apiService = ApiService(dio: Dio());
  GetMedicalTestByNameCubit() : super(GetMedicalTestByNameInitial());
  Future<void> getMedicalTestByName({required String query}) async {
    emit(GetMedicalTestByNameLoading());
    final result = await GetLabTestRepoImplementation(apiService: apiService)
        .getLabtestSearch(query: query);
    result.fold(
      (failure) => emit(GetMedicalTestByNameError(errorMessage: failure)),
      (medicaltestsearch) => emit(
          GetMedicalTestByNameSuccess(medicalTestSearch: medicaltestsearch)),
    );
  }
}
