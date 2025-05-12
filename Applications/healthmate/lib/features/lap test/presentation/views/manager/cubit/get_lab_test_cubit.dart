import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/lab_test_model.dart';
import 'package:healthmate/features/lap%20test/presentation/data/repos/get_lab_test_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'get_lab_test_state.dart';

class GetLabTestCubit extends Cubit<GetLabTestState> {
  GetLabTestCubit() : super(GetLabTestInitial());
  ApiService apiService = ApiService(dio: Dio());

  Future<void> getLabTest() async {
    emit(GetLabTestLoading());
    var result =
        await GetLabTestRepoImplementation(apiService: apiService).getLabtest();
    result.fold(
      (error) {
        emit(GetLabTestError(errorMap: error));
      },
      (response) {
        emit(GetLabTestSucess(medicalTestsResponse: response));
      },
    );
  }
}
