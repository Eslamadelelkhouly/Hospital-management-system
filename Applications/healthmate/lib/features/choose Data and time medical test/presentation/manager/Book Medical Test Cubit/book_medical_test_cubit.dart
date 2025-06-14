import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/data/repos/book_medical_test_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'book_medical_test_state.dart';

class BookMedicalTestCubit extends Cubit<BookMedicalTestState> {
  BookMedicalTestCubit() : super(BookMedicalTestInitial());
  ApiService apiService = ApiService(dio: Dio());

  Future<void> bookMedicalTest({
    required String medicalTestId,
    required String doctorId,
    required String date,
    required String time,
  }) async {
    emit(BookMedicalTestLoading());
    var result = await BookMedicalTestRepoImplementation(apiService: apiService)
        .bookMedicalTest(
      medicalTestId: medicalTestId,
      doctorId: doctorId,
      date: date,
      time: time,
    );
    result.fold(
      (error) {
        emit(BookMedicalTestError(message: error));
      },
      (response) {
        emit(BookMedicalTestSuccess(response: response));
      },
    );
  }
}
